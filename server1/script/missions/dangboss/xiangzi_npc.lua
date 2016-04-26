
local tbAward = 
{
	{nExp = 5e6},
	{
		{szName="一纪乾坤符", tbProp={6, 1, 2126, 1, 0, 0}, nExpiredTime = 60*24*30, nRate = 0.5},
		{nExp = 5e7, nRate = 2},
		{szName="神秘矿石", tbProp={6, 1, 398, 1, 0, 0}, nRate = 1.5},
	
		{szName="天晶白驹丸", tbProp={6, 1, 2183, 1, 0, 0}, nRate = 4},
		{szName="特别白驹丸", tbProp={6, 1, 1157, 1, 0, 0}, nRate = 5, nExpiredTime = 60*24*7},
		
		{szName="黄金之果", tbProp={6, 1, 907, 1, 0, 0}, nRate = 6, nExpiredTime = 60*24*7},
		
		{nExp = 2e7, nRate = 10},
		{szName="洗髓经", tbProp={6, 1, 22, 1, 0, 0}, nRate = 8},
	
		{szName="武林秘籍", tbProp={6, 1, 26, 1, 0, 0}, nRate = 8},
		{nExp = 1e7, nRate = 15},
		
		{szName="8级玄晶矿石", tbProp={6, 1, 147, 8, 0, 0}, nRate = 20},
		{szName="7级玄晶矿石", tbProp={6, 1, 147, 7, 0, 0}, nRate = 20},
	}
}
Include("\\script\\lib\\awardtemplet.lua")
function main()
	local nNpcIndex = GetLastDiagNpc()
	
	if GetNpcParam(nNpcIndex, 4) ~= 1 then
		SetNpcParam(nNpcIndex, 4, 1)
		tbAwardTemplet:GiveAwardByList(%tbAward, "宝箱点")
		DelNpc(nNpcIndex)
	else
		return
	end
end

