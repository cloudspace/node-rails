module NodeRails
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      desc "This generator installs node.js with a folder called node-rails in the root of the application"

      def create_dir_layout
        %W{node-rails}.each do |dir|
          empty_directory "#{dir}" 
        end
      end

      def create_app_file
        template "package.json", "node-rails/package.json"
        template "node-rails-server.js", "node-rails/node-rails-server.js"
        template "redis.rb", "config/initializers/redis.rb"
      end

    end
  end
end