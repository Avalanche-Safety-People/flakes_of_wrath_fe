class User < ApplicationRecord
  def self.from_google(response)
    user = User.find_by(uid: response[:uid], provider: response[:provider])
    if user.nil?
      user = User.create!(uid: response[:uid], provider: response[:provider])
      UserService.create_user(user.id)
    end
  end
end
