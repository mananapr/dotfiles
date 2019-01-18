## enable vim mode
fish_vi_key_bindings

## hide vim mode status
function fish_mode_prompt
end

## ls after cd
function cd
   builtin cd $argv
   ls
end

## abbreviations
abbr -a p "python"
abbr -a r "ranger"
abbr -a pm "pacman"
abbr -a pmu "sudo pacman -Syu"
abbr -a pmi "sudo pacman -S"
abbr -a pms "pacman -Ss"
abbr -a pmro "sudo pacman -Rns (pacman -Qtdq)"
abbr -a hotspot "sudo create_ap wlp3s0 wlp3s0 'ssid' pwd"
abbr -a gs "git status"
abbr -a ga "git add"
abbr -a gm "git commit -m"
abbr -a gp "git push"
