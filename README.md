# menu.XML Parser
Parse your xml menu file to Json with this ruby api

## Requirements
Ruby v ruby 3.1.2p20

XML file structure as follows

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
    <item> ... </item>
  </menu_type>
</menu>
```

### Run

`ruby bundle install`

`ruby app/app.rb <file_path>`

## Possible Errors

lorem ipsum
