class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments
  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :nickname, uniqueness: { case_sensitive: true }
  end
end
