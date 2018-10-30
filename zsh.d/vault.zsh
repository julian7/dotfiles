if whichX vault; then
    vaultauth() {
        if (($# < 1)); then
            echo "Usage: vaultauth <user> [params to vault login]"
            return 1
        fi
        if ! vault status >/dev/null 2>/dev/null; then
            echo "Error: vault (${VAULT_ADDR:-https://127.0.0.1:8200}) is not available"
            return 1
        fi
        uname="$1"
        shift
        export VAULT_TOKEN=$(vault login -token-only -method=userpass username="$uname" "$@")
    }
fi
