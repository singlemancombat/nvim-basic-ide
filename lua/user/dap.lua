local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_go_status_ok, dap_go = pcall(require, "dap-go")
if not dap_go_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

vim.fn.sign_define(
  "DapBreakpoint",
  {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
  })

vim.fn.sign_define(
  "DapStopped",
  {
    text = "▶",
    texthl = "Green",
    linehl = "ColorColumn",
    numhl = "Green",
  })

-- Config for Golang --
dap_go.setup({
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}"
  },
})

-- Config for Python --


-- Config for Java --


-- dap ui settings --

dapui.setup({
  expand_lines = true,
  icons = {
    expanded = "",
    collapsed = "",
    circular = "",
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        id = "repl",
        id = "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    border = "rounded", -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = {
    indent = 1,
  },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  },
})


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({ reset = true })
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
	local repl = dap.repl
	repl.close()
	-- close the remaining windows
	-- vim.api.nvim_command([[exe "normal \<c-w>o"]])
	vim.cmd("stopinsert")
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
	local repl = dap.repl
	repl.close()
	-- vim.api.nvim_command([[exe "normal \<c-w>o"]])
	vim.cmd("stopinsert")
end
