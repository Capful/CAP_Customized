@echo off
rem 设置变量
rem CAP Customized 主目录
set Capful=D:\CAP Customized

rem CAP Customized 后处理目录
set post=%Capful%\Postprocessor\

rem 备份目录
set backup=%Capful%\backup\

for /f "delims== tokens=1*" %%a in ('type "%Capful%\bat\NX1847.ini" ^|findstr /i "NX1847"') do  set "NX1847=%%b"
echo ===============================================================
echo.
set "NX1847meun=%NX1847%\MACH\resource\template_set\"
set "NX1847post=%NX1847%\MACH\resource\Postprocessor\"
set "NX1847moban=%NX1847%\LOCALIZATION\prc\simpl_chinese\startup\"
echo.
echo 恢复NX 1847模板菜单
echo.
if exist "%backup%NX 1847\cam_general.bak" del /q "%NX1847meun%cam_general.opt"
copy /y "%backup%NX 1847\cam_general.bak" "%NX1847meun%"
ren "%NX1847meun%cam_general.bak" cam_general.opt
echo.
echo 移除NX 1847模板备份
echo.
if exist "%NX1847meun%cam_general.opt" del /q "%backup%NX 1847\cam_general.bak"
echo 恢复NX 1847系统模板菜单
echo.
if exist "%backup%NX 1847\ugs_model_templates_simpl_chinese.bak" del /q "%NX1847moban%ugs_model_templates_simpl_chinese.pax"
copy /y "%backup%NX 1847\ugs_model_templates_simpl_chinese.bak" "%NX1847moban%"
ren "%NX1847moban%ugs_model_templates_simpl_chinese.bak" ugs_model_templates_simpl_chinese.pax
echo.
echo 移除NX 1847系统模板备份
echo.
if exist "%NX1847moban%ugs_model_templates_simpl_chinese.pax" del /q "%backup%NX 1847\ugs_model_templates_simpl_chinese.bak"
echo.
echo 移除NX 1847制图模板
echo.
if exist "C:\Users\%username%\AppData\Local\Siemens\NX1847\nx_Capful_Drafting_Standard_User.dpv" del /q "C:\Users\%username%\AppData\Local\Siemens\NX1847\nx_Capful_Drafting_Standard_User.dpv"
echo.
echo 恢复NX 1847后处理菜单
echo.
if exist "%backup%NX 1847\template_post.bak" del /q "%NX1847post%template_post.dat"
copy /y "%backup%NX 1847\template_post.bak" "%NX1847post%"
ren "%NX1847post%template_post.bak" template_post.dat
echo.
echo 移除NX 1847后处理备份
echo.
if exist "%NX1847post%template_post.dat" del /q "%backup%NX 1847\template_post.bak"
echo.
echo 移除NX 1847后处理
echo.
del /q "%NX1847post%post.def"
del /q "%NX1847post%post.tcl"
del /q "%NX1847post%ugpost_base_group1.tcl"
rmdir /q /s "%backup%NX 1847"
rd "%backup%"
echo.
echo ===============================================================
pause
exit

