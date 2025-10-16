::コマンドを非表示
@echo off
echo 作業環境を準備中...

@REM start /max msedge --no-startup-window
@REM timeout /t 3 /nobreak >nul
@REM cscript //nologo test.vbs

call config.bat

start /MAX chrome

::誤動作回避のためインターバルを設定&ポップアップ非表示
::timeout /t 2 /nobreak >nul

start /MAX chrome --new-window "https://translate.google.com/"
start /MAX chrome --new-window "https://keep.google.com/u/0/#home"

timeout /t 2 /nobreak >nul

::cscript //nologo start_edge_maximized.vbs

@REM set URL=https://www.google.com
@REM for /f "delims=" %%i in ('powershell -command "(Get-WmiObject -Class Win32_DesktopMonitor).ScreenWidth"') do set W=%%i
@REM for /f "delims=" %%i in ('powershell -command "(Get-WmiObject -Class Win32_DesktopMonitor).ScreenHeight"') do set H=%%i
@REM start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ^
@REM --app=%URL% --window-position=0,0 --window-size=%W%,%H%

::Edgeが/MAX非対応のため--start-maximizedオプションを使用
start msedge --start-maximized

@REM powershell -ExecutionPolicy Bypass -Command ^
@REM "Start-Process msedge; ^
@REM Start-Sleep -Seconds 3; ^
@REM $wshell = New-Object -ComObject WScript.Shell; ^
@REM $wshell.AppActivate('Edge'); ^
@REM Start-Sleep -Milliseconds 500; ^
@REM $wshell.SendKeys('%%( )'); ^
@REM Start-Sleep -Milliseconds 200; ^
@REM $wshell.SendKeys('x')"

timeout /t 2 /nobreak >nul

::Explorerは同一行複数タブ設定不可
start /MAX explorer "%EXPLORER1%"
start /MAX explorer "%EXPLORER2%"
start /MAX excel "%EXCEL_FILE1%"

echo 準備完了！
