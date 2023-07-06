class Item < ApplicationRecord
  belongs_to :user
  has_many :purchase_records
  has_one_attached :image

  belongs_to :condition, class_name: 'Condition', foreign_key: 'condition_id', optional: true
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id', optional: true
  belongs_to :shipping_day, class_name: 'ShippingDay', foreign_key: 'shipping_day_id', optional: true
  belongs_to :shipping_fee_payer, class_name: 'ShippingFeePayer', foreign_key: 'shipping_fee_payer_id', optional: true
  belongs_to :shipping_area, class_name: 'ShippingArea', foreign_key: 'shipping_area_id', optional: true

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :condition_id, presence: true, exclusion: { in: [1], message: 'を選択してください' }
  validates :category_id, presence: true, exclusion: { in: [1], message: 'を選択してください' }
  validates :shipping_day_id, presence: true, exclusion: { in: [1], message: 'を選択してください' }
  validates :shipping_fee_payer_id, presence: true, exclusion: { in: [1], message: 'を選択してください' }
  validates :shipping_area_id, presence: true, exclusion: { in: [1], message: 'を選択してください' }
  validate :validate_price_format

  default_scope -> { order(created_at: :desc) }

  def sold_out?
    purchase_records.exists?
  end

  def validate_price_format
    return if price.blank? || price.to_s.match?(/\A[0-9]+\z/)

    errors.add(:price, 'is invalid. Please enter a valid number.')
  end
end
