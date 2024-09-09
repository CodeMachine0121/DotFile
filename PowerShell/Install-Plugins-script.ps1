winget install JanDeDobbeleer.OhMyPosh -s winget  

Install-Module oh-my-posh -Scope CurrentUser
Install-Module ZLocation -Scope CurrentUser
Install-Module PSReadLine -Scope CurrentUser
Install-Module posh-git -Scope CurrentUser


Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression