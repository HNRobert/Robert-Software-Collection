@echo off

REM ���� OneDrive ��ע����� 
for /f  %%a in ('reg query HKCR\CLSID /s /f OneDrive /d /c /e ^| find "HKEY_CLASSES_ROOT\CLSID"') do (
  set key=%%a
)

REM ����ҵ���ע������д���µ�ֵ 
if defined key (
  echo %key% > OneDrive-registry.txt
  echo System.IsPinnedToNameSpaceTree = REG_DWORD 0 >> OneDrive-registry.txt
  regini OneDrive-registry.txt
  del OneDrive-registry.txt
  echo �ɹ��޸�ע����� %key%
) else (
  echo û���ҵ�����������ע�����
)

pause