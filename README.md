# menu.XML Parser

## introduction
The menu_interpreter class offers an easy API to parse your xml menu file into a Json file.

## Instalation
  ruby v 3.1.2p20
```
  $ bundle install
```
## Quick start

Say you have a xml file containing the following structure

```
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

```
  $ ruby menu_interpreter.rb <file_path>
```

The aplication will convert the xml file to json format and create a file `app/menus/menu_type_menu_id.json`

```
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

## Possible Handled Errors

- Blank file path error
- File could not be found
- Extension is not provided/Supported
- Missing menu id

## Examples

### Working example
When it's called with the propper parameter
```
$ ruby app/menu_interpreter.rb app/assets/sandwiches.xml
Executing interpreter for file app/assets/sandwiches.xml
Generating file 'sandwiches_234567891.json
Output file: app/menus/sandwiches_234567891.json
```
In case you call the file using the same xml_in it will **update** the existing file avoiding duplicates.
```
$ ruby app/menu_interpreter.rb app/assets/sandwiches.xml
Executing interpreter for file app/assets/sandwiches.xml
Updating file 'sandwiches_234567891.json
Output file: app/menus/sandwiches_234567891.json
```
The result of the IO files is as follows
```
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
