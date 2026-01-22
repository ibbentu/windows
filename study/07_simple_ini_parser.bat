@echo off
chcp 65001 >nul

REM INI 파일을 한줄씩 읽어 Key=Value 형태로 출력
REM setlocal enabledelayedexpansion 없이 구현

echo === INI 파일 파싱 (간단 버전) ===
echo.

for /f "tokens=1,2 delims==" %%a in (simple_config.ini) do (
    echo Key: %%a
    echo Value: %%b
    echo ---
)

pause
