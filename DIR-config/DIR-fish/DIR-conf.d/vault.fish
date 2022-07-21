if command -qs vault
    function vaultauth -a uname
        if [ (count $argv) -lt 1 ]
            echo "Usage: vaultauth <user> [params to vault login]"
            return 1
        end
        if ! vault status >/dev/null 2>/dev/null
            if [ -z "$VAULT_AUTH" ]
                set -l VAULT_ADDR "https://127.0.0.1:8200"
            end
            echo "Error: vault ($VAULT_ADDR) is not available"
            return 1
        end
        set -xg VAULT_TOKEN (vault login -token-only -method=userpass username="$uname" $argv[2..-1])
    end
end
