function gim
  set -l stat (git --no-pager diff --color --stat --cached)
  [ "$stat" != "" ]
  and echo $stat
  and read -p "set_color green; echo -n 'OK? '; set_color normal"
  git commit (_suffix_message $argv)
end

completeas gim 'git commit'
