require 'xmlsimple'
require 'JSON'
  config = XmlSimple.xml_in('app/menus/coffee.xml',
    'KeyAttr'    => { 'item' => 'name' },
    'ForceArray' => false,
    'ContentKey' => '-content'
  )
p config.class
p '-\\-'
p config['coffeeDrinks']['drink']
p '-\\-'
p config['id'].to_json
p '-\\-'
p config['coffeeDrinks'].to_json
