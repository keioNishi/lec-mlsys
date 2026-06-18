<#
.SYNOPSIS
    リポジトリ内の desktop.ini を全削除する(.git 内部を含む)。

.DESCRIPTION
    Google Drive 同期はフォルダごとに隠し+システム属性の desktop.ini を
    生成する。これが .git/refs などに入り込むと git の参照解析が壊れ、
    fetch/push が "fatal: bad object refs/desktop.ini" で失敗する。
    .gitignore は .git 内部には作用しないため、物理削除が唯一の対策。

    このスクリプトはスクリプト自身が置かれたフォルダ配下を再帰的に走査し、
    desktop.ini だけを削除する(他ファイルには一切触れない)。
    push の前に実行すること。

.EXAMPLE
    powershell -ExecutionPolicy Bypass -File .\clean-desktop-ini.ps1
#>

$ErrorActionPreference = 'Stop'

# スクリプト自身の場所をリポジトリルートとみなす
$repo = $PSScriptRoot
if ([string]::IsNullOrEmpty($repo)) { $repo = (Get-Location).Path }

Write-Host "Scanning for desktop.ini under: $repo"

# -Force で隠し+システム属性ファイルも、.git 等の隠しフォルダも対象に含める
$files = Get-ChildItem -LiteralPath $repo -Recurse -Force -File -Filter 'desktop.ini' -ErrorAction SilentlyContinue

if (-not $files) {
    Write-Host "No desktop.ini found. Clean."
    exit 0
}

$removed = 0
$failed  = @()
foreach ($f in $files) {
    try {
        Remove-Item -LiteralPath $f.FullName -Force -Confirm:$false
        $removed++
    } catch {
        $failed += $f.FullName
    }
}

Write-Host "Removed $removed desktop.ini file(s)."
if ($failed.Count -gt 0) {
    Write-Warning "Failed to remove $($failed.Count) file(s):"
    $failed | ForEach-Object { Write-Warning "  $_" }
    exit 1
}

exit 0
