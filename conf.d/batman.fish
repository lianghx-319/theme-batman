status is-interactive || exit

function __batman_color_dim; set_color 666; end
function __batman_color_fst; set_color -o fa0; end
function __batman_color_snd; set_color -o 36f; end
function __batman_color_trd; set_color -o f06; end
function __batman_color_off; set_color normal; end

set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"
set __fish_git_prompt_showstashstate

set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_color_prefix (__batman_color_dim)
set __fish_git_prompt_color_suffix (__batman_color_dim)
set __fish_git_prompt_color_bare (__batman_color_fst)
set __fish_git_prompt_color_merging (__batman_color_snd)
set __fish_git_prompt_char_upstream_ahead '>'
set __fish_git_prompt_char_upstream_behind '<'
set __fish_git_prompt_char_upstream_diverged '<>'
set __fish_git_prompt_char_upstream_equal '='

function _batman_postexec --on-event fish_postexec
    test "$CMD_DURATION" -lt 1000 && set _batman_cmd_duration && return

    set --local secs (math --scale=1 $CMD_DURATION/1000 % 60)
    set --local mins (math --scale=0 $CMD_DURATION/60000 % 60)
    set --local hours (math --scale=0 $CMD_DURATION/3600000)

    test $hours -gt 0 && set --local --append out (__batman_color_dim)$hours(__batman_color_fst)"h"
    test $mins -gt 0 && set --local --append out (__batman_color_dim)$mins(__batman_color_fst)"m"
    test $secs -gt 0 && set --local --append out (__batman_color_dim)$secs(__batman_color_fst)"s"

    set --global _batman_cmd_duration "$out"(__batman_color_off)" "
end

