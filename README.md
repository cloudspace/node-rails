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

  rails g node:install
  
Go to the node-rails directory in the root of the application and npm install

  cd node-rails && npm install
  
Add the node_rails_client helper to the head of your application layout, passing in @current_user as a parameter
  
  node_rails_client(@current_user)
  
Add the node_rails_devise_redis_sync helper to the beginning of sessions#after_sign_in_path_for
  
  node_rails_devise_redis_sync(@current_user)
  
Add the node_rails_devise_redis_clean helper to the beginning of the after_sign_out_path_action

  node_rails_devise_redis_clean

Start the node server

  cd node-rails
  node node-rails-server.js
  
Add acts_as_node to any model you want to trigger socket events

  acts_as_node
  
