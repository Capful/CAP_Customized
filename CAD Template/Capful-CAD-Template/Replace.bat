@echo off
echo 替换最模板文件
echo %cd%
for /f "delims=" %%i in ('dir/b/on *.dwt')do set "fn=%%i"
echo %fn%
copy %fn% ..\Capful-CAD-Template.dwt
pause