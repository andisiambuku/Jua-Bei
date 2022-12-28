class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :store
      t.string :image_url
      t.string :price_prediscount
      t.string :discount
      t.string :coupon_discount
      t.datetime :expire_at
      t.integer :price_normal

      t.timestamps
    end
  end
end
