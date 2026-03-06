@echo off

setlocal enabledelayedexpansion

echo ==========================================================
echo =                   Seja bem-vindo ao                    =
echo =               "Organizador de Arquivos"                =
echo =                      por RCC996^^!                      =
echo ==========================================================
timeout /t 6 /nobreak

:MENU

cd /d "%USERPROFILE%"
cls

echo ----------------------------------------------------
echo MENU INICIAL
echo ----------------------------------------------------
echo Escolha o local que deseja organizar:
echo 1. Pasta Downloads
echo 2. Area de Trabalho ou Desktop
echo 3. Outro local
echo 4. Sair
echo OU
echo 5. Exibir pastas internas
echo ----------------------------------------------------

set /p OPCAO=Escolha uma opcao [1-5]: 

if  "%OPCAO%"=="1" goto DOWNLOAD
if  "%OPCAO%"=="2" goto DESKTOP
if  "%OPCAO%"=="3" goto OUTRO
if  "%OPCAO%"=="4" goto FIM
if  "%OPCAO%"=="5" (
  cls
  echo ====================================================
  echo PASTAS DISPONIVEIS:
  echo ____________________________________________________
  dir
  echo ====================================================
  pause
  goto MENU
)

echo Opcao invalida^^! Tente novamente...
pause
goto MENU

:DOWNLOAD
cd Downloads
goto MENU2

:DESKTOP
cd Desktop
goto MENU2

:OUTRO
cls
echo ===================================================================================================================
echo PASTAS DISPONIVEIS:
echo ___________________________________________________________________________________________________________________
dir
echo ===================================================================================================================
echo Para continuar, atente-se^^! Caso o local desejado esteja em outra unidade de disco [pen-drive, HD externo, etc]
echo ou ainda, seja apenas uma subpasta dentro de uma dessas apresentadas, digite o caminho exato do diretorio.
echo Caso contrario, digite apenas o nome da pasta.
echo exemplos:
echo C:\Usuarios\nome_usuario\Documents\exemplo_subpasta
echo ou
echo D:\MinhaPasta
echo -------------------------------------------------------------------------------------------------------------------
set /p DIRETORIO=Digite o caminho do local desejado: 

if exist "%DIRETORIO%" (
  cls
  cd /d "%DIRETORIO%"
  echo Voce escolheu "%DIRETORIO%"...
  FOR %%G IN (.) DO set "NOME_PASTA=%%~nxG"
  echo Voce agora esta em: "!NOME_PASTA!"
  echo O diretorio esta correto? [s/n]
  set /p RESPOSTA=Digite sua resposta: 
  
  if /i "!RESPOSTA!"=="s" (
    echo Ok, diretorio correto^^! Prosseguindo...
    pause
    goto MENU2
  )
  
  if /i "!RESPOSTA!"=="n" (
    echo Ok, diretorio incorreto^^! Tente novamente...
    pause
    cd /d "%USERPROFILE%"
    goto OUTRO    
  )
  
  echo Opcao invalida^^! Tente novamente...
  pause
  goto OUTRO
)

cls
echo Local "%DIRETORIO%" invalido ou inexistente^^! Verifique se o nome e/ou caminho estao corretos...
echo Ou, se preferir, deseja cria-lo? [s/n]
set /p RESPOSTA=Digite sua resposta: 

if /i "!RESPOSTA!"=="s" (
  echo Ok, criando diretorio...
  mkdir "%DIRETORIO%"
  echo Pronto, diretorio criado com sucesso^^!
  echo Quando houverem arquivos para organizar dentro dele, reexecute este programa.
  echo Retornando ao inicio...
  pause
  goto MENU
)

if /i "!RESPOSTA!"=="n" (
  echo Ok, Retornando ao inicio...
  pause
  goto MENU
)

echo Opcao invalida^^! Tente novamente...
pause
goto OUTRO

:MENU2
cls

echo ----------------------------------------------------------
echo ATENCAO^^! DEFINA O TIPO DE ORGANIZACAO
echo ----------------------------------------------------------
echo 1. Por categorias/grupos [ex: Documentos, Imagens, etc.]
echo 2. Apenas por tipos/extensoes [ex: PDFs, DOCX, PNGs, JPGs, etc.]
echo OU
echo 3. Selecionar outro local
echo 4. Sair

set /p OPCAO2=Escolha uma opcao [1-4]: 

if  "%OPCAO2%"=="1" goto CATEGORIAS
if  "%OPCAO2%"=="2" goto TIPOS
if  "%OPCAO2%"=="3" goto MENU
if  "%OPCAO2%"=="4" goto FIM

echo Opcao invalida^^! Tente novamente...
pause
goto MENU2

:CATEGORIAS
cls
echo Atencao^^!^^! Ao prosseguir as seguintes acoes serao executadas dentro do local indicado anteriormente:
echo - Criacao de diretorios especificos;
echo - Movimentacao de todos os arquivos* para os novos diretorios.
echo ------------------------------------------------------------------
echo [*] Serao movidos apenas os arquivos que forem compativeis com o
echo programa e estiverem dentro do diretorio indicado anteriormente.
echo [^^!] Certifique-se que nao ha nenhum arquivo do local indicado aberto
echo Exceto se um deles for este programa.
echo ------------------------------------------------------------------
echo Tem certeza que deseja prosseguir? [s/n]
set /p RESPOSTA2=Digite sua resposta: 

if /i "!RESPOSTA2!"=="n" (
  echo Certo, cancelando operacoes e retornando ao inicio...
  pause
  goto MENU
)

if /i "!RESPOSTA2!"=="s" (
  goto PROCESSO_CATEGORIAS
)

echo Opcao invalida^^! Tente novamente...
pause
goto CATEGORIAS


:PROCESSO_CATEGORIAS
cls
echo Certo, prosseguindo em 5 segundos...
timeout /t 5 /nobreak
set /a count=0

FOR %%E in (pdf docx doc txt rtf odt) do (
  if exist "*.%%E" (
    if not exist "Documentos" ( 
      mkdir "Documentos" 
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Documentos" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    if not exist "Documentos\%%E" mkdir "Documentos\%%E"
    move /y "*.%%E" "Documentos\%%E\" >nul 2>&1
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)
echo ________________________________________________________________
echo Categoria "Documentos" completa^^!
echo ________________________________________________________________
set /a count=0

FOR %%E in (jpg jpeg png gif bmp svg webp ico) do (
  if exist "*.%%E" (
    if not exist "Imagens" (
      mkdir "Imagens"
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Imagens" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    
    if not exist "Imagens\%%E" mkdir "Imagens\%%E"
    
    move /y "*.%%E" "Imagens\%%E\" >nul 2>&1
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)

echo ________________________________________________________________
echo Categoria "Imagens" completa^^!
echo ________________________________________________________________
set /a count=0

FOR %%E in (xlsx xls csv ods) do (
  if exist "*.%%E" (
    if not exist "Planilhas" (
      mkdir "Planilhas"
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Planilhas" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    
    if not exist "Planilhas\%%E" mkdir "Planilhas\%%E"
    
    move /y "*.%%E" "Planilhas\%%E\" >nul 2>&1
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)

echo ________________________________________________________________
echo Categoria "Planilhas" completa^^!
echo ________________________________________________________________
set /a count=0

FOR %%E in (pptx ppt odp) do (
  if exist "*.%%E" (
    if not exist "Slides" (
      mkdir "Slides"
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Slides" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    
    if not exist "Slides\%%E" mkdir "Slides\%%E"
    
    move /y "*.%%E" "Slides\%%E\" >nul 2>&1
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)

echo ________________________________________________________________
echo Categoria "Slides" completa^^!
echo ________________________________________________________________
set /a count=0

FOR %%E in (mp4 mkv avi mov wmv flv) do (
  if exist "*.%%E" (
    if not exist "Videos" (
      mkdir "Videos"
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Videos" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    
    if not exist "Videos\%%E" mkdir "Videos\%%E"
    
    move /y "*.%%E" "Videos\%%E\" >nul 2>&1
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)

echo ________________________________________________________________
echo Categoria "Videos" completa^^!
echo ________________________________________________________________
set /a count=0

FOR %%E in (mp3 wav wma aac flac) do (
  if exist "*.%%E" (
    if not exist "Musicas" (
      mkdir "Musicas"
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Musicas" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    
    if not exist "Musicas\%%E" mkdir "Musicas\%%E"
    
    move /y "*.%%E" "Musicas\%%E\" >nul 2>&1
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)

echo ________________________________________________________________
echo Categoria "Musicas" completa^^!
echo ________________________________________________________________
set /a count=0

FOR %%E in (zip rar 7z tar gz) do (
  if exist "*.%%E" (
    if not exist "Compactados" (
      mkdir "Compactados"
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Compactados" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    
    if not exist "Compactados\%%E" mkdir "Compactados\%%E"
    
    move /y "*.%%E" "Compactados\%%E\" >nul 2>&1
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)

echo ________________________________________________________________
echo Categoria "Compactados" completa^^!
echo ________________________________________________________________
set /a count=0

FOR %%E in (exe msi bat sh) do (
  if exist "*.%%E" (
    if not exist "Executaveis" (
      mkdir "Executaveis"
      set /a count+=1
    ) else (
      if !count!==0 (
        echo ========================================================================================================
        echo PROCESSO PAUSADO
        echo Ja existe uma pasta "Executaveis" nesse diretorio, apos o processo, verifique a existencia de arquivos
        echo anteriores nao processados. Aguarde o processo encerrar!
        echo RETOMANDO EM 5 SEGUNDOS...
        echo ========================================================================================================
        timeout /t 5 /nobreak
        set /a count+=1
      )
    )
    
    if not exist "Executaveis\%%E" mkdir "Executaveis\%%E"

    if /i "%%E"=="bat" (
      FOR %%F in (*.bat) do (
        if /i not "%%F"=="%~nx0" (
          move /y "%%F" "Executaveis\%%E\" >nul 2>&1
        )
      )
    ) else (
      move /y "*.%%E" "Executaveis\%%E\" >nul 2>&1
    )
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)
echo ________________________________________________________________
echo Categoria "Compactados" completa^^!
echo ________________________________________________________________
set /a count=0
timeout /t 5

cls
echo ====================================================================================================================
echo Processo finalizado, abrindo explorador de arquivos para vizualizacao final e encerrando programa em 10 segundos...
echo ====================================================================================================================
start .
timeout /t 10
goto FIM


:TIPOS
cls
echo Atencao^^!^^! Ao prosseguir as seguintes acoes serao executadas dentro do local indicado anteriormente:
echo - Criacao de diretorios especificos;
echo - Movimentacao de todos os arquivos* para os novos diretorios.
echo ------------------------------------------------------------------
echo [*] Serao movidos apenas os arquivos que forem compativeis com o
echo programa e estiverem dentro do diretorio indicado anteriormente.
echo [^^!] Certifique-se que nao ha nenhum arquivo do local indicado aberto
echo Exceto se um deles for este programa.
echo ------------------------------------------------------------------
echo Tem certeza que deseja prosseguir? [s/n]
set /p RESPOSTA2=Digite sua resposta:

if /i "!RESPOSTA2!"=="n" (
  echo Certo, cancelando operacoes e retornando ao inicio...
  pause
  goto MENU
)

if /i "!RESPOSTA2!"=="s" (
  goto PROCESSO_TIPOS
)

echo Opcao invalida^^! Tente novamente...
goto TIPOS

:PROCESSO_TIPOS
cls
echo Certo, prosseguindo em 5 segundos...
timeout /t 5 /nobreak

FOR %%E in (pdf docx doc txt rtf odt jpg jpeg png gif bmp svg webp ico xlsx xls csv ods pptx ppt odp mp4 mkv avi mov wmv flv mp3 wav wma aac flac zip rar 7z tar gz exe msi bat sh) do (
  if exist "*.%%E" (
    if not exist "%%E" mkdir "%%E"
    
    if /i "%%E"=="BAT" (
      FOR %%F in (*.bat) do (
        if /i not "%%F"=="%~nx0" (
          move /y "%%F" "%%E\" >nul 2>&1
        )
      )
      ) else (
      move /y "*.%%E" "%%E\" >nul 2>&1
    )
  ) else (
    echo Nao ha arquivos %%E para processar, continuando...
  )
)

cls
echo ====================================================================================================================
echo Processo finalizado, abrindo explorador de arquivos para vizualizacao final e encerrando programa em 10 segundos...
echo ====================================================================================================================
start .
timeout /t 10
goto FIM

:FIM
cls
echo =========================
echo Encerrando programa...
echo =========================
timeout /t 5

exit
