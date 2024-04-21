> This plugin is in super early development

# Markdown Actions

This plugin was born because I wrote a lot of documentation, I like doing it in the terminal, keep things simple, I don't like switching apps, going for the terminal to obsidian for example is just a waste of time. But I also want some modern features that those program offers.

- First is making a TOC (Table of contents)
- Second is check item in a list

This are the two first actions that are included in this plugin.

To install this plugin with Lazy, you can do

```
{
    "batmikun/mactions.nvim",
    config = function()
        local mk = require('mactions')

        vim.keymap.set("n", <leader>mtc, mk.generate_toc())
        vim.keymap.set("n", <leader>mti, mk.toggle_item_list())
    end
}
```

Function included in the module are:

1. `generate_toc()`
2. `toggle_item_list()`

I don't know what are gonna be the next
