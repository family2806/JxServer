Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\func_itembonusweekly.lua");
Include("\\script\\tagnewplayer\\func_itemtim.lua");
Include("\\script\\tagnewplayer\\func_itemanbang.lua");
Include("\\script\\tagnewplayer\\bonusEXP.lua");
Include("\\script\\tagnewplayer\\func_bonusthanhtich.lua");
Include("\\script\\tagnewplayer\\func_quest180.lua");



function NWP_main()
do return end
	if (IsCode()~=1) then
		Talk(1, "", "大侠不属于安邦黄金令牌的对象! .");
		return
	end
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> 请大侠选择奖励";
	if (CheckObject() == 1) then
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) == 1) then
			tinsert(tbOpp,"我想领取重生后升级成120级的奖励/GetLevel120"); -- 已重生一次, 升级为120级
		end
	end
	if (CheckObject() == 2) then
		local IsQ, IsFQ = GetCurQuest()
		if(IsQ == 0) then
			tinsert(tbOpp,"我想接第一连环任务/AcceptFirstQuest");
		end
		
		if (IsQ == 1) then
			if (IsFQ == 0) then
				tinsert(tbOpp,"我想看已接任务/ReviewCurQuest");
				tinsert(tbOpp,"我已完成第一连环任务/FinishFirstQuest");
			elseif (IsFQ == 1) then
				tinsert(tbOpp,"我想接第二连环任务/GetSecondQuest");
			end		
		end
		
		if (IsQ == 2) then
			if (IsFQ == 1) then
				tinsert(tbOpp,"我想看已接任务/ReviewCurQuest");
				tinsert(tbOpp,"我已完成第二连环任务/FinishSecondQuest");
			elseif (IsFQ == 2) then
				tinsert(tbOpp,"我想接第三连环任务/GetThirdQuest");
			end	
		end
		
		if (IsQ == 3) then
			if (IsFQ == 2) then
				tinsert(tbOpp,"我想看已接任务/ReviewCurQuest");
				tinsert(tbOpp,"我已完成第三连环任务/FinishThirdQuest");
			end	
		end
		
	end
	if (CheckObject() == 3 and CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) == 1) then
		tinsert(tbOpp,"我想领取升级成165级的奖励/GetLevel165");--未重生，升级165级
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) == 1) then
			tinsert(tbOpp,"我想领取紫装备奖励/GetItemTim");
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) == 1) then
			tinsert(tbOpp,"我想领取安邦装备奖励/GetItemAnBang");
	end
	tinsert(tbOpp,"我想领取成绩奖/GetBonusThanhTich_main");
	tinsert(tbOpp,"我想领取每日奖/BonusEveryDay");
	tinsert(tbOpp, "<#>Tho竧/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 

