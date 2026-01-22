@echo off
setlocal enabledelayedexpansion

REM INI 파일 파서 - 기능별 단순 버전

set "iniFile=config.ini"
set "currentSection="

echo === INI 파일 파서 ===
echo.

REM 1. 파일 읽기 및 파싱
for /f "usebackq delims=" %%L in ("%iniFile%") do (
    set "line=%%L"
    
    REM 2. 섹션 파싱 ([Section])
    if "!line:~0,1!"=="[" (
        set "currentSection=!line:[=!"
        set "currentSection=!currentSection:]="
        echo [!currentSection!]
    ) else (
        REM 3. 주석 제외 (;로 시작하는 줄)
        if not "!line:~0,1!"==";" (
            REM 4. key=value 파싱 및 환경변수 설정
            for /f "tokens=1,* delims==" %%K in ("!line!") do (
                set "key=%%K"
                set "value=%%L"
                
                if not "!key!"=="" if not "!currentSection!"=="" (
                    set "!currentSection!_!key!=!value!"
                    echo  !key!=!value!
                )
            )
        )
    )
)

echo.
echo === 읽어온 설정값 확인 ===
echo Database_Host = !Database_Host!
echo App_Name = !App_Name!
echo Logging_Level = !Logging_Level!

endlocal
pause
