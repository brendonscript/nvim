return {
  'folke/flash.nvim',
  opts = {
    -- label = {
    --   rainbow = {
    --     enabled = true,
    --     -- number between 1 and 9
    --     shade = 5,
    --   },
    -- },
    modes = {
      -- options used when flash is activated through
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = {
        -- by default all keymaps are enabled, but you can disable some of them,
        -- by removing them from the list.
        -- If you rather use another key, you can map them
        -- to something else, e.g., { [";"] = "L", [","] = H }
        keys = { 'f', 'F', 't', 'T', ']', '[' },
        ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
        -- The direction for `prev` and `next` is determined by the motion.
        -- `left` and `right` are always left and right.
        char_actions = function(motion)
          return {
            [']'] = 'next', -- set to `right` to always go right
            ['['] = 'prev', -- set to `left` to always go left
            -- clever-f style
            [motion:lower()] = 'next',
            [motion:upper()] = 'prev',
          }
        end,
      },
    },
  },
}
