@echo off
set TARGET=10.255.255.1
ping -n 3 %TARGET% | find "TTL=" >nul
if %errorlevel% neq 0 (
    echo Ping failed at %date% %time% >> %USERPROFILE%\OneDrive\ドキュメント\ITハンズオン\BAT_Training\error.log
    powershell -ExecutionPolicy Bypass -File "%USERPROFILE%\OneDrive\ドキュメント\ITハンズオン\BAT_Training\auto_capture.ps1"
)
pause