export LANG="en_US.UTF-8"

# Enable colors and change prompt:
 autoload -U colors && colors
 PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


 # History in cache directory:
  HISTSIZE=10000
 SAVEHIST=10000
  HISTFILE=~/.cache/zsh/history

  # Basic auto/tab complete:
   autoload -U compinit
   zstyle ':completion:*' menu select
   zmodload zsh/complist
   compinit
   _comp_options+=(globdots)

   # Load zsh-syntax-highlighting; should be last
   source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
