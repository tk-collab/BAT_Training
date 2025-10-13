@echo off
echo ダウンロードフォルダを整理中...

set DOWNLOAD=%USERPROFILE%\Downloads
set ARCHIVE=%DOWNLOAD%\Temp

REM 一次退避フォルダを作成
if not exist "%ARCHIVE%" mkdir "%ARCHIVE%"

REM 90日以上前のファイルのみを移動（フォルダは対象外）
echo 90日以上前のファイルを一次退避に移動中...
cd /d "%DOWNLOAD%"
forfiles /d -90 /c "cmd /c if @isdir==FALSE move @path \"%ARCHIVE%\\\"" 2>nul

REM 一次退避内の270日以上前のファイルのみを削除（フォルダは残す）
echo 一次退避フォルダ内の270日以上前のファイルを削除中...
cd /d "%ARCHIVE%"
forfiles /d -270 /c "cmd /c if @isdir==FALSE del @path" 2>nul

echo 整理完了！
pause