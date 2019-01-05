# script that launch work application
#! bin/sh

# Launch scripts
xkbset ma 1 10 30 30 1 &

# Launch apps
google-chrome &
wmctrl -r chrome -t 1 &
code ./git/workspace/renderer.code-workspace &
evolution &
pidgin &
mattermost-desktop &

# Guake Terminal

guake -n ~/git/renderer --rename-current-tab="renderer"

tmux split-window -h -c "#{pane_current_path}" \; send-keys "npm run build:dev-disc -https" Enter &

/bin/sleep 60

tmux split-window -v -c "#{pane_current_path}" \; send-keys "SERVICE_HTTPS=true SERVICE_PORT_HTTPS=10504 npm run server:dev" Enter &

