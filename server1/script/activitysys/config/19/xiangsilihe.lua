Include("\\script\\activitysys\\config\\19\\extend.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\19\\valentinehead.lua")

function main()
	if IsInValentine() ~= 1 then
		return
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1 
	end
	
	if pActivity:CheckTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,1000000000,"通过玫瑰礼盒以及相思礼盒获得总经验已达到上限","<") ~= 1 then
		return 1
	end
	
	
	local tbAward = 
	{
		{nExp_tl = 3000000},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "2011情人节, 打开相思礼盒获得经验")
	pActivity:AddTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,3000000)
	
end