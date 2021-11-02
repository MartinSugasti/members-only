module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      # this approach is used because Devise is built on top of Warden and sets
      # the user on the warden middleware object.
      env['warden'].user || reject_unauthorized_connection
    end
  end
end
