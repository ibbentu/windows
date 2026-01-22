@echo off
chcp 65001 >nul

set SOURCE_DIR=%~dp0ABC
set DEST_DIR=%HomeDrive%\ABC

echo [%~nx0] ABC 폴더 이동 시작...

if not exist "%SOURCE_DIR%" (
    echo [%~nx0] ERROR: ABC 폴더를 찾을 수 없습니다. "경로: %SOURCE_DIR%"
    pause
    exit /b 1
)

if exist "%DEST_DIR%" (
    echo [%~nx0] WARNING: 대상 경로에 ABC 폴더가 이미 존재합니다. "경로: %DEST_DIR%"
    pause
    exit /b 1
)

echo [%~nx0] 소스: %SOURCE_DIR%
echo [%~nx0] 대상: %DEST_DIR%
echo.

move "%SOURCE_DIR%" "%DEST_DIR%"
if %errorlevel% neq 0 (
    echo [%~nx0] ERROR: 폴더 이동 실패.
    pause
    exit /b 1
)

echo [%~nx0] [성공]: ABC 폴더가 이동되었습니다.
echo [%~nx0] 새로운 경로: %DEST_DIR%
pause
