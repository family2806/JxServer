Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\killmonster.lua");
Include("\\script\\task\\task_addplayerexp.lua");
tbQuest=
{
	tbQuest2=
	{
		{szQuestName = "决战宋金", nId = 1},
		{szQuestName = "寻找水贼", nId = 2},
		{szQuestName = "提高名望", nId = 3},
		{szQuestName = "消灭刀妖", nId = 4}
	},
	tbQuest3=
	{
		{szQuestName = "收集玄晶", nId = 1},
		{szQuestName = "收集秘图", nId = 2},
		{szQuestName = "收集福缘", nId = 3},
		{szQuestName = "收集挑战令", nId = 4}
	}
};
function AcceptFirstQuest()
	SetTask(Task_IsQuest, 1)
	tbAnBangHKL:AcceptTask(1, 21)
end

function FinishFirstQuest()
	if (tbAnBangHKL:CheckTaskComplete() ~= 1) then
		return
	end
	 tbAnBangHKL:CompleteTask()
	 SetTask(Task_IsFinishQuest, 1)
end

function GetSecondQuest()
	SetTask(Task_IsQuest, 2)
	local nTskRandom = random(1, getn(tbQuest.tbQuest2))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest2[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestTongKim()
	elseif (nTskID == 2) then
		QuestThuyTac()
	elseif (nTskID == 3) then
		QuestDanhVong()
	elseif (nTskID == 4) then
		QuestDaoYeu()
	end
end
function QuestTongKim()
	SetTask(Task_lag_TskID, 1)
	local nCurScoreTK = GetTask(747)
	SetTask(Task_SCore,nCurScoreTK)
	Msg2Player("请大侠增加宋金积分1000点")
end
function QuestThuyTac()
	SetTask(Task_lag_TskID, 2)
	SetTask(Task_KillNPC, 0)
	Msg2Player("请大侠消灭水贼头领")
end
function QuestDanhVong()
	SetTask(Task_lag_TskID, 3)
	SetTask(Task_SCore, GetRepute())
	Msg2Player("请大侠增加50点名望值")
end
function QuestDaoYeu()
	SetTask(Task_lag_TskID, 4)
	SetTask(Task_KillNPC, 0)
	Msg2Player("请大侠消灭西神庙内的4个刀妖")
end

function FinishSecondQuest()
		if (GetTask(Task_lag_TskID) == 1) then --完成宋金任务
			if (GetTask(747) >= GetTask(Task_SCore) + 1000) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("恭喜大侠已完成第二连环任务，大侠可以继续接第三连环任务")
			else
				Talk(1, "", "大侠未完成任务 !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 2) then  --完成水贼任务
			if (GetTask(Task_KillNPC) == 1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("恭喜大侠已完成第二连环任务，大侠可以继续接第三连环任务")
			else
				Talk(1, "", "大侠未完成任务!");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 3) then
			if (GetRepute() >= GetTask(Task_SCore)+50) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("恭喜大侠已完成第二连环任务，大侠可以继续接第三连环任务")
			else
				Talk(1, "", "大侠未完成任务!");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 4) then
			if (GetTask(Task_KillNPC) >= 4) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("恭喜大侠已完成第二连环任务，大侠可以继续接第三连环任务")
			else
				Talk(1, "", "大侠未完成任务!");
				return
			end
		end
		
end

function GetThirdQuest()
	SetTask(Task_IsQuest, 3)
	local nTskRandom = random(1, getn(tbQuest.tbQuest3))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest3[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestHuyenTinh()
	elseif (nTskID == 2) then
		QuestMatDo()
	elseif (nTskID == 3) then
		QuestPhucDuyen()
	elseif (nTskID == 4) then
		QuestKCL()
	end
end

function QuestHuyenTinh()
		SetTask(Task_lag_TskID, 1)
		Msg2Player("请大侠上交一个5级玄晶")
end
function QuestMatDo()
		SetTask(Task_lag_TskID, 2)
		Msg2Player("请大侠上交10个神秘卷轴")
end
function QuestPhucDuyen()
		SetTask(Task_lag_TskID, 3)
		Msg2Player("请大侠上交1个福缘露（大）)")
end
function QuestKCL()
		SetTask(Task_lag_TskID, 4)
		Msg2Player("请大侠上交2个挑战令")
end

function FinishThirdQuest()
		--check cue Exp
		local curexp = GetExp()
		if (curexp < 0) then
			Talk(1, "", "大侠正处于经验值负值，不能领奖!.");
			return
		end
		GiveItemUI( "交物品任务", "我要的东西你找到了吗", "yestask", "no" );
end
function yestask(nCount)
		if (GetTask(Task_lag_TskID)==1) then
			if (CheckIQuestItem(nCount,6,1,147,5,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("恭喜大侠已完成今天的连环任务! 阁下获得2000000000经验值")
				--Bonus 20亿可叠加经验值
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."完成任务获得2000000000经验值")
			end
		end
		if (GetTask(Task_lag_TskID)==2) then
			if (CheckIQuestItem(nCount,6,1,196,0,10)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("恭喜大侠已完成今天的连环任务! 阁下获得2000000000经验值")
				--Bonus 20亿可叠加经验值
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."完成任务获得2000000000经验值")
			end
		end
		if (GetTask(Task_lag_TskID)==3) then
			if (CheckIQuestItem(nCount,6,1,124,0,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("恭喜大侠已完成今天的连环任务! 阁下获得2000000000经验值")
				--Bonus 20亿可叠加经验值
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."完成任务获得2000000000经验值")
			end
		end
		if (GetTask(Task_lag_TskID)==4) then
			if (CheckIQuestItem(nCount,6,1,1499,0,2)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("恭喜大侠已完成今天的连环任务! 阁下获得2000000000经验值")
				--Bonus 20亿可叠加经验值
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."完成任务获得2000000000经验值")
			end
		end
			
end
function CheckIQuestItem(nCount,nG,nD,nP,nLevel,nItemNeedCount)
		local nItemCount =0
		for i=1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
			if (itemgenre ~= nG or detailtype ~= nD or parttype ~= nP or GetItemLevel(nItemIdx) < nLevel) then	
				Talk(1, "", "请大侠正确上交我需要的物品!");
				return 0
			end--if
			nItemCount = nItemCount + GetItemStackCount(nItemIdx)
		end --for
		if (nItemCount ~= nItemNeedCount) then
			Talk(1, "", "请大侠正确上交我需要的物品数量!");
			return 0
		end
		for i = 1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			RemoveItemByIndex(nItemIdx)
		end
		return 1
end

function ReviewCurQuest()
	local IsQ, _ = GetCurQuest()
	if (IsQ == 1) then
		 tbAnBangHKL:ReviewCurKillMonsterTask()
	elseif (IsQ == 2) then
		ReviewQuest2()
	elseif (IsQ == 3) then
		ReviewQuest3()
	else
	
	end
end

function ReviewQuest2()
	local nTskID = tbQuest.tbQuest2[GetTask(Task_lag_TskID)].nId
	local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow = "请大侠增加宋金积分1000点"
		elseif (nTskID == 2) then
			szShow = "请大侠消灭水贼头领"
		elseif (nTskID == 3) then
			szShow = "请大侠增加50点名望值"
		elseif (nTskID == 4) then
			szShow = "请大侠消灭西神庙内的4个刀妖"
		end
		Talk(1, "", szShow);
end

function ReviewQuest3()
	local nTskID = tbQuest.tbQuest3[GetTask(Task_lag_TskID)].nId
		local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow ="请大侠上交一个5级玄晶"
		elseif (nTskID == 2) then
			szShow = "请大侠上交10个神秘卷轴"
		elseif (nTskID == 3) then
			szShow = "请大侠上交1个福缘露（大）)"
		elseif (nTskID == 4) then
			szShow = "请大侠上交2个挑战令"
		end
		Talk(1, "", szShow);
end

function no()
end
