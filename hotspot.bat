@echo off

:menu
cls
echo Hotspot Manager
echo ----------------
echo 1. Start Hotspot
echo 2. Stop Hotspot
echo 3. Show Status
echo 4. Exit

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    goto start_hotspot
) else if "%choice%"=="2" (
    goto stop_hotspot
) else if "%choice%"=="3" (
    goto show_status
) else if "%choice%"=="4" (
    goto end
) else (
    echo Invalid choice. Please select a valid option.
    timeout /t 2 >nul
    goto menu
)

:start_hotspot
netsh wlan set hostednetwork mode=allow ssid=sms key=sajinmsimon
netsh wlan start hostednetwork
echo Hotspot "sms" started.
timeout /t 3 >nul
goto menu

:stop_hotspot
netsh wlan stop hostednetwork
echo Hotspot "sms" stopped.
timeout /t 3 >nul
goto menu

:show_status
cls
echo Ethernet Status:
ipconfig | findstr /C:"Ethernet adapter" /C:"Physical Address" /C:"IPv4 Address"
echo.

echo Hotspot Status:
netsh wlan show hostednetwork | findstr /C:"Status"
echo.

echo Network Traffic:
netstat -e

timeout /t 5 >nul
goto menu

:end
