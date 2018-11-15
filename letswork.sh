# script that launch work application
#! bin/sh

# Launch apps
google-chrome chrome://bookmarks/?id=109 &
vscode ./git/workspace/renderer.code-workspace &
evolution &
pidgin &
mattermost-desktop &

# Guake Terminal
guake -n ~/ --rename-current-tab="CONTROL"
/bin/sleep 2
guake -n ~/git/renderer --rename-current-tab="RENDERER" &
/bin/sleep 2
guake -n ~/git/renderer --rename-current-tab="RENDERER B" --execute-command="npm run build:dev-disc -https" &
/bin/sleep 60
guake -n ~/git/renderer --rename-current-tab="RENDERER S" --execute-command="SERVICE_HTTPS=true SERVICE_PORT_HTTPS=10504 npm run server:dev" &
reset &

