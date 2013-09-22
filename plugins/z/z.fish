function z
  cd (bash -c 'source /opt/boxen/homebrew/etc/profile.d/z.sh; _z $0; echo $PWD' $argv)
end
