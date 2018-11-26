require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_price
    price_string = @menu.search('price').text
    price = price_string.split '£'
  end

  def get_calories
    @menu.search('calories')[0].text.to_i
    @menu.search('calories')[1].text.to_i
    @menu.search('calories')[2].text.to_i
    @menu.search('calories')[3].text.to_i
    @menu.search('calories')[4].text.to_i
  end

end

p = GuiseppesMenu.new

puts p.get_calories
