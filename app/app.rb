require 'xmlsimple'
require 'JSON'

print "What's the file name?
> "
f_name = gets.chomp
sleep(0.5)
print "What is the extension of #{f_name} file?
> "
f_ext = gets.chomp
sleep(0.5)

if f_ext == 'xml'
  p "Let's parse it!"
  sleep (0.5)
  menu = XmlSimple.xml_in("app/menus/#{f_name}.xml",
    'KeyAttr'    => { 'item' => 'name' },
    'ForceArray' => false,
    'ContentKey' => '-content'
    )
else
  return 'Sorry, this api only parses xml files'
end

p 'Here is a sample of the data'
p "Menu id: #{menu['id']}"
p JSON.pretty_generate(menu)

p '--||--'

print "would you like to generate Json file?
(y/n) > "
gen_file = gets.chomp.downcase
sleep(0.5)
if gen_file == 'y'
  p 'Creating json file in app/menus directory'
  sleep(2)
  File.write("app/menus/#{menu['id']}_#{f_name}.json", JSON.pretty_generate(menu))
  p "Json file of the menu id: #{menu['id']} is ready."
elsif gen_file == 'n'
  p 'Good bye!'
else
  p "Bad request, try again"
end
