$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$body = "{`n	`"hello`": `"world`"`n}"

$response = Invoke-RestMethod 'https://localhost:5001/api/DeploymentCompleted' -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json