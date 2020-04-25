param(
    [string]$LetsEncryptEmail = 'noreply@your-domain.com',
    [string]$TopLevelDomain = 'your-domain.com',
    [switch]$IsProduction,
    [switch]$DeployDataSystems
    
)
$env:PWD = "${PSScriptRoot}".Replace('\', '/')
$env:TOP_LEVEL_DOMAIN = 'localhost'
$env:TRAEFIK_WEB_ENTRYPOINT = 'web'
$env:LETS_ENCRYPT_EMAIL = $LetsEncryptEmail

if ($IsProduction) {
    $env:TOP_LEVEL_DOMAIN = $TopLevelDomain
    $env:TRAEFIK_WEB_ENTRYPOINT = 'websecure'
    $overrideFile = "${PSScriptRoot}/stacks/stack.production.yml"
}

if ($DeployDataSystems)
{

}

# if ($Deploy)
# {
#     docker stack deploy -c ${baseFile} -c ${overrideFile} -c ${mongoFile} -c ${elasticSearchFile} seis635
# }
# else
# {
#     $baseFile
#     $overrideFile
#     docker-compose -f $baseFile -f $overrideFile -f ${mongoFile} -f ${elasticSearchFile} config
# }