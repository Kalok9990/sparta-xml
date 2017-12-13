require "nokogiri"

class GuiseppesMenu
  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open("./xml_menu.xml"))
  end

  def get_menu_names
    @menu.search("name").text
  end

  def get_menu_food
    @menu.search("food").text
  end

  def get_menu_prices
    @menu.search("price").text
  end

  def get_menu_description
    @menu.search("description").text
  end

  def get_menu_calories
    @menu.search("calories").text
  end

end

x = GuiseppesMenu.new
# puts x.get_menu_names
# puts x.get_menu_names.last.text
puts x.get_menu_food
