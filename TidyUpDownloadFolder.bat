@echo off
echo �_�E�����[�h�t�H���_�𐮗���...

set DOWNLOAD=%USERPROFILE%\Downloads
set ARCHIVE=%DOWNLOAD%\Temp

REM �ꎟ�ޔ��t�H���_�쐬
if not exist "%ARCHIVE%" mkdir "%ARCHIVE%"

REM 90���ȏ�O�̃t�@�C�����ꎟ�ޔ��Ɉړ�
echo 90���ȏ�O�̃t�@�C�����ꎟ�ޔ��Ɉړ���...
cd /d "%DOWNLOAD%"
forfiles /d -90 /c "cmd /c if @isdir==FALSE move @path \"%ARCHIVE%\\\"" 2>nul

REM �ꎟ�ޔ����270���ȏ�O�̃t�@�C�����S�~���ɑ���
echo �ꎟ�ޔ����270���ȏ�O�̃t�@�C�����S�~���Ɉړ���...
powershell -ExecutionPolicy Bypass -Command ^
"Add-Type -AssemblyName Microsoft.VisualBasic; ^
Get-ChildItem -Path '%ARCHIVE%' -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-270) } | ForEach-Object { ^
    Write-Host \"�S�~���Ɉړ�: $($_.Name)\"; ^
    [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($_.FullName, 'OnlyErrorDialogs', 'SendToRecycleBin') ^
}"

echo ���������I
pause