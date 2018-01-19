class Scraping

require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

# Webbsidan som ska scrapas
# page = HTTParty.get('https://newyork.craigslist.org/search/pet?s=0')
page = HTTParty.get('https://newyork.craigslist.org/search/pet?s=0')

  # transformerar vår HTTP response till ett nokogiri objekt
  parse_page = Nokogiri::HTML(page)

  pets_array = []

  parse_page.css('.content').css('.row').css('hdrlnk').map do |a|
    post_name = a.text
    pets_array.push(post_name)
  end

Pry.start(binding)

end
