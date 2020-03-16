# This Powershell Script is to Extract details of Locations from Address in Germany
#
# http://dev.virtualearth.net/REST/v1/Locations/DE/{postalCode}/{locality}/{addressLine}?includeNeighborhood={includeNeighborhood}&include={includeValue}&maxResults={maxResults}&key={BingMapsAPIKey}
#
#
#
$Location = New-Object psobject -Property @{
    BingKey = "Akj0AL0hfwAF1ixTreTS5rl8YCfzkEgqb9bYV8IrD3nbM8B5SePwwoO6fdjmogKn"
    RESTUrl = "http://dev.virtualearth.net/REST/v1/Locations"
    country = "DE"
    postalCode = "68804"
    locality = "Altlussheim"
    addressLine = "platanenweg"

}
$OutputLocation = "output.txt"
# Write-Host "$($assoc.Id) - $($assoc.Name) - $($assoc.Owner)"

#$url = "$($Location.RESTUrl)/$($Location.country)/$($Location.postalCode)/$($Location.locality)/$($Location.addressLine)?o=xml&key=$($Location.BingKey)"
$url = "$($Location.RESTUrl)/$($Location.country)/$($Location.postalCode)/$($Location.locality)?key=$($Location.BingKey)"
#$url = "$($Location.RESTUrl)/$($Location.country)/$($Location.postalCode)/$($Location.locality)?o=xml&key=$($Location.BingKey)"
Write-Host $url

Invoke-RestMethod -Method 'Get' -Uri $url -OutFile $OutputLocation


