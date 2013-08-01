require 'node-rails/view_helpers'
module NodeRails
  class Railtie < Rails::Railtie
    initializer "node-rails.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end