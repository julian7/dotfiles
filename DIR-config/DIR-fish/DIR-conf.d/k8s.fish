alias kubesh='kctl run --generator=run-pod/v1 --rm -ti kubesh-$RANDOM --image'
alias k=kctl

if set -q KREW_ROOT
    fish_add_path -g "$KREW_ROOT/.krew/bin"
else
    fish_add_path -g "$HOME/.krew/bin"
end

complete -c kcx -f
complete -c kcx -a "(kctl config view -o jsonpath='{range .contexts[?(@.name != \"'(kubectl config current-context)'\")]}{.name}{\"\n\"}{end}')"

complete -c kns -f
complete -c kns -a "(kctl get namespaces -o=jsonpath='{range .items[*]}{.metadata.name}{\"\n\"}{end}')" -x

if command -qs kubectl
    eval (kubectl completion fish)
    complete -c kctl -e
    complete -c kctl -n '__kubectl_clear_perform_completion_once_result'
    complete -c kctl -n 'not __kubectl_requires_order_preservation && __kubectl_prepare_completions' -f -a '$__kubectl_comp_results'
    complete -k -c kctl -n '__kubectl_requires_order_preservation && __kubectl_prepare_completions' -f -a '$__kubectl_comp_results'
end
