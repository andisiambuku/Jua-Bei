class AddIdToProductSearches < ActiveRecord::Migration[7.0]
  def change
    add_column :product_searches, :product_search_id, :integer
  end
end
