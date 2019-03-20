Import-Module ActiveDirectory 
Export-NpsConfiguration -Path C:\scripts\nps\config\YEDEK_LocalNPSExportedConfig.xml

$CurrentServerNPS = $env:computername

$NPServers = Get-ADGroupMember "nps_server"
$NPServers | ForEach-Object {

$NPServerName = $_.Name

    if ($NPServerName -ne $CurrentServerNPS) {
    $NPServerName
    copy-item C:\scripts\nps\config\YEDEK_LocalNPSExportedConfig.xml \\$NPServerName\C$\scripts\nps\config\LocalNPSExportedConfig.xml
    
    Invoke-Command -ComputerName $NPServerName -ScriptBlock {Export-NPSConfiguration -Path C:\scripts\nps\config\BackupNPSExportedConfig.xml}
    Invoke-Command -ComputerName $NPServerName -ScriptBlock {Import-NPSConfiguration -Path C:\scripts\nps\config\LocalNPSExportedConfig.xml}
    Write-EventLog –LogName Application –Source “NPS_SYNC” –EntryType Information –EventID 4991 –Message “NPS Sync script calisti.”
    }
}