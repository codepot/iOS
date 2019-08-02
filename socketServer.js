var net = require('net');

var server = net.createServer(function(socket)
{
  socket.write('echo\r\n');
  socket.pipe(socket);
}
);

server.listen(8989, '127.0.0.1');

console.log('server running at port 8989');
