@echo off
title MENU DE SUPORTE E REPARO - FUNESA
color 0A

:MENU
cls
echo =====================================================
echo          MENU DO SUPORTE TECNICO - FUNESA
echo              por Pablo Oliveira - V3.0 - Remake Henrique Rizotti
echo =====================================================
echo.

echo  1.  Verificar e Reparar Disco (CHKDSK)
echo  2.  Reparar Arquivos de Sistema (SFC)
echo  3.  Limpar Arquivos Temporarios
echo  4.  Verificar Erros de Memoria (Diagnostico)
echo  5.  Restaurar Sistema
echo  6.  Verificar Conectividade de Rede (Ping/Teste)
echo  7.  Gerenciar Processos (Task Manager)
echo  8.  Backup de Drivers
echo  9.  Verificar Atualizacoes do Windows
echo 10.  Informacoes do Sistema
echo 11.  Limpar Cache DNS
echo 12.  Reiniciar Servicos de Rede
echo 13.  Desfragmentar Disco
echo 14.  Gerenciar Usuarios Locais
echo 15.  Verificar Integridade de Arquivos (DISM)
echo 16.  Ativar/Desativar Firewall do Windows
echo 17.  Ver Logs de Eventos
echo 18.  Testar Velocidade de Disco
echo 19.  Criar Ponto de Restauracao
echo 20.  Executar Comando Personalizado (CMD)
echo 21.  Atualizar Todos os Programas (Winget Update)
echo 22.  Liberar Memoria RAM (Limpar Cache do Standby)
echo 23.  Abrir Configuracoes Avancadas de Rede
echo 24.  Checar Uso de Disco/CPU/Net em Tempo Real
echo 25.  Escanear Porta Aberta (Netstat)
echo 26.  Exibir IPs e Rotas (ipconfig/route)
echo 27.  Testar Velocidade de Internet (Speedtest CLI)
echo 28.  Desativar Programas de Inicializacao
echo 29.  Abrir Editor de Registro (Regedit)
echo 30.  Sair
echo =====================================================
set /p opcao=Escolha uma opcao (1-30): 

:: ================= EXECUÇÃO DAS OPCOES =================
if "%opcao%"=="1" chkdsk
if "%opcao%"=="2" sfc /scannow
if "%opcao%"=="3" cleanmgr
if "%opcao%"=="4" mdsched
if "%opcao%"=="5" rstrui
if "%opcao%"=="6" ping 8.8.8.8 -n 5 & pause
if "%opcao%"=="7" taskmgr
if "%opcao%"=="8" powershell -command "Export-WindowsDriver -Online -Destination C:\BackupDrivers"
if "%opcao%"=="9" powershell -command "Install-Module PSWindowsUpdate -Force; Get-WindowsUpdate; Install-WindowsUpdate -AcceptAll -AutoReboot"
if "%opcao%"=="10" systeminfo | more
if "%opcao%"=="11" ipconfig /flushdns
if "%opcao%"=="12" netsh winsock reset & netsh int ip reset & shutdown -r -t 5
if "%opcao%"=="13" defrag C:
if "%opcao%"=="14" lusrmgr.msc
if "%opcao%"=="15" DISM /Online /Cleanup-Image /ScanHealth
if "%opcao%"=="16" (
    echo 1 - Ativar Firewall
    echo 2 - Desativar Firewall
    set /p fw=Escolha: 
    if "%fw%"=="1" netsh advfirewall set allprofiles state on
    if "%fw%"=="2" netsh advfirewall set allprofiles state off
)
if "%opcao%"=="17" eventvwr
if "%opcao%"=="18" winsat disk
if "%opcao%"=="19" powershell -Command "Checkpoint-Computer -Description 'Ponto de Restauracao Manual'"
if "%opcao%"=="20" cmd
if "%opcao%"=="21" winget upgrade --all
if "%opcao%"=="22" powershell -Command "Clear-Content -Path C:\Windows\Temp\*; Clear-Content -Path C:\Users\*\AppData\Local\Temp\*; Write-Host 'Memoria liberada!'"
if "%opcao%"=="23" ncpa.cpl
if "%opcao%"=="24" resmon
if "%opcao%"=="25" netstat -ano | more
if "%opcao%"=="26" ipconfig /all & route print
if "%opcao%"=="27" (
    if exist "%TEMP%\speedtest\speedtest.exe" (
        echo Speedtest CLI ja instalado. Executando...
        "%TEMP%\speedtest\speedtest.exe"
    ) else (
        echo Baixando Speedtest CLI...
        powershell -Command "Invoke-WebRequest -Uri https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip -OutFile $env:TEMP\speedtest.zip"
        powershell -Command "Expand-Archive -Path $env:TEMP\speedtest.zip -DestinationPath $env:TEMP\speedtest -Force"
        echo Instalacao concluida. Executando teste...
        "%TEMP%\speedtest\speedtest.exe"
    )
    pause
)
if "%opcao%"=="28" taskmgr /7
if "%opcao%"=="29" regedit
if "%opcao%"=="30" exit

pause
goto MENU