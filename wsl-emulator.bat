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

:inicio
echo Selecione uma opção:
echo 1. Manual
echo 2. Automático
echo 3. Abrir GitHub
echo 4. Sair
set /p opcao=Digite o número da opção desejada: 

if "%opcao%"=="1" goto manual
if "%opcao%"=="2" goto automatico
if "%opcao%"=="3" goto abrir_github
if "%opcao%"=="4" goto sair
echo Opção inválida. Por favor, escolha uma opção válida.
timeout /t 4 >nul
goto inicio

:manual
echo Abrindo a janela de Recursos do Windows...
control appwiz.cpl,,2
pause
goto inicio

:automatico
echo 1. Ativar Emulador
echo 2. Ativar WSL
echo 3. Sair
set /p subopcao=Digite o número da opção desejada: 

if "%subopcao%"=="1" goto ativarEmulador
if "%subopcao%"=="2" goto ativarWSL
if "%subopcao%"=="3" goto inicio
echo Opção inválida. Por favor, escolha uma opção válida.
timeout /t 4 >nul
goto automatico

:abrir_github
start https://github.com/Pugn0/wsl-emulator
timeout /t 4 >nul
goto inicio

:ativarWSL
echo Ativando Subsistema do Windows para Linux...
powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux"
echo Subsistema ativado com sucesso.
goto pergunta_reiniciar

:ativarEmulador
echo Desativando Subsistema do Windows para Linux...
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux"
echo Emulador desativado com sucesso.
goto pergunta_reiniciar

:pergunta_reiniciar
echo Deseja reiniciar agora para aplicar as mudanças? [S/N]
set /p resposta=Digite S para reiniciar agora ou N para voltar ao menu: 
if /I "%resposta%"=="S" goto reiniciar
if /I "%resposta%"=="N" goto inicio
echo Opção inválida. Por favor, escolha uma opção válida.
goto pergunta_reiniciar

:reiniciar
shutdown /r /t 0

:sair
exit