@echo off > Registry.txt

REM ����ע����� 
for /f "delims=" %%a in ('reg query HKEY_CLASSES_ROOT /s /f " FileSyncEx" /k /c /e ^| find "HKEY_CLASSES_ROOT"') do (
  echo %%a [DELETE] >> Registry.txt
)

REM ɾ��ע����� 
regini Registry.txt
del Registry.txt

pause


