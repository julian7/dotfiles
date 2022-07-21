alias dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'"
alias dip=dstat

function dex -a name
    if test (count $argv) -lt 1
        echo "Usage: $0 <container ID> [<command>...]"
        return
    end
    if test (count $argv) -eq 1
        set argv sh
    end

    docker exec -ti $name $argv
end

function dstat
    begin
        set -l id name ip
        echo "ID|NAME|IP"
        docker ps --no-trunc --format '{{.ID}}:{{.Names}}' |
        while IFS=: read id name
            set ip (docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $id)
            or set ip "N/A"
            printf "%12s|%s|%s\n" (string sub -l 12 $id) $name $ip
        end
    end |
    column -s '|' -t
end
