function _G.cocos_refrush () 
	vim.cmd("wa")
    vim.fn.system("curl -s http://192.168.1.54:7456/asset-db/refresh")
end
