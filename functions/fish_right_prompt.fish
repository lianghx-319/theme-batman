# Options
set -g __fish_git_prompt_show_informative_status
set -g __fish_git_prompt_showcolorhints
set -g __fish_git_prompt_showdirtystate
set -g __fish_git_prompt_showuntrackedfiles
set -g __fish_git_prompt_showstashstate
set -g __fish_git_prompt_showupstream "informative"

# Colors
set -g __fish_git_prompt_color_branch $_batman_color_yellow --bold
set -g __fish_git_prompt_color_dirtystate $_batman_color_red
set -g __fish_git_prompt_color_invalidstate $_batman_color_red
set -g __fish_git_prompt_color_merging $_batman_color_red
set -g __fish_git_prompt_color_stagedstate $_batman_color_yellow
set -g __fish_git_prompt_color_upstream_ahead $_batman_color_yellow
set -g __fish_git_prompt_color_upstream_behind $_batman_color_yellow


# Icons
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_invalidstate '#'
set -g __fish_git_prompt_char_stagedstate '+'
set -g __fish_git_prompt_char_stashstate '$'
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_untrackedfiles '%'
set -g __fish_git_prompt_char_upstream_ahead '>'
set -g __fish_git_prompt_char_upstream_behind '<'
set -g __fish_git_prompt_char_upstream_diverged '<>'
set -g __fish_git_prompt_char_upstream_equal '=' 

function fish_right_prompt
  set -l code $status
  test $code -ne 0; and echo (__batman_color_dim)"("(__batman_color_trd)"$code"(__batman_color_dim)") "(__batman_color_off)

  if test -n "$SSH_CONNECTION"
     printf (__batman_color_trd)":"(__batman_color_dim)"$HOSTNAME "(__batman_color_off)
   end

  printf (__fish_git_prompt)" "$_batman_cmd_duration
end
