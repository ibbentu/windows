@echo off
REM ========================================
REM 두 숫자를 더하는 함수
REM 매개변수: %1 = 첫 번째 숫자, %2 = 두 번째 숫자
REM 반환값: 두 숫자의 합 (exit /b로 반환)
REM ========================================

echo [add.bat] %1 + %2 계산 중...

REM 계산 수행
set /a result=%1 + %2

echo [add.bat] 결과: %result%

REM 결과를 반환값으로 전달
exit /b %result%
