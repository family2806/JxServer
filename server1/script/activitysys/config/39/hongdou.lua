Include("\\script\\activitysys\\config\\39\\extend.lua")
Include("\\script\\activitysys\\config\\39\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\39\\seed.lua")

function main()
	if tbValenTree:IsDuring() ~= 1 then
		return 1
	end
	if PlayerFunLib:CheckTotalLevel(120,"default",">=") ~= 1 then
		return 1
	end
	if PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 then
		return 1
	end 
--By: NgaVN -- ÔÚÕû¸ö»î¶¯ÆÚ¼ä£¬Ê¹ÓÃÒìÏã»¨ºÍºì¶¹×î¶àÊ¹ÓÃ30ÎïÆ·		
	if pActivity:CheckTaskDaily(TSK_AWARD_USE_TIME, 30, "Sö dông DŞ H­¬ng Hoa Hång vµ §Ëu Hång ®· ®¹t ®Õn giêi h¹n","<") ~= 1 then
		return 1
	end
	pActivity:AddTaskDaily(TSK_AWARD_USE_TIME, 1)
--By: NgaVN - 2.000.000 ¾­ÑéÖµ
	local tbAward = {
		--{szName="HuyÒn tinh",tbProp={6,1,147,1,0,0},nExpiredTime=20120301,},
		--{nJxb = 1},
		{szName = "§iÓm kinh nghiÖm", nExp=2000000};
		}
	
	tbAwardTemplet:Give(tbAward, 1, {EVENT_LOG_TITLE, "use hongdouguo"})
end