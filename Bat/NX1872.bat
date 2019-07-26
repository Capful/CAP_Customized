@echo off
set NX_Name=NX 1872
set NX_Name_A=NX1872
set Capful=D:\CAP Customized
set CAP_Template=%Capful%\NX Template\
set CAP_Post=%Capful%\Postprocessor\
set Backup=%Capful%\Backup\%NX_Name%\
set Customized=%Capful%\Customized\

if exist "%Capful%\bat\NX1872.ini" (	
	for /f "delims== tokens=1*" %%a in ('type "%Capful%\bat\NX1872.ini" ^|findstr /i "NX1872"') do  set "NX=%%b"
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
	xcopy "%Meun%cam_general.opt" "%Backup%" /c /e /r /y /s
)
echo .替换加工菜单文件..
echo .
xcopy "%CAP_Template%cam_general.opt" "%Meun%" /c /e /r /y /s
echo .
echo --------------------------------------------------
if exist "%Backup%template_post.dat" (	
	echo .后处理菜单文件        已存在备份
	echo .
) else (
	echo .创建 后处理菜单文件   备份
	echo .
	xcopy "%Post%template_post.dat" "%Backup%"  /c /e /r /y /s
)
echo .替换后处理菜单文件..
echo .
xcopy "%CAP_Post%template_post.dat" "%Post%" /c /e /r /y /s
echo .
echo .替换后处理文件..
echo .
xcopy "%CAP_Post%*.*" "%Post%" /c /e /r /y /s
echo .
echo .--------------------------------------------------
if exist "%Backup%ugs_model_templates_simpl_chinese.pax" (	
	echo .系统模板              已存在备份
	echo .
) else (
	echo .创建 系统模板         备份
	echo .
	xcopy  "%Template%ugs_model_templates_simpl_chinese.pax" "%Backup%" /c /e /r /y /s
)
echo .替换系统模板文件..
echo .
xcopy "%CAP_Template%ugs_model_templates_simpl_chinese.pax" "%Template%" /c /e /r /y /s
echo .
echo --------------------------------------------------
if exist "%Backup%Local\history.pax" (	
	echo .用户信息文件          已存在备份
	echo .
) else (
	echo .创建 用户信息文件     备份
	echo .
	xcopy "%Local%*.*" "%Backup%Local\"  /c /e /r /y /s
)
echo .替换用户信息文件..
echo .
xcopy "%Customized%NX\Local\*.*" "%Local%" /c /e /r /y /s
echo .
echo .替换制图模板文件..
echo .
xcopy "%CAP_Template%nx_Capful_Drafting_Standard_User.dpv" "%Local%" /c /e /r /y /s
echo .
echo --------------------------------------------------
if exist "%Backup%ug_main.men" (	
	echo .界面标题文件          已存在备份
	echo .
) else (
	echo .创建 界面标题文件     备份
	echo .
	xcopy "%NX%\UGII\menus\ug_main.men" "%Backup%"  /c /e /r /y /s
)
echo .替换界面标题文件
echo .
xcopy "%Customized%NX\nx1872_ug_main.men" "%NX%\UGII\menus\ug_main.men" /c /e /r /y /s
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