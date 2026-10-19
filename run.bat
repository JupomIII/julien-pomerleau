@echo off
REM Synchronise les modifications du portfolio vers GitHub (GitHub Pages).
REM Double-clique sur ce fichier après avoir modifié index.html, style.css, etc.

setlocal
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo === Recherche des changements ===
git add -A
if errorlevel 1 goto :error

git diff --cached --quiet
if not errorlevel 1 (
  echo Aucun changement a envoyer.
  pause
  exit /b 0
)

set "MESSAGE=Mise a jour du portfolio %date% %time%"
echo.
echo === Enregistrement : %MESSAGE% ===
git commit -m "%MESSAGE%"
if errorlevel 1 goto :error

echo.
echo === Recuperation des changements distants ===
git pull --rebase origin main
if errorlevel 1 goto :error

echo.
echo === Envoi vers GitHub ===
git push origin main
if errorlevel 1 goto :error

echo.
echo Site mis a jour. Il peut prendre une minute avant d'etre visible :
echo https://jupomiii.github.io/julien-pomerleau/
pause
exit /b 0

:error
echo.
echo ERREUR : la synchronisation a echoue. Lis le message ci-dessus.
pause
exit /b 1
