function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _number_dirty_files
  echo (command git status -s --ignore-submodules=dirty ^/dev/null | wc -l)
end

begin

  function fish_prompt
    set -l cyan (set_color 0cf)
    set -l normal (set_color normal)

    set -l clock (date '+%H:%M:%S')
    set -l cwd (basename (prompt_pwd))

    echo -n -s $cyan $clock ' ' $cwd $normal ' '
  end

  function fish_right_prompt
    set -l yellow (set_color ff0)
    set -l cyan (set_color 0cf)
    set -l normal (set_color normal)

    if [ (_git_branch_name) ]
      set -l git_branch (_git_branch_name)
      set git_info "$cyan$git_branch"

      set -l n (_number_dirty_files)
      if [ $n -gt 0 ]
        set -l dirty "$yellow$n"
        set git_info "$dirty $git_info"
      end
    end

    echo -n -s $git_info
  end

end