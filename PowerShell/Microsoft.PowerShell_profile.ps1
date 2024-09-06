## wslRelated
$env:Path += ";~\AppData\Local\Programs\oh-my-posh\bin"
$env:Path += ";~\AppData\Roaming\npm"
$env:Path += ";~\scoop\shims"
$env:Path += ";D:\MinGW\bin"
$env:Path += ";D:\luarocks-3.11.1"
. ~/Documents/PowerShell/wslRelated.ps1
. ~/Documents/PowerShell/nami.ps1


## alias
Set-Alias vim nvim


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
Function hosts { wsl vim C:\Windows\System32\drivers\etc\hosts }

# function of folder
Function .. { cd ..\ }
Function ... { cd ..\.. }
Function l { Get-ChildItem -Path $pwd -File } # list only file not folders


Function bun {
    $currentPath = wsl pwd
    wsl docker run -it --rm -w /app -v ${currentPath}:/app -p 8080:8080 -p 5555:5555 oven/bun bun $args
}
Function dpnpm {
    $currentPath = wsl pwd
    wsl docker run -it --rm -w /app -v ${currentPath}:/app -p 8080:8080 -p 5555:5555 octoblu/pnpm pnpm $args
}
Function dnpm {
    $currentPath = wsl pwd
    wsl docker run -it --rm -w /app -v ${currentPath}:/app -p 8080:8080 node:alpine npm $args
}

Function hx{
    hexo clean
    hexo generate
    hexo server
}



$env:DB_SERVER="localhost"
$env:DB_USER="root"
$env:DB_PASS="1234qwer"
$env:DB_NAME="BlockChain"
$env:Redis="localhost"


