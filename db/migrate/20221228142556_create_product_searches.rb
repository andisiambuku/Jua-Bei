class CreateProductSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :product_searches do |t|
      t.string :search_term
      t.integer :count

      t.timestamps
    end
  end
end
