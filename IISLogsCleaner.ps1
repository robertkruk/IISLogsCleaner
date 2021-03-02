# Script to delete old log files for IIS
# Adapted from: https://gallery.technet.microsoft.com/scriptcenter/Automatically-clean-up-old-8d35fdfd
# Created by Robert.K and Kasha.K - 2016(c)
#
#Put script into c:\scripts

#Set Locations to scan
$arrayLocations= @(“D:\iis\foo\logs”,”C:\inetpub\logs\LogFiles”)
#set days to keep
$maxDaystoKeep = -90
#log file for script; c:\scripts must exist or change path to existing location
$outputPath = "c:\scripts\IISLogsCleaner\Cleanup_Old_logs.log"

#loop Locations specified above
Foreach($element in $arrayLocations){
  #test if location exists
If(test-path $element){

#delete items in Locations
Foreach ($item in (Get-ChildItem $element -Recurse | Where LastWriteTime -lt ((get-date).AddDays($maxDaystoKeep)))){
        "$($item.BaseName) is older than $((get-date).AddDays($maxDaystoKeep)) and will be deleted" | Add-Content $outputPath
        $Path= $item.DirectoryName+"\"+$item
        Remove-Item $Path
    }
}
    ELSE{
        "No items to be deleted today $($(Get-Date).DateTime)"  | Add-Content $outputPath
        }

Write-Output "Cleanup of log files older than $((get-date).AddDays($maxDaystoKeep)) completed..."
start-sleep -Seconds 10
}
$LASTEXITCODE
