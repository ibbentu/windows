@echo off
chcp 65001 >nul
call "%HomeDrive%\modules\bat\textColors.bat" 

set mode=global
set name=이름
set email=이메일
set mode_code=0

if "%mode%"=="global" (
    set mode_code=1
) else if "%mode%"=="local" (
    set mode_code=2
) else (
    echo %RED%[ERROR] %~nx0: 잘못된 모드입니다. "global" 또는 "local"을 사용하세요.%RESET%
    pause
    exit /b 1
)

call "%HomeDrive%\modules\bat\git.bat" %mode_code% %name% %email%
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: git 설정 실패.%RESET%
    pause
    exit /b 1
)
echo %GREEN%[SUCCESS] %~nx0: git 설정이 완료되었습니다.%RESET%
pause