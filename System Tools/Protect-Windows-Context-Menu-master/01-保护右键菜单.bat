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
echo off > Registry-Menu-Lock.txt

REM �ļ��Ҽ���������������ļ�
echo HKEY_CLASSES_ROOT\*\shell [8 19] >> Registry-Menu-Lock.txt
echo HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM ��ݷ�ʽ�Ҽ���OneDrive �Ӱ�
echo HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM URL ��ݷ�ʽ�Ҽ���OneDrive �Ӱ�
echo HKEY_CLASSES_ROOT\IE.AssocFile.URL\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM Ŀ¼�Ҽ�
echo HKEY_CLASSES_ROOT\Directory\shell [8 19] >> Registry-Menu-Lock.txt
echo HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM Ŀ¼�����Ҽ�
echo HKEY_CLASSES_ROOT\Directory\Background\shell [8 19] >> Registry-Menu-Lock.txt
echo HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM �ļ�����չ�˵�
echo HKEY_CLASSES_ROOT\Folder\shell [8 19] >> Registry-Menu-Lock.txt
echo HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM �����Ҽ�
echo HKEY_CLASSES_ROOT\DesktopBackground\Shell [8 19] >> Registry-Menu-Lock.txt
echo HKEY_CLASSES_ROOT\DesktopBackground\Shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM ���ж���
echo HKEY_CLASSES_ROOT\AllFilesystemObjects\shell [8 19] >> Registry-Menu-Lock.txt
echo HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt
REM �����Ҽ�
echo HKEY_CLASSES_ROOT\Drive\shell [8 19] >> Registry-Menu-Lock.txt
echo HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers [8 19] >> Registry-Menu-Lock.txt

REM =======================================================================================================================
echo off > Registry-Menu-Unlock.txt

REM ϵͳ����
REM �ļ��Ҽ���������������ļ�
echo HKEY_CLASSES_ROOT\*\shell [1 5 8 17] >> Registry-Menu-Unlock.txt
echo HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM ��ݷ�ʽ�Ҽ���OneDrive �Ӱ�
echo HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM URL ��ݷ�ʽ�Ҽ���OneDrive �Ӱ�
echo HKEY_CLASSES_ROOT\IE.AssocFile.URL\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM Ŀ¼�Ҽ�
echo HKEY_CLASSES_ROOT\Directory\shell [1 5 8 17] >> Registry-Menu-Unlock.txt
echo HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM Ŀ¼�����Ҽ�
echo HKEY_CLASSES_ROOT\Directory\Background\shell [1 5 8 17] >> Registry-Menu-Unlock.txt
echo HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM �ļ�����չ�˵�
echo HKEY_CLASSES_ROOT\Folder\shell [1 5 8 17] >> Registry-Menu-Unlock.txt
echo HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM �����Ҽ�
echo HKEY_CLASSES_ROOT\DesktopBackground\Shell [1 5 8 17] >> Registry-Menu-Unlock.txt
echo HKEY_CLASSES_ROOT\DesktopBackground\Shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM ���ж���
echo HKEY_CLASSES_ROOT\AllFilesystemObjects\shell [1 5 8 17] >> Registry-Menu-Unlock.txt
echo HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt
REM �����Ҽ�
echo HKEY_CLASSES_ROOT\Drive\shell [1 5 8 17] >> Registry-Menu-Unlock.txt
echo HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers [1 5 8 17] >> Registry-Menu-Unlock.txt

REM =======================================================================================================================

:: �г�ѡ�ִ������
:menu
cls
echo ��ѡ������ѡ�
echo 1. �����Ҽ��˵��༭
echo 2. �����Ҽ��˵��༭
set /p choice=������ѡ������֣�
if "%choice%"=="1" (
  echo     ����
  regini Registry-Menu-Lock.txt
  psexec -i -s cmd /c "cd /d ""%~dp0"" && regini Registry-Menu-Lock.txt"
) else if "%choice%"=="2" (
  echo     ����
  psexec -i -s cmd /c "cd /d ""%~dp0"" && regini Registry-Menu-Unlock.txt"
  regini Registry-Menu-Unlock.txt
) else (
  goto menu
)

REM =======================================================================================================================

del Registry-Menu-Lock.txt
del Registry-Menu-Unlock.txt

pause