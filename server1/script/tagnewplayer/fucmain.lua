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
		Talk(1, "", "���������ڰ���ƽ����ƵĶ���! .");
		return
	end
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> �����ѡ����";
	if (CheckObject() == 1) then
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) == 1) then
			tinsert(tbOpp,"������ȡ������������120���Ľ���/GetLevel120"); --�� ������һ��, ����Ϊ120��
		end
	end
	if (CheckObject() == 2) then
		local IsQ, IsFQ = GetCurQuest()
		if(IsQ == 0) then
			tinsert(tbOpp,"����ӵ�һ��������/AcceptFirstQuest");
		end
		
		if (IsQ == 1) then
			if (IsFQ == 0) then
				tinsert(tbOpp,"���뿴�ѽ�����/ReviewCurQuest");
				tinsert(tbOpp,"������ɵ�һ��������/FinishFirstQuest");
			elseif (IsFQ == 1) then
				tinsert(tbOpp,"����ӵڶ���������/GetSecondQuest");
			end		
		end
		
		if (IsQ == 2) then
			if (IsFQ == 1) then
				tinsert(tbOpp,"���뿴�ѽ�����/ReviewCurQuest");
				tinsert(tbOpp,"������ɵڶ���������/FinishSecondQuest");
			elseif (IsFQ == 2) then
				tinsert(tbOpp,"����ӵ�����������/GetThirdQuest");
			end	
		end
		
		if (IsQ == 3) then
			if (IsFQ == 2) then
				tinsert(tbOpp,"���뿴�ѽ�����/ReviewCurQuest");
				tinsert(tbOpp,"������ɵ�����������/FinishThirdQuest");
			end	
		end
		
	end
	if (CheckObject() == 3 and CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) == 1) then
		tinsert(tbOpp,"������ȡ������165���Ľ���/GetLevel165");--δ����������165��
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) == 1) then
			tinsert(tbOpp,"������ȡ��װ������/GetItemTim");
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) == 1) then
			tinsert(tbOpp,"������ȡ����װ������/GetItemAnBang");
	end
	tinsert(tbOpp,"������ȡ�ɼ���/GetBonusThanhTich_main");
	tinsert(tbOpp,"������ȡÿ�ս�/BonusEveryDay");
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 

