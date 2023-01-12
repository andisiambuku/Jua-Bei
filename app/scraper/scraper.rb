require 'nokogiri'
require 'net/http'
require 'openssl'
require 'net/http'

class Scraper 

    def initialize(search)
        key = "7pNsEoE6c89LBweXVE6s3F24ngpgZQCH"

        @jumia_url = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.jumia.co.ke%2fcatalog%2f%3fq%3d#{search}&api_key=#{key}&render_js=1&wait_until=networkidle2")
        @ebay_url = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.ebay.com%2fsch%2fi.html%3f_from%3dR40%26_trksid%3dp2380057.m570.l1313%26_nkw%3d#{search}&api_key=#{key}")
        # @kilimall_url = URI("")

    end

    def response(url)
        http = Net::HTTP.new(url.port, url.host)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERFIY_PEER

        request = Net::HTTP::Get.new(url)
        data(http.request(request))
    end

    def data(resp)
        browser_html = resp.read_body
        parsed_page = Nokogiri::HTML(browser_html)
    end
    

    def ebay_site
        cards = response(@ebay_url).xpath("//div[@class='s-item__wrapper clearfix']")
        new = cards.map.with_index do |card,index| 
            {
                name: card.xpath(".//span[@role='heading']/text()").to_s,
                price: card.xpath(".//span[@class='s-item__price']/text()").to_s,
                store:'Ebay',
                image_url: card.xpath(".//img[@class='s-item__image-img']").attr("src").to_s,
                rating:"",
                price_prediscount:card.xpath(".//span[@class='STRIKETHROUGH']/text()").to_s,
                discount: card.xpath(".//span[@class='BOLD']/text()").to_s,
                coupon_discount: card.xpath(".//span[@class='NEGATIVE BOLD']/text()").to_s

            }
        end
        create_product(new)
    end

    def jumia
        articles = response(@jumia_url).xpath("//div[@class='-paxs row _no-g _4cl-3cm-shs']/article/a")
        new = articles.map.with_index do |product, index|
            product={
                name: product.xpath(".//div[@class='info']/h3/text()").to_s,
                price: product.xpath(".//div[@class='prc']/text()").to_s,
                store: 'Jumia',
                image_url: product.xpath(".//img[@class='img']").to_s,
                rating: product.xpath(".//div[@class='stars _s']/text()").to_s,
                price_prediscount: product.xpath(".//div[@class='old']/text()").to_s,
                discount: product.xpath(".//div[@class='bdg _dsct _sm']/text()").to_s,
                coupon_discount: product.xpath(".//div[@class='bdg _dsct _sm']/text()").to_s,
                
            }
        end
        create_product(new)
    end

    # def kilimall
                # name: 
                # price: 
                # store:
                # image_url:
                # rating:
                # price_prediscount:
                # discount:
                # coupon_discount:
                # expire_at:
                # price_normal:
    # end





    def create_product(new_product)
        new_product&.map {|p| Product.create(p)}

    end

end