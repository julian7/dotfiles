[[ -e $HOME/.dvm/dvm.sh ]] && source $HOME/.dvm/dvm.sh

alias dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'"

function dip() {
    (
        echo $'ID\tNAME\tIP address'
        docker ps --format '{{.ID}}:{{.Names}}' |
        while IFS=: read id name; do
            ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $id)
            echo -e "$id\t$name\t$ip"
        done
    ) |
    column -s $'\t' -t
}
