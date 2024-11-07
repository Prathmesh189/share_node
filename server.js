const http = require('http');
const app = require('./app');
const  port = 1809;
console.log("started server.js");

const server = http.createServer(app);

console.log("running");
console.log("Succed");
server.listen(port);


