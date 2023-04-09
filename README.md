# menu.XML Parser
Parse your xml menu file to Json with this ruby api

## Requirements
Ruby v ruby 3.1.2p20

XML file structure
XML file should be located at app/menus/**file_name.xml**

```
<menu>
  <id>menu_id</id>
  <coffeeDrinks>
    <drink>
      <name>drink_name</name>
      <ingredients>
        <ingredient>ingredient_name</ingredient>
        <ingredient>ingredient_name</ingredient>
      </ingredients>
      <preparation>drink_preparation</preparation>
    </drink>
    <drink> ... </drink>
  </coffeeDrinks>
</menu>
```

### Run

`ruby bundle install`

`ruby app/app.rb`

follow prompt commands
