@echo off
chcp 65001 >nul
call "%HomeDrive%\modules\bat\textColors.bat" 

echo ============================================
echo  [%~nx0] git 사용자 설정
echo ============================================
echo.

REM ========================================
REM Git 설치 확인
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: Git이 설치되어 있지 않습니다.%RESET%
    exit /b 1
)
echo [%~nx0] Git 설치 확인 완료

REM ========================================
call "%HomeDrive%\modules\bat\checkArgCount.bat" 3 %*
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: 인자 검증 실패 %errorlevel%.%RESET%
    exit /b 1
)

echo %CYAN%[DEBUG-INPUT] %~nx0: 설정 모드: %1%RESET%
echo %CYAN%[DEBUG-INPUT] %~nx0: 사용자 이름: %2%RESET%
echo %CYAN%[DEBUG-INPUT] %~nx0: 사용자 이메일: %3%RESET%

REM ========================================
set user_name=%2
set user_email=%3

:mode
if "%1"=="1" (
    echo [%~nx0]: global 설정 모드
    goto set_global
) else if "%1"=="2" (
    echo [%~nx0]: local 설정 모드
    goto set_local
) else (
    echo %RED%[ERROR] %~nx0: 첫 번째 인자는 1^(global^) 또는 2^(local^)이어야 합니다. ^(받은 값: %1^)%RESET%
    exit /b 1
)

REM ========================================
:set_global
git config --global user.name "%2"
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: user.name 설정 실패%RESET%
    exit /b 1
)
git config --global user.email "%3"
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: user.email 설정 실패%RESET%
    exit /b 1
)

echo [%~nx0] 글로벌 설정 확인
echo.
echo ===== git global settings ==================
git config --global --list
echo.
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: 글로벌 설정 확인 실패%RESET%
    exit /b 1
)
echo %GREEN%[SUCCESS] %~nx0: 글로벌 설정이 완료되었습니다.%RESET%
exit /b

REM ========================================
:set_local
git config user.name "%2"
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: user.name 설정 실패%RESET%
    exit /b 1
)
git config user.email "%3"
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: user.email 설정 실패%RESET%
    exit /b 1
)

echo [%~nx0] 로컬 설정 확인
echo.
echo ==== git local settings ====================
git config --list
echo.
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: 로컬 설정 확인 실패%RESET%
    exit /b 1
)
echo %GREEN%[SUCCESS] %~nx0: 로컬 설정이 완료되었습니다.%RESET%
exit /b
REM ========================================