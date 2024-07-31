@echo off
:: Download the PowerShell script from GitHub
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/EastWitch-ss/tightvcn/blob/main/install-tightvcn.ps1' -OutFile '%TEMP%\install-tightvnc.ps1'"

:: Execute the PowerShell script
powershell -ExecutionPolicy Bypass -File "%TEMP%\install-tightvnc.ps1"

