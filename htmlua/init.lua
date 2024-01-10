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
    if type(node) ~= "table" then
        local node = tostring(node);
        if sanitize then
            node = node:gsub("<", "&lt;"):gsub(">", "&gt;");
        end
        return node;
    end
    -- local function dump(o, ind)
    --     local increment = 2;
    --     if type(o) == "table" then
    --         local str = "{\n";
    --         for i, v in pairs(o) do
    --             str = str .. (" "):rep(ind + increment) .. i .. " = " .. dump(v, ind + increment) .. "\n";
    --         end
    --         return str .. (" "):rep(ind) .. "}"
    --     else
    --         return o
    --     end
    -- end
    -- print(dump(node, 0));

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

end

return htmlua;