@echo off
echo �_�E�����[�h�t�H���_�𐮗���...

set DOWNLOAD=%USERPROFILE%\Downloads
set ARCHIVE=%DOWNLOAD%\Temp

REM �ꎟ�ޔ��t�H���_���쐬
if not exist "%ARCHIVE%" mkdir "%ARCHIVE%"

REM 90���ȏ�O�̃t�@�C���݂̂��ړ��i�t�H���_�͑ΏۊO�j
echo 90���ȏ�O�̃t�@�C�����ꎟ�ޔ��Ɉړ���...
cd /d "%DOWNLOAD%"
forfiles /d -90 /c "cmd /c if @isdir==FALSE move @path \"%ARCHIVE%\\\"" 2>nul

REM �ꎟ�ޔ����270���ȏ�O�̃t�@�C���݂̂��폜�i�t�H���_�͎c���j
echo �ꎟ�ޔ��t�H���_����270���ȏ�O�̃t�@�C�����폜��...
cd /d "%ARCHIVE%"
forfiles /d -270 /c "cmd /c if @isdir==FALSE del @path" 2>nul

echo ���������I
pause