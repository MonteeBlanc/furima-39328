class PurchaseForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :street, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む7桁の数字で入力してください" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "はハイフンなしの10桁または11桁の数字で入力してください" }
    validates :token
  end

  def save_with_related_records
    return unless valid?

    purchase_record = PurchaseRecord.new(
      user_id: user_id,
      item_id: item_id
    )

    if purchase_record.save
      shipping_information = ShippingInformation.new(
        purchase_record_id: purchase_record.id,
        postal_code: postal_code,
        shipping_area_id: shipping_area_id,
        city: city,
        street: street,
        building: building,
        phone_number: phone_number
      )
      shipping_information.save
    end

    purchase_record
  end
end

