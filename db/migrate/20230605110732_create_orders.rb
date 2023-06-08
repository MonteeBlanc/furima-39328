class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :item, null: false, foreign_key: true
      t.references :purchase_record, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end


