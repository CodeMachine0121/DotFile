Set-Alias -Name k -Value kubectl
Set-Alias -Name kctx -Value kubectx
Set-Alias -Name kns -Value kubens



## Autocompleteion
kubectl completion powershell | Out-String | Invoke-Expression
Register-ArgumentCompleter -CommandName k -ScriptBlock $__kubectlCompleterBlock
