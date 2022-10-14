require 'nokogiri'
require 'open-uri'

def source
    page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
end

def get_urls (page)
    scrap_url = page.xpath('//*[@id="deputes-list"]/*/*/*/a')
    url_href_array = []
    url_array = []
    
    scrap_url.each do |url|
        url_href_array << url['href']
    end
    
    url_array = url_href_array.map {|href| "https://www2.assemblee-nationale.fr" + href}
end

def get_email(urls)
    all_email_array = []
    urls.each do |url|
        page = Nokogiri::HTML(URI.open("#{url}"))
        scrap_email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
        all_email_array << scrap_email.text
    end

    return all_email_array
end

def get_names(urls)
    all_names_array = []
    urls.each do |url|
        page = Nokogiri::HTML(URI.open("#{url}"))
        scrap_names = page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1')
        all_names_array << scrap_names.text
    end

    return all_names_array
end

def perform
    final_array = []
    
    urls = get_urls(source)
    email = get_email(urls)
    name =  get_names(urls)

    for i in 0...urls.length
        hash = { name[i] => email[i] }
        final_array.append(hash)
    end

    final_array
    
end

puts perform
