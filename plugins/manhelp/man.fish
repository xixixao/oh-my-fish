function man
  if command man $argv > /dev/null ^/dev/null
    command man $argv
  else
    eval $argv[1] --help | less -R
  end
end

completeas man 'command man'