require 'xmlsimple'
require 'JSON'

# This class will handle the xml and output a json file
class MenuInterpreter
  class BlankFilenameError < StandardError; end
  class ExtensionNotProvided < StandardError; end
  class ExtensionNotSupported < StandardError; end
  class MissingMenuId < StandardError; end

  # initialize the class and checks for file name
  def initialize(file_name)
    raise BlankFilenameError, 'Filename is required for this action' if file_name.nil?

    puts "You called this file with the parameter #{ARGV[0]}"
    @file_name = file_name
  end

  # check if file extension is present and is .xml
  def extension
    file_extension = File.extname(@file_name)
    raise ExtensionNotProvided, 'The filename provided has no extension' if file_extension.empty?

    raise ExtensionNotSupported, 'The filename provided has extension that is not supported' if file_extension != '.xml'

    file_extension
  end

  # parse file to array and checks for id
  def parser
    menu = XmlSimple.xml_in(
      ARGV[0],
      'KeyAttr' => { 'item' => 'name' },
      'ForceArray' => false,
      'ContentKey' => '-content'
      )
    menu_keys = menu.keys
    raise MissingMenuId, 'The file structure is missing an id' unless menu_keys.include?('id')

    # file_generator(menu, menu_keys)
    structure(menu, menu_keys)
  end

  # idea to check structure, probably there's a better way of doing it... might not go down this road
  def structure(menu, menu_keys)
    p 'menu'
    p menu
    p 'menu_id'
    p menu_id = menu_keys[0]
    p 'menu_type'
    p menu_type = menu_keys[1]
    p 'menu_item'
    p menu_item = menu[menu_type].keys[0]
    p 'menu[menu_type][menu_item]'
    p menu[menu_type][menu_item][0]
    p menu[menu_type][menu_item][0].keys
    p menu[menu_type][menu_item][0].keys.include?('name')
    p menu[menu_type][menu_item][0].class
    p menu[menu_type][menu_item][0].include?(:name)
    # p menu[menu_keys[1]].keys
  end
end

menu_interpreter = MenuInterpreter.new(ARGV[0])
menu_interpreter.extension
menu_interpreter.parser
