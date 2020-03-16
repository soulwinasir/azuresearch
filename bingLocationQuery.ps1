# This PowerShell Script is used to search for a location using Query. 
#
#
#  http://dev.virtualearth.net/REST/v1/Locations?q=1%20Microsoft%20Way%20Redmond%20WA%2098052&o=xml&key={BingMapsAPIKey}

$Location = New-Object psobject -Property @{
    BingKey = "Akj0AL0hfwAF1ixTreTS5rl8YCfzkEgqb9bYV8IrD3nbM8B5SePwwoO6fdjmogKn"
    RESTUrl = "http://dev.virtualearth.net/REST/v1/Locations"
    Query = "Mannheim wasserturm"
    Format = "json"
    maxResults = 1
}
$OutputLocation = "output.txt"
$Location.Query = [System.Web.HttpUtility]::UrlEncode($Location.Query) 

$url = "$($Location.RESTUrl)?q=$($Location.Query)&o=$($Location.format)&maxResults=$($Location.maxResults)&key=$($Location.BingKey)"

#Invoke-RestMethod -Method 'Get' -Uri $url -OutFile $OutputLocation

$response = ""
if($($Location.Format).Equals("json"))
{
    $response = Get-Content -Raw -Path $OutputLocation | ConvertFrom-Json

    Write-Host $response.resourceSets.resources.geocodePoints.coordinates

    
}


