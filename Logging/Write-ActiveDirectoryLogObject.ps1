#Template used for object based logging in Active Directory based unattended scripts
function Write-ActiveDirectoryLogLobject {
<#
.SYNOPSIS
    TODO
.DESCRIPTION
    TODO
.EXAMPLE
    Write-ActiveDirectoryLogObject -Action SetUser -LogMessage -Result Success -User $user.SamAccountName -LogError $null
.NOTES
    Author: jethro@regenit.cloud / https://github.com/regen-it
    Version: 0.1
#>
    Param (
        [Parameter(Mandatory=$true)]
        [string]$action,
        [Parameter(Mandatory=$true)]
        [string]$logMessage,
        [Parameter(Mandatory=$true)]
        [string]$result,
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$User,
        [string]$logError = ($Error | Select-Object -First 1 -ExpandProperty Exception).Message
    )
    $logObject = [PSCustomObject]@{
        Action = $action
        LogMessage = $logMessage
        Result = $result
        User = $user
        LogError = $logError
    }
    $logObject
}
