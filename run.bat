@echo off
REM Publie le portfolio sur GitHub Pages.
REM Double-clique sur ce fichier apres avoir modifie index.html, style.css, etc.

setlocal
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo === Verification du depot ===
if exist ".git\index.lock" (
  echo ERREUR : le fichier .git\index.lock bloque Git.
  echo Ferme GitHub Desktop ou tout autre programme qui utilise Git, puis relance.
  goto :error
)
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
  echo ERREUR : ce dossier n'est pas un depot Git.
  goto :error
)

echo.
echo === Recherche des changements ===
git -c core.quotepath=false add -A
if errorlevel 1 goto :error

git diff --cached --quiet
if not errorlevel 1 (
  echo Aucun changement a envoyer.
  call :ignored_assets
  pause
  exit /b 0
)

echo Fichiers qui seront publies :
git -c core.quotepath=false diff --cached --name-status
echo.

set "MESSAGE=Mise a jour du portfolio %date% %time%"
echo === Enregistrement : %MESSAGE% ===
git -c core.quotepath=false commit -m "%MESSAGE%"
if errorlevel 1 goto :error
git -c core.quotepath=false show --stat --oneline HEAD
echo.

echo === Recuperation des changements distants ===
git pull --rebase --autostash origin main
if errorlevel 1 (
  echo ERREUR : la recuperation des changements distants a echoue.
  echo Un conflit est probable : resous-le, puis relance ce fichier.
  goto :error
)

echo.
echo === Envoi vers GitHub ===
git push origin main
if errorlevel 1 (
  echo Premier envoi refuse, nouvelle tentative dans 3 secondes...
  timeout /t 3 /nobreak >nul
  git push origin main
  if errorlevel 1 goto :error
)

echo.
echo Termine. GitHub Pages publie en une minute environ :
echo https://jupomiii.github.io/julien-pomerleau/
call :ignored_assets
pause
exit /b 0

:ignored_assets
git -c core.quotepath=false status --ignored --short | findstr /i /c:"!! assets/" >nul
if errorlevel 1 exit /b 0
echo.
echo Attention : fichiers dans assets/ exclus du site par .gitignore :
git -c core.quotepath=false status --ignored --short | findstr /i /c:"!! assets/"
echo Si une image utilisee par le site apparait ici, retire-la de .gitignore et relance.
exit /b 0

:error
echo.
echo ERREUR : la publication a echoue. Lis le message ci-dessus.
pause
exit /b 1
