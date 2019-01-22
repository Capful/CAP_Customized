@echo off

rem CAP Customized 主目录
set Capful=D:\CAP Customized

rem CAP Customized 模板目录
set Template=%Capful%\Template\

rem CAP Customized 后处理目录
set post=%Capful%\Postprocessor\

rem 备份目录
set backup=%Capful%\backup\

for /f "delims== tokens=1*" %%a in ('type "%Capful%\bat\NX1847.ini" ^|findstr /i "NX1847"') do  set "NX1847=%%b"
echo ===============================================================
echo.
echo NX1847安装路径为%NX1847%
echo.
set "NX1847meun=%NX1847%\MACH\resource\template_set\"
set "NX1847post=%NX1847%\MACH\resource\Postprocessor\"
set "NX1847moban=%NX1847%\LOCALIZATION\prc\simpl_chinese\startup\"
echo.
echo 创建NX1847备份
echo.
if not exist "%backup%NX 1847"con md "%backup%NX 1847"
if not exist "%backup%NX 1847\cam_general.bak" copy /y "%NX1847meun%cam_general.opt" "%backup%NX 1847\cam_general.bak"
if not exist "%backup%NX 1847\template_post.bak" copy /y "%NX1847post%template_post.dat" "%backup%NX 1847\template_post.bak"
if not exist "%backup%NX 1847\ugs_model_templates_simpl_chinese.bak" copy /y "%NX1847moban%ugs_model_templates_simpl_chinese.pax" "%backup%NX 1847\ugs_model_templates_simpl_chinese.bak"
echo.
echo 替换NX1847加工模板菜单..
copy /y "%Template%cam_general.opt" "%NX1847meun%"
echo.
echo 替换NX 1847后处理菜单
copy /y "%post%template_post.dat" "%NX1847post%"
echo.
echo 替换NX 1847系统模板菜单
copy /y "%Template%ugs_model_templates_simpl_chinese.pax" "%NX1847moban%"
echo.
echo 复制NX 1847后处理
copy /y "%post%post.def" "%NX1847post%"
copy /y "%post%post.tcl" "%NX1847post%"
copy /y "%post%ugpost_base_group1.tcl" "%NX1847post%"
echo.
echo ===============================================================
pause
exit

