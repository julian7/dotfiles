alias kubesh='kubectl run --generator=run-pod/v1 --rm -ti kubesh-$RANDOM --image'

complete -c kcx -f
complete -c kcx -a "(kubectl config view -o jsonpath='{range .contexts[?(@.name != \"'(kubectl config current-context)'\")]}{.name}{\"\n\"}{end}')"

complete -c kns -f
complete -c kns -a "(kubectl get namespaces -o=jsonpath='{range .items[*]}{.metadata.name}{\"\n\"}{end}')" -x
