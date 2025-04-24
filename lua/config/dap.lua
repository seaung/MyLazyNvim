local M = {}

function M.setup()
  local dap = require("dap")
  local dapui = require("dapui")
  local dapgo = require("dap-go")

  dapui.setup()

  -- 打开dap
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  -- 关闭dap
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  -- dap退出时关闭
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dapgo.setup()

  -- dap调试快捷键配置
  vim.keymap.set("n", "<leader>dc", function()
    dap.continue()
  end, { desc = "继续执行" })
  vim.keymap.set("n", "<leader>db", function()
    dap.toggle_breakpoint()
  end, { desc = "切换断点" })
  vim.keymap.set("n", "<leader>du", function()
    dapui.toggle()
  end, { desc = "切换dap ui" })
  vim.keymap.set("n", "<leader>di", function()
    dap.step_into()
  end, { desc = "步入操作" })
  vim.keymap.set("n", "<leader>do", function()
    dap.step_out()
  end, { desc = "步出操作" })
  vim.keymap.set("n", "<leader>doo", function()
    dap.step_over()
  end)
  vim.keymap.set("n", "<leader>dr", function()
    dap.restart()
  end, { desc = "重启DAP" })
  vim.keymap.set("n", "<leader>dq", function()
    dap.terminate()
  end, { desc = "退出DAP" })

  -- 图标配置
  vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })
end

return M
