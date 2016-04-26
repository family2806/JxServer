Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\bonusvlmc\\func_check.lua");
Include("\\script\\bonusvlmc\\func_quest999.lua");
Include("\\script\\bonusvlmc\\vlmc_main.lua");

function VLMC_main()
	local tbOpp = {}
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	
	ResetTaskGiveQuest()
	
	local str1 = "<#> һ��ɳ�����ܽ���ɳĮ����Ȼ���书����������Ҫͳһ���֣������λӢ�ۺ��ܵĶ���������";
	local str2 = "<#> ����ֻ��һ˲�䣬���ǣ�����һ˲�䣬���ǿ��Խ������õ���ҵ!";
	
--	if (GetTask(VLMC_Task_IsQuest) == 0) then
--		tinsert(tbOpp,"����������[������Σ]/AcceptQuest");
--	end
--	
--	if (GetTask(VLMC_Task_IsQuest) == 1 and GetTask(VLMC_Task_IsFinishQuest) ~= 1) then
--		tinsert(tbOpp,"�����������[������Σ]/FinishQuest");
--		tinsert(tbOpp,"����������/ReviewQuest");
--	end
	
	if (GetGlbValue(GlbVar1)== 1 and GetTask(TSK_Get2ExpTK)~= nCurrDate ) then
		tinsert(tbOpp,"���ν�ս��˫�����ֽ���/Get2xExpTK");
	end	
	
	if (GetGlbValue(GlbVar2)== 1 and GetTask(TSK_GetBonusEXP)== 0 ) then
		tinsert(tbOpp,"�մ��˫�����ֽ���/GetEXPBonus");
	end
	
	if (GetGlbValue(GlbVar1) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_TK) == 0 ) then
			tinsert(tbOpp,"�䷢�ν�˫������/AcceptEXPBonusTK");
		end
	end
	
	if (GetGlbValue(GlbVar2) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_x2EXP) == 0 ) then
			tinsert(tbOpp,"�䷢���˫������/AcceptActiveX2EXP");
		end
	end
	
	tinsert(tbOpp, "<#>�˳�/OnCancel")
	if ( Is_VLMC() == 0 ) then
		Say( str1, getn( tbOpp ), tbOpp )
		return
	end;
	Say( str2, getn( tbOpp ), tbOpp )	
end

function OnCancel()
end 

