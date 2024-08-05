
function ConvertTo-WslPath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    # Initialize the variable to store the full path
    $fullPath = $null

    # Check if the path exists
    if (Test-Path -Path $Path) {
        # Resolve the full path from a relative or absolute path
        $fullPath = Resolve-Path -Path $Path
    } else {

        $Path = Join-Path -Path (Get-Location) -ChildPath $Path
        $fullPath = $Path
    }

    # Normalize the path and replace drive letters and backslashes
    $wslPath = $fullPath -replace '^([A-Za-z]):', '/mnt/$1' -replace '\\', '/'
    $wslPath = $wslPath.ToLower()

    return $wslPath
}
