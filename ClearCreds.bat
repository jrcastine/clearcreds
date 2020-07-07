@Echo off
@Echo This is a DOS batch file that you would run from a cmd prompt, logged in as a user and NOT an admin.
@echo ***
@Echo This is useful in environments where PowerShell is locked down by GPO and users cannot access network resources
@Echo and where there are some 'hidden' saved credentials blocking access to network resources.
@Echo ***
@Echo This will use the cmdkey utility to create a text file with the saved credentials, then parse out the tokens
@Echo and ultimately delete all those tokens.
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
