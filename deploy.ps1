param(
    [string]$LetsEncryptEmail = 'noreply@your-domain.com',
    [string]$TopLevelDomain = 'your-domain.com',
    [switch]$IsProduction,
    [switch]$Deploy
    
)
$env:PWD = ${PSScriptRoot}.Replace('\', '/')
$env:TOP_LEVEL_DOMAIN = 'localhost'
$env:TRAEFIK_WEB_ENTRYPOINT = 'web'
$env:LETS_ENCRYPT_EMAIL = $LetsEncryptEmail
$baseFile = "$env:PWD/stack.yml"
$overrideFile = "$env:PWD/stack.development.yml"
if ($IsProduction) {
    $env:TOP_LEVEL_DOMAIN = $TopLevelDomain
    $env:TRAEFIK_WEB_ENTRYPOINT = 'websecure'
    $overrideFile = "$env:PWD/stack.production.yml"
}

$env:PWD = $env:PWD.Replace('C:/', '/c/')
if ($Deploy)
{
    docker stack deploy -c "$baseFile" -c "$overrideFile" seis635
}
else
{
    $baseFile
    $overrideFile
    docker-compose -f $baseFile -f $overrideFile config
}