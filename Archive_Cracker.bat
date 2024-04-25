@echo off
Title Archive_Cracker
color 02
echo ""Created By @TermuxTest1"

if not exsist "C:\Program Files\7-Zip" (
   echo 7-Zip not installed!
   pause
   exit
)

set /p archive="Enter Archive File:"
if not exsist "%archive" (
   echo Archive not Found!
   pause
   exit
)

set /p Wordlist="Enter Wordlist File:"
if not exsist "%Wordlist" (
   echo Wordlist not Found!
   pause
   exit
)

for /f %%a in (%Wordlist%) do (
    set pass=%%a
    call :attempt
)

echo Try Another Wordlist!
pause 
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%Archive%" -o"Cracked_Archive" -y >nul 2>&1

echo attempt: %pass%

if /I %errorlevel% EQU 0 (
   echo Password Found: %pass%
   pause
   exit
)