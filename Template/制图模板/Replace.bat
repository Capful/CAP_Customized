@echo off
echo �滻������ͼģ���ļ�
echo %cd%
for /f "delims=" %%i in ('dir/b/on *.dpv')do set "fn=%%i"
echo %fn%
copy %fn% ..\nx_Capful_Drafting_Standard_User.dpv
pause