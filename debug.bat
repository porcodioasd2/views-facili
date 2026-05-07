@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ========================================
echo DEBUG: Running server with full output
echo ========================================
echo.

echo System Info:
node --version
npm --version
echo.

echo Checking dependencies...
npm list --depth=0
echo.

echo ========================================
echo Starting server (showing all output)...
echo ========================================
echo.

"C:\Program Files\nodejs\node.exe" server.js

echo.
echo ========================================
echo Server exited. Press any key to close...
echo ========================================
pause
