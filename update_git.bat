@echo off
title Masir Biriyani - Git Auto Updater
color 0b
echo =====================================================================
echo                MASIR BIRIYANI GIT AUTO-UPDATER
echo =====================================================================
echo.

:: Step 1: Check git status
echo [Step 1/4] Checking current Git status...
echo ---------------------------------------------------------------------
git status
echo ---------------------------------------------------------------------
echo.

:: Ask user if they want to proceed with staging
set /p confirm="Do you want to stage and push all changes? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo.
    echo Operation cancelled by user.
    goto end
)

:: Step 2: Stage all changes
echo.
echo [Step 2/4] Staging all files (git add .)...
git add .
echo Files staged successfully!
echo.

:: Step 3: Prompt for commit message
echo [Step 3/4] Commit Configuration
echo ---------------------------------------------------------------------
set "commit_msg="
set /p commit_msg="Enter your commit message (or press Enter for 'Auto Update'): "

if "%commit_msg%"=="" (
    set commit_msg=Auto Update
)
echo.
echo Committing changes...
git commit -m "%commit_msg%"
echo.

:: Step 4: Push to remote main branch
echo [Step 4/4] Pushing to GitHub (origin main)...
echo ---------------------------------------------------------------------
git push origin main
echo ---------------------------------------------------------------------
echo.
echo Git update completed successfully!
echo.

:end
echo =====================================================================
echo Press any key to exit...
pause >nul
