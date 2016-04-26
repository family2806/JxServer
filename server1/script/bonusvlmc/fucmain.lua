Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\bonusvlmc\\func_check.lua");
Include("\\script\\bonusvlmc\\func_quest999.lua");
Include("\\script\\bonusvlmc\\vlmc_main.lua");

function VLMC_main()
	local tbOpp = {}
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	
	ResetTaskGiveQuest()
	
	local str1 = "<#> 一颗沙粒不能建成沙漠。虽然我武功盖世，但是要统一武林，还需各位英雄豪杰的鼎力相助！";
	local str2 = "<#> 生活只是一瞬间，但是，用这一瞬间，人们可以建造永久的事业!";
	
--	if (GetTask(VLMC_Task_IsQuest) == 0) then
--		tinsert(tbOpp,"我来接任务[救困扶危]/AcceptQuest");
--	end
--	
--	if (GetTask(VLMC_Task_IsQuest) == 1 and GetTask(VLMC_Task_IsFinishQuest) ~= 1) then
--		tinsert(tbOpp,"我已完成任务[救困扶危]/FinishQuest");
--		tinsert(tbOpp,"看任务详情/ReviewQuest");
--	end
	
	if (GetGlbValue(GlbVar1)== 1 and GetTask(TSK_Get2ExpTK)~= nCurrDate ) then
		tinsert(tbOpp,"收宋金战场双倍积分奖励/Get2xExpTK");
	end	
	
	if (GetGlbValue(GlbVar2)== 1 and GetTask(TSK_GetBonusEXP)== 0 ) then
		tinsert(tbOpp,"收打怪双倍积分奖励/GetEXPBonus");
	end
	
	if (GetGlbValue(GlbVar1) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_TK) == 0 ) then
			tinsert(tbOpp,"颁发宋金双倍积分/AcceptEXPBonusTK");
		end
	end
	
	if (GetGlbValue(GlbVar2) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_x2EXP) == 0 ) then
			tinsert(tbOpp,"颁发打怪双倍积分/AcceptActiveX2EXP");
		end
	end
	
	tinsert(tbOpp, "<#>退出/OnCancel")
	if ( Is_VLMC() == 0 ) then
		Say( str1, getn( tbOpp ), tbOpp )
		return
	end;
	Say( str2, getn( tbOpp ), tbOpp )	
end

function OnCancel()
end 

