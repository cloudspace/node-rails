module NodeRails
  module ControllerHelpers
    def node_rails_devise_redis_sync(current_user)
      #store session to redis
      if current_user
        # an unique MD5 key
        cookies["_validation_token_key"] = Digest::MD5.hexdigest("#{session[:session_id]}:#{current_user.id}")
        # store session data or any authentication data you want here, generate to JSON data
        stored_session = JSON.generate({"user_id"=> current_user.id})
        $redis.hset(
          "mySessionStore",
          cookies["_validation_token_key"],
          stored_session
        )
      end
    end
    
    def node_rails_devise_redis_clean
      #expire session in redis
      if cookies["_validation_token_key"].present?
        $redis.hdel("mySessionStore", cookies["_validation_token_key"])
      end
    end
  end
end

ActionController::Base.send :include, NodeRails::ControllerHelpers