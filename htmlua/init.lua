local node = {};


function node.init(tag, inner)
    return {
        tag = tag;
        inner = inner;
    };
end

local htmlua = {};

function htmlua.gen(...)
    local tags = {...};
    local fns = {};
    for _, tag in ipairs(tags) do
        fns[#fns + 1] = function(inner) 
            return node.init(tag, inner);
        end;
    end
    return table.unpack(fns);
end

function format_attributes(attr)
    local str = "";
    for i, v in pairs(attr) do
        str = str .. (" %s=\"%s\""):format(i, v:gsub('"', '\\"'))
    end
    return str;
end

function htmlua.render(node, sanitize)
    local sanitize = sanitize == nil and true or sanitize;
    if node.tag == "script" or node.tag == "style" then
        sanitize = false;
    end
    if type(node) ~= "table" then
        local node = tostring(node);
        if sanitize then
            node = node:gsub("<", "&lt;"):gsub(">", "&gt;");
        end
        return node;
    end

    if type(node.inner) == "table" then
        local children = {};
        local attributes = {};

        for i, v in pairs(node.inner) do
            if type(i) == "string" then
                attributes[i] = v;
            end

            if type(i) == "number" then
                children[#children + 1] = htmlua.render(v, sanitize);
            end
        end

        local formatted_attr = format_attributes(attributes);

        return ("<%s%s>%s</%s>"):format(node.tag, formatted_attr, table.concat(children, ""), node.tag)
    else
        return ("<%s>%s</%s>"):format(node.tag, node.inner, node.tag)
    end

end

return htmlua;
