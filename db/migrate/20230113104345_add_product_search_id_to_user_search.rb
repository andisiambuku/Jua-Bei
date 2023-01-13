class AddProductSearchIdToUserSearch < ActiveRecord::Migration[7.0]
  def change
    add_column :user_searches, :product_search_id, :integer
  end
end
