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

  def get_xpath_names
  arr2=[]
  a = @menu.xpath('//name').to_a
  a.each do |waffles|
    if waffles.text === Waffles
      arr2 << waffles.text
      puts 'you get two waffles'
    else
      arr2
    end
  end
  arr
  end

end

guiseppes = GuiseppesMenu.new

puts guiseppes.get_xpath_names
