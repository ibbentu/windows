@echo off
chcp 65001 >nul
call "%HomeDrive%\modules\bat\textColors.bat"

set "csvFile=%~dp0init_move.csv"
echo %CYAN%[DEBUG] %~nx0: CSV 파일 경로 - %csvFile%%RESET%

if not exist "%csvFile%" (
    echo %RED%[ERROR] %~nx0: CSV 파일을 찾을 수 없습니다. "경로: %csvFile%"%RESET%
    pause
    exit /b 1
)

call "%HomeDrive%\modules\bat\csvParser.bat" "%csvFile%" 2
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: CSV 파싱 실패.%RESET%
    pause
    exit /b 1
)

echo %GREEN%[SUCCESS] %~nx0: 폴더 이동 완료.%RESET%
pause