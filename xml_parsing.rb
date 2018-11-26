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
    array = @menu.search('calories')
    array.each do |cal|
      cal.text.to_i
    end
  end

end

p = GuiseppesMenu.new

puts p.get_calories
