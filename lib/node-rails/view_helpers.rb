module NodeRails
  module ViewHelpers
    def node_rails_client(current_user)
      if current_user.present?
        javascript_tag "
          $(document).ready(function(){
            console.log('PROVE I WORK');

            var socket = new io.connect('http://0.0.0.0:5001');

            socket.on('connect', function(client) {
              console.log('Connected');
              socket.emit('node-rails-change/#{@current_user.id}', {'success': 'true'});
              console.log('Emitted');
            });

            socket.on('node-rails-change/#{@current_user.id}', function(message){
              console.log('I had a node-rails-change message: '+message);
            });


            socket.on('disconnect', function() {
              console.log('I Disconnected');
            });

          });
        "
      end
    end
  end
end
