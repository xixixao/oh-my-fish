function lsd
  ls -l | egrep '^d' | perl -lpe 's/(.*?\d\d:\d\d|.*?\d  \d{4}) //' | column
end

function c -d "quickly cd and ls"
  cd $argv
  set_color blue
  lsd
  set_color normal
end
