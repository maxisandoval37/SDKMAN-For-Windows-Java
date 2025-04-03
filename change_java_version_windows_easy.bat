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

:: Define Java versions and their paths
set "java7=C:\Program Files\Java\jdk1.7.0_80"
set "java11=C:\Program Files\Java\jdk-11.0.20"
set "java21=C:\Program Files\Java\jdk-21.0.1"

:menu

cls

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
echo.

echo.
echo ##########################################################
echo ###########CREDITS BY GITHUB.COM/MAXISANDOVAL37###########
echo ##########################################################
echo.

echo ===============================
echo       Java Version Selector    
echo ===============================
echo Current Java version:
java -version
echo.
echo.

:: Display options
echo Select an option:
echo [1] Show current Java version
echo [2] Use Java 7
echo [3] Use Java 11
echo [4] Use Java 21
echo [5] Exit
echo.
set /p choice=Enter the number of the desired option: 
echo.

:: Handle selection
if "%choice%"=="1" (
    echo Current Java version:
    java -version
    pause
    goto menu
)
if "%choice%"=="2" set "JAVA_HOME=!java7!"
if "%choice%"=="3" set "JAVA_HOME=!java11!"
if "%choice%"=="4" set "JAVA_HOME=!java21!"
if "%choice%"=="5" exit /b

:: Validate the selection
if not defined JAVA_HOME (
    echo Invalid option.
    pause
    goto menu
)

:: Update environment variables
setx JAVA_HOME "%JAVA_HOME%" /M
setx PATH "%JAVA_HOME%\bin;%PATH%" /M

:: Apply changes in the current session
set "PATH=%JAVA_HOME%\bin;%PATH%"

echo Java changed to: %JAVA_HOME%
java -version
pause
goto menu