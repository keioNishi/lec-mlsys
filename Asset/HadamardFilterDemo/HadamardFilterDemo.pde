// =====================================================================
//  HadamardFilterDemo
//  --------------------------------------------------------------------
//  3x3 フィルタ行列を画像との「部分アダマール積（＝3x3近傍の要素積の和）」
//  としてラスタ走査で適用し、そのつど 256 諧調をフルに使うよう正規化する
//  デモ。EXEC ボタンを繰り返し押すと、フィルタ効果が累積していく様子を
//  観察できる。
//
//  ・画像 : 200x200 グレースケール。丸/三角/四角/縦/横/斜め線をランダム配置。
//           塗りつぶし有無もランダム。
//  ・GUI  : 3x3 のセルをクリック→キー入力で係数を自由に設定。
//  ・正規化: ヒストグラム平坦化（各諧調の画素数が均等）または線形ストレッチ。
//           正規化が後段で行われるので、フィルタ係数の総和で割る必要は無い。
// =====================================================================

int W = 400, H = 400;          // 画像サイズ（実解像度）
int SCALE = 1;                 // 表示倍率（1:1、拡大なし）
int DX = 20, DY = 20;          // 表示左上

float[] img;                   // 作業用グレースケール 0..255
PImage view;                   // 表示用

// --- フィルタ（3x3） ---
String[] cellText = {          // GUI 上のテキスト（左上→右下）
  "0","0","0",
  "0","1","0",
  "0","0","0"
};
float[] filter = new float[9];
int selCell = -1;              // 選択中セル（-1で無選択）
boolean freshCell = false;     // 選択直後：最初の入力で既存値を消して上書き

// --- レイアウト ---
int PX = 450;                  // 右パネル左端
int GRIDY = 70;
int CELL = 70, GAP = 8;

// --- 状態 ---
int iter = 0;                  // EXEC 累積回数
int normMode = 0;              // 0=HistEQ 1=Stretch 2=Signed
float gain = 1.5;              // Signed の強調ゲイン（線を目立たせる）
float lineWeight = 1;          // 図形の線の太さ（デフォルト1）
int fillMode = 0;              // 塗りつぶし: 0=ランダム 1=あり 2=なし
float[] lastConv = null;       // 直近の符号付き畳み込み結果（再正規化用）
PFont uiFont;                  // 日本語対応フォント

// --- ボタン定義 ---
class Btn {
  float x,y,w,h; String label;
  Btn(float x,float y,float w,float h,String l){this.x=x;this.y=y;this.w=w;this.h=h;label=l;}
  boolean hit(float mx,float my){return mx>=x&&mx<=x+w&&my>=y&&my<=y+h;}
}
Btn execBtn, resetBtn, normBtn, gainMinus, gainPlus, lwMinus, lwPlus, fillBtn;

// 生成図形（位置等は保持し、線の太さだけ変えて再描画できるように）
int NSHAPES = 44;
class Shape {
  int type, g, d;          // 種類, グレー値, 斜線の向き
  float cx, cy, s, a;      // 中心, サイズ, 三角の回転角
  boolean filled;
}
Shape[] shapes;
Btn[] presets;
String[] presetNames = {"Identity","Blur","Sharpen","Sobel-X","Sobel-Y","Laplacian"};
float[][] presetVals = {
  {0,0,0, 0,1,0, 0,0,0},                 // Identity
  {1,1,1, 1,1,1, 1,1,1},                 // Blur（正規化されるので総和無視でOK）
  {0,-1,0, -1,5,-1, 0,-1,0},             // Sharpen
  {-1,0,1, -2,0,2, -1,0,1},              // Sobel-X
  {-1,-2,-1, 0,0,0, 1,2,1},              // Sobel-Y
  {0,-1,0, -1,4,-1, 0,-1,0}              // Laplacian
};

void settings(){
  size(700, 630);
  pixelDensity(1);               // HiDPI での密度2化を抑止（バッファ幅=W を保証）
}

void setup(){
  uiFont = createFont("Meiryo", 16, true);  // 日本語対応（Windows標準フォント）
  textFont(uiFont);

  int gw = 3*CELL+2*GAP;
  execBtn  = new Btn(PX, 310, gw, 46, "EXEC  ▶");
  resetBtn = new Btn(PX, 366, (gw-GAP)/2, 34, "New Image");
  normBtn  = new Btn(PX + (gw+GAP)/2, 366, (gw-GAP)/2, 34, "Norm: HistEQ");
  fillBtn  = new Btn(PX, 406, gw, 30, "塗りつぶし: ランダム");

  presets = new Btn[6];
  float bw = (gw-2*GAP)/3.0;
  for(int i=0;i<6;i++){
    float bx = PX + (i%3)*(bw+GAP);
    float by = 452 + (i/3)*(30+GAP);
    presets[i] = new Btn(bx, by, bw, 30, presetNames[i]);
  }
  gainMinus = new Btn(PX,        534, 46, 28, "−");
  gainPlus  = new Btn(PX+gw-46,  534, 46, 28, "+");
  lwMinus   = new Btn(PX,        576, 46, 28, "−");
  lwPlus    = new Btn(PX+gw-46,  576, 46, 28, "+");

  view = createImage(W, H, RGB);
  newImage();
  parseFilter();
}

// ---------------------------------------------------------------------
//  画像生成：ランダムな図形を敷き詰める
// ---------------------------------------------------------------------
// New Image：図形をランダムに生成し直して描画
void newImage(){
  generateShapes();
  renderImage();
}

// 図形のパラメータだけをランダム生成（位置・種類・塗り等を保持）
void generateShapes(){
  shapes = new Shape[NSHAPES];
  for(int i=0;i<NSHAPES;i++){
    Shape sh = new Shape();
    sh.g      = (int)random(80, 256);      // 明るめのグレー
    sh.filled = random(1) < 0.5;
    sh.cx = random(W); sh.cy = random(H);
    sh.s  = random(36, 120);
    sh.type = (int)random(6);
    sh.a = random(TWO_PI);                  // 三角の回転
    sh.d = random(1) < 0.5 ? 1 : -1;        // 斜線の向き
    shapes[i] = sh;
  }
}

// 保持中の図形を、現在の lineWeight（線の太さ）で描画して img[] に反映
void renderImage(){
  PGraphics pg = createGraphics(W, H);
  pg.beginDraw();
  pg.background(0);
  pg.ellipseMode(CENTER);
  pg.rectMode(CENTER);
  pg.strokeWeight(lineWeight);
  for(Shape sh : shapes){
    pg.stroke(sh.g);
    boolean f = (fillMode==0) ? sh.filled : (fillMode==1);  // 0=ランダム 1=あり 2=なし
    if(f) pg.fill(sh.g); else pg.noFill();
    float cx = sh.cx, cy = sh.cy, s = sh.s;
    switch(sh.type){
      case 0:  // 丸
        pg.ellipse(cx, cy, s, s);
        break;
      case 1:  // 三角
        pg.triangle(cx+cos(sh.a)*s*0.6, cy+sin(sh.a)*s*0.6,
                    cx+cos(sh.a+2.09)*s*0.6, cy+sin(sh.a+2.09)*s*0.6,
                    cx+cos(sh.a+4.19)*s*0.6, cy+sin(sh.a+4.19)*s*0.6);
        break;
      case 2:  // 四角
        pg.rect(cx, cy, s, s);
        break;
      case 3:  // 垂直線
        pg.line(cx, cy-s*0.7, cx, cy+s*0.7);
        break;
      case 4:  // 水平線
        pg.line(cx-s*0.7, cy, cx+s*0.7, cy);
        break;
      case 5:  // 斜め線
        pg.line(cx-s*0.6, cy-s*0.6*sh.d, cx+s*0.6, cy+s*0.6*sh.d);
        break;
    }
  }
  pg.endDraw();
  img = new float[W*H];
  for(int y=0;y<H;y++){
    for(int x=0;x<W;x++){
      img[y*W+x] = brightness(pg.get(x, y));  // get()は論理座標・密度非依存で安全
    }
  }
  iter = 0;
  lastConv = null;   // 基画像が変わったので直近結果を破棄
  updateView();
}

// ---------------------------------------------------------------------
//  1回のフィルタ適用（畳み込み）＋正規化
// ---------------------------------------------------------------------
void execFilter(){
  parseFilter();
  lastConv = convolve(img);   // 符号付き結果を保持
  iter++;
  applyNorm();                // 現在の正規化モード/ゲインで反映
}

// 直近の畳み込み結果に、現在のモード/ゲインで正規化を再適用（EXEC不要で見え方を更新）
void applyNorm(){
  if(lastConv == null) return;
  if(normMode==0)      img = histEq(lastConv);
  else if(normMode==1) img = stretch(lastConv);
  else                 img = signedNorm(lastConv);
  updateView();
}

float[] convolve(float[] src){
  float[] out = new float[W*H];
  for(int y=0;y<H;y++){
    for(int x=0;x<W;x++){
      float s = 0; int k = 0;
      for(int dy=-1;dy<=1;dy++){
        for(int dx=-1;dx<=1;dx++){
          int xx = constrain(x+dx, 0, W-1);
          int yy = constrain(y+dy, 0, H-1);
          s += src[yy*W+xx] * filter[k];   // 部分アダマール積の和
          k++;
        }
      }
      out[y*W+x] = s;
    }
  }
  return out;
}

// ヒストグラム平坦化：各諧調の画素数が均等になるよう変換
float[] histEq(float[] src){
  int N = src.length;
  float mn = Float.MAX_VALUE, mx = -Float.MAX_VALUE;
  for(float v : src){ mn = min(mn, v); mx = max(mx, v); }
  float[] out = new float[N];
  if(mx - mn < 1e-6){ for(int i=0;i<N;i++) out[i] = 128; return out; }

  int[] q = new int[N];
  int[] hist = new int[256];
  for(int i=0;i<N;i++){
    int b = (int)((src[i]-mn)/(mx-mn)*255f + 0.5f);
    b = constrain(b, 0, 255);
    q[i] = b; hist[b]++;
  }
  int[] cdf = new int[256];
  int acc = 0, cdfmin = 0; boolean found = false;
  for(int i=0;i<256;i++){
    acc += hist[i]; cdf[i] = acc;
    if(!found && hist[i] > 0){ cdfmin = acc; found = true; }
  }
  for(int i=0;i<N;i++){
    float v = (cdf[q[i]] - cdfmin) / (float)(N - cdfmin) * 255f;
    out[i] = constrain(v, 0, 255);
  }
  return out;
}

// 線形ストレッチ（min-max を 0..255 に伸長）
float[] stretch(float[] src){
  float mn = Float.MAX_VALUE, mx = -Float.MAX_VALUE;
  for(float v : src){ mn = min(mn, v); mx = max(mx, v); }
  float[] out = new float[src.length];
  if(mx - mn < 1e-6){ for(int i=0;i<out.length;i++) out[i] = 128; return out; }
  for(int i=0;i<src.length;i++) out[i] = (src[i]-mn)/(mx-mn)*255f;
  return out;
}

// ゼロ中心・符号対称：0→中間グレー(128)、正→明、負→暗。
// スケールは |v| の上位パーセンタイル（外れ値を無視）＝ロバスト化。
// さらに gain を掛けてコントラストを持ち上げ、線をハッキリ立たせる。
// 「灰色一色＋線だけ立つ」見え方に最適。
float[] signedNorm(float[] src){
  float a = robustAbsPercentile(src, 0.98);   // 98%点をレンジ端に
  float[] out = new float[src.length];
  for(int i=0;i<src.length;i++)
    out[i] = constrain(128f + (src[i]/a) * gain * 127f, 0, 255);
  return out;
}

// |src| の p 分位点（0..1）。外れ値に強いスケール推定。
float robustAbsPercentile(float[] src, float p){
  float[] tmp = new float[src.length];
  for(int i=0;i<src.length;i++) tmp[i] = abs(src[i]);
  tmp = sort(tmp);
  int idx = constrain((int)(p*(src.length-1)), 0, src.length-1);
  float a = tmp[idx];
  return a < 1e-6 ? 1 : a;
}

void updateView(){
  view.loadPixels();
  for(int i=0;i<W*H;i++){
    int g = (int)constrain(img[i], 0, 255);
    view.pixels[i] = color(g);
  }
  view.updatePixels();
}

void parseFilter(){
  for(int i=0;i<9;i++){
    float v = 0;
    try { v = Float.parseFloat(cellText[i].trim()); } catch(Exception e){ v = 0; }
    filter[i] = v;
  }
}

// ---------------------------------------------------------------------
//  描画
// ---------------------------------------------------------------------
void draw(){
  background(30);

  // 画像
  image(view, DX, DY, W*SCALE, H*SCALE);
  noFill(); stroke(90); rect(DX, DY, W*SCALE, H*SCALE);
  fill(220); textAlign(LEFT, BOTTOM); textSize(13);
  text("Image " + W + "x" + H + "   iterations: " + iter, DX, DY-6);

  // ヒストグラム
  drawHistogram(DX, DY + H*SCALE + 20, W*SCALE, 70);

  // 右パネル
  drawPanel();
}

void drawHistogram(float x, float y, float w, float h){
  int[] hist = new int[256];
  for(float v : img){ int b = (int)constrain(v,0,255); hist[b]++; }
  int mxh = 1; for(int c : hist) mxh = max(mxh, c);
  fill(20); stroke(90); rect(x, y, w, h);
  noStroke(); fill(150,200,255);
  for(int i=0;i<256;i++){
    float bh = (hist[i]/(float)mxh) * (h-2);
    float bx = x + 1 + i/256.0*(w-2);
    rect(bx, y+h-1-bh, (w-2)/256.0 + 0.5, bh);
  }
  fill(200); textAlign(LEFT, TOP); textSize(11);
  text("histogram (0 ─ 255)", x+4, y+4);
}

void drawPanel(){
  fill(230); textAlign(LEFT, BOTTOM); textSize(15);
  text("3x3 Filter Matrix", PX, GRIDY-8);

  // セル
  textAlign(CENTER, CENTER); textSize(16);
  for(int i=0;i<9;i++){
    float cx = PX + (i%3)*(CELL+GAP);
    float cy = GRIDY + (i/3)*(CELL+GAP);
    if(i==selCell){ fill(60,90,140); stroke(120,170,255); }
    else          { fill(45);        stroke(100); }
    strokeWeight(i==selCell?2:1);
    rect(cx, cy, CELL, CELL, 6);
    fill(240); noStroke();
    text(cellText[i].equals("")?"_":cellText[i], cx+CELL/2, cy+CELL/2);
  }
  strokeWeight(1);

  drawBtn(execBtn,  color(40,120,60), 18);
  drawBtn(resetBtn, color(70),        13);
  normBtn.label = "Norm: " + (normMode==0 ? "HistEQ" : normMode==1 ? "Stretch" : "Signed");
  drawBtn(normBtn,  color(70,70,100), 13);

  fillBtn.label = "塗りつぶし: " + (fillMode==0 ? "ランダム" : fillMode==1 ? "あり" : "なし");
  drawBtn(fillBtn, color(90,70,70), 14);

  fill(200); textAlign(LEFT, BOTTOM); textSize(13);
  text("Presets", PX, 447);
  for(Btn b : presets) drawBtn(b, color(60,60,75), 12);

  // Gain コントロール（Signed モードで有効）
  fill(200); textAlign(LEFT, BOTTOM); textSize(12);
  text("Gain (Signed)", PX, 530);
  drawBtn(gainMinus, color(70,70,100), 18);
  drawBtn(gainPlus,  color(70,70,100), 18);
  fill(255); textAlign(CENTER, CENTER); textSize(15);
  text("x" + nf(gain,0,2), PX + (3*CELL+2*GAP)/2, gainMinus.y + gainMinus.h/2);

  // Line width コントロール（図形の線の太さ）
  fill(200); textAlign(LEFT, BOTTOM); textSize(12);
  text("Line width", PX, 572);
  drawBtn(lwMinus, color(70,90,70), 18);
  drawBtn(lwPlus,  color(70,90,70), 18);
  fill(255); textAlign(CENTER, CENTER); textSize(15);
  text(str((int)lineWeight), PX + (3*CELL+2*GAP)/2, lwMinus.y + lwMinus.h/2);

  // 操作ヘルプ（ヒストグラムの下、左カラムに表示）
  fill(160); textAlign(LEFT, TOP); textSize(11);
  float hy = 515;
  text("• セルをクリック→数字/./- を入力（BackSpaceで消去, Tabで次へ）", DX, hy);
  text("• EXEC を繰り返し押すとフィルタ効果が累積", DX, hy+15);
  text("• 係数の総和で割る必要なし（後段で自動正規化）", DX, hy+30);
}

void drawBtn(Btn b, color c, int ts){
  boolean over = b.hit(mouseX, mouseY);
  fill(over ? lerpColor(c, color(255), 0.2) : c);
  stroke(150); strokeWeight(1);
  rect(b.x, b.y, b.w, b.h, 6);
  fill(255); noStroke();
  textAlign(CENTER, CENTER); textSize(ts);
  text(b.label, b.x+b.w/2, b.y+b.h/2);
}

// ---------------------------------------------------------------------
//  入力
// ---------------------------------------------------------------------
void mousePressed(){
  // セル選択
  for(int i=0;i<9;i++){
    float cx = PX + (i%3)*(CELL+GAP);
    float cy = GRIDY + (i/3)*(CELL+GAP);
    if(mouseX>=cx&&mouseX<=cx+CELL&&mouseY>=cy&&mouseY<=cy+CELL){ selCell=i; freshCell=true; return; }
  }
  selCell = -1;

  if(execBtn.hit(mouseX,mouseY))  { execFilter(); return; }
  if(resetBtn.hit(mouseX,mouseY)) { newImage();   return; }
  if(normBtn.hit(mouseX,mouseY))  { normMode = (normMode+1)%3; applyNorm(); return; }
  if(fillBtn.hit(mouseX,mouseY))  { fillMode = (fillMode+1)%3; renderImage(); return; }
  if(gainMinus.hit(mouseX,mouseY)){ gain = constrain(gain/1.25, 0.25, 12); applyNorm(); return; }
  if(gainPlus.hit(mouseX,mouseY)) { gain = constrain(gain*1.25, 0.25, 12); applyNorm(); return; }
  if(lwMinus.hit(mouseX,mouseY))  { lineWeight = constrain(lineWeight-1, 1, 12); renderImage(); return; }
  if(lwPlus.hit(mouseX,mouseY))   { lineWeight = constrain(lineWeight+1, 1, 12); renderImage(); return; }
  for(int i=0;i<6;i++){
    if(presets[i].hit(mouseX,mouseY)){
      for(int k=0;k<9;k++) cellText[k] = trimNum(presetVals[i][k]);
      parseFilter();
      return;
    }
  }
}

String trimNum(float v){
  if(v == (int)v) return str((int)v);
  return nf(v,0,2);
}

void keyPressed(){
  if(selCell < 0) return;
  if(key == BACKSPACE){
    freshCell = false;   // 手動編集モードへ（既存値を残して1文字削除）
    if(cellText[selCell].length()>0)
      cellText[selCell] = cellText[selCell].substring(0, cellText[selCell].length()-1);
  } else if(key == ENTER || key == RETURN){
    parseFilter(); selCell = -1; freshCell = false;
  } else if(key == TAB){
    parseFilter(); selCell = (selCell+1)%9; freshCell = true;  // 次セルも上書き待ち
  } else if((key>='0'&&key<='9') || key=='.' || key=='-'){
    if(freshCell){ cellText[selCell] = ""; freshCell = false; }  // 最初の入力で既存値をクリア
    cellText[selCell] += key;
  }
}
