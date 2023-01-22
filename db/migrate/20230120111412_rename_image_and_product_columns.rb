class RenameImageAndProductColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image_url, :product_url
    rename_column :products, :product_link, :image_link
  end
end
