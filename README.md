# htmlua

hyper text markup lua

html (bad):

```html
<html lang="en">
    <head>
        <title>My document</title>
    </head>
    <body>
        <h1>My document</h1>
        <p>Here comes some cool text or something</p>
        <p>Haven't really decided yet</p>
        <p>Today's date is 10/01-2024</p>
    </body>
</html>
```

htmlua (good):

```lua
local doc = html {
    lang = "en";
    head {
        title {
            "My document";
        }
    };
    body {
        h1 {
            "My document"
        };
        p {
            "Here comes some cool text or something"
        };
        p {
            "Haven't really decided yet"
        };
        p {
            "Today's date is 10/01-2024"
        };
    };
}
```
