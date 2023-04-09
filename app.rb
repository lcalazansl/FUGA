require 'active_support/core_ext/hash'
require 'rspec'

def list_maker
  xml_data = File.open('coffee_menu.xml')
  hash = Hash.from_xml(xml_data)
  p hash
end
list_maker
