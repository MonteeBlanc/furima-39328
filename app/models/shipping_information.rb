class ShippingInformation < ApplicationRecord
  belongs_to :purchase_record

  validates :postal_code, presence: true
  validates :phone_number, presence: true
  validates :shipping_area_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
end
