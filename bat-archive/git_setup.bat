@echo off
chcp 65001 >nul

set mode=global
set name=이름
set email=이메일
set mode_code=0

if "%mode%"=="global" (
    set mode_code=1
) else if "%mode%"=="local" (
    set mode_code=2
) else (
    echo [%~nx0] ERROR: 잘못된 모드입니다. "global" 또는 "local"을 사용하세요.
    pause
    exit /b 1
)

call "%HomeDrive%\modules\bat\git.bat" %mode_code% %name% %email%
if %errorlevel% neq 0 (
    echo [%~nx0] ERROR: git 설정 실패.
    pause
    exit /b 1
)
echo [%~nx0] [성공]: git 설정이 완료되었습니다.
pause