# Find DC list from Active Directory

$DCs = Get-ADDomainController -Filter *


# Define time for report (default is 1 day)

$startDate = (get-date).AddDays(-1)


# Store successful logon events from security logs with the specified dates and workstation/IP in an array

foreach ($DC in $DCs){

$slogonevents = Get-Eventlog -LogName Security -ComputerName $DC.Hostname -after $startDate | where {$_.eventID -eq 4624 }}


# Crawl through events; print all logon history with type, date/time, status, account name, computer and IP address if user logged on remotely

 

 foreach ($e in $slogonevents){

 # Logon Successful Events

 # Local (Logon Type 2)

 if (($e.EventID -eq 4624 ) -and ($e.ReplacementStrings[8] -eq 2)){

 write-host "Type: Local Logon`tDate: "$e.TimeGenerated "`tStatus: Success`tUser: "$e.ReplacementStrings[5] "`tWorkstation: "$e.ReplacementStrings[11]

 }

 # Remote (Logon Type 10)

 if (($e.EventID -eq 4624 ) -and ($e.ReplacementStrings[8] -eq 10)){

 write-host "Type: Remote Logon`tDate: "$e.TimeGenerated "`tStatus: Success`tUser: "$e.ReplacementStrings[5] "`tWorkstation: "$e.ReplacementStrings[11] "`tIP Address: "$e.ReplacementStrings[18]

 }}