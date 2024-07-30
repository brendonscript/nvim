local function configure_sources(lazy_sources)
  local config = {
    nvim_lsp = { group_index = 1, order = 1 },
    snippets = { group_index = 1, order = 2 },
    copilot = { group_index = 1, order = 3 },
    buffer = { group_index = 2, order = 4 },
    path = { group_index = 2, order = 5 },
    lazydev = { group_index = 0, order = 6 },
    git = { group_index = 2, order = 7 },
  }

  local sources = {}

  for _, item in ipairs(lazy_sources) do
    local name = item.name
    local group_index = item.group_index or 2

    if config[name] then
      group_index = config[name].group_index
      table.insert(sources, { name = name, group_index = group_index })
      if name == 'copilot' and group_index == 1 then
        table.insert(sources, { name = name, group_index = 2 })
      end
    else
      table.insert(sources, { name = name, group_index = 2 })
    end
  end

  -- Sort the `after` table according to the desired order
  table.sort(sources, function(a, b)
    local order_a = config[a.name] and config[a.name].order or math.huge
    local order_b = config[b.name] and config[b.name].order or math.huge
    return order_a < order_b or (order_a == order_b and a.group_index < b.group_index)
  end)

  return sources
end

return {
  'hrsh7th/nvim-cmp',
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require('cmp')
    local copilot_reverse_prioritize = function(entry1, entry2)
      if entry1.source.name == 'copilot' and entry2.source.name ~= 'copilot' then
        return false
      elseif entry2.copilot == 'copilot' and entry1.source.name ~= 'copilot' then
        return true
      end
    end

    -- opts.sorting.comparators = {
    --   copilot_reverse_prioritize,
    --   cmp.config.compare.offset,
    --   cmp.config.compare.exact,
    --   -- cmp.config.compare.scopes,
    --   cmp.config.compare.score,
    --   cmp.config.compare.recently_used,
    --   cmp.config.compare.locality,
    --   cmp.config.compare.kind,
    --   -- cmp.config.compare.sort_text,
    --   cmp.config.compare.length,
    --   cmp.config.compare.order,
    -- }

    local comparators = opts.sorting.comparators or {}

    table.insert(comparators, 1, copilot_reverse_prioritize)
    opts.sorting.comparators = comparators
    opts.sources = configure_sources(opts.sources)

    -- for i, v in ipairs(opts.sources) do
    --   if v.name == 'copilot' then
    --     v.priority = 1
    --   else
    --   end
    -- end
    -- opts.sources = cmp.config.sources({
    --   { name = 'nvim_lsp' },
    --   { name = 'snippets' },
    --   { name = 'copilot' },
    -- }, {
    --   { name = 'copilot' },
    --   { name = 'buffer' },
    --   { name = 'path' },
    --   { name = 'lazydev' },
    --   { name = 'git' },
    --   { name = 'crates' },
    -- })
  end,
}
