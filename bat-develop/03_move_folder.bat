@echo off
chcp 65001 >nul

REM ========================================
call "%HomeDrive%\modules\bat\checkArgCount.bat" 2 %*

REM ========================================
set SOURCE_DIR=%1
set DEST_DIR=%2

if not exist "%SOURCE_DIR%" (
    echo [%~nx0] ERROR: 소스 폴더를 찾을 수 없습니다. "경로: %SOURCE_DIR%"
    exit /b 1
)

if exist "%DEST_DIR%" (
    echo [%~nx0] ERROR: 대상 폴더가 이미 존재합니다. "경로: %DEST_DIR%"
    exit /b 1
)

echo [%~nx0] 현재: %SOURCE_DIR%
echo [%~nx0] 이동: %DEST_DIR%
echo.

move "%SOURCE_DIR%" "%DEST_DIR%"
if %errorlevel% neq 0 (
    echo [%~nx0] ERROR: 폴더 이동 실패.
    exit /b 1
)

echo [%~nx0] [성공]: %DEST_DIR%로 폴더가 이동되었습니다.
exit /b 0