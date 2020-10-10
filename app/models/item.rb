class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  has_many :comments
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :from
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :image
  end
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :category_id, :from_id, :day_id, numericality: { other_than: 1, message: 'Select' }
end
