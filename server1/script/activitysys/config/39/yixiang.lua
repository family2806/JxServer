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
--By: NgaVN -- 使用异香玫瑰和红豆物品最多30个
	if pActivity:CheckTaskDaily(TSK_AWARD_USE_TIME, 30, "使用异香玫瑰和红豆已达上限","<") ~= 1 then
		return 1
	end
	pActivity:AddTaskDaily(TSK_AWARD_USE_TIME, 1)
--By: NgaVN -- 3.000.000 经验值
	local tbAward = {
		--{szName="玄晶",tbProp={6,1,147,1,0,0},nExpiredTime=20120301,},
		--{nJxb = 1},
		{szName = "经验值", nExp=3000000};
		}
	
	tbAwardTemplet:Give(tbAward, 1, {EVENT_LOG_TITLE, "use meiguiyixiang"})
end