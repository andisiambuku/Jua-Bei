class AddProductSearchIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_search_id, :integer
  end
end
