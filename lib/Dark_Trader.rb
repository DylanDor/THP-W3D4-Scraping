require 'nokogiri'
require 'open-uri'

def source
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
end

def crypto(link)

    array_name = []
    array_value = []
    final_array = []
    hash = {}


    all_names = source.xpath('//tr//td[3]')
    all_prices = source.xpath('//tr//td[5]')

    all_names.each do |name|
        array_name << name.text
    end

    all_prices.each do |price|
        array_value << price.text
    end

    i = 0
    loop do
        hash = { array_name[i] => array_value[i] }
        break if array_value[i] == nil
        final_array.append(hash)
        i += 1
    end

    final_array

end

puts crypto(source)