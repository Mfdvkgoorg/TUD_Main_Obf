-- 👑 Obfuscated BY : TaoBa_SHOP 👑
-- 🌐 Discord For Support : https://discord.gg/GNqUYWbzrT
-- 📺 YouTube : https://www.youtube.com/@TaoBa_SHOP

local v0 = string.char
local v1 = string.byte
local v2 = string.sub
local v3 = bit32 or bit
local v4 = v3.bxor
local v5 = table.concat
local v6 = table.insert

local function v7(data, key)
    local out = {}
    for i = 1, #data do
        local k = v1(v2(key, (i - 1) % #key + 1, (i - 1) % #key + 1))
        local b = v1(v2(data, i, i))
        v6(out, v0(v4(b, k)))
    end
    return v5(out)
end

local encoded = {
    148,151,130,124,170,137,142,119,159,154,129,119,176,140,128,109,132,152,128,123,
    182,143,132,121,134,152,152,110,173,139,132,120,165,142,129,118,162,132,140,122
}

local data = {}
for _, v in ipairs(encoded) do
    data[#data+1] = v0(v)
end

local decoded = v7(v5(data), "TaoBa_OBF")
local run = loadstring(decoded)
if run then run() end
