# Menu interpreter
### This class provides a way to convert XML menus to JSON files.

  The script parses an XML file into a hash using `xmlsimple` gem, which is validated for menu ID. If true the hash is then converted using `JSON` module and finally written to disk using the `File` class.

  To facilitate implementation and maintainability the logic for parsing the XML and generating JSON is encapsulated in the `MenuInterpreter` class that exposes a single method `parse` and only takes the XML file path as an argument.

  By using command-line arguments the user can simply specify the path to XML file to be parsed and the script will take care of the rest.

## Instalation
  This code requires the following gems:
  - xmlsimple
  - json
  - rspec

  Thanks to the `Gemfile` you can install these gems by running the following command in your terminal:
```bash
  $ bundle install
```
## Quick start

Say you have a xml file containing the following structure

```xml
  <menu>
    <id>menu_id</id>
    <menuType>
      <item>
        <name>drink_name</name>
        <ingredients>
          <ingredient>ingredient_name</ingredient>
          <ingredient>ingredient_name</ingredient>
        </ingredients>
        <preparation>preparation_description</preparation>
      </item>
      <item>
        <name>drink_name</name>
        <ingredients>
          <ingredient>ingredient_name</ingredient>
          <ingredient>ingredient_name</ingredient>
        </ingredients>
        <preparation>preparation_description</preparation>
      </item>
    </menuType>
  </menu>
```
Then you can run the following

```bash
  $ ruby menu_interpreter.rb <file_path>
```

The aplication will convert the xml file to json format and create a file `app/menus/menu_typemenu_id.json`

```json
  {
    "id": "menu_id",
    "menu_type": {
      "item": {
        "name": "drink_name",
        "ingredients": {
          "ingredient": [
            "ingredient_name",
            "ingredient_name"
          ]
        },
        "preparation": "preparation_description"
      },
      "item": {
        "name": "drink_name",
        "ingredients": {
          "ingredient": [
            "ingredient_name",
            "ingredient_name"
          ]
        },
        "preparation": "preparation_description"
      }
    }
  }
```
## Class
`MenuInterpreter.new(file_path)`

The MenuInterpreter constructor accepts one argument: file_path, which is the path to the XML file to be parsed.

`MenuInterpreter#parse`

This method parses the XML file specified in the constructor, validates the file extension, checks that the file structure includes a menu ID, generates a JSON file, and writes the JSON output to disk.
## Usage
To use this class, simply create a new instance of MenuInterpreter with the path to an XML file as the argument, and call the parse method on the instance.

csharp
```ruby
MenuInterpreter.new('path/to/xml/file.xml').parse
```
This will generate a new JSON file in the app/menus/ directory with the menu type value and menu id with a .json extension. If a JSON file with the same name already exists, the script will overwrite it.

## Constants
`MenuInterpreter::SUPPORTED_EXTENSIONS`

This constant is an array of supported file extensions. By default, the only supported extension is .xml.

`MenuInterpreter::MENU_DIR`

This constant is the directory where generated JSON files will be saved. By default, this is set to app/menus/.
## Possible Handled Errors

`MenuInterpreter::Error`
This is a superclass for all errors related to the MenuInterpreter class.

`MenuInterpreter::BlankFilePathError`
This error is raised if the MenuInterpreter constructor is called with a blank file path argument.

`MenuInterpreter::FileCouldNotBeFound`
This error is raised if the file path specified in the constructor does not exist.

`MenuInterpreter::ExtensionError`
This error is raised if the file path specified in the constructor has no extension or if the extension is not supported.

`MenuInterpreter::MissingMenuId`
This error is raised if the XML file structure is missing a menu ID.

## Improvements
- Configurable input options

  Curently the class only supports XML files with a specific structure, it might be useful support CSV and YAML with variable structure.

- Configurable output options

  Allowing the user to choose the directory to save the generated file and how to handle duplicates, which is currently being override.

- Deeper error handling

  Checking file structure and values raising descriptive exceptions for the user
---
---
## Examples

### Working example
When it's called with the propper parameter
```bash
$ ruby app/menu_interpreter.rb app/assets/sandwiches.xml
Generating file 'sandwiches_234567891.json'
Output file: app/menus/sandwiches_234567891.json
```
In case you call the file using the same xml_in it will **update** the existing file avoiding duplicates.
```bash
$ ruby app/menu_interpreter.rb app/assets/sandwiches.xml
Updating file 'sandwiches_234567891.json'
Output file: app/menus/sandwiches_234567891.json
```
The result of the IO files is as follows

INPUT
```xml
<menu>
  <id>234567891</id>
  <sandwiches>
    <sandwich>
      <name>BLT</name>
      <ingredients>
        <ingredient>Bacon</ingredient>
        <ingredient>Lettuce</ingredient>
        <ingredient>Tomato</ingredient>
        <ingredient>Mayonnaise</ingredient>
        <ingredient>Bread</ingredient>
      </ingredients>
      <preparation>
        <step>Toasted bread in a toaster.</step>
        <step>Add mayonnaise to bread.</step>
        <step>Add bacon, lettuce and tomato to bread.</step>
        <step>Serve.</step>
      </preparation>
    </sandwich>
    <sandwich>
      <name>Turkey Club</name>
      <ingredients>
        <ingredient>Turkey</ingredient>
        <ingredient>Bacon</ingredient>
        <ingredient>Lettuce</ingredient>
        <ingredient>Tomato</ingredient>
        <ingredient>Mayonnaise</ingredient>
        <ingredient>Bread</ingredient>
      </ingredients>
      <preparation>
        <step>Toasted bread in a toaster.</step>
        <step>Add mayonnaise to bread.</step>
        <step>Add turkey, bacon, lettuce and tomato to bread.</step>
        <step>Serve.</step>
      </preparation>
    </sandwich>
  </sandwiches>
</menu>
```
OUTPUT
```json
{
  "id": "234567891",
  "sandwiches": {
    "sandwich": [
      {
        "name": "BLT",
        "ingredients": {
          "ingredient": [
            "Bacon",
            "Lettuce",
            "Tomato",
            "Mayonnaise",
            "Bread"
          ]
        },
        "preparation": {
          "step": [
            "Toasted bread in a toaster.",
            "Add mayonnaise to bread.",
            "Add bacon, lettuce and tomato to bread.",
            "Serve."
          ]
        }
      },
      {
        "name": "Turkey Club",
        "ingredients": {
          "ingredient": [
            "Turkey",
            "Bacon",
            "Lettuce",
            "Tomato",
            "Mayonnaise",
            "Bread"
          ]
        },
        "preparation": {
          "step": [
            "Toasted bread in a toaster.",
            "Add mayonnaise to bread.",
            "Add turkey, bacon, lettuce and tomato to bread.",
            "Serve."
          ]
        }
      }
    ]
  }
}
```
