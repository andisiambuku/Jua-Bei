class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :store, :product_link, :discount,:rating, :image_url
end
