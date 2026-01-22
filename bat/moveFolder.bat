@echo off
chcp 65001 >nul
call "%HomeDrive%\modules\bat\textColors.bat" 

REM ========================================
call "%HomeDrive%\modules\bat\checkArgCount.bat" 2 %*
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: 인자 검증 실패 %errorlevel%.%RESET%
    exit /b 1
)

REM ========================================
set SOURCE_DIR=%1
set DEST_DIR=%2
echo %CYAN%[DEBUG-INPUT] %~nx0: 현재: %SOURCE_DIR%%RESET%
echo %CYAN%[DEBUG-INPUT] %~nx0: 이동: %DEST_DIR%%RESET%
echo.

if not exist "%SOURCE_DIR%" (
    echo %RED%[ERROR] %~nx0: 소스 폴더를 찾을 수 없습니다. "경로: %SOURCE_DIR%"%RESET%
    exit /b 1
)

if exist "%DEST_DIR%" (
    echo %RED%[ERROR] %~nx0: 대상 폴더가 이미 존재합니다. "경로: %DEST_DIR%"%RESET%
    exit /b 1
)

REM 대상 폴더 부모 디렉터리 생성 (이미 존재해도 오류 없음)
mkdir "%DEST_DIR%" 2>nul
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: 대상 폴더 생성 실패.%RESET%
    exit /b 1
)

move "%SOURCE_DIR%" "%DEST_DIR%"
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: 폴더 이동 실패.%RESET%
    exit /b 1
)

echo %GREEN%[SUCCESS] %~nx0: %DEST_DIR%로 폴더가 이동되었습니다.%RESET%
exit /b 0