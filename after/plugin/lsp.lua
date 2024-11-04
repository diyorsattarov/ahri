local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Configure Java LSP
lspconfig.jdtls.setup({
    cmd = { "jdtls" },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    filetypes = { "java" },  -- Restrict jdtls to Java files only
    settings = {
        java = {}
    },
    init_options = {
        bundles = {}
    }
})

-- Configure C++ LSP (using clangd)
lspconfig.clangd.setup({
    cmd = { "clangd" },
    filetypes = { "cpp", "c", "objc", "objcpp" },  -- Specify C and C++ file types
    root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", "compile_flags.txt", "Makefile"),
})

