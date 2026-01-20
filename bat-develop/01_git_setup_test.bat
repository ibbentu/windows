@echo off
chcp 65001 >nul

echo ============================================
echo  git 사용자 설정
echo ============================================
echo.

REM 설정 모드 선택
:select_mode
set /p mode_choice=설정 모드를 선택하세요 (1: global, 2: local): 
if "%mode_choice%"=="1" (
    goto global_set
) else if "%mode_choice%"=="2" (
    goto local_set
) else (
    echo 잘못된 선택입니다. 다시 시도하세요. 종료 하려면 Ctrl+C를 입력하세요.
    goto select_mode
)

:global_set
set /p global_name=글로벌 사용자 이름을 입력하세요: 
git config --global user.name "%global_name%"
set /p global_email=글로벌 이메일 주소를 입력하세요: 
git config --global user.email "%global_email%"

echo.
echo 글로벌 설정 확인
git config --global --list
echo.
echo 글로벌 설정이 완료되었습니다.
pause
exit /b

:local_set
set /p local_name=로컬 사용자 이름을 입력하세요: 
git config user.name "%local_name%"
set /p local_email=로컬 이메일 주소를 입력하세요: 
git config user.email "%local_email%"

echo.
echo 로컬 설정 확인
git config --list
echo.
echo 로컬 설정이 완료되었습니다.
pause
exit /b