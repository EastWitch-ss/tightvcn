# Paths for the files within the extracted folder
$installerPath = "$env:TEMP\TightVNC\tightvnc-2.8.84-gpl-setup-64bit.msi"
$regFilePath = "$env:TEMP\TightVNC\tightvnc-settings.reg"

# Silent installation of TightVNC Server
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $installerPath /quiet /norestart ADDLOCAL=Server" -Wait -NoNewWindow

# Import registry settings
Start-Process -FilePath "regedit.exe" -ArgumentList "/s $regFilePath" -Wait -NoNewWindow

# Add firewall rule for TightVNC
New-NetFirewallRule -DisplayName "Allow TightVNC Server" -Direction Inbound -Protocol TCP -LocalPort 5900,5901 -Action Allow

# Clean up temporary files
if (Test-Path $installerPath) { Remove-Item $installerPath -Force }
if (Test-Path $regFilePath) { Remove-Item $regFilePath -Force }
