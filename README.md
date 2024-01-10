# htmlua

hyper text markup lua

html (bad):

```html
<html lang="en">
    <head>
        <title>My document</title>
        <style>
            html {
                color-scheme: light dark;
            }
            p {
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <h1>My document</h1>
        <p>Here comes some cool text or something</p>
        <p>Haven't really decided what kind yet. Today's date is 10/01-2024</p>
    </body>
</html>
```

htmlua (good):

```lua
html {
    lang = "en",
    head {
        title "My document",
        style [[
            html {
                color-scheme: light dark;
            }
            p {
                font-size: 16px;
            }  
        ]],
    },
    body {
        h1 "My document",
        p "Here comes some cool text or something",
        p {
            "Haven't really decided what kind yet.",
            " ",
            os.date "Today's date is %d/%m-%Y",
        },
    },
}
```
