<#                                                                                          
                                    .                                                     
                             .:----:.                                                     
                          :----:.                                                         

                        :----.                                                            
         -==-         :----. :     -==  =========-   -==    ===    .========.             
        +##+        .-----  +#:   .##*  #########+   *##    ###    :########:             
       =##+        :-----  :##+   =##-     +##:      *##    ###    :##+                   
       ###        :-----    *##.  *##      +##:      *##    ###    :##+                   
      :##+       :-----     =##- :##=      +##:      *##    ###    :##+.....              
      :##+      .-----:     .##* +##.      +##:      *##    ###    :########:             
       *##.     ------       +##-##*       +##:      *##    ###    :##*:::::              
       :##*    .------       :#####-       +##:      *##    ###    :##+                   
        -##+   -------        *####        +##:      *##====###    :##+                   
         +##=  -------.       -###+        +##:      *##****###    :##+                   
         .###  -------:       .###:        +##:      *##    ###    :##+                   
         .##*  --------        ###         +##:      *##    ###    :##+                   
         =##=  :-------:       ###         +##:      *##    ###    :##+.....              
        -##*   .--------:      ###         +##:      *##    ###    :########:             
       .:::.    ----------.    :::         .::.      :::    :::    .::::::::              
                .------------:::::::::::::::::::::::::::---:::::::::::::::::::::::-----   
                                                        ...                       ..:..   
#>

# Registry path to PuTTY configured profiles
$regPath = 'HKCU:\SOFTWARE\SimonTatham\PuTTY\Sessions'

# Iterate over each PuTTY profile
Get-ChildItem $regPath -Name | ForEach-Object {
    # Check if SSH config
    if (((Get-ItemProperty -Path "$regPath\$_").Protocol) -eq 'ssh') {
        # Write the Host for easy SSH use
        $host_nospace = $_.replace('%20', ' ')
        $hostLine = "Host $host_nospace"

        # Parse Hostname for special use cases (Bastion) to create SSH hostname
        $puttyHostname = (Get-ItemProperty -Path "$regPath\$_").HostName
        if ($puttyHostname -like '*@*') {
            $sshHostname = $puttyHostname.split("@")[-1]
        } else { $sshHostname = $puttyHostname }
        $hostnameLine = "`tHostName $sshHostname"   

        # Parse Hostname for special cases (Bastion) to create User
        if ($puttyHostname -like '*@*') {
            $sshUser = $puttyHostname.split("@")[0..($puttyHostname.split('@').length - 2)] -join '@'
        } else { $sshHostname = $puttyHostname }
        $userLine = "`tUser $sshUser"   

        # Parse for Identity File
        $puttyKeyfile = (Get-ItemProperty -Path "$regPath\$_").PublicKeyFile
        if ($puttyKeyfile) { 
            $sshKeyfile = $puttyKeyfile.replace('\', '/')
            $identityLine = "`tIdentityFile $sshKeyfile"
        }

        # Parse Configured Tunnels
        $puttyTunnels = (Get-ItemProperty -Path "$regPath\$_").PortForwardings
        if ($puttyTunnels) {
            $puttyTunnels.split() | ForEach-Object {
                # First character denotes tunnel type
                $tunnelType = $_.Substring(0,1)
                # Digits follow tunnel type is local port
                $tunnelPort = $_ -match '\d*\d(?==)' | Foreach {$Matches[0]}
                # Text after '=' is the tunnel destination
                $tunnelDest = $_.split('=')[1]

                if ($tunnelType -eq 'D') {
                    $tunnelLine = "`tDynamicForward $tunnelPort $tunnelDest"
                }
                ElseIf ($tunnelType -eq 'R') {
                    $tunnelLine = "`tRemoteForward $tunnelPort $tunnelDest"
                }
                ElseIf ($tunnelType -eq 'L') {
                    $tunnelLine = "`tLocalForward $tunnelPort $tunnelDest"
                }
            }
        }

        # Parse if Forward Agent is required
        $puttyAgent = (Get-ItemProperty -Path "$regPath\$_").AgentFwd
        if ($puttyAgent -eq 1) { $agentLine = "`tForwardAgent yes" }

        # Parse if non-default port
        $puttyPort = (Get-ItemProperty -Path "$regPath\$_").PortNumber
        if (-Not $puttyPort -eq 22) { $PortLine = "`tPort $puttyPort" }

        # Build output string
        $output = "$hostLine`n$hostnameLine`n$userLine`n$identityLine`n$tunnelLine`n$agentLine`n"

        # Output to file if set, otherwise STDOUT
        Write-Host $output
    }
}
