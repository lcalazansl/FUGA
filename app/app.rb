require 'xmlsimple'
require 'JSON'



config = XmlSimple.xml_in('app/menus/coffee.xml',
  'KeyAttr'    => { 'item' => 'name' },
  'ForceArray' => false,
  'ContentKey' => '-content'
  )

p
# p config.class
p '-\\-'
# p config['coffeeDrinks']['drink']
p '-\\-'
# p config['id'].to_json
p '-\\-'
# p JSON.pretty_generate(config)
config['coffeeDrinks'].to_json
p "Creating json file in app/menus directory"
sleep(3)
File.write("app/menus/#{config['id']}.json", JSON.pretty_generate(config))
p "Json file of the menu id: #{config['id']} is ready."
