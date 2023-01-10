class AddRatingToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :rating, :string
  end
end
