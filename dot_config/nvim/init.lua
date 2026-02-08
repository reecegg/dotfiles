-- Globally load the nlog module
if _G.nlog then
    print("Warning: 'nlog' is already defined in the global scope. Overwriting it.")
end
_G.nlog = require("nlog")
nlog.log("Starting Neovim...")

-- Fundamental mapping required before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load core configuration
require("config.core")

-- Load plugins
require("config.lazy")
