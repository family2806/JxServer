Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	PlayerFunLib:AddSkillState(980,2,3,46656000,1)--18*60*60*24*30=46656000 30Ìì
	PlayerFunLib:AddSkillState(966,2,3,46656000,1)--18*60*60*24*30=46656000 30Ìì
	WriteLog(date("%Y%m%d %H%M%S").."\t".." sö dông cµn kh«n song tuyÖt ".."\t".. GetAccount().."\t"..GetName())
end

