function lsd
  set_color blue
  find . -type d -maxdepth 1 -not -name '.*' -exec echo '{}' \; | perl -lpe 's/^\.\///' | column
  set_color normal
end
