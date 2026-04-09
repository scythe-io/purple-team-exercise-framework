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

# Define the URL of the WinRAR installer
$winrarUrl = "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-700.exe"

# Define the local path where the installer will be saved
$localPath = "$env:TEMP\WinRARInstaller.exe"

# Define the path to the WinRAR executable
$winrarExePath = "C:\Program Files\WinRAR\WinRAR.exe"

# Define the path to the renamed executable
$renamedExePath = "C:\Program Files\WinRAR\ronf.exe"

# Define the path to the file to be archived
$fileToArchive = "$env:PUBLIC\Documents\systeminfo.txt"

# Define the path to the archive
$archivePath = "$env:TEMP\info_sys.zip"

# Step 1: Download the WinRAR installer
Invoke-WebRequest -Uri $winrarUrl -OutFile $localPath

# Step 2: Execute the WinRAR installer
Start-Process -FilePath $localPath -ArgumentList "/S" -Wait

# Step 3: Rename the WinRAR executable
Rename-Item -Path $winrarExePath -NewName $renamedExePath

# Step 4: Use WinRAR to archive the file
# Note: This assumes WinRAR is installed and the executable is renamed as specified.
# Adjust the command according to your needs, especially the path to the renamed executable.
& $renamedExePath a -afzip $archivePath $fileToArchive

# Optionally, remove the installer file after installation
Remove-Item -Path $localPath
