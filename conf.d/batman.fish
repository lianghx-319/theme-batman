status is-interactive || exit

set --query batman_color_gray || set --global batman_color_gray 666
set --query batman_color_yellow || set --global batman_color_yellow fa0
set --query batman_color_blue || set --global batman_color_blue 36f
set --query batman_color_red || set --global batman_color_red f06
# back up green 8AEA92 5EFC8D
set --query batman_color_green || set --global batman_color_green 16F4D0

function __batman_color_gray; set_color $batman_color_gray; end
function __batman_color_yellow; set_color -o $batman_color_yellow; end
function __batman_color_blue; set_color -o $batman_color_blue; end
function __batman_color_red; set_color -o $batman_color_red; end
function __batmon_color_fth; set_color -o $batman_color_green; end
function __batman_color_off; set_color normal; end

function _batman_postexec --on-event fish_postexec
    test "$CMD_DURATION" -lt 1000 && set _batman_cmd_duration && return

    set --local secs (math --scale=1 $CMD_DURATION/1000 % 60)
    set --local mins (math --scale=0 $CMD_DURATION/60000 % 60)
    set --local hours (math --scale=0 $CMD_DURATION/3600000)

    test $hours -gt 0 && set --local --append out (__batman_color_gray)$hours(__batman_color_yellow)"h"
    test $mins -gt 0 && set --local --append out (__batman_color_gray)$mins(__batman_color_yellow)"m"
    test $secs -gt 0 && set --local --append out (__batman_color_gray)$secs(__batman_color_yellow)"s"

    set --global _batman_cmd_duration "$out"(__batman_color_off)" "
end

