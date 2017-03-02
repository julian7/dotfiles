[[ -e $HOME/.dvm/dvm.sh ]] && source $HOME/.dvm/dvm.sh

alias dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'"

alias dip=dstat

function dstat() {
    (
        echo $'ID\tNAME\tIP\t MEMORY'
        docker ps --no-trunc --format '{{.ID}}:{{.Names}}' |
        while IFS=: read id name; do
            ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $id)
            mem=$(cat /sys/fs/cgroup/memory/docker/$id/memory.usage_in_bytes)
            if ((mem > 536870912)); then
                mem=$((mem/1073741824.0))
                sfx=G
            elif ((mem > 524288)); then
                mem=$((mem/1048576.0))
                sfx=M
            elif ((mem > 512)); then
                mem=$((mem/1024.0))
                sfx=k
            else
                sfx=""
            fi
            printf "%12s\t%s\t\t%s\t%6.1f%s\n" "${id:0:12}" "$name" "${ip:-N/A}" "$mem" "$sfx"
        done
    ) |
    column -s $'\t' -t
}
