class RemoveNameFromProductSearches < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_searches, :name, :string
  end
end
