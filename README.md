# ClearCreds
DOS / CMD batch file to remove all cached credentials from a Windows 7, 8, 10 and/or 11 machine as well as Windows Sever up to and including 2025.

Saved a password in a Windows dialog box and it's not showing up in Credential Manager?  Have issues with Outlook not allowing authentication and your account locking out?  This may be due to a saved credential in Windows.  The CMDKEY tool allows you to see all the active credentials for your Windows system.

This batch file will delete all the saved credentials for the logged in user.  Using the cmdkey tool (https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cmdkey), we create a list of all the credentials, then create a second list of the credential tokens and delete them out.

You simply run this script from the logged in user's desktop. DO NOT run as administrator, this needs to run as the locally logged in user. Local admin rights are not required  for this script to clean up credentials.

If you are a local machine admin or AD domain admin, this can be run to clear out your credentials from a server or workstation so as to not leave a credentialed session behind that could be exploited.
