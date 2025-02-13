# Connector: Exchange
# Commands: New-Mailbox,set-Mailbox,Add-MailboxPermission
param (
    [Parameter(Mandatory = $true)]
    $Name,
    [Parameter(Mandatory = $true)]
    $DisplayName,
    [Parameter(Mandatory = $true)]
    $Alias,
    [Parameter(Mandatory = $true)]
    $Owner,
    [Parameter(Mandatory = $true)]
    $Members,
    [Parameter(Mandatory = $true)]
    $Readers
)


$mailbox = New-Mailbox -Shared -Name $name -DisplayName $displayName -Alias $alias
if ($mailbox -eq $null) {
    throw "Failed to create mailbox"
}
Start-Sleep -s 5

<#
if ($owner -ne $null -and $owner -ne "" ) {
    set-Mailbox -Identity $mailbox.ExchangeObjectId 
}
#>

if ($members -ne $null -and $members -ne "" ) {
    foreach ($member in $members) {
        Add-MailboxPermission -Identity $mailbox.ExchangeObjectId  -User $member  -AccessRights FullAccess -InheritanceType All | Out-Null
        Add-RecipientPermission -Identity $mailbox.ExchangeObjectId  -AccessRights SendAs -Trustee $member -confirm:$false | Out-Null
    }
}


if ($readers -ne $null -and $readers -ne "" ) {
    foreach ($reader in $readers) {
        Add-MailboxPermission -Identity $mailbox.ExchangeObjectId  -User $member  -AccessRights ReadPermission -InheritanceType All | Out-Null
    }
}

write-output $mailbox | Select name,displayname,Identity,PrimarySmtpAddress