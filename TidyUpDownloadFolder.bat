@echo off
echo ダウンロードフォルダを整理中...

set DOWNLOAD=%USERPROFILE%\Downloads
set ARCHIVE=%DOWNLOAD%\Temp

REM 一次退避フォルダ作成
if not exist "%ARCHIVE%" mkdir "%ARCHIVE%"

REM 90日以上前のファイルを一次退避に移動
echo 90日以上前のファイルを一次退避に移動中...
cd /d "%DOWNLOAD%"
forfiles /d -90 /c "cmd /c if @isdir==FALSE move @path \"%ARCHIVE%\\\"" 2>nul

REM 一次退避内の270日以上前のファイルをゴミ箱に送る
echo 一次退避内の270日以上前のファイルをゴミ箱に移動中...
powershell -ExecutionPolicy Bypass -Command ^
"Add-Type -AssemblyName Microsoft.VisualBasic; ^
Get-ChildItem -Path '%ARCHIVE%' -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-270) } | ForEach-Object { ^
    Write-Host \"ゴミ箱に移動: $($_.Name)\"; ^
    [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($_.FullName, 'OnlyErrorDialogs', 'SendToRecycleBin') ^
}"

echo 整理完了！
pause