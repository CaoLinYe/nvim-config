function _G.cocos_refrush () 
	vim.cmd("wa")
    vim.fn.system("curl -s http://192.168.1.54:7456/asset-db/refresh")
end

local function copy_path()
  -- local path = vim.fn.expand("%:p")
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
end

vim.api.nvim_create_user_command("CopyPath", copy_path, {})
