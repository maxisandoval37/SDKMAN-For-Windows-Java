@echo off & setlocal EnableDelayedExpansion
color 0A
title JAVA VERSION WINDOWS

:: Check if the script has administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo The script requires administrator privileges.
    echo Requesting permissions...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Search for Java installations in the default directory
set "java_dir=C:\Program Files\Java"
set "count=0"

for /f "delims=" %%A in ('dir /b /ad "%java_dir%\jdk*" 2^>nul') do (
    set /a count+=1
    set "java_option_!count!=%%A"
)

:: Get the full path of this .bat file
set "THISBAT=%~f0"
set "BATDIR=%~dp0"
set "BATDIR=%BATDIR:~0,-1%"

echo Setting environment variable sdkw to: %THISBAT%
setx sdkw "%THISBAT%" /M

:: Add current folder to PATH if not already included
echo %PATH% | find /i "%BATDIR%" >nul
if errorlevel 1 (
    echo Adding %BATDIR% to the system PATH...
    setx PATH "%PATH%;%BATDIR%" /M
) else (
    echo The directory is already in the PATH.
)

:: Define Java download links
set "java7_url=https://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-windows-x64.exe"
set "java8_url=https://download.oracle.com/java/8/archive/jdk-8u401-windows-x64.exe"
set "java11_url=https://download.oracle.com/java/11/archive/jdk-11.0.20_windows-x64_bin.exe"
set "java17_url=https://download.oracle.com/java/17/archive/jdk-17.0.10_windows-x64_bin.exe"
set "java21_url=https://download.oracle.com/java/21/archive/jdk-21.0.1_windows-x64_bin.exe"
set "java24_url=https://download.oracle.com/java/24/archive/jdk-24_windows-x64_bin.exe"

:menu
cls

call :print_ascii

echo ================================
echo      Java Version Selector    
echo.

call :get_current_java
echo   Current Java version: !java_version!
echo ================================

echo.
echo Select an option:
echo  [0] Show current Java version

for /L %%N in (1,1,%count%) do (
    echo  [%%N] !java_option_%%N!
)

echo  [8] Exit
echo  [9] Download Java version
echo.
set /p choice=Enter the number of the desired option: 
echo.

:: Handle selection
if "%choice%"=="0" (
    call :get_current_java
    echo Current Java version: !java_version!
    pause
    goto menu
)

if "%choice%"=="8" exit /b
if "%choice%"=="9" goto download_java

:: Loop to check installed Java selection
for /L %%N in (1,1,%count%) do (
    if "%choice%"=="%%N" (
        set "selected_java=!java_option_%%N!"
        goto set_java
    )
)

echo Invalid option.
pause
goto menu

:set_java
set "JAVA_HOME=%java_dir%\%selected_java%"
setx JAVA_HOME "%JAVA_HOME%" /M
setx PATH "%JAVA_HOME%\bin;%PATH%" /M

:: Update current session
set "PATH=%JAVA_HOME%\bin;%PATH%"

echo.
echo Java changed to: %JAVA_HOME%
echo.
pause
goto menu

:download_java
cls
echo Select a Java version to download:
echo.
echo  [1] Java 7
echo  [2] Java 8
echo  [3] Java 11
echo  [4] Java 17
echo  [5] Java 21
echo  [6] Java 24
echo  [7] Go back to the main menu
echo.
set /p download_choice=Enter the number of the desired version: 

if "%download_choice%"=="1" set "download_url=!java7_url!"
if "%download_choice%"=="2" set "download_url=!java8_url!"
if "%download_choice%"=="3" set "download_url=!java11_url!"
if "%download_choice%"=="4" set "download_url=!java17_url!"
if "%download_choice%"=="5" set "download_url=!java21_url!"
if "%download_choice%"=="6" set "download_url=!java24_url!"
if "%download_choice%"=="7" goto menu

if not defined download_url (
    echo Invalid option.
    pause
    goto download_java
)

echo Downloading Java, please wait...
powershell -Command "& {Invoke-WebRequest -Uri '%download_url%' -OutFile 'java_installer.exe'}"

echo Download complete! Starting installation...
start /wait java_installer.exe /s

echo Installation finished. You may need to restart your system.
pause
goto menu

:get_current_java
for /f "tokens=2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v JAVA_HOME 2^>nul') do set "JAVA_HOME_TMP=%%b"

set "java_version=Unknown"
for %%v in (7 8 11 17 21 24) do (
    if not "!JAVA_HOME_TMP!"=="" (
        echo !JAVA_HOME_TMP! | findstr /i "1\.%%v\." >nul && set "java_version=Java %%v"
        echo !JAVA_HOME_TMP! | findstr /i "%%v\." >nul && set "java_version=Java %%v"
    )
)
exit /b

:print_ascii
echo.
echo                  _________-----_____
echo        ____------           __      ----_
echo  ___----             ___------              \
echo     ----________        ----                 \
echo                -----__    ^|             _____)
echo                     __-                /     \
echo         _______-----    ___--          \    /)\
echo   ------_______      ---____            \__/  /
echo                -----__    \ --    _          /\
echo                       --__--__     \_____/   \_/\
echo                               ---^|   /          ^|
echo                                  ^| ^|___________^|
echo                                  ^| ^| ((_(_)^| )_)
echo                                  ^|  \_((_(_)^|/(_)
echo                                   \             (
echo                                    \_____________)
echo.
echo ##########################################################
echo ###########CREDITS BY GITHUB.COM/MAXISANDOVAL37###########
echo ##########################################################
echo.
exit /b