class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :trackable, omniauth_providers: [:steam]

  def self.find_for_steam_oauth(auth)
    user = User.where(provider: auth[:provider], uid: auth[:uid]).first

    if user
      user.update(
        name: auth[:info][:nickname],
        avatar: auth[:info][:image]
      )

      user
    else
      User.create(
        name: auth[:info][:nickname],
        provider: auth[:provider],
        uid: auth[:uid],
        avatar: auth[:info][:image]
      )
    end
  end

  def to_s
    name
  end

  def email
    "#{uid}@#{provider}.tera.tf"
  end
end
