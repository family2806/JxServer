-------------------------------------------------------------------------
-- FileName		:	honor_master.lua
-- Author		:	zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   排名npc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\task\\system\\task_string.lua" )
Include("\\script\\lib\\awardtemplet.lua")


tbHonor_Sys_2009.nHonor_QuestTime_Task = 2599
tbHonor_Sys_2009.nHonor_QuestChance_Task = 2600 -- 0 没有答题机会了, 1 有一次答题机会, 2 有两次答题机会两, 3 没接任务, 4答对问题可以领奖了 

tbHonor_Sys_2009.tbMasterContent = 
{
	strTalk1 = "<dec><npc>我是这里的堂主，这里设有当代十大高手的雕塑。你可以随便参观，但是，不能弄坏里面任何东西。此外，这里有1个小任务，你想参加吗？",
	strTalk2 = "<dec><npc>这里叫做名人堂，也是给武林中的各大高手封名号的地方，只需要得到世间公认为高手，这里就会有一个让人梦想的雕塑。",
	strTalk3 = "<dec><npc>这个任务很简单，你去观察那些雕塑是谁，然后回来找我，我将问一些问题，回答对的话，奖励就属于你。",
	strTalk4 = "<dec><npc>你走这么快啊？准备好了没有?",
	strTalk5 = "<dec><npc>今天你有<color=green>%d<color> 机会回答问题 <enter>在江湖排名榜<color=yellow>%s<color> 第几个人<color=yellow>%d<color> 是谁?",
	strTalk6 = "<dec><npc>今天已经回答此问题了，请等明天再继续吧.",
	strTalk7 = "<dec><npc>祝贺答案正确!",
	strTalk8 = "<dec><npc>真遗憾！答案不对，明天再来吧",
	strTalk9 = "<dec><npc>恭喜大侠猜对了！但是装备不足空位，请留下<color=green>3<color> 空位，然后再来领取",
	strSelect1 = "请问这里是哪里?/#tbHonor_Sys_2009:master_introduce()",
	strSelect2 = "我想接任务?/#tbHonor_Sys_2009:master_quest()",
	strSelect3 = "问题真是简单，我去去就回来./#tbHonor_Sys_2009:accept_quest()",
	strSelect4 = "我去去就回来/#tbHonor_Sys_2009:doing_quest()",
	strReturn = "我还有一些问题需要问/#tbHonor_Sys_2009:master_main()",
	strCancel1 = "结束对话/#tbHonor_Sys_2009:master_onCancel()",
	strCancel2 = "现在我有一点忙，稍候回来./#tbHonor_Sys_2009:master_onCancel()",
	strCancel3 = "我还有一些其他事情，稍候回来./#tbHonor_Sys_2009:master_onCancel()",
	strCancel4 = "我依然未准备好./#tbHonor_Sys_2009:master_onCancel()",
}

tbHonor_Sys_2009.tb_reward = 
{
    {
        {szName = "仙草露", tbProp={6, 1, 71, 1, 0, 0}, nCount = 3, nBindState = -2}
    }
}
	

function main()
	tbHonor_Sys_2009:master_main()
end

function tbHonor_Sys_2009:master_main()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_introduce()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strReturn;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	local tbTalk = {};
	
	if (nQuestChance == 3) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel2;
	elseif (nQuestChance == 1 or nQuestChance == 2) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel3;
	elseif (nQuestChance == 4) then
		self:give_reward();
		return
	else
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk6;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	end
	
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:accept_quest()
	self:reset_task();
	SetTask(self.nHonor_QuestChance_Task, 2);
end

function tbHonor_Sys_2009:doing_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
        local tbTalk = {};
		local tbLadder;
		local nLimit = 100;
	
		repeat
		    local nPos = random(1,getn(self.tbHonor_Ladder_List));
		    tbLadder = self.tbHonor_Ladder_List[nPos];
		    nLimit = nLimit - 1;
		until tbLadder.nCount ~= 0 or nLimit <= 0
		
		local nTotal = tbLadder.nCount;

		if (nTotal == 0) then
		    return
		end
		
		local nTotalSelection = min(nTotal, 4);

		local nRightIdx = random(1, nTotalSelection);

		local i = 1;
		local k = 1;
		local tbSelect = {};
		while i <= nTotalSelection do
		    local nPos = random(1, nTotal);
		    local bNewPos = 1;

	        for k = 1, nTotalSelection do
	            if(nPos == tbSelect[k])then
	                bNewPos = 0;
	            end
	        end
	        if bNewPos == 1 then
	            tbSelect[i] = nPos;
	            if (i == nRightIdx)then
	                tbTalk[1] = format(self.tbMasterContent.strTalk5, nQuestChance, tbLadder.strName, nPos);
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:right_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            else
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:wrong_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            end
	            i = i + 1;
	        end
		end
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel4;
        CreateTaskSay(tbTalk);
	end
	
end

function tbHonor_Sys_2009:right_answer()
	self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
		SetTask(self.nHonor_QuestChance_Task, 4);
		local tbTalk = {};
		if (CalcFreeItemCellCount() >= 3) then
		    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk7;
		    self:give_reward();
        else
            tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
		end

	    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
        CreateTaskSay(tbTalk);
	end
end

function tbHonor_Sys_2009:wrong_answer()
    self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
    
    if (nQuestChance == 2) then
        SetTask(self.nHonor_QuestChance_Task, 1);
        self:doing_quest()
        return
    end
    
    local tbTalk = {};
	SetTask(self.nHonor_QuestChance_Task, 0);
    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk8;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
    CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:give_reward()
    self:reset_task();

	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);

	if (nQuestChance == 4) then
	    if (CalcFreeItemCellCount() < 3) then
	        local tbTalk = {};
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
            CreateTaskSay(tbTalk);
        else
            tbAwardTemplet:GiveAwardByList(self.tb_reward, "Honor System Answer Reward");
	        SetTask(self.nHonor_QuestChance_Task, 0);
	    end
	end
end

function tbHonor_Sys_2009:reset_task()
    local nQuestTime = GetTask(self.nHonor_QuestTime_Task);
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	local nCurTime = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nQuestTime ~= nCurTime) then
	    nQuestTime = nCurTime;
	    nQuestChance = 3; -- 没接任务状态
	    SetTask(self.nHonor_QuestTime_Task, nQuestTime);
	    SetTask(self.nHonor_QuestChance_Task, nQuestChance);
	end
end

function tbHonor_Sys_2009:master_onCancel()

end
