
Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	if PlayerFunLib:CheckLevel(80,"default",">=") ~= 1 then
		return 1
	end
	PlayerFunLib:AddSkillState(966,1,3,10886400,1)
	PlayerFunLib:AddSkillState(979,1,3,10886400,1)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."使用一纪乾坤符".."\t".. GetAccount().."\t"..GetName())
end
