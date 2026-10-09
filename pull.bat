@echo off
rem Google Drive scatters desktop.ini into .git, which breaks git refs
rem ("fatal: bad object refs/desktop.ini"). Remove them, then git pull.
rem ASCII only on purpose: cmd.exe misreads UTF-8 Japanese in .bat files.

cd /d "%~dp0"

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0clean-desktop-ini.ps1"
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to remove desktop.ini. git pull was not run.
    pause
    exit /b 1
)

echo.
git pull
set RC=%ERRORLEVEL%

echo.
pause
exit /b %RC%
