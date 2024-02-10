@echo off
chcp 65001 > nul

REM Logo

echo.
echo ............................................................................
echo ░░░░░░░░▄██▄░░░░░░▄▄░░	   .                                                .
echo ░░░░░░░▐███▀░░░░░▄███▌     .                                                .
echo ░░▄▀░░▄█▀▀░░░░░░░░▀██░	   .    Desativando os seguintes recursos           .
echo ░█░░░██░░░░░░░░░░░░░░░	   .    - Subsistema Windows para Linux             .
echo █▌░░▐██░░▄██▌░░▄▄▄░░░▄	   .    - Plataforma de Máquina Virtual             .
echo ██░░▐██▄░▀█▀░░░▀██░░▐▌     .                                                .
echo ██▄░▐███▄▄░░▄▄▄░▀▀░▄██     .                                                .
echo ▐███▄██████▄░▀░▄█████▌     .                                                .
echo ▐████████████▀▀██████░     .                                                .
echo ░▐████▀██████░░█████░░     .                                                .
echo ░░░▀▀▀░░█████▌░████▀░░     .                                                .
echo ░░░░░░░░░▀▀███░▀▀▀░░░░     .                                                .
echo .............................................................................
echo [1] - Fazer manualmente	[2] - Fazer automaticamente [3] Sobre	[4] Sair
echo.

:menu

set /p opcao=Digite o número da opção desejada:

if "%opcao%"=="1" (
    call :manual
) else if "%opcao%"=="2" (
    call :automatico
) else if "%opcao%"=="3" (
    start https://github.com/Pugn0/wsl-emulator
	timeout /t 4 >nul
	goto menu
) else if "%opcao%"=="4" (
    exit
) else (
    echo Opção inválida. Por favor, escolha uma opção válida.
    timeout /t 4 >nul
    goto menu
)

exit

:manual
echo Abrindo a janela de Recursos do Windows...
control appwiz.cpl,,2
pause
goto menu

:automatico
echo Deseja ativar (A) ou desativar (D) os recursos? (A/D)
set /p escolha=

if /i "%escolha%"=="A" (
    echo Ativando Subsistema do Windows para Linux...
    powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux"
    echo.
    echo Ativando Plataforma de Máquina Virtual...
    powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform"
    echo.
    echo Concluído! O sistema será reiniciado em breve.
    shutdown /r /t 5 /f /d p:0:0
) else if /i "%escolha%"=="D" (
    echo Desativando Subsistema do Windows para Linux...
    powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux"
    echo.
    echo Desativando Plataforma de Máquina Virtual...
    powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform"
    echo.
    echo Concluído!
) else (
    echo Opção inválida. Por favor, escolha A para ativar ou D para desativar os recursos.
    pause
    goto automatico
)
goto menu
