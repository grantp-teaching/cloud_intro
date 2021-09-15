# Checks for cloud setup lab

# files expected
$paths = @( "$HOME\.aws", "$HOME\.aws\config", "$HOME\.aws\credentials" )

# check for expected files
foreach ( $path in $paths ) {

if ( Test-Path $path ) {
    Write-Host "$path exists"
}
else {
    Write-Host "$path does not exist" 
    Write-Host " ... fix this error and re-run"
    Return
    }

}

# ensure that the aws CLI is operational
$output = (aws ec2 describe-host-reservations)
Write-Host "output from aws:"
Write-Host $output
if ( "HostReservationSet" -in ($output | ConvertFrom-Json).PSObject.Properties.Name ) {
    Write-Host "aws CLI works OK"
    }
    else
    {
    Write-Host "aws CLI not working, fix and re-run"
    Return
    }

# confirmation screen
Write-Host "You have completed AWS setup lab"

