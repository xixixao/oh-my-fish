function gid
  git diff --color-words --color $argv
end

completeas gid 'git diff'
