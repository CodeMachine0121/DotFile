## kubectl 
. ~/Documents/PowerShell/kubernets.ps1
## nami
. ~/Documents/PowerShell/nami.ps1
## wslRelated
. ~/Documents/PowerShell/wslRelated.ps1

$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
oh-my-posh init pwsh --config "~/posh-theme/themes/gruvbox.omp.json" | Invoke-Expression

Import-Module posh-git
Import-Module ZLocation

Import-Module PSReadLine

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineOption -ShowToolTips



Function ex { explorer.exe $args }
Function hosts { sudo wsl vim C:\Windows\System32\drivers\etc\hosts }

# function of folder
Function .. { cd ..\ }
Function ... { cd ..\.. }
Function l { Get-ChildItem -Path $pwd -File } # list only file not folders

# function vim {
#     param([string]$filePath)
#     $wslPath = ConvertTo-WslPath -Path $filePath
#     wsl nvim "$wslPath"
# }

Function bun {
    $currentPath = wsl pwd
    wsl docker run -it --rm -w /app -v ${currentPath}:/app -p 8080:8080 oven/bun bun $args
}
Function dnpm {
    $currentPath = wsl pwd
    wsl docker run -it --rm -w /app -v ${currentPath}:/app -p 8080:8080 node:alpine npm $args
}

$env:INSTANCE_UNIX_SOCKET="restaurant-421915:us-central1:lucky-cat"
$env:DB_USER="luckycat"
$env:DB_PASS="1234qwer"
$env:DB_NAME="LuckyCatDB"


