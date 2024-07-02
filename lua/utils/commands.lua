local M = {}
local notes_dir = '~/Documents/Notes/'
local function open_note_file(file_name, path)
  vim.cmd('e ' .. notes_dir .. path .. file_name .. '.md')
end

M.Today = function()
  -- local today = os.date('%Y-%m-%d')
  local today = os.date('%Y-%m-%d')
  local dir = os.date('01 Journal/%Y/%m-%B/')
  local year = os.date('%Y')
  local month = os.date('%B')
  -- local dir = '01 Journal/' .. year .. '/' .. month .. '/'
  open_note_file(today, dir)
end

M.InboxNote = function()
  open_note_file('Inbox', '')
end

M.NewNote = function()
  local today = os.date('%Y%m%d%H%M')
  vim.ui.input({ prompt = 'Note Title' }, function(res)
    if res == nil or res == '' then
      open_note_file(today, '00 Inbox/')
    else
      open_note_file(res, '00 Inbox/')
    end
  end)
end

M.WorkInbox = function()
  open_note_file('Work Inbox', '03 Work/')
end

M.SearchNotes = function()
  require('telescope.builtin').live_grep({
    cwd = notes_dir,
  })
end

M.FindNotes = function()
  require('telescope.builtin').find_files({
    cwd = notes_dir,
  })
end

M.LuaScratch = function()
  local scratch = '~/Code/Testing/scratch.lua'
  vim.cmd('e ' .. scratch)
end

require('utils.helpers').create_commands(M)
