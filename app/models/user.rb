class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :items, dependent: :destroy
  has_many :orders
  has_many :comments, dependent: :destroy
  has_many :commented_items, through: :comments, source: :item
  has_many :sns_credentials, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item

  with_options presence: true do
    validates :name
    validates :nickname, uniqueness: { case_sensitive: true }
  end

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
