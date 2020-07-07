# clearcreds
DOS / CMD batch file to remove all 'hidden' credentials from a Windows 7, 8 and/or 10 machine

This uses the inbuilt cmdkey tool (https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cmdkey) to clear out all saved credentials that are NOT showing in the Windows Credential Manager.

You simply run this script from the logged in user's desktop.  Please note, do NOT run as administrator, this needs to run as the locally logged in user and does not require admin rights to run.
