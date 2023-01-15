class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :store, :image_url, :discount,:rating
end
