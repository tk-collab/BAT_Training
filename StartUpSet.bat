::�R�}���h���\��
@echo off
echo ��Ɗ���������...

start /MAX chrome

::�듮�����̂��߃C���^�[�o����ݒ�&�|�b�v�A�b�v��\��
timeout /t 2 /nobreak >nul

start /MAX chrome --new-window "https://translate.google.com/"
start /MAX chrome --new-window "https://keep.google.com/u/0/#home"
::Edge��/MAX��Ή��̂��߉�ʃT�C�Y�𒲐�
start msedge --window-size=1920,1080 --window-position=0,0
::Explorer�͓���s�����^�u�ݒ�s��
start /MAX explorer "%EXPLORER1%"
start /MAX explorer "%EXPLORER2%"
start /MAX excel "%EXCEL_FILE1%"

echo ���������I
