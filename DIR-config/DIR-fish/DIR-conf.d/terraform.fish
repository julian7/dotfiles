if command -qs terraform
    alias tf=terraform
    alias tpx='terraform plan -out=x'
    alias tax='terraform apply x'
end
