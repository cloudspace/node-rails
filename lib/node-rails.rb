require 'version'
require 'rails'
require 'node-rails/railtie' if defined?(Rails)
require 'node-rails/engine' if defined?(Rails)
require 'node-rails/model_helpers' if defined?(Rails)
require 'node-rails/controller_helpers' if defined?(Rails)
require 'node-rails/generators/node/install/install_generator' if defined?(Rails)

