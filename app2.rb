require 'nokogiri'

f=File.open('coffee_menu.xml')
doc=Nokogiri::XML(f)
f.close
drinks = {}
doc.xpath('//drink').each do |drink|
  p drink.attributes
  p "------"
end
print drinks



# require 'json'


# doc =  Nokogiri::XML(File.open('coffee_menu.xml'))

# drinks = {}

# # doc.xpath("//drink").each |drink| do
# #   drinks[drink.name] = drink.text
# # end

# p drinks
# json_data = JSON.generate(hash)

# puts json_data

# def coffee_drink_list
#   coffee_menu = File.open('/coffee_menu.xml')
#   hash = Hash.from_xml(coffee_menu)

#   hash['menu']['coffeeDrinks'].each do |coffee_drink|
#     p coffee_drink
#   end
# end

# puts hash
