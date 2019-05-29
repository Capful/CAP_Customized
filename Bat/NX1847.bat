@echo off
set NX_Name=NX 1847
set NX_Name_A=NX1847
set Capful=D:\CAP Customized
set CAP_Template=%Capful%\NX Template\
set CAP_Post=%Capful%\Postprocessor\
set Backup=%Capful%\Backup\%NX_Name%\
set Customized=%Capful%\Customized\

if exist "%Capful%\bat\NX1847.ini" (	
	for /f "delims== tokens=1*" %%a in ('type "%Capful%\bat\NX1847.ini" ^|findstr /i "NX1847"') do  set "NX=%%b"
	echo --------------------------------------------------
    echo *                                                *
    echo *               %NX_Name%已安装                    *
	echo *                                                *
    echo --------------------------------------------------
	Goto Y
) else (
	Goto N
)

:Y 
set Meun=%NX%\MACH\resource\template_set\
set Post=%NX%\MACH\resource\Postprocessor\
set Template=%NX%\LOCALIZATION\prc\simpl_chinese\startup\
set Local=%LocalAppData%\Siemens\%NX_Name_A%\
echo.
echo	安装目录      	%NX%
echo	菜单文件      	%Meun%
echo	后处理文件      %Post%
echo	模板文件      	%Template%
echo	用户文件      	%Local%
echo .
if not exist "%Backup%"con md "%Backup%"
if not exist "%Backup%Local"con md "%Backup%Local"
echo --------------------------------------------------
if exist "%Backup%cam_general.opt" (	
	echo .加工菜单文件          已存在备份
	echo .
) else (
	echo .创建 加工菜单文件     备份
	echo .
	copy /y "%Meun%cam_general.opt" "%Backup%" 
)
echo .替换加工菜单文件..
echo .
copy /y "%CAP_Template%cam_general.opt" "%Meun%"
echo .
echo --------------------------------------------------
if exist "%Backup%template_post.dat" (	
	echo .后处理菜单文件        已存在备份
	echo .
) else (
	echo .创建 后处理菜单文件   备份
	echo .
	copy /y "%Post%template_post.dat" "%Backup%" 
)
echo .替换后处理菜单文件..
echo .
copy /y "%CAP_Post%template_post.dat" "%Post%"
echo .
echo .替换后处理文件..
echo .
copy /y "%CAP_Post%*.*" "%Post%"
echo .
echo .--------------------------------------------------
if exist "%Backup%ugs_model_templates_simpl_chinese.pax" (	
	echo .系统模板              已存在备份
	echo .
) else (
	echo .创建 系统模板         备份
	echo .
	copy /y "%Template%ugs_model_templates_simpl_chinese.pax" "%Backup%" 
)
echo .替换系统模板文件..
echo .
copy /y "%CAP_Template%ugs_model_templates_simpl_chinese.pax" "%Template%"
echo .
echo --------------------------------------------------
if exist "%Backup%Local\history.pax" (	
	echo .用户信息文件          已存在备份
	echo .
) else (
	echo .创建 用户信息文件     备份
	echo .
	copy /y "%Local%*.*" "%Backup%Local\" 
)
echo .替换用户信息文件..
echo .
copy /y "%Customized%NX\Local\*.*" "%Local%"
echo .
echo .替换制图模板文件..
echo .
copy /y "%CAP_Template%nx_Capful_Drafting_Standard_User.dpv" "%Local%"
echo .
echo --------------------------------------------------
if exist "%Backup%ug_main.men" (	
	echo .界面标题文件          已存在备份
	echo .
) else (
	echo .创建 界面标题文件     备份
	echo .
	copy /y "%NX%\UGII\menus\ug_main.men" "%Backup%" 
)
echo .替换界面标题文件
echo .
copy /y "%Customized%NX\nx1847_ug_main.men" "%NX%\UGII\menus\ug_main.men"
echo .
echo --------------------------------------------------

Goto Done

:N
echo --------------------------------------------------
echo *                                                *
echo *               %NX_Name%未安装                    *
echo *                                                *
echo --------------------------------------------------
Goto Done

:Done
pause
exit