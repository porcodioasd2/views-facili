@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ========================================
echo YouTube Shorts Viewer - Local Dev Server
echo ========================================
echo.

REM Kill any existing node process on port 3000
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :3000') do taskkill /pid %%a /f >nul 2>&1
timeout /t 1 >nul

echo Checking Node.js...
"C:\Program Files\nodejs\node.exe" --version || (
    echo ERROR: Node.js not found!
    echo Download from: https://nodejs.org/
    pause
    exit /b 1
)

echo.
echo ========================================
echo Starting server...
echo ========================================
echo.

:loop
"C:\Program Files\nodejs\node.exe" server.js
echo.
echo ❌ SERVER CRASHED!
echo.
echo Type 'r' to restart or any other key to exit...
choice /c r /n /t 5 /d n >nul
if errorlevel 2 goto end
goto loop

:end
echo Goodbye!
exit /b 0
