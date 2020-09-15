class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :lists, dependent: :destroy
  has_many :list_shares
  has_many :shared_lists, through: :list_shares, source: :list

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    
    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
