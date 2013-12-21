function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _number_modified_files
  echo (command git status -s -uno --ignore-submodules=dirty ^/dev/null | wc -l)
end

function _number_untracked_files
  echo (command git ls-files --other --exclude-standard ^/dev/null | wc -l | tr -d ' ')
end

begin

  function fish_prompt
    set -l red (set_color f00)
    set -l normal (set_color normal)

    set -l clock (date '+%H:%M:%S')
    set -l cwd (basename (prompt_pwd))

    echo -n -s $red $clock ' ' $cwd $normal ' '
  end

  function fish_right_prompt
    set -l yellow (set_color ff0)
    set -l gray (set_color 999)
    set -l cyan (set_color 0cf)
    set -l normal (set_color normal)

    if [ (_git_branch_name) ]
      set -l git_branch (_git_branch_name)
      set git_info "$cyan$git_branch"

      set -l nu (_number_untracked_files)
      if [ $nu -gt 0 ]
        set -l dirty "$gray$nu"
        set git_info "$dirty $git_info"
      end

      set -l nm (_number_modified_files)
      if [ $nm -gt 0 ]
        set -l dirty "$yellow$nm"
        set git_info "$dirty $git_info"
      end
    end

    echo -n -s $git_info
  end

end