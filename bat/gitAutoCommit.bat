@echo off
chcp 65001 >nul
call "%HomeDrive%\modules\bat\textColors.bat" 

git add .
git commit -m "Auto commit"
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: git commit 실패%RESET%
    exit /b 1
)

git push
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: git push 실패%RESET%
    exit /b 1
)

echo %GREEN%[SUCCESS] %~nx0: git 커밋 및 푸시 완료%RESET%
exit /b 0