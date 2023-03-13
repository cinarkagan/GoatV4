local function goatGithubRequest(scripturl)
	if not isfile("goat/"..scripturl) then
		local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/cinarkagan/GoatV4/"..readfile("goat/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then return nil end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("goat/"..scripturl, res)
	end
	return readfile("goat/"..scripturl)
end

shared.CustomSavegoat = 8542275097
if pcall(function() readfile("goat/CustomModules/8542275097.lua") end) then
	loadstring(readfile("goat/CustomModules/8542275097.lua"))()
else
	local publicrepo = goatGithubRequest("CustomModules/8542275097.lua")
	if publicrepo then
		loadstring(publicrepo)()
	end
end