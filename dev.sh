alias docker-init='eval $(docker-machine env default || docker-machine start default && docker-machine env default)'
alias dc='docker-compose -f docker-compose.local.yml'
alias unit='dc run --rm php vendor/bin/phpunit --verbose'
alias un='unit'
