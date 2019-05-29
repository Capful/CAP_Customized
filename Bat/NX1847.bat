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
if not exist "%Backup%"con md "%Backup%"
if not exist "%Backup%Local"con md "%Backup%Local"
echo --------------------------------------------------
if exist "%Backup%cam_general.opt" (	
	echo .�ӹ��˵��ļ�          �Ѵ��ڱ���
	echo .
) else (
	echo .���� �ӹ��˵��ļ�     ����
	echo .
	copy /y "%Meun%cam_general.opt" "%Backup%" 
)
echo .�滻�ӹ��˵��ļ�..
echo .
copy /y "%CAP_Template%cam_general.opt" "%Meun%"
echo .
echo --------------------------------------------------
if exist "%Backup%template_post.dat" (	
	echo .����˵��ļ�        �Ѵ��ڱ���
	echo .
) else (
	echo .���� ����˵��ļ�   ����
	echo .
	copy /y "%Post%template_post.dat" "%Backup%" 
)
echo .�滻����˵��ļ�..
echo .
copy /y "%CAP_Post%template_post.dat" "%Post%"
echo .
echo .�滻�����ļ�..
echo .
copy /y "%CAP_Post%*.*" "%Post%"
echo .
echo .--------------------------------------------------
if exist "%Backup%ugs_model_templates_simpl_chinese.pax" (	
	echo .ϵͳģ��              �Ѵ��ڱ���
	echo .
) else (
	echo .���� ϵͳģ��         ����
	echo .
	copy /y "%Template%ugs_model_templates_simpl_chinese.pax" "%Backup%" 
)
echo .�滻ϵͳģ���ļ�..
echo .
copy /y "%CAP_Template%ugs_model_templates_simpl_chinese.pax" "%Template%"
echo .
echo --------------------------------------------------
if exist "%Backup%Local\history.pax" (	
	echo .�û���Ϣ�ļ�          �Ѵ��ڱ���
	echo .
) else (
	echo .���� �û���Ϣ�ļ�     ����
	echo .
	copy /y "%Local%*.*" "%Backup%Local\" 
)
echo .�滻�û���Ϣ�ļ�..
echo .
copy /y "%Customized%NX\Local\*.*" "%Local%"
echo .
echo .�滻��ͼģ���ļ�..
echo .
copy /y "%CAP_Template%nx_Capful_Drafting_Standard_User.dpv" "%Local%"
echo .
echo --------------------------------------------------
if exist "%Backup%ug_main.men" (	
	echo .��������ļ�          �Ѵ��ڱ���
	echo .
) else (
	echo .���� ��������ļ�     ����
	echo .
	copy /y "%NX%\UGII\menus\ug_main.men" "%Backup%" 
)
echo .�滻��������ļ�
echo .
copy /y "%Customized%NX\nx1847_ug_main.men" "%NX%\UGII\menus\ug_main.men"
echo .
echo --------------------------------------------------

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