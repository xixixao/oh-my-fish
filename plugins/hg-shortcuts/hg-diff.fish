function hg-diff
  for item in $argv
    switch "$item"
      case --stat
        hg diff $argv
        return
    end
  end

  hg --color=always diff $argv |\
    diff-highlight |\
    diff-so-fancy |\
    sed 's/\x1B\[0;3[12];1m/\x1B\[0;33;1m/g' |\
    sed -E 's/\x1B\[7m/\x1B\[2;1m/g' |\
    sed -E 's/\x1B\[27m/\x1B\[22m/g' |\
    less -R
end

completeas hg-diff 'hg diff'
