class CreateShippingAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_areas do |t|

      t.timestamps
    end
  end
end
