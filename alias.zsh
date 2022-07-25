# alias for some binaries
alias vim="nvim"
alias ls="exa"

# alias just for panda.
alias startest="docker-compose -f deployments/testing/docker-compose.yaml up -d"
alias migratetest="docker exec -it testing_pablo_method_worker_1 make migrate"
alias removetest="docker-compose -f deployments/testing/docker-compose.yaml down --remove-orphans"
alias stoptest="docker-compose -f deployments/testing/docker-compose.yaml stop"
