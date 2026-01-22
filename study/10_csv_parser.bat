@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
call "%HomeDrive%\modules\bat\textColors.bat" 

REM ========================================
REM 간단한 CSV 파서 (동적 컬럼 처리)
REM ========================================

echo === CSV 파일 파싱 예제 ===
echo.

REM 최대 지원 컬럼 수 정의 (동적으로 변경 가능)
set "maxColumns=%1"
if "%maxColumns%"=="" set "maxColumns=4"

REM CSV 파일명 설정
set "csvFile=%~dp0sample.csv"

REM CSV 파일 존재 확인
if not exist "%csvFile%" (
    echo %RED%[ERROR] %~nx0: CSV 파일을 찾을 수 없습니다. "경로: %csvFile%"
    exit /b 1
)

echo CSV 파일: %csvFile%
echo 지원 컬럼 수: %maxColumns%
echo.
echo --- CSV 파일 내용 ---
type "%csvFile%"
echo.
echo --- 파싱 결과 ---
echo.

if "%1"=="2" (
    for /f "tokens=1,2 delims=," %%a in ('type "%csvFile%"') do (
        echo %%a, %%b
    )
) else if "%1"=="4" (
    for /f "tokens=1-4 delims=," %%a in ('type "%csvFile%"') do (
        echo %%a, %%b, %%c, %%d
    )
) else if "%1"=="5" (
    for /f "tokens=1-5 delims=," %%a in ('type "%csvFile%"') do (
        echo %%a, %%b, %%c, %%d, %%e
    )
)
