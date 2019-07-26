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
echo --------------------------------------------------
set A=cam_general.opt
echo .
if exist "%Backup%%A%" (	
	echo .
	echo .恢复加工菜单文件
	echo .
	xcopy "%Backup%%A%" "%Meun%" /c /e /r /y /s
	echo .
	echo .移除加工菜单备份文件
	echo .
	del /q "%Backup%%A%"
	echo .
) else (
	echo .加工菜单备份文件不存在！
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set B=template_post.dat
echo .
if exist "%Backup%%B%" (	
	echo .
	echo .恢复后处理菜单文件
	echo .
	xcopy "%Backup%%B%" "%Post%" /c /e /r /y /s
	echo .
	echo .移除后处理文件
    echo.
    del /q "%Post%post.def"
    del /q "%Post%post.tcl"
    del /q "%Post%ugpost_base_group1.tcl"
	echo.
	echo .移除后处理备份文件
	echo .
	del /q "%Backup%%B%"
	echo .
) else (
	echo .后处理备份文件不存在！
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set C=ugs_model_templates_simpl_chinese.pax
echo .
if exist "%Backup%%C%" (	
	echo .
	echo .恢复系统模板文件
	echo .
	xcopy "%Backup%%C%" "%Template%" /c /e /r /y /s
	echo .
	echo .移除系统模板备份文件
	echo .
	del /q "%Backup%%C%"
	echo .
) else (
	echo .系统模板备份文件不存在！
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set D=Local\history.pax
set D1=nx_Capful_Drafting_Standard_User.dpv
echo .
if exist "%Backup%%D%" (
	echo .
	echo .恢复用户信息文件
	echo .
	xcopy "%Backup%Local\*.*" "%Local%" /c /e /r /y /s
	echo .
	echo .移除用户信息备份文件
	echo .
	del /q "%Backup%Local\*.*"
	echo .
) else (
	echo .用户信息备份文件不存在！
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set F=\UGII\menus\ug_main.men
set F1=ug_main.men
echo .
if exist "%Backup%%F1%" (	
	echo .
	echo .恢复标题文件
	echo .
	xcopy "%Backup%%F1%" "%NX%%F%" /c /e /r /y /s
	echo .
	echo .移除标题备份文件
	echo .
	del /q "%Backup%%F1%"
	echo .
) else (
	echo .标题备份文件不存在！
)
echo --------------------------------------------------
echo .删除备份文件夹
rmdir /q /s "%backup%"
rd "%Capful%\Backup"
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

