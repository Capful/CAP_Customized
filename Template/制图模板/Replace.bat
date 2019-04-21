@echo off
echo 替换最新制图模板文件
echo %cd%
for /f "delims=" %%i in ('dir/b/on *.dpv')do set "fn=%%i"
echo %fn%
copy %fn% ..\nx_Capful_Drafting_Standard_User.dpv
pause