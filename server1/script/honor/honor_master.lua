-------------------------------------------------------------------------
-- FileName		:	honor_master.lua
-- Author		:	zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   ����npc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\task\\system\\task_string.lua" )
Include("\\script\\lib\\awardtemplet.lua")


tbHonor_Sys_2009.nHonor_QuestTime_Task = 2599
tbHonor_Sys_2009.nHonor_QuestChance_Task = 2600 -- 0 û�д��������, 1 ��һ�δ������, 2 �����δ��������, 3 û������, 4�����������콱�� 

tbHonor_Sys_2009.tbMasterContent = 
{
	strTalk1 = "<dec><npc>����������������������е���ʮ����ֵĵ��ܡ���������ιۣ����ǣ�����Ū�������κζ��������⣬������1��С��������μ���",
	strTalk2 = "<dec><npc>������������ã�Ҳ�Ǹ������еĸ�����ַ����ŵĵط���ֻ��Ҫ�õ����乫��Ϊ���֣�����ͻ���һ����������ĵ��ܡ�",
	strTalk3 = "<dec><npc>�������ܼ򵥣���ȥ�۲���Щ������˭��Ȼ��������ң��ҽ���һЩ���⣬�ش�ԵĻ��������������㡣",
	strTalk4 = "<dec><npc>������ô�찡��׼������û��?",
	strTalk5 = "<dec><npc>��������<color=green>%d<color> ����ش����� <enter>�ڽ���������<color=yellow>%s<color> �ڼ�����<color=yellow>%d<color> ��˭?",
	strTalk6 = "<dec><npc>�����Ѿ��ش�������ˣ���������ټ�����.",
	strTalk7 = "<dec><npc>ף�ش���ȷ!",
	strTalk8 = "<dec><npc>���ź����𰸲��ԣ�����������",
	strTalk9 = "<dec><npc>��ϲ�����¶��ˣ�����װ�������λ��������<color=green>3<color> ��λ��Ȼ��������ȡ",
	strSelect1 = "��������������?/#tbHonor_Sys_2009:master_introduce()",
	strSelect2 = "���������?/#tbHonor_Sys_2009:master_quest()",
	strSelect3 = "�������Ǽ򵥣���ȥȥ�ͻ���./#tbHonor_Sys_2009:accept_quest()",
	strSelect4 = "��ȥȥ�ͻ���/#tbHonor_Sys_2009:doing_quest()",
	strReturn = "�һ���һЩ������Ҫ��/#tbHonor_Sys_2009:master_main()",
	strCancel1 = "�����Ի�/#tbHonor_Sys_2009:master_onCancel()",
	strCancel2 = "��������һ��æ���Ժ����./#tbHonor_Sys_2009:master_onCancel()",
	strCancel3 = "�һ���һЩ�������飬�Ժ����./#tbHonor_Sys_2009:master_onCancel()",
	strCancel4 = "����Ȼδ׼����./#tbHonor_Sys_2009:master_onCancel()",
}

tbHonor_Sys_2009.tb_reward = 
{
    {
        {szName = "�ɲ�¶", tbProp={6, 1, 71, 1, 0, 0}, nCount = 3, nBindState = -2}
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
	    nQuestChance = 3; -- û������״̬
	    SetTask(self.nHonor_QuestTime_Task, nQuestTime);
	    SetTask(self.nHonor_QuestChance_Task, nQuestChance);
	end
end

function tbHonor_Sys_2009:master_onCancel()

end
