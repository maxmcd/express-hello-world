const { spawn } = require('child_process');

const command1 = spawn('node', ['app.js']);
const command2 = spawn('sleep', ['100000']);

command1.stdout.pipe(process.stdout);
command1.stderr.pipe(process.stderr);

command2.stdout.pipe(process.stdout);
command2.stderr.pipe(process.stderr);

command1.on('exit', (code) => {
    console.log(`command1 exited with code ${code}`);
    process.exit(code);
});

command2.on('exit', (code) => {
    console.log(`command2 exited with code ${code}`);
    process.exit(code);
});