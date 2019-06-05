const shell = require('shelljs');

const pwd = shell.pwd().split('/');
const path = pwd[pwd.length-1];

shell.exec(`guake --rename-current-tab=${path} &`);
shell.exec(`tmux`);
shell.exec('tmux split-window -h');
shell.exec('tmux split-window -v');
// shell.exec('echo test')
// shell.exec('npm run build:dev-disc -https');
