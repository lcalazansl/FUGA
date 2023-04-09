require 'xmlsimple'
  config = XmlSimple.xml_in('coffee_menu.xml',
    'KeyAttr'    => { 'item' => 'name' },
    'ForceArray' => false,
    'ContentKey' => '-content'
  )
p config
p '-\\-'
p '-\\-'
p '-\\-'
p config['coffeeDrinks']
