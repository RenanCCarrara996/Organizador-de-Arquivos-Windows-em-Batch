@echo off

setlocal enabledelayedexpansion

cls

echo ===================================CRIADOR AUTOMATICO DE ARQUIVOS PARA TESTES====================================
echo Ola, Seja bem-vindo(a) ao programa de criacao de arquivos testes!
echo _________________________________________________________________________________________________________________
echo Este programa tem como objetivo a criacao de arquivos exemplo em diversas extensoes, a fim de agilizar o processo
echo de testes do programa: "Organizador_arquivos.bat" de 'RCC996'
echo -----------------------------------------------------------------------------------------------------------------
echo [!] Atencao
echo A seguir, sera criado (caso nao houver) um diretorio chamado "TESTE_BAT" em sua Area de Trabalho (ou Desktop).
echo Se deseja continuar com o programa, faca o que se pede, caso contrario, apenas feche-o.
echo _________________________________________________________________________________________________________________

pause
cls
echo Certo, prosseguindo...
cd /d "%USERPROFILE%"
timeout /t 3

if exist "Area de Trabalho" (
    cd /d "Area de Trabalho"
) else if exist "Desktop" (
    cd /d "Desktop"
) else (
    echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    echo Nao foi possivel acessar sua Area de Trabalho, a pasta sera criada em %USERPROFILE%
    echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
)
timeout /t 3

if exist "TESTE_BAT" (
    cd "TESTE_BAT"
) else (
    mkdir "TESTE_BAT"
    cd "TESTE_BAT"
)

echo Agora voce esta em:
cd 
echo Prosseguindo para a criacao dos arquivos em 10 segundos...
timeout /t 10 /nobreak
cls

set /a count=1

FOR %%T in (pdf docx doc txt rtf odt jpg jpeg png gif bmp svg webp ico xlsx xls csv ods pptx ppt odp mp4 mkv avi mov wmv flv mp3 wav wma aac flac zip rar 7z tar gz exe msi bat sh) do (
    echo > "Arquivo_teste_!count!.%%T"
    set /a count+=1
)

echo ==================================
echo Arquivos criados com sucesso!
echo ==================================
echo Confira abaixo em 5 segundos...
timeout /t 5 /nobreak
echo --------------------------------------------------------------------
dir
echo --------------------------------------------------------------------
echo Faca o que se pede a seguir para encerrar o programa:
pause
exit

