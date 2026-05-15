
---

# **rename-in-scoop.nvim**  
Scoped symbol renaming inside the current function using Treesitter.

A tiny Neovim plugin that lets you rename a symbol **only inside the function you’re currently in**, without touching the rest of the file and without relying on LSP rename scope. Perfect for quick refactors, local variable cleanup, or avoiding LSP‑wide renames.

---

## ✨ Features

- Rename a symbol **only inside the current function**
- Uses Treesitter to detect the function boundaries
- Works in any language with Treesitter function nodes
- Zero dependencies
- One simple command: **`:ScopedRename`**

---

## 📦 Installation

### **lazy.nvim**

```lua
{
  "alexphoenix42/rename-in-scoop.nvim",
  config = function()
    require("rename_in_scoop").setup()
  end,
}
```

---

## 🚀 Usage

Place your cursor on the symbol you want to rename, anywhere inside a function, then run:

```
:ScopedRename
```

You’ll be prompted for the new name.  
Only occurrences **inside the current function** will be changed.

---

## 🧠 How it works

The plugin:

1. Uses Treesitter to find the nearest parent function node  
2. Extracts its start and end lines  
3. Prompts you for a new name  
4. Performs a scoped substitution inside that range  

This avoids LSP rename scope and gives you precise, local control.

---

## 🛠️ Example

Before:

```lua
local x = 10
print(x)
```

After running `:ScopedRename` on `x` → `count`:

```lua
local count = 10
print(count)
```

Only inside the function — nowhere else.

Absolutely — here’s an updated, polished README section that includes a **keyboard shortcut example** using `<leader>F2`. It’s clean, conventional, and exactly what Neovim users expect.

You can drop this directly into your README.

---

## ⌨️ Keymap (optional)

If you want a convenient shortcut for scoped renaming, add this to your Neovim config:

```lua
vim.keymap.set("n", "<leader>F2", "<cmd>ScopedRename<CR>", { desc = "Scoped Rename" })
```

This binds:

- **`<leader>F2`** → run `:ScopedRename`
- Works in normal mode
- Shows up in which‑key (if installed)

Users can of course change it to whatever they prefer.

---

## 🗺️ Supported languages

Any language where Treesitter exposes one of these node types:

- `function_definition`
- `function_declaration`
- `method_definition`

If your language uses different node names, feel free to open an issue or PR.

---

## 🤝 Contributing

PRs, issues, and feature requests are welcome.  
If you want support for more Treesitter node types or languages, just ask.

---

## 📜 License

## License
This project is licensed under the GNU General Public License v3.0 — see the [LICENSE](LICENSE) file for details.

---
