$url = "https://github.com/Azure/azure-devops-cli-extension/releases/download/0.1.4/vsts-cli-0.1.4.msi"
$outpath = "$PSScriptRoot\vsts-cli.msi"


[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$gitToken = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter your personal git access token", "Token", "")


if ($gitToken -eq "")
{
    Write-Output("Invalid git token")
    exit
}
Write-Output("Your git token: $gitTOken")   

Write-Output("Downloading file...")

Invoke-WebRequest  $url -OutFile $outpath

Write-Output("Installing VSTS CLI...")

$args = @("/i",$outpath)
Start-Process -Filepath msiexec -ArgumentList $args -Wait

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

vsts login --token $gitToken
vsts configure --use-git-aliases yes

git config --global alias.prb "!git pr create --target-branch"
git config --global alias.prm "!git prb master --query pullRequestId"
git config --global alias.prmc "!git prm --auto-complete"
git config --global alias.prl "!git pr list -output table"
git config --global alias.prc "!git pr update --query status --auto-complete on --id"
git config --global alias.url "!git config --get remote.origin.url"
git config --global alias.execurl "`"!f() { exec start chrome \`"$@/pullrequests?_a=mine\`"; } ; f"
git config --global alias.web "!git execurl `$(git url)"
