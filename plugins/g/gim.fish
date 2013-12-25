function gim
  set -l stat (git --no-pager diff --color --stat --cached)
  [ "$stat" != "" ]
  and _print_multiline $stat
  and read -p "set_color green; echo -n 'OK? '; set_color normal"
  _suffix_message $argv | xargs git commit
end

completeas gim 'git commit'
