
    /*
    Generated by pack.ts
    */
import {IScript} from "@koksmat/powerpacks"


export interface IParameters {
  
}
export default class Script implements IScript{
  
  public get code() : string {
    return `# Connector: Exchange
# Commands: Get-Mailbox
# Outputs: rooms.csv


# This to ensure a predictalbe output of e.g. dates

$culture = [System.Globalization.CultureInfo]::CreateSpecificCulture("de-DE")
[System.Threading.Thread]::CurrentThread.CurrentUICulture = $culture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $culture

Get-Mailbox  -ResultSize Unlimited -RecipientTypeDetails RoomMailbox 
     | Select-Object -Property DisplayName,Name,MailTip,ResourceType, PrimarySmtpAddress,WhenCreatedUTC, ResourceCapacity
    | Export-Csv -Path $PSScriptRoot/rooms.csv -NoTypeInformation -Encoding UTF8 -UseCulture
#| fl`
  }
  public get commands() : string[] {
    return ['Get-Mailbox']
  }
  public get outputs() : string[] {
    return ['rooms.csv']
  }
}
    