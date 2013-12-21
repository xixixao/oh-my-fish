function gid
  set -l rev
  if [ (count $argv) = 0 ]
    set rev HEAD
  end
  git diff --color-words --color $rev $argv
end

completeas gid 'git diff'
