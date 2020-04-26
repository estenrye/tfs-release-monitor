param(
    [string]$LetsEncryptEmail = 'noreply@your-domain.com',
    [string]$TopLevelDomain = 'your-domain.com',
    [switch]$IsProduction,
    [switch]$Deploy,
    [string]$WorkingDirectory = "${PSScriptRoot}".Replace('\', '/'),
    [array]$Stacks = @('data_systems', 'network_systems', 'metrics_systems', 'logging_systems')
)
$env:WORKING_DIRECTORY = $WorkingDirectory
$env:TOP_LEVEL_DOMAIN = 'localhost'
$env:TRAEFIK_WEB_ENTRYPOINT = 'web'
$env:LETS_ENCRYPT_EMAIL = $LetsEncryptEmail
$env:SCHEME = 'http'
$environment = 'development'

if ($IsProduction) {
  $env:TOP_LEVEL_DOMAIN = $TopLevelDomain
  $env:TRAEFIK_WEB_ENTRYPOINT = 'websecure'
  $env:SCHEME = 'https'
  $environment = 'production'
}

if ($Deploy)
{
  $networks = docker network ls --format '{{.Name}}'

  if (-not $networks.Contains('graylog')) {
    docker network create --driver overlay graylog
  }

  if (-not $networks.Contains('public')) {
    docker network create --driver overlay public
  }

  if (-not $networks.Contains('monitor')) {
    docker network create --driver overlay monitor
  }
}

foreach ($stack in $Stacks) {
  $base_stacks = (Get-ChildItem -Path "${PSScriptRoot}/stacks/${stack}" -Exclude "*.*.stack.yml")

  foreach ($baseFile in $base_stacks) {
    $stackName = $baseFile.Name.Replace('.stack.yml', '')
    $overrideFile = $baseFile.FullName.Replace('.stack.yml',".$environment.stack.yml")
    if ($Deploy) {
      
      if (Test-Path($overrideFile))
      {
        docker stack deploy -c $baseFile.FullName -c $overrideFile $stackName
      }
      else
      {
        docker stack deploy -c $baseFile.FullName $stackName
      }
    }
  }
  
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