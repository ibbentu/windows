@echo off
chcp 65001 >nul
call "%HomeDrive%\modules\bat\textColors.bat"

set "csvFile=%~dp0sample.csv"

if not exist "%csvFile%" (
    echo %RED%[ERROR] %~nx0: CSV 파일을 찾을 수 없습니다. "경로: %csvFile%"%RESET%
    pause
    exit /b 1
)

if "%1"=="2" (
    for /f "tokens=1,2 delims=," %%a in ('type "%csvFile%"') do (
        echo %%a, %%b
    )
) else (
    echo %RED%[ERROR] %~nx0: 지원하지 않는 컬럼 수입니다.%RESET%
    pause
    exit /b 1
)