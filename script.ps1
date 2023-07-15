$clientSecret = "" | ConvertTo-SecureString -AsPlainText -Force
$connectCreds = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList "2a4a7826-7dc3-4b82-9adf-8741434bb77d", $clientSecret
Connect-AzAccount -ServicePrincipal -Credential $connectCreds -Tenant "16b65589-0618-4f66-8e94-62c88bc626ad"


New-AzResourceGroup -Name TutorialResources -Location eastus
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."
$vmParams = @{
    ResourceGroupName = 'TutorialResources'
    Name = 'TutorialVM2'
    Location = 'eastus'
    ImageName = 'Win2016Datacenter'
    PublicIpAddressName = 'tutorialPublicIp'
    Credential = $cred
    OpenPorts = 3389
    Size = 'Standard_D2s_v3'
  }
  $newVM1 = New-AzVM @vmParams