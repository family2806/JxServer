Include("\\script\\tong\\tong_header.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\event\\vng\\MergeServer201105\\head.lua")

tbItemBonus_TongCityWar = 
{
	{szName = "�i����ֵ", nExp_tl = 20000000},
	{szName ="����ս���",tbProp={6,1,2377,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="Ѫս����",tbProp={6,1,2212,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="���з�",tbProp={6,1,1266,1,0,0},nExpiredTime=10080, nCount = 1},
}
function GetBonus_CityTongWar()
do return end
	if checkBangHuiLimit() == 0 then
			Say("�Բ��𣬴���δ�����κΰ��",0);
			return
	end
	if (MergerSV_TongGetBonusCitywar_Time() ~= 1) then
		Say("�Բ���Ŀǰ���ʺ��콱",0);
		return
	end
	if (Check_PlayerObj() ~= 1) then
		Say("�Բ��𣬴����ĵȼ����ʺ��콱!",0);
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_TongCityWar_Date,1,"�Բ��𣬸ý���ÿ��ֻ����ȡһ��!","<") ~= 1) then
		return
	end
	if (GetJoinTongTime() < 60*24) then
		Talk(1,"","�����Ǹռ�������ˣ����Բ����콱!")
		return
	end
	if (GetTask(Task_TongCityWar_Bonus) >=  4) then
		Say("�Բ��𣬸ý������ֻ����4��!",0);
		return
	end
	if (CalcFreeItemCellCount() <10) then
		Say("�Բ��𣬴�����װ������10����λ!",0);
		return
	end
	if (Check_CityTongWar() ==1) then
		PlayerFunLib:AddTaskDaily(Task_TongCityWar_Date,1)
		SetTask(Task_TongCityWar_Bonus, GetTask(Task_TongCityWar_Bonus) + 1)
		tbAwardTemplet:GiveAwardByList(tbItemBonus_TongCityWar, "MergerSV_201010");
	else
		Say("�Բ��𣬴����İ��û��ռ�κγ���!",0);
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