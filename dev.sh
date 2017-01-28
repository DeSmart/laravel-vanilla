alias docker-init='eval $(docker-machine env default || docker-machine start default && docker-machine env default)'
alias dc='docker-compose -f docker-compose.local.yml'
alias drun='docker exec -it $(docker ps -qf "name=.*(php|app).*")'
alias unit='drun vendor/bin/phpunit'
alias un='unit'
