require 'xmlsimple'
require 'json'

# This class handles the conversion of XML menus to JSON files
class MenuInterpreter
  SUPPORTED_EXTENSIONS = ['.xml'].freeze
  MENU_DIR = 'app/menus/'.freeze

  class Error < StandardError; end
  class BlankFilePathError < Error; end
  class FileCouldNotBeFound < Error; end
  class ExtensionError < Error; end
  class MissingMenuId < Error; end

  def initialize(file_path)
    raise BlankFilePathError, 'File path is required for this action' if file_path.nil?
    raise FileCouldNotBeFound, 'File path could not be found' unless File.exist?(file_path)

    @file_path = file_path
  end

  def parse
    validate_file_extension

    menu = XmlSimple.xml_in(
      @file_path, {
        'KeyAttr' => { 'item' => 'name' },
        'ForceArray' => false,
        'ContentKey' => '-content'
      }
    )

    validate_menu_id(menu)

    generate_json_file(menu)
  end

  private

  def validate_file_extension
    extension = File.extname(@file_path)

    raise ExtensionError, 'The filename provided has no extension' if extension.empty?
    raise ExtensionError, 'The filename provided has extension that is not supported' unless SUPPORTED_EXTENSIONS.include?(extension)
  end

  def validate_menu_id(menu)
    raise MissingMenuId, 'The file structure is missing an id' unless menu.keys.include?('id')
  end

  def generate_json_file(menu)
    menu_type = menu.keys[1]
    menu_id = menu['id']
    json_file_name = "#{menu_type}#{menu_id}.json"
    json_file_path = "#{MENU_DIR}#{json_file_name}"

    puts "#{File.exist?(json_file_path) ? 'Updating' : 'Generating'} file '#{json_file_name}'"

    File.write(json_file_path, JSON.pretty_generate(menu))

    puts "Output file: #{json_file_path}"
  end
end

# Usage: $ ruby menu_interpreter.rb input_file_path.xml
MenuInterpreter.new(ARGV[0]).parse
