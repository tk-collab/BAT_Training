::コマンドを非表示
@echo off
echo 作業環境を準備中...

call config.bat

start /MAX chrome

::誤動作回避のためインターバルを設定&ポップアップ非表示
timeout /t 2 /nobreak >nul

::start "" "C:\Users\katot\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Anthropic\Claude.lnk"
::timeout /t 1 >nul
::powershell -command "$s = New-Object -ComObject wscript.shell; $s.SendKeys('{LWIN}{UP}')"

::Active windowを能動的にとりに行く手法で最大化
powershell -ExecutionPolicy Bypass -File "C:\Users\katot\OneDrive\ドキュメント\ITハンズオン\BAT_Training\MaxChatGPT-Claude.ps1"

timeout /t 2 /nobreak >nul

start /MAX chrome --new-window "https://translate.google.com/"
start /MAX chrome --new-window "https://keep.google.com/u/0/#home"

timeout /t 2 /nobreak >nul

::set URL=https://www.google.com
::for /f "delims=" %%i in ('powershell -command "(Get-WmiObject -Class Win32_DesktopMonitor).ScreenWidth"') do set W=%%i
::for /f "delims=" %%i in ('powershell -command "(Get-WmiObject -Class Win32_DesktopMonitor).ScreenHeight"') do set H=%%i
::start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ^
::--app=%URL% --window-position=0,0 --window-size=%W%,%H%

::Edgeが/MAX非対応のため--start-maximizedオプションを使用
::start msedge --start-maximized

::Explorerは同一行複数タブ設定不可
start /MAX explorer "%EXPLORER1%"
start /MAX explorer "%EXPLORER2%"
start /MAX explorer "%EXPLORER3%"
start /MAX excel "%EXCEL_FILE1%"

echo 準備完了！
