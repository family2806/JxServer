-------------------------------------------------------------------------
-- FileName		:	honor_ladder.lua
-- Author		:   zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   排名npc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\task\\system\\task_string.lua" )
Include( "\\script\\lib\\say.lua" )



tbHonor_Sys_2009.tbLadderContent = 
{
	strTalk1 = "你看到<color=yellow>%s<color> 在石碑上这样写道<enter> <enter>%s",
	
	strCancel = "离开/#tbHonor_Sys_2009:ladder_onCancel()",
}

function main()
	local nNpcIdx = GetLastDiagNpc();
	tbHonor_Sys_2009:ladder_main(nNpcIdx)
end

function tbHonor_Sys_2009:ladder_main(nNpcIdx)
	local nLadderIdx = GetNpcParam(nNpcIdx, 1);
	local nIdx = GetNpcParam(nNpcIdx, 2);
	local tbLadder = self.tbHonor_Ladder_List[nLadderIdx];
	
	if (tbLadder == nil) then return end
	
	local tbPlayer  = tbLadder.tbLadder[nIdx];
	
	if (tbPlayer == nil or nIdx > tbLadder.nCount) then return end
	
	local tbTalk = {}
    local tbContentTb =
	{
	    {
			format("名称: <color=yellow>%s<color>",tbPlayer.strPlayerName), "", 
			format("门派: <color=yellow>%s<color>",self.tbNPC_Template_List[tbPlayer.nClass].strName),
		},
		{
			format(tbLadder.content, tbPlayer.nValue),"",
			format("排名: <color=green>%d<color>",nIdx),
		},
	}
	local var_width = {30,1,30}
	local var_align = 1
	
	tbTalk[getn(tbTalk)+1] = format(self.tbLadderContent.strTalk1, tbLadder.strName, maketable(tbContentTb, var_width, var_align));
	tbTalk[getn(tbTalk)+1] = self.tbLadderContent.strCancel;
    
	CreateTaskSay(tbTalk);
end



function tbHonor_Sys_2009:ladder_onCancel()
end
