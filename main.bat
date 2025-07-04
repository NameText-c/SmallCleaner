@echo off
set userChoice=unkdown
set APP_NAME=SmallCleaner
set CON_TITLE_homePage=%APP_NAME%
set CON_TITLE_clean=Cleaning... - %APP_NAME%
set CON_TITLE_finishPage=Finished - %APP_NAME%
set UNIT_STORAGE_GiB=1073741824
set UNIT_STORAGE_MiB=1048576


:getAdministratorPrivileges
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit cd /d "%~dp0"


:homePage
title %CON_TITLE_homePage%
mode con cols=35 lines=8
cls
echo.
echo       [C] Clean
echo       [X] Exit
echo    _____________________________
echo.
echo       Type your choice[C,X]:
choice /c "CX" /n
set userChoice=%errorlevel%
if %userChoice%==1 (goto clean)
if %userChoice%==2 (exit 0)
goto homePage


:clean
title %CON_TITLE_clean%
mode con cols=100 lines=30
cls
del /f /s /q "%temp%\*"
del /f /s /q "%userprofile%\.cache\*"
del /f /s /q "%windir%\*.tmp"
del /f /s /q "%windir%\temp\*"
del /f /s /q "%windir%\*.bak"
del /f /s /q "%windir%\*.back"
del /f /s /q "%windir%\SoftwareDistribution\Download\*"
goto finishPage


:finishPage
title %CON_TITLE_finishPage%
mode con cols=34 lines=11
cls
echo.
echo          Finished clean.
echo    ____________________________
echo.
echo       [H] Back to home page
echo       [X] Exit
echo    ____________________________
echo.
echo       Type your choice[H,X]:
choice /c "HX" /n
set userChoice=%errorlevel%
if %userChoice%==1 (goto homePage)
if %userChoice%==2 (exit 0)