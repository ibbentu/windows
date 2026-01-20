@echo off
chcp 65001 >nul

git add .
git commit -m "Auto commit"
if %errorlevel% neq 0 (
    echo [%~nx0] ERROR: git commit 실패
    pause
    exit /b 1
)

git push
if %errorlevel% neq 0 (
    echo [%~nx0] ERROR: git push 실패
    pause
    exit /b 1
)

echo [%~nx0] [성공]: git 커밋 및 푸시 완료
pause