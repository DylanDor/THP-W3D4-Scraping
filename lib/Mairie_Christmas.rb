require 'nokogiri'
require 'open-uri'

def source_main
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
end

def get_townhall_email(townhall_url)
    all_email_array = []
    townhall_url.each do |url|
        page = Nokogiri::HTML(URI.open("#{url}"))
        scrap_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
        all_email_array << scrap_email.text
    end

    return all_email_array
end

def get_townhall_urls (page)
    scrap_url = page.xpath('//a[@class="lientxt"]')
    url_href_array = []
    url_array = []
    
    scrap_url.each do |url|
        url_href_array << url['href']
    end
    
    url_array = url_href_array.map {|href| "http://annuaire-des-mairies.com" + href[1..-1]}

end

def get_townhall_name (page)
    all_name = page.xpath('//a[@class="lientxt"]')
    name_array = []
    
    all_name.each do |url|
        name_array << url.text
    end

    return name_array
end

def perform
    final_array = []
    
    urls = get_townhall_urls(source_main)
    email = get_townhall_email(urls)
    name =  get_townhall_name(source_main)

    for i in 0...name.length
        hash = { name[i] => email[i] }
        final_array.append(hash)
    end

    final_array
end


