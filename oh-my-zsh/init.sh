git clone https://github.com/zsh-users/zsh-autosuggestions.git ${zsh_custom:-~/.oh-my-zsh}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${zsh_custom:-~/.oh-my-zsh}/plugins/zsh-syntax-highlighting

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-you-should-use

git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-z


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh}/themes/powerlevel10k

if [[ "$(uname)" == "Darwin" ]]; then
    brew install fzf
elif [[ "$(uname)" == "Linux" ]]; then
    sudo apt-get install fzf
fi
