
# Project folder name
$projectList = @(
    "Namipaymentaccountapi",
    "Namipromotionapi",
    "Namiuserinfoapi",
    "Shabondi",
    "Hectorgraphql",
    "Bartholomew",
    "Robin",
	"Martin",
	"Sphinx"
)
# Git Path
$gitPath = "D:\twsc"
class PathObject{
    [string]$CsprojPath
    [string]$JobName
}
$watcherData = @{}
##########################
function startFileWatcher {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FolderPath,
        [Parameter(Mandatory=$true)]
        [string]$JobName,
        [Parameter(Mandatory=$true)]
        [string]$ProjectName
    )
    $object = [PathObject]::new()
    $object.CsprojPath = $FolderPath
    $object.JobName = $JobName
    $watcherData[$ProjectName] = $object
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $FolderPath
    $watcher.Filter = "*.cs"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true
    $action = {
        $path = $Event.SourceEventArgs.FullPath
        $changeType = $Event.SourceEventArgs.ChangeType
        $fileName = Split-Path -Path $path -Leaf
        $ProjectName = ($path -split '\\')[2]
        $JobName = $watcherData[$ProjectName].JobName
        Remove-Job -Name $JobName -Force
        Start-Job -Name $JobName {cd $args[0]; dotnet run} -ArgumentList $watcherData[$ProjectName].CsprojPath
        Write-Host [$JobName] "::" $fileName "has been changed！" -ForegroundColor Yellow 
    }
    Register-ObjectEvent $watcher "Changed" -Action $action -SourceIdentifier "wt_$JobName"
    Start-Job -Name $JobName {cd $args[0]; dotnet run} -ArgumentList $FolderPath
}
function nami {
    # Delete Job
    if($args[0] -eq "-d"){
        $jobNames = (Get-Job | Where-Object { $_.State -eq "Running" -and $_.Name -notmatch "^wt_" }).Name
        while ($true) {
            Write-Host "Please select a Job:"
            for ($i = 0; $i -lt $jobNames.Count; $i++) {
                Write-Host ("[{0}] {1}" -f ($i + 1), $jobNames[$i])
            }
            $jobIndex = Read-Host "Please enter the job number:"
            if ([int]::TryParse($jobIndex, [ref]$null)) {
                $jobIndex = [int]$jobIndex - 1
                if ($jobIndex -ge 0 -and $jobIndex -le $jobNames.Count) {
                    $jobName = $jobNames[$jobIndex]
                    Remove-Job -Name $jobName -Force
                    Remove-Job -Name "wt_$jobName" -Force
                    Get-Job
                    break
                }
                else {
                    Write-Host "Invalid selection: $jobIndex"
                }
            }
            else {
                Write-Host "Invalid selection: $jobIndex"
            }
        }
    }
	if ($args[0] -eq "-dd") {
		Write-Host "#########################Before Closing Jobs#############################"
		Get-Job
		Write-Host "#########################Closing Jobs###################################"
		$jobNames = (Get-Job)

        for ($i = 0; $i -lt $jobNames.Count; $i++) {
			$job = $JobNames[$i]
			if($projectList.Contains($job.Name.Replace("wt_",""))){
            	Write-Host ("[{0}] {1}" -f ($i + 1), $job.Name)
				Remove-Job -Name $job.Name -Force
				Remove-Job -Name "wt_$job.Name" -Force
			}
        }
		Write-Host "#########################After Closing Jobs##############################"
		Get-Job

	}
	if ($args[0] -eq "-l") {

		Write-Host "#########################Listing Jobs###################################"
		Get-Job	
	}
    # Run All project for Nami
    if($args[0] -eq "-all"){
        $visitedDirectories = @()
        $logMessages = @()
        Get-ChildItem -Recurse -Path $gitPath -Directory | 
        ForEach-Object {
            $projectDirectory = $_.FullName
            $projectName = $_.Name
            if ($visitedDirectories -notcontains $projectDirectory -and $projectList -contains $projectName) {
                $visitedDirectories += $projectDirectory
                $csprojFiles = Get-ChildItem $projectDirectory -Recurse -Filter "*$projectName.csproj" -File -ErrorAction SilentlyContinue | 
                            Where-Object { $_.Name -ilike "$projectName.csproj" }
                if ($csprojFiles.Count -gt 0) {
                    foreach ($csproj in $csprojFiles) {
                        $projectPath = $csproj.DirectoryName
                        $jobName = $csproj.Name.Replace(".csproj", "")
                        $existingJobs = Get-Job -Name $jobName -ErrorAction SilentlyContinue
                        if ($existingJobs.Count -eq 0) {
                            if ($visitedDirectories -notcontains $projectPath) {
                                $visitedDirectories += $projectPath
                                if ($logMessages -notcontains "Starting $projectPath") {
                                    $logMessages += "Starting $projectPath"
                                }
                                startFileWatcher -FolderPath $projectPath -JobName $jobName -ProjectName $projectName
                            } 
                        } 
                        elseif ($existingJobs[0].State -eq "Running") {
                            if ($logMessages -notcontains "Job $jobName is already running, skipping") {
                                $logMessages += "Job $jobName is already running, skipping"
                            }
                        } 
                        else {
                            if ($logMessages -notcontains "Job $jobName already exists, skipping") {
                                $watcherJobName = "wt_" + $existingJobs.Name
                                Remove-Job -Job $existingJobs -Force
                                Remove-Job -Name $watcherJobName -Force -ErrorAction SilentlyContinue
                                startFileWatcher -FolderPath $projectPath -JobName $jobName -ProjectName $projectName
                            }
                        }
                    }
                } else {
                    if ($logMessages -notcontains "No .csproj files found in $projectPath") {
                        $logMessages += "No .csproj files found in $projectPath"
                    }
                }
            }
        }
        $logMessages | ForEach-Object { Write-Output $_ }
        Get-Job
    }
}
