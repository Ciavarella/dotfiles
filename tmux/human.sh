#!/bin/bash

tm_color_background=colour55
tm_color_background_secondary=colour99
tm_color_active=colour97
tm_color_inactive=colour241
tm_color_text=colour254
tm_color_black=colour232

# separators
tm_left_separator=''
tm_left_separator_black=''
tm_right_separator=''
tm_right_separator_black=''
tm_session_symbol=''

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg $tm_color_black
set-option -g status-attr default

# set menubar to top
set-option -g status-position top

# default window title colors
set-window-option -g window-status-fg $tm_color_inactive
set-window-option -g window-status-bg default
set -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-format $tm_active

# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_color_active

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

tm_tunes="#[fg=$tm_color_background]#(osascript ~/.dotfiles/applescripts/tunes.scpt)"
tm_battery="#(~/.dotfiles/bin/battery)"

tm_active="#[fg=$tm_color_text,bg=$tm_color_background] #I #W "

tm_date="#[fg=$tm_color_background_secondary] %R %d %b "

tm_session_name="#[fg=$tm_color_background] #S "

set -g status-left $tm_session_name
set -g status-right $tm_tunes' '$tm_battery' '$tm_date
