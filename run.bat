@echo off
SET SERVERFOLDER=MinecraftServer
SET BACKUP=saves
SET LOGS=logs
SET DAYSTOKEEPBACKUPS=30

REM Create the BACKUP and LOGS directories if they don't already exist
if not exist .\%BACKUP% echo md %BACKUP%
if not exist .\%LOGS% echo md %LOGS%

REM Delete older backups and log files older than DAYSTOKEEPBACKUPS value
ForFiles /p .\%BACKUP% /d -%DAYSTOKEEPBACKUPS% /c "cmd /c rd /s /q @file"
ForFiles /p .\%LOGS% /d -%DAYSTOKEEPBACKUPS% /c "cmd /c del @file"

REM Create a Timestamp so we can name the files and directories
For /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
For /f "tokens=1-2 delims=/: " %%a in ("%TIME%") do (if %%a LSS 10 (set mytime=0%%a%%b) else (set mytime=%%a%%b))
SET TIMESTAMP=%mydate%_%mytime%
echo Timestamp set to %TIMESTAMP%

REM Make a backup
md .\%BACKUP%\%TIMESTAMP%
XCOPY .\%SERVERFOLDER%\worlds\* .\%BACKUP%\%TIMESTAMP% /s /i

REM Run the server - We redirect the output (the ">" and "2>") to output and error files.
echo Running. See .\%LOGS%\%TIMESTAMP%_output.txt for the output
cd .\%SERVERFOLDER%\
start cmd /c ".\bedrock_server.exe > ..\%LOGS%\%TIMESTAMP%_output.txt 2>..\%LOGS%\%TIMESTAMP%_errors.txt"

REM Because Windows can't write logs to a file as well as to the console, you can use baretail
REM or gnu tools "tail.exe" to "tail" the file (i.e. see what's happening).
REM ** note ** the console still accepts STDIN commands so you can op and stop as normal

REM start D:\Games\Minecraft\baretail.exe ..\%LOGS%\%TIMESTAMP%_output.txt

pause