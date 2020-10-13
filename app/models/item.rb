class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :from
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :image
    validates :price
  end
  validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999, message: 'が範囲外です' }
  validates :category_id, :from_id, :day_id, numericality: { other_than: 1, message: 'を選んでください' }

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%").order('created_at DESC')
    else
      Item.includes(:order).order('created_at DESC')
    end
  end

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
  
end
