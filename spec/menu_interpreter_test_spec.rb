require 'rspec/autorun'
require_relative '../app/menu_interpreter'

RSpec.describe MenuInterpreter do
  describe '#initialize' do
    context 'with missing file path argument' do
      it 'raises BlankFilePathError if file path is nil' do
        expect { MenuInterpreter.new([]) }.to raise_error(MenuInterpreter::BlankFilePathError)
      end
    end

    it 'raises FileCouldNotBeFound if file path does not exist' do
      expect { MenuInterpreter.new(['non_existing_file.xml']) }.to raise_error(MenuInterpreter::FileCouldNotBeFound)
    end

    it 'does not raise error if file path is valid' do
      expect { MenuInterpreter.new(['app/assets/test_menu.xml']) }.not_to raise_error
    end
  end

  describe '#parse' do
    context 'with invalid file extensions' do
      it 'raises ExtensionError if filename has no extension' do
        interpreter = MenuInterpreter.new(['no_extension'])
        expect { interpreter.parse }.to raise_error(MenuInterpreter::ExtensionError)
      end

      it 'raises ExtensionError if filename extension is not supported' do
        interpreter = MenuInterpreter.new(['unsupported_extension.xyz'])
        expect { interpreter.parse }.to raise_error(MenuInterpreter::ExtensionError)
      end
    end

    context 'with valid XML file' do
      it 'raises MissingMenuId if the file structure is missing an id' do
        interpreter = MenuInterpreter.new(['app/assets/menu_without_id.xml'])
        expect { interpreter.parse }.to raise_error(MenuInterpreter::MissingMenuId)
      end

      it 'generates a JSON file with the same name and path as the XML file' do
        interpreter = MenuInterpreter.new(['app/assets/test_menu.xml'])
        interpreter.parse
        expect(File.exist?('app/menus/test_menu.json')).to be true
        File.delete('app/menus/test_menu.json') # cleanup
      end
    end
  end
end
