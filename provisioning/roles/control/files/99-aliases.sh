alias k='kubectl'
alias kc='k config view --minify | grep name'
alias kdp='kubectl describe pod'
alias krh='kubectl run --help | more'
alias ugh='kubectl get --help | more'
alias c='clear'
alias kd='kubectl describe pod'
alias ke='kubectl explain'
alias kf='kubectl create -f'
alias kg='kubectl get pods --show-labels'
alias kr='kubectl replace -f'
alias kh='kubectl --help | more'
alias krh='kubectl run --help | more'
alias ks='kubectl get namespaces'
alias l='ls -lrt'
alias ll='vi ls -rt | tail -1'
alias kga='k get pod --all-namespaces'
alias kgaa='kubectl get all --show-labels'

complete -F _complete_alias k
complete -F _complete_alias kc
complete -F _complete_alias kdp
complete -F _complete_alias krh
complete -F _complete_alias ugh
complete -F _complete_alias kd
complete -F _complete_alias ke
complete -F _complete_alias kf
complete -F _complete_alias kg
complete -F _complete_alias kr
complete -F _complete_alias kh
complete -F _complete_alias krh
complete -F _complete_alias ks
complete -F _complete_alias kga
complete -F _complete_alias kgaa
