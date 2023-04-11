require 'xmlsimple'
require 'JSON'

# This class will handle the xml and output a json file
class MenuInterpreter
  class BlankFilePathError < StandardError; end
  class ExtensionNotProvided < StandardError; end
  class ExtensionNotSupported < StandardError; end
  class MissingMenuId < StandardError; end
  class FileCouldNotBeFound < StandardError; end

  # initialize the class and checks for file name
  def initialize(file_path)
    raise BlankFilePathError, 'File path is required for this action' if file_path.nil?
    raise FileCouldNotBeFound, 'File path could not be found' unless File.exist?(file_path)

    puts "You called this file with the parameter #{ARGV[0]}"
    @file_path = file_path
  end

  # check if file extension is present and is .xml
  def extension
    file_extension = File.extname(@file_path)

    raise ExtensionNotProvided, 'The filename provided has no extension' if file_extension.empty?

    raise ExtensionNotSupported, 'The filename provided has extension that is not supported' if file_extension != '.xml'
  end

  # parse file to array and checks for id
  def parser
    # this method uses xmlsimple gem
    menu = XmlSimple.xml_in(
      ARGV[0],
      'KeyAttr' => { 'item' => 'name' },
      'ForceArray' => false,
      'ContentKey' => '-content'
      )
    # this piece of code checks if the input file has an id
    menu_keys = menu.keys
    raise MissingMenuId, 'The file structure is missing an id' unless menu_keys.include?('id')

    file_generator(menu, menu_keys)
  end

  def file_generator(menu, menu_keys)
    json_file_name = "#{menu_keys[1].downcase}_#{menu['id']}.json"
    json_file_path = "app/menus/#{menu_keys[1].downcase}_#{menu['id']}.json"

    puts "#{File.exist?(json_file_path) ? 'Updating' : 'Generating'} file '#{json_file_name}"
    File.write(json_file_path, JSON.pretty_generate(menu))
    puts "You can now find the file at: #{json_file_path}"
  end
end

menu_interpreter = MenuInterpreter.new(ARGV[0])
menu_interpreter.extension
menu_interpreter.parser
