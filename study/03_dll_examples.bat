@echo off
chcp 65001 >nul
REM ========================================
REM BAT에서 DLL 활용하는 방법들
REM ========================================

echo ============================================
echo  BAT 스크립트에서 DLL 활용 예제
echo ============================================
echo.

REM ----------------------------------------
REM 1. rundll32 사용 (Windows 내장 DLL)
REM ----------------------------------------
echo [1] rundll32 예제 - Windows 내장 기능 호출
echo.

echo     예시 명령어들:
echo     - 화면 잠금: rundll32 user32.dll,LockWorkStation
echo     - 제어판 열기: rundll32 shell32.dll,Control_RunDLL
echo     - 프린터 폴더: rundll32 shell32.dll,SHHelpShortcuts_RunDLL PrintersFolder
echo.

set /p choice1=화면 잠금을 테스트하시겠습니까? (Y/N): 
if /i "%choice1%"=="Y" (
    echo 3초 후 화면이 잠깁니다...
    timeout /t 3 >nul
    rundll32 user32.dll,LockWorkStation
)
echo.

REM ----------------------------------------
REM 2. PowerShell로 .NET DLL 사용
REM ----------------------------------------
echo [2] PowerShell을 통한 .NET DLL 사용
echo.

echo     메시지 박스 표시 (System.Windows.Forms)
set /p choice2=메시지 박스를 테스트하시겠습니까? (Y/N): 
if /i "%choice2%"=="Y" (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('BAT에서 DLL을 호출했습니다!', '알림', 'OK', 'Information')"
)
echo.

REM ----------------------------------------
REM 3. PowerShell로 Win32 API 호출
REM ----------------------------------------
echo [3] PowerShell을 통한 Win32 API (user32.dll) 호출
echo.

echo     비프음 재생 (user32.dll - MessageBeep)
set /p choice3=비프음을 테스트하시겠습니까? (Y/N): 
if /i "%choice3%"=="Y" (
    powershell -Command ^
        "$sig = '[DllImport(\"user32.dll\")] public static extern bool MessageBeep(uint type);'; ^
        $type = Add-Type -MemberDefinition $sig -Name Win32 -Namespace API -PassThru; ^
        $type::MessageBeep(0x10)"
    echo 비프음이 재생되었습니다!
)
echo.

REM ----------------------------------------
REM 4. regsvr32로 COM DLL 등록/해제
REM ----------------------------------------
echo [4] COM DLL 등록 예제 (regsvr32)
echo.
echo     등록: regsvr32 파일.dll
echo     해제: regsvr32 /u 파일.dll
echo     (관리자 권한 필요)
echo.

REM ----------------------------------------
REM 5. 시스템 정보 가져오기 예제
REM ----------------------------------------
echo [5] 시스템 메모리 정보 가져오기 (kernel32.dll)
echo.
set /p choice5=시스템 메모리 정보를 확인하시겠습니까? (Y/N): 
if /i "%choice5%"=="Y" (
    powershell -Command ^
        "$mem = Get-CimInstance Win32_OperatingSystem; ^
        $total = [math]::Round($mem.TotalVisibleMemorySize/1MB, 2); ^
        $free = [math]::Round($mem.FreePhysicalMemory/1MB, 2); ^
        Write-Host '전체 메모리:' $total 'GB'; ^
        Write-Host '사용 가능:' $free 'GB'"
)
echo.

echo ============================================
echo  예제 완료
echo ============================================
pause
