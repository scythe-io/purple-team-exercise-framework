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

## Ping Sweep
# Dynamically get the IP address of the network adapter, excluding those starting with 169
$IPAddress = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notmatch '^169' -and $_.IPAddress -notmatch '127.0.0.1' } | Select-Object -ExpandProperty IPAddress

# Extract the subnet from the IP address
$Subnet = $IPAddress.Substring(0, $IPAddress.LastIndexOf('.')) + '.'

# Ping sweep of /24 network
(1..254) | % {$ip="$Subnet$_"; Write-Output "$ip $(ping $ip -n 1 -w 1)"} | Out-File "$env:PUBLIC\documents\sysinfo.txt" -Append