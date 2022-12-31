@echo off

:: ###########################################################
:: Check we're running at admin, exit if not
whoami /groups | find "12288" || echo NOT RUNNING AS ADMIN
whoami /groups | find "12288" || exit /B

:: ###########################################################
:: Check winget is installed
winget
if %errorlevel% neq 0 echo "ERROR - Install Winget" && echo "https://github.com/microsoft/winget-cli/releases" && pause && exit /b

:: ###########################################################
:: Install Apps available through Windows Package Manager

:: ###################################################################
:: Core
winget install --id="Nvidia.GeForceExperience" --exact --silent 
winget install --id="Microsoft.VC++2015-2019Redist-x86" --exact --silent 

:: #####################################################################
:: Dev
winget install --id="Microsoft.VisualStudioCode" --exact --silent --override "/allusers /verysilent /suppressmsgboxes"
winget install --id="JetBrains.IntelliJIDEA.Community" --exact
winget install --id="GoLang.Go.1.19" --exact
winget install --id="OpenJS.Nodejs" --exact
winget install --id="Microsoft.PowerShell" --exact
winget install --id="Insomnia.Insomnia" --exact
winget install --id="Postman.Postman" --exact
winget install --id="WestWind.MarkdownMonster" --exact 
winget install --id="WinMerge.WinMerge" --exact 
winget install --id="Git.Git" --exact --silent 
winget install --id="GitHub.cli" --exact --silent
winget install --id="OpenJS.NodeJS" --exact --silent 
winget install --id="Azul.Zulu.17" --exact
winget install --id="Python.Python.2" --exact --silent
winget install --id="Microsoft.VisualStudio.2019.BuildTools" --exact --silent 
winget install --id="Docker.DockerDesktop" --exact
winget install --id="9p7knl5rwt25" --exact --silent --accept-package-agreements & :: Windows Store - SysInternals

:: AWS
winget install --id="Amazon.AWSCLI" --exact --silent 
winget install --id="Amazon.SAM-CLI" --exact --silent

:: Azure
winget install --id="Microsoft.AzureCLI" --exact --silent
winget install --id="Microsoft.Bicep" --exact --silent
winget install --id="Microsoft.AzureFunctionsCoreTools" --exact --silent

:: VS Code Extensions
set path=%path%;%LOCALAPPDATA%\Programs\microsoft VS Code\bin

call code --install-extension eamodio.gitlens
call code --install-extension donjayamanne.githistory
call code --install-extension ms-vscode.PowerShell
call code --install-extension AmazonWebServices.aws-toolkit-vscode
call code --install-extension aws-scripting-guy.cform
call code --install-extension yzhang.markdown-all-in-one
call code --install-extension ms-python.python
call code --install-extension dbaeumer.vscode-eslint
call code --install-extension esbenp.prettier-vscode
call code --install-extension ms-vscode-remote.remote-wsl
call code --install-extension redhat.vscode-yaml
call code --install-extension xabikos.JavaScriptSnippets
call code --install-extension golang.Go
call code --install-extension ms-vscode-remote.remote-ssh
call code --install-extension DavidAnson.vscode-markdownlint
call code --install-extension GitHub.vscode-pull-request-github
call code --install-extension 42Crunch.vscode-openapi
call code --install-extension ivangsa.asyncapi-preview
call code --install-extension hediet.vscode-drawio
call code --install-extension ms-python.python
call code --install-extension gera2ld.markmap-vscode
call code --install-extension jebbs.plantuml

:: #####################################################################
:: Tweaking & monitoring tools
winget install --id="CrystalDewWorld.CrystalDiskMark" --exact 
winget install --id="CrystalDewWorld.CrystalDiskInfo" --exact 
winget install --id="PrimateLabs.Geekbench" --exact 
winget install --id="TechPowerUp.GPU-Z" --exact 
winget install --id="REALiX.HWiNFO" --exact --silent
winget install --id="CPUID.CPU-Z" --exact --silent 
winget install --id="FinalWire.AIDA64Extreme" --exact --silent 

:: #####################################################################
:: Office
:: REMOVED FOR NOW

:: #####################################################################
:: General Tools
winget install --id="AntibodySoftware.WizTree" --exact 
winget install --id="7zip.7zip" --exact --silent 
winget install --id="Microsoft.PowerToys" --exact --silent 
winget install --id="VideoLAN.VLC" --exact --silent
winget install --id="Google.Chrome" --exact --silent
winget install --id="Discord.Discord" --exact --silent
winget install --id="Adobe.Acrobat.Reader.64-bit" --silent --exact
winget install --id="Audacity.Audacity" --silent --exact
winget install --id="HandBrake.HandBrake" --silent --exact

:: #####################################################################
:: Games
winget install --id="GOG.Galaxy" --exact
winget install --id="Valve.Steam" --exact
winget install --id="Ubisoft.Connect" --exact
winget install --id="EpicGames.EpicGamesLauncher" --exact
winget install --id="ElectronicArts.EADesktop" --exact
winget install --id="MoonlightGameStreamingProject.Moonlight" --exact

:: #####################################################################
:: Windows App Store Packages

winget install --id="9P6RC76MSMMJ" --accept-source-agreements --accept-package-agreements & :: Amazon Prime Video
winget install --id="9N2D0P16C80H" --exact --silent --accept-package-agreements --verbose-logs & :: Affinity Designer 2
winget install --id="9P8DVF1XW02V" --exact --silent --accept-package-agreements --verbose-logs & :: Affinity Photo 2
winget install --id="9NTV2DZ11KD9" --exact --silent --accept-package-agreements --verbose-logs & :: Affinity Publisher 2

:: #####################################################################
:: PowerShell Packages

Install-Module -Name AWS.Tools.Installer -Force

:: #####################################################################
:: Windows Tweaks

:: Enable long file paths in Win 10/11
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem /t REG_DWORD /v LongPathsEnabled /d 1 /f
