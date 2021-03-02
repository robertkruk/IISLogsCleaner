# IISLogsCleaner

PowerShell script to delete old IIS log files.

## Files:

1. IISLogsCleaner.ps1 - this is the worker script that task scheduler will run
2. New-ScheduledScript.ps1 - this is the script to create a Scheduled Task (can be used to automate the process on multiple computers if PS Remoting is enabled)

## USAGE:

1. Login to server using RDP or local console
2. Create restore point or snapshot if applicable (No snapshots on DC's or other data replication based servers such as Exchange/SQL/etc)
3. Copy scripts to c:\scripts
4. Open PowerShell
5. Run script command

--------------------------------------------------------------------------------

```
PS C:\Scripts> .\New-ScheduledScript.ps1 -ScriptFilePath C:\scripts\IISLogsCleaner.ps1 -LocalScriptFolderPath 'C:\' -TaskTriggerOptions @{'Daily' = $true; 'At' = '3Am'} -TaskName 'IISLogsCleaner' -TaskRunAsUser 'NT AUTHORITY\SYSTEM' -Computername localhost
```

--------------------------------------------------------------------------------

## Note:

- you can change -ComputerName to a remote computer if PowerShell Remoting is enabled on the server.
- RunAsUser is using SYSTEM account, no password is required as the system is running this locally. (Password variables were commented out of the script)

### Credits:

Adapted from: <https://gallery.technet.microsoft.com/scriptcenter/Automatically-clean-up-old-8d35fdfd>

Created by Robert.K and Kasha.K
