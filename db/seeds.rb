# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product_search = ProductSearch.create!(search_term: "iphone 13 pro max")
Product.create!(image_url: "https://ke.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/33/971486/1.jpg?2883", name: "iphone 13 pro max", price: 1504, price_prediscount: 1504, discount: 0, rating: 4.5, store: "Jumia", product_search_id: product_search.id)
Product.create!(image_url: "https://m.media-amazon.com/images/I/61i8Vjb17SL._AC_UY218_.jpg", name: "iphone 13 pro max", price: 1101, price_prediscount: 1101, discount: 0, rating: 4.0, store: "Amazon", product_search_id: product_search.id)
Product.create!(image_url: "https://www.ebay.com/itm/295473064202?epid=9049279727&hash=item44cb91290a:g:2kIAAOSwxXZjlsEi&amdata=enc%3AAQAHAAAA4NTKnA02cr87PZioL4eWwkRsmYAUQKZb%2F%2BTpHwtG9ju%2FSsKubKIYeGDYVCihh%2BgKqbwINsl%2BmZAZf1UyK2fq4HYf3KMLvdYHGBci6HOFQvYFeVdjud6epwuR13FwcA%2F34CQJ8wXKHxLn0oQcJsPM%2B1o2aEl0appYvr%2BHwlyT%2BgbxIhE%2FTT8pa48jMoSyV4L8EeonCa29h5cXcbWU2kcgh214VxndC%2B7GAGE3EjAbpT7d432P72ttBWNVrKKpb4c2asW8nuTJBPVGuYzDB04YwcTcjZTFaNvX%2FmORC6WdUQz6%7Ctkp%3ABFBMvP7cnrdh", name: "iphone 13 pro max", price: 839, price_prediscount: 839, discount: 0, rating: 3.5, store: "Ebay", product_search_id: product_search.id)







  
