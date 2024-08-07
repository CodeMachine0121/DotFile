## import denpendencies
$env:Path += ";~\AppData\Local\Programs\oh-my-posh\bin"
. ~/Documents/PowerShell/wslRelated.ps1

## update oh-my-posh
winget upgrade JanDeDobbeleer.OhMyPosh -s winget

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
Function hosts {wsl vim C:\Windows\System32\drivers\etc\hosts }

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
