@echo off
cd /d "%~dp0"

:: ������ԱȨ��
net session >nul 2>&1
if %errorLevel% neq 0 (
  echo ���Թ���ԱȨ�����д˽ű���
  pause
  exit /b
)

REM ��ȡ��ǰ�û��İ�ȫ��ʶ��
for /f "tokens=1* delims= " %%a in ('whoami /user /nh') do set "userSID=%%b"

REM =======================================================================================================================
echo off > Registry-Explorer-Lock.txt

echo ; ��Դ�������̷�ͼ�� >> Registry-Explorer-Lock.txt
echo HKEY_USERS\%userSID%\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer [1 5 8 17] >> Registry-Explorer-Lock.txt
echo HKEY_USERS\%userSID%\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace [8 19] >> Registry-Explorer-Lock.txt
echo ; ѡ���ļ��д����̷�ͼ�� >> Registry-Explorer-Lock.txt
echo HKEY_USERS\%userSID%\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace [8 19] >> Registry-Explorer-Lock.txt

REM =======================================================================================================================
echo off > Registry-Explorer-Unlock.txt

echo ; ��Դ�������̷�ͼ�� >> Registry-Explorer-Lock.txt
echo HKEY_USERS\%userSID%\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer [1 5 8 17] >> Registry-Explorer-Unlock.txt
echo HKEY_USERS\%userSID%\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace [1 5 8 17] >> Registry-Explorer-Unlock.txt
echo ; ѡ���ļ��д����̷�ͼ�� >> Registry-Explorer-Lock.txt
echo HKEY_USERS\%userSID%\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace [1 5 8 17] >> Registry-Explorer-Unlock.txt

REM =======================================================================================================================

:: �г�ѡ�ִ������
:menu
cls
echo ��ѡ������ѡ�
echo 1. ���� NameSpace
echo 2. ���� NameSpace
set /p choice=������ѡ������֣�
if "%choice%"=="1" (
  echo     ����
  psexec -i -s cmd /c "cd /d ""%~dp0"" && regini Registry-Explorer-Lock.txt"
) else if "%choice%"=="2" (
  echo     ����
  psexec -i -s cmd /c "cd /d ""%~dp0"" && regini Registry-Explorer-Unlock.txt"
) else (
  goto menu
)

REM =======================================================================================================================

del Registry-Explorer-Lock.txt
del Registry-Explorer-Unlock.txt

pause