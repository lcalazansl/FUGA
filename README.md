# menu.XML Parser

## introduction
The menu_interpreter class offers an easy API to parse your xml menu file into a Json file.

## Instalation
  ruby v 3.1.2p20
```
  $ bundle install
```
## Quick Start

Say you have a xml file containing the following structure

```
  <menu>
    <id>menu_id</id>
    <menu_type>
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
    </menu_type>
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

## Possible Errors

lorem ipsum
