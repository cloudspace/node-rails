require "version.rb"
require 'rails'

module NodeRails
  
  class Engine < Rails::Engine
  end
  
  def acts_as_node
    def self.included(base)
      base.class_eval do
        after_create {|my_obj| my_obj.message 'create' }
        after_update {|my_obj| my_obj.message 'update' }
        after_destroy {|my_obj| my_obj.message 'destroy' }
      end
    end

    def message action
      msg = { resource: self.class.name.downcase,
              action: action,
              id: self.id,
              obj: self }

      $redis.publish 'node-rails-change', msg.to_json
    end
  end
end
