require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @xml_menu.get_menu_prices_as_floats.each do |value|
      expect(value).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.get_all_food_items.each do |i|
      if i.element_children[0].text == 'Full Breakfast'
        expect(i.element_children[3].text.to_i).to be > 1000
      else
        expect(i.element_children[3].text.to_i).to be < 1000
      end
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
  # Consider children element methods - Remember to step through the data and print out to the command line if you need it

    @xml_menu.get_all_food_items.each do |i|
      if i.element_children[0].text.include? 'Waffles'
        expect(i.element_children[2].text).to include 'Two'
      end
    end
  end

end
