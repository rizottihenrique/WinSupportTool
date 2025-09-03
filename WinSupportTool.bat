@echo off
title WinSupportTool
color 0A

:MENU
cls
echo =====================================================
echo              WinSupportTool
echo  por Pablo Oliveira - V3.0 - Remake Henrique Rizotti
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
echo 18.  Criar Ponto de Restauracao
echo 19.  Executar Comando Personalizado (CMD)
echo 20.  Atualizar Todos os Programas (Winget Update)
echo 21.  Liberar Memoria RAM (Limpar Cache do Standby)
echo 22.  Abrir Configuracoes Avancadas de Rede
echo 23.  Checar Uso de Disco/CPU/Net em Tempo Real
echo 24.  Escanear Porta Aberta (Netstat)
echo 25.  Exibir IPs e Rotas (ipconfig/route)
echo 26.  Testar Velocidade de Internet (Speedtest CLI)
echo 27.  Desativar Programas de Inicializacao
echo 28.  Abrir Editor de Registro (Regedit)
echo 29.  Sair
echo =====================================================
set /p opcao=Escolha uma opcao (1-29): 

:: ================= EXECUÇÃO DAS OPCOES =================
if "%opcao%"=="1" chkdsk C: /scan | more & pause
if "%opcao%"=="2" sfc /scannow | more & pause
if "%opcao%"=="3" cleanmgr
if "%opcao%"=="4" mdsched
if "%opcao%"=="5" rstrui
if "%opcao%"=="6" ping 8.8.8.8 -n 5 & pause
if "%opcao%"=="7" taskmgr
if "%opcao%"=="8" powershell -command "Export-WindowsDriver -Online -Destination C:\BackupDrivers"
if "%opcao%"=="9" powershell -command "Install-Module PSWindowsUpdate -Force; Get-WindowsUpdate; Install-WindowsUpdate -AcceptAll -AutoReboot"
if "%opcao%"=="10" systeminfo | more & pause
if "%opcao%"=="11" ipconfig /flushdns & pause
if "%opcao%"=="12" netsh winsock reset & netsh int ip reset & shutdown -r -t 5
if "%opcao%"=="13" defrag C: | more & pause
if "%opcao%"=="14" lusrmgr.msc
if "%opcao%"=="15" DISM /Online /Cleanup-Image /ScanHealth | more & pause
if "%opcao%"=="16" (
    echo 1 - Ativar Firewall
    echo 2 - Desativar Firewall
    set /p fw=Escolha: 
    if "%fw%"=="1" netsh advfirewall set allprofiles state on
    if "%fw%"=="2" netsh advfirewall set allprofiles state off
    pause
)
if "%opcao%"=="17" eventvwr
if "%opcao%"=="18" powershell -Command "Checkpoint-Computer -Description 'Ponto de Restauracao Manual'"
if "%opcao%"=="19" cmd
if "%opcao%"=="20" (
    where winget >nul 2>nul
    if errorlevel 1 (
        echo Winget nao encontrado. Instalando...
        powershell -command "Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile $env:TEMP\AppInstaller.msixbundle"
        powershell -command "Add-AppxPackage -Path $env:TEMP\AppInstaller.msixbundle"
        echo Instalacao concluida. Reinicie o script para usar o Winget.
        pause
    ) else (
        echo Winget encontrado. Atualizando programas...
        winget upgrade --all
        pause
    )
)
if "%opcao%"=="21" powershell -Command "Clear-Content -Path C:\Windows\Temp\*; Clear-Content -Path C:\Users\%USERNAME%\AppData\Local\Temp\*; Write-Host 'Memoria liberada!'; pause"
if "%opcao%"=="22" ncpa.cpl
if "%opcao%"=="23" resmon
if "%opcao%"=="24" netstat -ano | more & pause
if "%opcao%"=="25" ipconfig /all & route print | more & pause
if "%opcao%"=="26" (
    if exist "%TEMP%\speedtest\speedtest.exe" (
        echo Speedtest CLI ja instalado. Executando...
        "%TEMP%\speedtest\speedtest.exe"
    ) else (
        echo Baixando Speedtest CLI...
        powershell -command "Invoke-WebRequest -Uri https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip -OutFile $env:TEMP\speedtest.zip"
        powershell -command "Expand-Archive -Path $env:TEMP\speedtest.zip -DestinationPath $env:TEMP\speedtest -Force"
        echo Instalacao concluida. Executando teste...
        "%TEMP%\speedtest\speedtest.exe"
    )
    pause
)
if "%opcao%"=="27" taskmgr /7
if "%opcao%"=="28" regedit
if "%opcao%"=="29" exit

pause
goto MENU
