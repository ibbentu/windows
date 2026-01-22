@echo off
chcp 65001 >nul

REM ESC 문자 생성
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

REM 기본 색상 코드 정의
set "RED=%ESC%[31m"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "BLUE=%ESC%[34m"
set "MAGENTA=%ESC%[35m"
set "CYAN=%ESC%[36m"
set "WHITE=%ESC%[37m"
set "RESET=%ESC%[0m"

REM RED = ERROR
REM YELLOW = WARNING
REM GREEN = SUCCESS
REM CYAN = DEBUG

REM %RED%[ERROR] %~nx0: "내용" %RESET%