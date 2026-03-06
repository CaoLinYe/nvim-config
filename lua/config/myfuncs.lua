function _G.cocos_refrush () 
    local result = vim.fn.system("curl http://192.168.1.54:7456/asset-db/refresh")
    print(result)
end
