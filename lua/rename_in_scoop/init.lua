local M = {}

function M.setup()
  local ts = vim.treesitter

  local function rename_in_function()
    local node = ts.get_node()
    if not node then return end

    while node
      and node:type() ~= "function_definition"
      and node:type() ~= "function_declaration"
      and node:type() ~= "method_definition"
    do
      node = node:parent()
    end

    if not node then
      print("No function node found")
      return
    end

    local start_row, _, end_row, _ = node:range()

    local old = vim.fn.expand("<cword>")
    local new = vim.fn.input("Rename '" .. old .. "' to: ")

    if new == "" then return end

    vim.cmd(string.format(
      "%d,%ds/\\<%s\\>/%s/g",
      start_row + 1,
      end_row + 1,
      old,
      new
    ))
  end

  vim.api.nvim_create_user_command("ScopedRename", rename_in_function, {})
end

return M

