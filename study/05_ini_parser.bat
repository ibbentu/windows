@echo off
REM ============================================
REM INI 파일 파서 예시
REM ini 파일에서 섹션별로 키-값을 읽어 환경변수로 설정
REM ============================================

setlocal enabledelayedexpansion

echo ========================================
echo INI 파일 파서 예시
echo ========================================
echo.

REM 파싱할 INI 파일 경로
set "iniFile=c:\modules\study\config.ini"

REM INI 파일이 있는지 확인
if not exist "!iniFile!" (
    echo 오류: INI 파일을 찾을 수 없습니다: !iniFile!
    exit /b 1
)

echo INI 파일 경로: !iniFile!
echo.
echo --- INI 파일 내용 ---
type "!iniFile!"
echo.
echo --- 파싱 결과 ---
echo.

REM 현재 섹션명
set "currentSection="

REM 파일 읽기 및 파싱
for /f "usebackq delims=" %%L in ("!iniFile!") do (
    set "line=%%L"
    
    REM 빈 줄 무시
    if not "!line!"=="" (
        
        REM 섹션 확인 (형식: [SectionName])
        if "!line:~0,1!"=="[" (
            REM 괄호 제거하여 섹션명 추출
            set "currentSection=!line:[=!"
            set "currentSection=!currentSection:]="
            echo [섹션: !currentSection!]
        ) else (
            REM 주석 무시
            if not "!line:~0,1!"==";" (
                if not "!line:~0,1!"=="REM" (
                    
                    REM key=value 형식 분석
                    for /f "tokens=1,* delims==" %%K in ("!line!") do (
                        set "key=%%K"
                        set "value=%%L"
                        
                        REM 공백 제거
                        for /f "tokens=*" %%A in ("!key!") do set "key=%%A"
                        for /f "tokens=*" %%A in ("!value!") do set "value=%%A"
                        
                        REM 환경변수 설정 (형식: Section_Key=Value)
                        if not "!currentSection!"=="" (
                            set "varName=!currentSection!_!key!"
                            set "!varName!=!value!"
                            echo !varName!=!value!
                        )
                    )
                )
            )
        )
    )
)

echo.
echo ========================================
echo 설정된 환경변수 확인
echo ========================================
echo.

REM 설정된 변수 출력 (예시: Database_Host)
if defined Database_Host (
    echo Database_Host = !Database_Host!
)

if defined Database_Port (
    echo Database_Port = !Database_Port!
)

if defined Database_User (
    echo Database_User = !Database_User!
)

if defined App_Name (
    echo App_Name = !App_Name!
)

if defined App_Version (
    echo App_Version = !App_Version!
)

if defined Logging_Level (
    echo Logging_Level = !Logging_Level!
)

echo.
echo ========================================
echo 파싱 완료!
echo ========================================

endlocal
pause
