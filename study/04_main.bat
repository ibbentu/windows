@echo off
chcp 65001 >nul

echo ============================================
echo  메인 스크립트
echo ============================================
echo.

REM 두 숫자를 전달하여 add.bat 호출
call add.bat 10 20

REM 반환값 확인 (%errorlevel%로 받음)
echo 반환된 결과: %errorlevel%
echo.

REM 다른 예제: 3과 7 더하기
call add.bat 3 7
echo 반환된 결과: %errorlevel%

pause
