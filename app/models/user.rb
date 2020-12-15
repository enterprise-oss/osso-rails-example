class User < ApplicationRecord
  devise :database_authenticatable, :omniauthable,
         :recoverable, :rememberable, :validatable         

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def as_json(*)
    {
      email: email,
      id: uid,
    }
  end
end
