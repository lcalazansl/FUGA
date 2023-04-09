require 'active_support/core_ext/hash'
# require 'libxml-ruby'

# 	def converter
# 		file_data = File.open('coffee_menu.xml')
# 		hashr = Hash.from_xml(file_data)
# 		puts hashr
# 	end
# 	puts converter



require 'nokogiri'

sample_data = File.open('coffee_menu.xml')

@parsed_info = Nokogiri::XML(sample_data)

def all_drinks
  drinks = []
  @parsed_info.xpath('//drink').each do |drink|
    # drink.at_xpath('//name').content
    drinks.push(drink.at_xpath('name').content)
  end
  p drinks
end
all_drinks

# p drink_ingredients = drink.at_xpath('ingredients').content
# drinks[drink_name] = drink_ingredients
# p drinks
# p drinks.at_xpath('//name').content
