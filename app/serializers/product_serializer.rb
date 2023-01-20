class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :store, :product_url, :discount,:rating
end
