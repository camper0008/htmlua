local htmlua = require("htmlua")
require("htmlua.elements")

local doc = html {
    lang = "en";
    head {
        title "My document";
        style [[
            html {
                color-scheme: light dark;
            }
            p {
                font-size: 16px;
            }  
        ]];
    };
    body {
        h1 "My document";
        p "Here comes some cool text or something";
        p {
            class = "quote\"test";
            "Haven't really decided yet <p>";
            " ";
            os.date("Today's date is %d/%m-%Y");
        };
    };
}

print(htmlua.render(doc));
