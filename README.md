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

## Possible Handled Errors

- Blank file path error
- File could not be found
- Extension is not Provided/Supported
- Missing menu id

## Examples

### Working example
When it's called with the propper parameter
```
$ ruby app/menu_interpreter.rb app/assets/sandwiches.xml
You called this file with the parameter app/assets/sandwiches.xml
Generating file 'sandwiches_234567891.json
You can now find the file at: app/menus/sandwiches_234567891.json
```
In case you call the file using the same xml_in it will **update** the existing file avoiding duplicates.
```
$ ruby app/menu_interpreter.rb app/assets/sandwiches.xml
You called this file with the parameter app/assets/sandwiches.xml
Updating file 'sandwiches_234567891.json
You can now find the file at: app/menus/sandwiches_234567891.json
```
The result of the IO files is as follows
```
<Menu>
  <id>234567891</id>
  <Sandwiches>
    <Sandwich>
      <Name>BLT</Name>
      <Ingredients>
        <Ingredient>Bacon</Ingredient>
        <Ingredient>Lettuce</Ingredient>
        <Ingredient>Tomato</Ingredient>
        <Ingredient>Mayonnaise</Ingredient>
        <Ingredient>Bread</Ingredient>
      </Ingredients>
      <Preparation>
        <Step>Toasted bread in a toaster.</Step>
        <Step>Add mayonnaise to bread.</Step>
        <Step>Add bacon, lettuce and tomato to bread.</Step>
        <Step>Serve.</Step>
      </Preparation>
    </Sandwich>
    <Sandwich>
      <Name>Turkey Club</Name>
      <Ingredients>
        <Ingredient>Turkey</Ingredient>
        <Ingredient>Bacon</Ingredient>
        <Ingredient>Lettuce</Ingredient>
        <Ingredient>Tomato</Ingredient>
        <Ingredient>Mayonnaise</Ingredient>
        <Ingredient>Bread</Ingredient>
      </Ingredients>
      <Preparation>
        <Step>Toasted bread in a toaster.</Step>
        <Step>Add mayonnaise to bread.</Step>
        <Step>Add turkey, bacon, lettuce and tomato to bread.</Step>
        <Step>Serve.</Step>
      </Preparation>
    </Sandwich>
  </Sandwiches>
</Menu>


{
  "id": "234567891",
  "Sandwiches": {
    "Sandwich": [
      {
        "Name": "BLT",
        "Ingredients": {
          "Ingredient": [
            "Bacon",
            "Lettuce",
            "Tomato",
            "Mayonnaise",
            "Bread"
          ]
        },
        "Preparation": {
          "Step": [
            "Toasted bread in a toaster.",
            "Add mayonnaise to bread.",
            "Add bacon, lettuce and tomato to bread.",
            "Serve."
          ]
        }
      },
      {
        "Name": "Turkey Club",
        "Ingredients": {
          "Ingredient": [
            "Turkey",
            "Bacon",
            "Lettuce",
            "Tomato",
            "Mayonnaise",
            "Bread"
          ]
        },
        "Preparation": {
          "Step": [
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
