class RemoveColumnsFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :expire_at, :string
    remove_column :products, :price_normal, :string
    remove_column :products, :coupon_discount, :string
  end
end
