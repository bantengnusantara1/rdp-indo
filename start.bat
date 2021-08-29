@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user Admin zU6UvZxB /add >nul
net localgroup administrators Admin /add >nul
net user Admin /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant Admin:F >nul
ICACLS C:\Windows\installer /grant Admin:F >nul
echo Setup Success"
echo -----------Windows RPD Details-----------
echo RPD IP Connection:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Ngrok token error! | Check your Ngrok token"
echo Username:
echo "Admin"
echo Password:
echo "zU6UvZxB"
echo -------------------------------------------
ping -n 10 127.0.0.1 >nul
