# NodeRails

Node Rails will enable you to run a Node server along side your Rails application and have the two share authentication
NodeRails assumes you are using Devise for your authentication.
NodeRails uses redis, so you will need to have that installed

## Installation

Add this line to your application's Gemfile:

    gem "node-rails", git: "https://github.com/cloudspace/node-rails.git"

And then execute:

    $ bundle

## Usage

Generate the Node directory and other required JS and Initializers

    $ rails g node:install
  
Go to the node-rails directory in the root of the application and npm install

    $ cd node-rails && npm install

Add underscore, node, and socket.io to your application.js file, after JQuery, in that order

	//= jquery
	...
	//= underscore
	//= node
	//= socket.io
	...

Add the node_rails_client helper to the end of &lt;head&gt; of your application layout, passing in @current_user as a parameter
      
    <head>
      ...
      <%= node_rails_client(@current_user) %>
    </head>
  
Add the node_rails_devise_redis_sync helper to the beginning of sessions#after_sign_in_path_for
  
    def after_sign_in_path_for
      node_rails_devise_redis_sync(@current_user)
      ...
    end
  
Add the node_rails_devise_redis_clean helper to the beginning of the after_sign_out_path action
    
    def after_sign_out_path
      node_rails_devise_redis_clean
      ...
    end

Start the node server

    $ cd node-rails
    $ node node-rails-server.js
  
Add acts_as_node to any model you want to trigger socket events
    
    class SomeModel < ActiveRecord::Base
      ...
      acts_as_node
      ...
    end
  
Out of the box, node-rails will send a message on create, update, or delete to the user object associated with the acts_as_node object.  You can override the message instance method on any acts_as_node object.  Each user is subscribed to their own namespace "node-rails-change/#{@current_user.id}":

    def node_message action
      msg = { resource: self.class.name.downcase,
              action: action,
              id: self.id,
              obj: self }

      $redis.publish "node-rails-change/#{self.user.id}", msg.to_json
    end