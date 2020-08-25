@Echo off
@Echo ClearCreds
@Echo DOS / CMD batch file to remove all cached credentials from a Windows 7, 8 and/or 10 machine as well as Windows Sever up to and including 2019.
@Echo https://github.com/jrcastine/clearcreds
@Echo ***
@Echo This is a DOS batch file that you would run from a cmd prompt, logged in as a user and NOT an admin.
@Echo ***
@Echo capture all the stored credentials
cmdkey.exe /list > "%TEMP%\List.txt"
@Echo sort out the tokens from our capture file
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
@Echo now do a loop to remove each saved credential for all the tokens we have
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
@Echo now cleanup our capture and token files
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q
@Echo We are done!
