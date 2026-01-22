@echo off
chcp 65001 >nul

set SOURCE_DIR=%~dp0ABC
set DEST_DIR=%HomeDrive%\ABC

call "%HomeDrive%\modules\bat\moveFolder.bat" "%SOURCE_DIR%" "%DEST_DIR%"

pause