var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

redis.subscribe('node-rails-change');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    socket.emit('node-rails-change', JSON.parse(message));
  });
});