# -a -b -c Commit message
#         into
# -a -b -c -m 'Commit message'
function _suffix_message
  set -l passed
  set -l concated
  set -l append
  for arg in $argv
    if [ -n "$append" ]
      set concated $concated $arg
    else if begin; echo $arg | ggrep -Pq '^-'; end
      set passed $passed $arg
    else
      set append true
      set concated $concated $arg
    end
  end
  if [ -n "$append" ]
    echo $passed -m "'$concated'"
  else
    echo $passed
  end
end
