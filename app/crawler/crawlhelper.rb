#module to help with fixing prices coming in from scaping
module CrawlHelp 
    #method to calculate the stars from the ratings from the ecommerce sites
    def star_count(star)
        s = star.scan(/[1-5]/)
        if s[1] == '.'
            s = s.slice(0,3)
            s.join('').to_f.round
        else
            s.first.to_i
        end        
    end

    #method to calculate the price of a product to the nearest 2dps
    def float_price(price)
        p=price.scan(/[0-9.,]+/).first
        if p
            p.gsub(/[,]/,"").to_f
            
        else
            0
        end
    end

    #method to calculate the dollar price of a product from the float price
    def dollar_price(price)
        float_price(price) * 100
    end

    #method to calculate the price index of a product
    def price_index(index, price)
        (2 * index) + price / 10
    end
end