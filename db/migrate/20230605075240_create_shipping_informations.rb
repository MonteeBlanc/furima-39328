class CreateShippingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_informations do |t|
      t.string :postal_code, null: false
      t.string :phone_number, null: false
      t.integer :shipping_area_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building
      t.references :purchase_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end

