class RenameImageLinkAndProductUrlColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image_url, :image_url
    rename_column :products, :product_link, :product_link
  end
end
