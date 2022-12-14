local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }

local filetype = {
    "filetype",
    icons_enabled = false,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
    padding = 0,
}

local fileformat = {
    "fileformat",
    icons_enabled = true,
    symbols = {
        unix = "LF",
        dos = "CRLF",
        mac = "CR",
    }
}

local filename = {
    "filename",
    path = 1,
    color = { fg = '#ff9e64', gui = 'bold' }
}

-- center stuff
local pad = function()
    return '%='
end

-- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

local spaces = function()
    return "s: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { diagnostics },
        lualine_b = { branch, diff },
        lualine_c = { pad, filename },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        -- lualine_x = { diff, spaces, "encoding", "fileformat", filetype },
        lualine_x = { spaces, "encoding", fileformat, filetype },
        lualine_y = {},
        lualine_z = { location },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { pad, "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    winbar = {},
    inactive_winbar = {},
    tabline = {},
    extensions = {},
})
