local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("php", {
    s("t", { t("$this") }),
    s("t.", { t("$this->"), i(0) }),
    s("tink", { t("eval(\\Psy\\sh());") }),
})
