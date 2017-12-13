require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  # Place your methods here
  def get_menu_prices_as_floats
    menu_prices = []
    # prices = @menu.search("price").text
    # prices = prices.split('£').drop(1)
    # prices.each do |pr|
    #   menu_prices.push(pr.to_f)
    # end

    @menu.xpath("//price").each do |price|
      menu_prices << price.text.gsub("£", "").to_f
    end

    menu_prices
  end

  def get_all_food_items
    names = @menu.search("name", "calories")
    calories = @menu.search("calories")
    p names
  end

end

x = GuiseppesMenu.new
# p x.get_menu_prices
