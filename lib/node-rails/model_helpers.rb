module NodeRails
  module ModelHelpers
    def self.included(base)
      base.class_eval do
        base.extend ClassMethods  
      end
    end
  
    module ClassMethods
      def acts_as_node(*args)
        puts "\n\nIT'S HAPPENING 1\n\n"
        after_create {|my_obj| my_obj.node_message 'create' }
        after_update {|my_obj| my_obj.node_message 'update' }
        after_destroy {|my_obj| my_obj.node_message 'destroy' }
        include InstanceMethods
      end
    end

    module InstanceMethods
      def node_message action
        puts "\n\nIT'S HAPPENING 2\n\n"
        msg = { resource: self.class.name.downcase,
                action: action,
                id: self.id,
                obj: self }

        $redis.publish "node-rails-change/#{self.user.id}", msg.to_json
      end
    end
  end
end
ActiveRecord::Base.send(:include, NodeRails::ModelHelpers)