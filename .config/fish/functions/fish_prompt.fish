function fish_prompt
  set -q fish_prompt_pwd_dir_length
  or set -lx fish_prompt_pwd_dir_length 0

  printf '%s%s%s%s%s%s %s%s%s%s%s%s ' (set_color --bold D2FFEA) ' ' (set_color --bold white) (prompt_pwd) (set_color EEFD7A) (fish_git_prompt) (set_color --bold 77D8E6) '❱' (set_color --bold EEFD7A) '❱' (set_color --bold EF78A1) '❱'
end

