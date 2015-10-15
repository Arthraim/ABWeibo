class User < ActiveRecord::Base
  class << self
    def signup_with_weibo_token token
      User.find_or_create_by(wb_uid: token.params['uid']) do |u|
        u.wb_token = token.token
        u.wb_expires_in = token.expires_in
        u.wb_expires_at = token.expires_at
        u.wb_refresh_token = token.refresh_token
      end
    end
  end
end
