::コマンドを非表示
@echo off
echo 作業環境を準備中...

start /MAX chrome

::誤動作回避のためインターバルを設定&ポップアップ非表示
timeout /t 2 /nobreak >nul

start /MAX chrome --new-window "https://translate.google.com/"
start /MAX chrome --new-window "https://keep.google.com/u/0/#home"
::Edgeが/MAX非対応のため画面サイズを調整
start msedge --window-size=1920,1080 --window-position=0,0
::Explorerは同一行複数タブ設定不可
start /MAX explorer "%EXPLORER1%"
start /MAX explorer "%EXPLORER2%"
start /MAX excel "%EXCEL_FILE1%"

echo 準備完了！
