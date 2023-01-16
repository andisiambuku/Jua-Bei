class AddNameToProductSearches < ActiveRecord::Migration[7.0]
  def change
    add_column :product_searches, :name, :string
  end
end
