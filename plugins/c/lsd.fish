function lsd
  set_color blue
  ls -l | egrep '^d' | perl -lpe 's/(.*?\d\d:\d\d|.*?\d  \d{4}) //' | column
  set_color normal
end
