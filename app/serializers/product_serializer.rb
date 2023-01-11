class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :store, :image_url, :discount, :coupon_discount, :rating
end
