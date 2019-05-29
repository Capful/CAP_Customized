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
    echo *               %NX_Name%�Ѱ�װ                    *
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
echo	��װĿ¼      	%NX%
echo	�˵��ļ�      	%Meun%
echo	�����ļ�      %Post%
echo	ģ���ļ�      	%Template%
echo	�û��ļ�      	%Local%
echo .
echo --------------------------------------------------
set A=cam_general.opt
echo .
if exist "%Backup%%A%" (	
    echo .
	echo .�Ƴ��ӹ��˵��ļ�
	echo .
	del /q "%Meun%%A%"
	echo .
	echo .�ָ��ӹ��˵��ļ�
	echo .
	copy /y "%Backup%%A%" "%Meun%"
	echo .
	echo .�Ƴ��ӹ��˵������ļ�
	echo .
	del /q "%Backup%%A%"
	echo .
) else (
	echo .�ӹ��˵������ļ������ڣ�
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set B=template_post.dat
echo .
if exist "%Backup%%B%" (	
    echo .
	echo .�Ƴ�����˵��ļ�
	echo .
	del /q "%Post%%B%"
	echo .
	echo .�ָ�����˵��ļ�
	echo .
	copy /y "%Backup%%B%" "%Post%"
	echo .
	echo .�Ƴ������ļ�
    echo.
    del /q "%Post%post.def"
    del /q "%Post%post.tcl"
    del /q "%Post%ugpost_base_group1.tcl"
	echo.
	echo .�Ƴ��������ļ�
	echo .
	del /q "%Backup%%B%"
	echo .
) else (
	echo .�������ļ������ڣ�
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set C=ugs_model_templates_simpl_chinese.pax
echo .
if exist "%Backup%%C%" (	
    echo .
	echo .�Ƴ�ϵͳģ���ļ�
	echo .
	del /q "%Template%%C%"
	echo .
	echo .�ָ�ϵͳģ���ļ�
	echo .
	copy /y "%Backup%%C%" "%Template%"
	echo .
	echo .�Ƴ�ϵͳģ�屸���ļ�
	echo .
	del /q "%Backup%%C%"
	echo .
) else (
	echo .ϵͳģ�屸���ļ������ڣ�
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set D=Local\history.pax
set D1=nx_Capful_Drafting_Standard_User.dpv
echo .
if exist "%Backup%%D%" (
    echo .
	echo .�Ƴ���ͼģ���ļ�	
    del /q "%Local%%D1%"
    echo .
	echo .�Ƴ��û���Ϣ�ļ�
	echo .
	del /q "%Local%*.*"
	echo .
	echo .�ָ��û���Ϣ�ļ�
	echo .
	copy /y "%Backup%Local\*.*" "%Local%"
	echo .
	echo .�Ƴ��û���Ϣ�����ļ�
	echo .
	del /q "%Backup%Local\*.*"
	echo .
) else (
	echo .�û���Ϣ�����ļ������ڣ�
)
echo --------------------------------------------------
echo .
echo --------------------------------------------------
set F=\UGII\menus\ug_main.men
set F1=ug_main.men
echo .
if exist "%Backup%%F1%" (	
    echo .
	echo .�Ƴ������ļ�
	echo .
	del /q "%NX%%F%"
	echo .
	echo .�ָ������ļ�
	echo .
	copy /y "%Backup%%F1%" "%NX%%F%"
	echo .
	echo .�Ƴ����ⱸ���ļ�
	echo .
	del /q "%Backup%%F1%"
	echo .
) else (
	echo .���ⱸ���ļ������ڣ�
)
echo --------------------------------------------------
echo .ɾ�������ļ���
rmdir /q /s "%Capful%\Backup"
Goto Done

:N
echo --------------------------------------------------
echo *                                                *
echo *               %NX_Name%δ��װ                    *
echo *                                                *
echo --------------------------------------------------
Goto Done

:Done
pause
exit

