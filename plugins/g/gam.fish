function gam
  set -l stat (git --no-pager diff --color --stat HEAD ^/dev/null)
  [ "$stat" != "" ]
  and _print_multiline $stat
  and read -p "set_color green; echo -n 'OK? '; set_color normal"
  _suffix_message $argv | xargs git commit
end

completeas gam 'git commit'
