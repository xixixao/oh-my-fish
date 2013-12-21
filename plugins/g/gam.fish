function gam
  set -l stat (git --no-pager diff --color --stat HEAD)
  [ "$stat" != "" ]
  and _print_multiline $stat
  and read -p "set_color green; echo -n 'OK? '; set_color normal"
  git commit -a (_suffix_message $argv)
end

completeas gam 'git commit'
