local ls = require "luasnip"
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local types = require "luasnip.util.types"
local rep = require "luasnip.extras".rep -- repeat node

ls.config.set_config {
  -- Tell luasnip to remember the last snippet. You can jump back into it even
  -- if you move outside the selection
  history = true,

  -- Update snippet as you
  update_events = "TextChanged,TextChangedI",
}

ls.add_snippets("php", {
  -- trigger from `met` a class function definition
  s("met", {
    -- TODO: add docblock here or as a separate snippet? if its here it could use treesitter to discover the variable types
    c(1, {
      t("public "),
      t("private "),
      t("protected "),
    }),
    t("function "),
    i(2, "name"),
    t("("),
    i(3, "$arg1"),
    t({")", "{", "\t"}), -- TODO: allow specifying return type with a choice node
    i(0), -- TODO: put a new line (or a choice node here for newline)
    -- c(0, {
    --   t("foo"),
    --   t({""}),
    -- }),
    c(4, {
      t("return;"),
      sn(nil, {
        t("return "),
        r(1, "", i(1)),
        t(";")
      }),
    }),
    t({"", "}"}),
  }),
  -- trigger from `tink` a tinker interactive session
  s("tink", {
    t("eval(\\Psy\\sh());"),
  }),
  -- trigger from `t.` for `$this` helper
  s("t.", {
    t("$this"),
    c(1, {
      sn(nil, {
        t("->"),
        r(1, "", i(1)),
      }),
      t(""),
    }),
  }),
  -- trigger from `pest` for a pest test
  s("pest", {
    t("it('"),
    i(1, "is a test"),
    t({
      "', function () {",
      "\t",
    }),
    i(0, "// "),
    t({"", "});"}),
  }),
}, {
  key = "php"
})
