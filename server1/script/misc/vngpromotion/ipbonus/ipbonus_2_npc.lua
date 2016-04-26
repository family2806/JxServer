Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")

function IpBonus()
	local nPromotionSay = {	}
	
	tinsert(nPromotionSay,"我想看在线时间/ShowTimeNow")
	tinsert(nPromotionSay,"领取蓝宝盒奖励/GetBonusGreenItem")	
	tinsert(nPromotionSay,"领取黄宝盒奖励/GetBonusYellowItem")	
	--tinsert(nPromotionSay,"领取双倍经验奖励/GetBonusExp")	
	tinsert(nPromotionSay,"领取宋金1.5倍奖励/GetTongKimBonus")	
	tinsert(nPromotionSay,"在下只是路过!/OnCancel")
	
	Say("当日，只需要大侠在线4小时，设置CSM将获得<color=red>1 蓝宝盒<color>. 大侠离线、委托在线或者委托离线的情况将不算。此外，大侠可以在1小时领取双倍奖励",getn(nPromotionSay),nPromotionSay)
end;

function ShowTimeNow()
	if CheckIPBonus() == 0 then
		Say("目前大侠不能看信息，请稍候再试!",0)
		return
	end
	IpBonus_Close()	
	local nHour, nMin, nSec = ShowTime()
	local nHour2, nMin2, nSec2 = ShowTimeYellowBox()
	local strMsg = format("在线设置CSM可以转换蓝宝盒的时间为%d小时%d分钟%d秒.<enter>总的在线时间：%d 小时%d 分%d 秒",nHour, nMin, nSec,nHour2, nMin2, nSec2)
	IpBonus_Start()
	Talk(1,"IpBonus",strMsg)
end

function GetBonusGreenItem()
	if CheckIPBonus() == 0 then
		Say("目前大侠不能领奖，请稍候再试!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
		
	if GetTask(TASKID_GET_TIMES) >= 6 then
		Say("大侠今天已领6次奖励了，明天再来吧",0)
		return
	end	
	
	local nHour, nMin, nSec = ShowTime()
	if nHour < 4 then
		Say("大侠不足4个小时的在线时间!",0)
		return
	end	
	
	if CalcFreeItemCellCount() < 2 then
		Say("大侠的装备不够2空位!",0)
		return
	end
	
	if IpBonus_Minus(4*60*60) == 1 then	
		SetTask(TASKID_GET_TIMES,GetTask(TASKID_GET_TIMES) + 1);
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30000,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);	
		SetItemBindState(nItemIndex, -2);
		Say("恭喜大侠获得1蓝宝盒.");
		Msg2Player("你获得1蓝宝盒.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","领取蓝宝盒",GetAccount(),GetName()))		
	end
end;

function GetBonusYellowItem()
	if CheckIPBonus() == 0 then
		Say("目前大侠不能领奖，请稍候再来!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 0 then
		Talk(1, "", "大侠已领该奖.")
		return
	end
	if IsCharged() == 0 then
		Talk(1, "", "需充值才能领奖.")
		return
	end
	
	if GetLevel() < 130 and  ST_IsTransLife() < 1 then
		Talk(1, "", "未重生需要130级才能领奖.")
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Say("大侠的装备不够2空位!",0)
		return
	end
	
	if IpBonus_Minus_Yellow_Box(50*60*60) == 1 then
		tbVNG_BitTask_Lib:setBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX, 1)
		if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 1 then		
			return
		end
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30001,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);
		SetItemBindState(nItemIndex, -2);
		Say("恭喜大侠获得1个黄宝盒.");
		Msg2Player("您获得一个黄宝盒.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","领取黄宝盒",GetAccount(),GetName()))
	else
		Say("大侠不足领奖条件!",0)
		return
	end
end;

function GetBonusExp()
	if CheckIPBonus() == 0 then
		Say("目前大侠不能领奖，请稍候再试!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
		Say("该奖励只能在每周周五、周六、周日获得，!" ,1,"真是不好意思/OnCancel")
		return
	end

	if GetSkillState(451) > 0 then
		Say("你不是已经领过了吗?" ,1,"真是不好意思/OnCancel")
		return
	end	
		
	AddSkillState(451, 20, 1, 18*60*60);
	Say("恭喜大侠获得双倍经验!");
	Msg2Player("您在60分钟内获得双倍经验效果.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","双倍经验",GetAccount(),GetName()))
end

function GetTongKimBonus()
	if CheckIPBonus() == 0 then
		Say("目前大侠不能领奖，请稍候再试!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	
--	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
--		Say("该奖励只能在每周周五、周六、周日获得，!" ,1,"真是不好意思/OnCancel")
--		return
--	end
	
	if (PlayerFunLib:CheckTaskDaily(TASKID_DAILY_X2TONGKIM,3,"今天大侠已领奖3次了。明天再来吧","<") ~= 1) then
			return
	end
	
	if (GetTask(TASKID_COUNT_X2TONGKIM) ~= 0) then
		Talk(1,"","大侠不是领了吗？快去参加宋金战场!!!!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(TASKID_DAILY_X2TONGKIM,1)
	SetTask(TASKID_COUNT_X2TONGKIM,1)
	Say("恭喜大侠获得1.5倍的宋金奖励!");
	Msg2Player("你获得宋金双倍积分.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","宋金双倍积分",GetAccount(),GetName()))
	
end


function OnCancel()
end;
