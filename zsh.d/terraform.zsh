if whence -p terraform > /dev/null; then
    alias tf=terraform
    alias tpx='terraform plan -out=x'
    alias tax='terraform apply x'
fi
