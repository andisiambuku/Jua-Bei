require 'nokogiri'
require 'net/http'
require 'openssl'
require 'uri'

class Scraper 

    def initialize(search,search_id)
        key = "7pNsEoE6c89LBweXVE6s3F24ngpgZQCH"
        @amazon_url = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.amazon.com%2fs%3fk%3d#{search}&api_key=#{key}&render_js=1&wait_until=domcontentloaded")
        @jumia_url = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.jumia.co.ke%2fcatalog%2f%3fq%3d#{search}&api_key=#{key}&render_js=1&wait_until=networkidle2")
        @ebay_url = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.ebay.com%2fsch%2fi.html%3f_from%3dR40%26_trksid%3dp2380057.m570.l1313%26_nkw%3d#{search}&api_key=#{key}")
        
        @search = search
        @search_id = search_id

    end

    def response(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        request = Net::HTTP::Get.new(url)
        data(http.request(request))
        # byebug
    end

    def data(resp)
        browser_html = resp.read_body
        parsed_page = Nokogiri::HTML(browser_html)
    end
    

        def ebay_site
            cards = response(@ebay_url).xpath("//div[@class='s-item__wrapper clearfix']")
            new= cards.map.with_index do |card, index|
            price = card.xpath(".//span[@class='s-item__price']/text()").to_s
        {
            image_url: card.xpath(".//img[@class='s-item__image-img']").attr('src').to_s,
            name: card.xpath(".//span[@role='heading']/text()").to_s,
            price: price,
            price_prediscount: card.xpath(".//span[@class='STRIKETHROUGH']/text()").to_s,
            discount: card.xpath(".//span[@class='BOLD']/text()").to_s,
            rating: '',
            store: 'ebay',
            search_id: @search_id,
             product_url: "https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw=#{@search}"
            
            }
        end
           create_product(new)
        end

    def jumia_site
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
                search_id: @search_id,
                product_url: "https://www.jumia.co.ke/catalog/?q=#{@search}"
                
            }
        end
        create_product(new)
    end

    def amazon_site
        articles = response(@amazon_url).xpath(".//div[@class='a-section a-spacing-base']")
        new = articles.map.with_index do |product, index|
          price = product.xpath(".//span[@class='a-price']/span/text()").to_s
          {
            image_url: product.xpath(".//img[@class='s-image']").attr('src').to_s,
            name: product.xpath(".//span[@class='a-size-base-plus a-color-base a-text-normal']/text()").to_s,
            price: price,
            price_before_discount: product.xpath(".//span[@class='a-price a-text-price']/span[1]/text()").to_s,
            ratings: count_stars(product.xpath(".//i[@class='a-icon a-icon-star-small a-star-small-4-5 aok-align-bottom']/span/text()").to_s),
            store: 'amazon',
            search_id: @search_id,
            product_url:"https://www.amazon.com/s?k=#{@search}"
            
          }
        end
        create_product(new)
    end

    def create_product(new_product)
        new_product&.map {|p| Product.create(p)}

    end

end