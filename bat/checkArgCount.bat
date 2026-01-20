@echo off
chcp 65001 >nul

REM ========================================
REM 초기 인자 검사
if "%1"=="" (
    echo [%~nx0] ERROR: 인자가 없습니다.
    exit /b 1
)
echo [%~nx0] 초기 인자 검사 완료

REM ========================================
REM 목표 인자 검사
set "temp=%1"
set /a "check=%temp%" 2>nul
if not "%check%"=="%temp%" (
    echo [%~nx0] ERROR: 첫 번째 인자는 숫자여야 합니다. 받은 값: %1
    exit /b 1
)
if %check% LSS 0 (
    echo [%~nx0] ERROR: 개수는 0 이상이어야 합니다. 받은 값: %1
    exit /b 1
)
echo [%~nx0] 목표 인자 검사 완료

REM ========================================
REM 목표 인자 저장
set expected=%1
shift /1

REM ========================================
REM 인자 개수 세기
set count=0
:loop
if "%1"=="" goto check
set /a count+=1
shift /1
goto loop

:check
if %count%==%expected% (
    echo [%~nx0] [성공]: 인자 개수 검사 완료 "예상: %expected%, 실제: %count%"
    exit /b 0
) else (
    echo [%~nx0] ERROR: 인자 개수가 예상과 일치하지 않습니다. "예상: %expected%, 실제: %count%"
    exit /b 1
)