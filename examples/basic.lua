local htmlua = require("htmlua")
local html, head, title, body, h1, p, style = htmlua.gen("html", "head", "title", "body", "h1", "p", "style");

local doc = html {
    lang = "en";
    head {
        title {
            "My document";
        };
        style [[
            p {
                font-size: 16px;
            }  
        ]];
    };
    body {
        h1 {
            "My document"
        };
        p {
            "Here comes some cool text or something"
        };
        p {
            class = "quote\"test";
            "Haven't really decided yet <p>";
            " ";
            os.date("Today's date is %d/%m-%Y");
        };
    };
}

print(htmlua.render(doc));
