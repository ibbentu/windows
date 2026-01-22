@echo off
chcp 65001 >nul

REM ESC 문자 생성 (16진수 1B를 8진수로 변환)
for /f %%A in ('copy /Z "%~f0" nul') do set "ESC=%%A"

REM 색상 코드 정의
set RESET=%ESC%[0m
set RED=%ESC%[31m
set GREEN=%ESC%[32m
set YELLOW=%ESC%[33m
set BLUE=%ESC%[34m
set MAGENTA=%ESC%[35m
set CYAN=%ESC%[36m
set WHITE=%ESC%[37m