require 'xmlsimple'
require 'JSON'

def file_interpreter
  puts "You initiate this file with the parameter #{ARGV[0]}"

  @file_name = ARGV[0]

  @file_extension = File.extname(@file_name)

  if @file_extension == '.xml'
    puts "The file extension for the file you passed is #{@file_extension}"
    file_parser
  else
    puts "File extension should be '.xml'"
  end
end

def file_parser
  menu = XmlSimple.xml_in(ARGV[0],
    'KeyAttr'    => { 'item' => 'name' },
    'ForceArray' => false,
    'ContentKey' => '-content'
    )
    menu_keys = menu.keys
    if menu_keys.include?('id')
      file_generator(menu, menu_keys)
    else
      puts "Menu shoul have an id"
    end
end

def file_generator(menu, menu_keys)
  gen_file_name = "app/menus/#{menu_keys[1].downcase}_#{menu['id']}.json"
  File.write(gen_file_name, JSON.pretty_generate(menu))
  puts "The file '#{gen_file_name}' was generated"
end

file_interpreter
