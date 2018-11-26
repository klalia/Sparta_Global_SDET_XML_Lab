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
    arr = []
    array = @menu.search('calories').to_a
    array.each do |calories|
      if calories.text.to_i < 1000
        arr << calories.text.to_i
      else
        arr
      end
      end
    arr
  end

end

p = GuiseppesMenu.new

puts p.get_calories
