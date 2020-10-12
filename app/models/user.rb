class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :items, dependent: :destroy
  has_many :orders
  has_many :comments, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :nickname, uniqueness: { case_sensitive: true }
  end
end
