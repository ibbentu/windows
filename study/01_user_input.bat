@echo off
chcp 65001 >nul
REM ========================================
REM 사용자 입력 받기 예제
REM ========================================

REM 1. 기본 입력 받기
echo === 기본 입력 예제 ===
set /p name=이름을 입력하세요: 
echo 안녕하세요, %name%님!
echo.

REM 2. 여러 개의 입력 받기
echo === 여러 입력 예제 ===
set /p age=나이를 입력하세요: 
set /p city=사는 도시를 입력하세요: 
echo.
echo [입력 결과]
echo 이름: %name%
echo 나이: %age%세
echo 도시: %city%
echo.

REM 3. 기본값 설정하기
echo === 기본값 예제 ===
set default_color=파랑
set /p color=좋아하는 색상 (기본값: %default_color%): 
if "%color%"=="" set color=%default_color%
echo 선택한 색상: %color%
echo.

REM 4. 예/아니오 선택
echo === Y/N 선택 예제 ===
set /p continue=계속하시겠습니까? (Y/N): 
if /i "%continue%"=="Y" (
    echo 계속 진행합니다!
) else (
    echo 종료합니다.
)

echo.
pause
