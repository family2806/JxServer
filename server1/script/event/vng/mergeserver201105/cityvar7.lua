Include("\\script\\tong\\tong_header.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\event\\vng\\MergeServer201105\\head.lua")

tbItemBonus_TongCityWar = 
{
	{szName = "经验值", nExp_tl = 20000000},
	{szName ="攻城战礼包",tbProp={6,1,2377,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="血战令旗",tbProp={6,1,2212,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="神行符",tbProp={6,1,1266,1,0,0},nExpiredTime=10080, nCount = 1},
}
function GetBonus_CityTongWar()
do return end
	if checkBangHuiLimit() == 0 then
			Say("对不起，大侠未加入任何帮会",0);
			return
	end
	if (MergerSV_TongGetBonusCitywar_Time() ~= 1) then
		Say("对不起，目前不适合领奖",0);
		return
	end
	if (Check_PlayerObj() ~= 1) then
		Say("对不起，大侠的等级不适合领奖!",0);
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_TongCityWar_Date,1,"对不起，该奖励每周只能领取一次!","<") ~= 1) then
		return
	end
	if (GetJoinTongTime() < 60*24) then
		Talk(1,"","大侠是刚加入帮会的人，所以不能领奖!")
		return
	end
	if (GetTask(Task_TongCityWar_Bonus) >=  4) then
		Say("对不起，该奖励最多只能领4次!",0);
		return
	end
	if (CalcFreeItemCellCount() <10) then
		Say("对不起，大侠的装备不足10个空位!",0);
		return
	end
	if (Check_CityTongWar() ==1) then
		PlayerFunLib:AddTaskDaily(Task_TongCityWar_Date,1)
		SetTask(Task_TongCityWar_Bonus, GetTask(Task_TongCityWar_Bonus) + 1)
		tbAwardTemplet:GiveAwardByList(tbItemBonus_TongCityWar, "MergerSV_201010");
	else
		Say("对不起，大侠的帮会没有占任何城市!",0);
		return
	end
end

function MergerSV_TongGetBonusCitywar_Date()
		local nDate = tonumber(GetLocalDate("%Y%m%d"))
		if (nDate > End_TongGetCityWarBonus_Date) then
			return 0
		end
		return 1
end