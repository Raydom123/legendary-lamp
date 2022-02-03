@echo off
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator @abz2022/add >nul
net localgroup administrators ABZ /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo  Successful installation !, If RDP is dead, please rebuild again! 
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Cannot get an army tunnel, ensure Ngrok_Auth_token is right in settings> Secrets> secret archive. Perhaps your previous VM still runs: https://dashboard.ngrok.com/status/tunnels "
echo Username: ABZ
echo Password: @abz2022
