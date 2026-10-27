<#
.SYNOPSIS
    ClearCreds - PowerShell version
.DESCRIPTION
    Removes all cached credentials for the currently logged-in user using cmdkey.
    Run as the logged-in user, NOT as administrator.
.NOTES
    https://github.com/jrcastine/clearcreds
#>

[CmdletBinding()]
param()

$ErrorActionPreference = 'Continue'

Write-Host 'ClearCreds' -ForegroundColor Cyan
Write-Host 'PowerShell script to remove all cached credentials from this Windows machine.'
Write-Host 'Run as the logged-in user, NOT as an administrator.'
Write-Host '***'

# Capture all stored credentials
Write-Host 'Capturing all stored credentials...'
$listOutput = & cmdkey.exe /list 2>&1

# Extract only the Target lines
$targetLines = $listOutput | Where-Object { $_ -match 'Target' }

if (-not $targetLines) {
    Write-Host 'No stored credentials found.'
} else {
    Write-Host 'Removing each saved credential...'
    foreach ($line in $targetLines) {
        # Parse the credential target name (everything after "Target:")
        if ($line -match 'Target:\s*(.+?)\s*$') {
            $target = $matches[1].Trim()
            if ($target) {
                Write-Host "  Deleting: $target"
                & cmdkey.exe /delete:$target | Out-Null
            }
        }
    }
}

# Cleanup is unnecessary here because we never wrote temp files.
Write-Host 'We are done!'
