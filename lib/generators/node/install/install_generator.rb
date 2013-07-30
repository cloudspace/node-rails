module Node
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      desc "This generator installs node.js with a folder called node-rails in the root of the application"

      def inject_node
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require underscore\n//= require backbone\n//= require backbone_rails_sync\n//= require backbone_datalink\n//= require backbone/#{application_name.underscore}\n"
        end
      end

      def create_dir_layout
        %W{node-rails}.each do |dir|
          empty_directory "app/#{dir}" 
        end
      end

      def create_app_file
        template "package.json", "app/node-rails/package.json"
        template "node-rails-server.js", "app/node-rails/node-rails-server.js"
        template "redis.rb", "app/config/initializers/redis.rb"
      end

    end
  end
end