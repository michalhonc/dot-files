#!/bin/bash
# script that launch work application

# Launch scripts
xkbset ma 1 10 30 30 1 &

# Launch apps
google-chrome &
simplenote &
# wmctrl -r chrome -t 1 &
evolution &
mattermost-desktop &
#gnome-pomodoro &
