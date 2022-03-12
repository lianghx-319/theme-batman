status is-interactive || exit

function __batman_color_dim; set_color 666; end
function __batman_color_fst; set_color -o fa0; end
function __batman_color_snd; set_color -o 36f; end
function __batman_color_trd; set_color -o f06; end
function __batman_color_off; set_color normal; end

# Options
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "verbose"

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red


# Icons
set __fish_git_prompt_char_cleanstate ' 👍  '
set __fish_git_prompt_char_conflictedstate ' ⚠️  '
set __fish_git_prompt_char_dirtystate ' 💩  '
set __fish_git_prompt_char_invalidstate ' 🤮  '
set __fish_git_prompt_char_stagedstate ' 🚥  '
set __fish_git_prompt_char_stashstate ' 📦  '
set __fish_git_prompt_char_stateseparator ' | '
set __fish_git_prompt_char_untrackedfiles ' 🔍  '
set __fish_git_prompt_char_upstream_ahead ' ☝️  '
set __fish_git_prompt_char_upstream_behind ' 👇  '
set __fish_git_prompt_char_upstream_diverged ' 🚧  '
set __fish_git_prompt_char_upstream_equal ' 💯 ' 

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

