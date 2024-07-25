#Template used for object based logging in EXO based unattended scripts
function Write-ExchangeOnlineLogObject {
<#
.SYNOPSIS
    TODO
.DESCRIPTION
    TODO
.EXAMPLE
    TODO
.NOTES
    Author: jethro@regenit.cloud / https://github.com/regen-it
    Version: 0.1
#>
    Param (
        [Parameter(Mandatory=$true)]
        [string]$action,
        [Parameter(Mandatory=$true)]
        [string]$result,
        [Parameter(Mandatory=$true)]
        [string]$user,
        [Parameter(Mandatory=$true)]
        [string]$dl,
        [string]$logError = (($Error | Select-Object -First 1 -ExpandProperty Exception).toString()).split("|")[2]
    )
    $logObject = [PSCustomObject]@{
        Action = $action
        Result = $result
        User = $user
        DL = $dl
        LogError = $logError
    }
    $logObject
}
