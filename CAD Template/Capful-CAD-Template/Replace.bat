@echo off
echo �滻��ģ���ļ�
echo %cd%
for /f "delims=" %%i in ('dir/b/on *.dwt')do set "fn=%%i"
echo %fn%
copy %fn% ..\Capful-CAD-Template.dwt
pause