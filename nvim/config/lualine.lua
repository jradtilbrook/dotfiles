-- Inspired Github Colors
 local colors = {
   red = '#ca1243',
   grey = '#f5f5f5',
   light_grey = '#979BAC',
   black = '#383a42',
   white = '#ffffff',
   transparent = '#ffffff',
   light_green = '#83a598',
   orange = '#fe8019',
   green = '#8ec07c',
   yellow = '#f8eec7',
   purple = '#5a32a3',
   cyan = '#489FC1',
 }

 local inspired_github = {
   normal = {
     a = { fg = colors.white, bg = colors.black },
     b = { fg = colors.black,  bg = colors.grey },
     c = { fg = colors.light_grey, bg = colors.white },
     z = { fg = colors.white, bg = colors.black },
   },
   insert = { a = { fg = colors.white, bg = colors.cyan } },
   visual = { a = { fg = colors.black, bg = colors.yellow } },
   replace = { a = { fg = colors.white, bg = colors.red } },
   command = { a = { fg = colors.white, bg = colors.purple } },
 }

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.transparent } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
      -- comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function harpoon_status()
    local status = require("harpoon.mark").status()
    if status == "" then
        status = "N"
    end
    return string.format("H:%s", status)
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

require('lualine').setup {
  options = {
    theme = 'github_dimmed',
    component_separators = '',
    globalstatus = true,
  },
  -- process_sections
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',  
      'filename',
      {
        'diagnostics',
        source = { 'intelephense', 'quick-lint-js' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'intelephense', 'quick-lint-js' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'intelephense', 'tsserver' },
        sections = { 'hint' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { harpoon_status, 'location', '%p%%/%L' },
  },
}
