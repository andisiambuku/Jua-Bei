class ChangeCountToIntegerAndAddDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :product_searches, :count, :integer, default: 1
  end
end
