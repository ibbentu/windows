@echo off
chcp 65001 >nul

REM ========================================
REM ANSI 이스케이프 코드를 사용한 색상 출력
REM ========================================

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

REM 밝은 색상 코드 정의
set "BRIGHT_RED=%ESC%[91m"
set "BRIGHT_GREEN=%ESC%[92m"
set "BRIGHT_YELLOW=%ESC%[93m"
set "BRIGHT_BLUE=%ESC%[94m"
set "BRIGHT_MAGENTA=%ESC%[95m"
set "BRIGHT_CYAN=%ESC%[96m"
set "BRIGHT_WHITE=%ESC%[97m"

REM 배경색 정의
set "BG_RED=%ESC%[41m"
set "BG_GREEN=%ESC%[42m"
set "BG_YELLOW=%ESC%[43m"
set "BG_BLUE=%ESC%[44m"
set "BG_MAGENTA=%ESC%[45m"
set "BG_CYAN=%ESC%[46m"
set "BG_WHITE=%ESC%[47m"

REM 밝은 배경색 정의
set "BG_BRIGHT_RED=%ESC%[101m"
set "BG_BRIGHT_GREEN=%ESC%[102m"
set "BG_BRIGHT_YELLOW=%ESC%[103m"
set "BG_BRIGHT_BLUE=%ESC%[104m"

REM 텍스트 스타일 정의
set "BOLD=%ESC%[1m"
set "DIM=%ESC%[2m"
set "ITALIC=%ESC%[3m"
set "UNDERLINE=%ESC%[4m"
set "BLINK=%ESC%[5m"
set "REVERSE=%ESC%[7m"

echo.
echo === 기본 색상 예제 ===
echo.
echo %RED%빨간색 텍스트%RESET%
echo %GREEN%초록색 텍스트%RESET%
echo %YELLOW%노란색 텍스트%RESET%
echo %BLUE%파란색 텍스트%RESET%
echo %MAGENTA%자주색 텍스트%RESET%
echo %CYAN%청록색 텍스트%RESET%
echo %WHITE%흰색 텍스트%RESET%

echo.
echo === 밝은 색상 예제 ===
echo.
echo %BRIGHT_RED%밝은 빨간색%RESET%
echo %BRIGHT_GREEN%밝은 초록색%RESET%
echo %BRIGHT_YELLOW%밝은 노란색%RESET%
echo %BRIGHT_BLUE%밝은 파란색%RESET%
echo %BRIGHT_MAGENTA%밝은 자주색%RESET%
echo %BRIGHT_CYAN%밝은 청록색%RESET%
echo %BRIGHT_WHITE%밝은 흰색%RESET%

echo.
echo === 배경색 예제 ===
echo.
echo %BG_RED%빨간 배경%RESET%
echo %BG_GREEN%초록 배경%RESET%
echo %BG_YELLOW%노란 배경%RESET%
echo %BG_BLUE%파란 배경%RESET%
echo %BG_BRIGHT_RED%밝은 빨간 배경%RESET%
echo %BG_BRIGHT_GREEN%밝은 초록 배경%RESET%

echo.
echo === 텍스트 스타일 예제 ===
echo.
echo %BOLD%굵은 텍스트%RESET%
echo %DIM%약한 텍스트%RESET%
echo %ITALIC%기울임 텍스트%RESET%
echo %UNDERLINE%밑줄 텍스트%RESET%
echo %REVERSE%반전 텍스트%RESET%

echo.
echo === 조합 예제 ===
echo.
echo %BOLD%%BRIGHT_RED%[ERROR] 굵은 밝은 빨간색%RESET%
echo %BOLD%%BRIGHT_GREEN%[SUCCESS] 굵은 밝은 초록색%RESET%
echo %BG_BRIGHT_YELLOW%%BOLD%[WARNING] 밝은 노란 배경 + 굵은 텍스트%RESET%
echo %UNDERLINE%%BRIGHT_BLUE%[INFO] 밑줄 밝은 파란색%RESET%

echo.
echo === 참고 정보 ===
echo.
echo ESC 문자 생성: for /f %%%%a in ('echo prompt $E ^| cmd') do set "ESC=%%%%a"
echo.
echo 기본 색상 코드:
echo   31=빨간색, 32=초록색, 33=노란색, 34=파란색
echo   35=자주색, 36=청록색, 37=흰색
echo.
echo 밝은 색상 코드: 90-97
echo 배경색: 40-47, 100-107
echo.
echo 텍스트 스타일:
echo   1=굵은글, 2=약한글, 3=기울임, 4=밑줄, 5=깜박임, 7=반전
echo.
echo 리셋: 0
echo.

pause
