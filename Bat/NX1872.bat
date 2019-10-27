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
	xcopy "%Meun%cam_general.opt" "%Backup%" /c /e /r /y /s
)
echo .�滻�ӹ��˵��ļ�..
echo .
xcopy "%CAP_Template%cam_general.opt" "%Meun%" /c /e /r /y /s
echo .
echo --------------------------------------------------
if exist "%Backup%template_post.dat" (	
	echo .�����˵��ļ�        �Ѵ��ڱ���
	echo .
) else (
	echo .���� �����˵��ļ�   ����
	echo .
	xcopy "%Post%template_post.dat" "%Backup%"  /c /e /r /y /s
)
echo .�滻�����˵��ļ�..
echo .
xcopy "%CAP_Post%template_post.dat" "%Post%" /c /e /r /y /s
echo .
echo .�滻�����ļ�..
echo .
xcopy "%CAP_Post%*.*" "%Post%" /c /e /r /y /s
echo .
echo .--------------------------------------------------
if exist "%Backup%ugs_model_templates_simpl_chinese.pax" (	
	echo .ϵͳģ��              �Ѵ��ڱ���
	echo .
) else (
	echo .���� ϵͳģ��         ����
	echo .
	xcopy  "%Template%ugs_model_templates_simpl_chinese.pax" "%Backup%" /c /e /r /y /s
)
echo .�滻ϵͳģ���ļ�..
echo .
xcopy "%CAP_Template%ugs_model_templates_simpl_chinese.pax" "%Template%" /c /e /r /y /s
echo .
echo --------------------------------------------------
if exist "%Backup%Local\history.pax" (	
	echo .�û���Ϣ�ļ�          �Ѵ��ڱ���
	echo .
) else (
	echo .���� �û���Ϣ�ļ�     ����
	echo .
	xcopy "%Local%*.*" "%Backup%Local\"  /c /e /r /y /s
)
echo .�滻�û���Ϣ�ļ�..
echo .
xcopy "%Customized%NX\Local\*.*" "%Local%" /c /e /r /y /s
echo .
echo .�滻��ͼģ���ļ�..
echo .
xcopy "%CAP_Template%nx_Capful_Drafting_Standard_User.dpv" "%Local%" /c /e /r /y /s
echo .
echo --------------------------------------------------
if exist "%Backup%ug_main.men" (	
	echo .��������ļ�          �Ѵ��ڱ���
	echo .
) else (
	echo .���� ��������ļ�     ����
	echo .
	xcopy "%NX%\UGII\menus\ug_main.men" "%Backup%"  /c /e /r /y /s
)
echo .�滻��������ļ�
echo .
xcopy "%Customized%NX\nx1872_ug_main.men" "%NX%\UGII\menus\ug_main.men" /c /e /r /y /s
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