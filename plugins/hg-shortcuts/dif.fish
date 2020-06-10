function dif
  set noprefix "--noprefix"
  for item in $argv
    switch "$item"
      case --stat
        set noprefix ""
    end
  end

  hg-diff $noprefix -r .^ $argv
end

completeas dif 'hg diff'
