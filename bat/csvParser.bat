@echo off
chcp 65001 >nul
call "%HomeDrive%\modules\bat\textColors.bat"

call "%HOmeDrive%\modules\bat\checkArgCount.bat" 2 %*
if %errorlevel% neq 0 (
    echo %RED%[ERROR] %~nx0: 인자 검증 실패 %errorlevel%.%RESET%
    exit /b 1
)

set "csvFile=%1"
set "columnCount=%2"

if not exist "%csvFile%" (
    echo %RED%[ERROR] %~nx0: CSV 파일을 찾을 수 없습니다. "경로: %csvFile%"%RESET%
    exit /b 1
)

if "%columnCount%"=="2" (
    for /f "tokens=1,2 delims=," %%a in ('type "%csvFile%"') do (
        echo %CYAN%[DEBUG] %~nx0: 파싱된 데이터 - %%a, %%b%RESET%
        call "%HomeDrive%\modules\bat\moveFolder.bat" "%%a" "%%b"
    )
) else (
    echo %RED%[ERROR] %~nx0: 지원하지 않는 컬럼 수입니다.%RESET%
    exit /b 1
)

echo %GREEN%[SUCCESS] %~nx0: CSV 파일 파싱이 완료되었습니다.%RESET%
exit /b 0