-------------------------------------------------------------------------
-- FileName		:	honor_head.lua
-- Author		:	zhangyifan
-- CreateTime	:	2009-05-11
-- Desc			:   ����ϵͳͷ�ļ�
-------------------------------------------------------------------------

tbHonor_Sys_2009 = {};
tbHonor_Sys_2009.szClassName = "Honor_Sys_2009";
tbHonor_Sys_2009.bLoaded = 0;

-- ���������б�
tbHonor_Sys_2009.tbHonor_Ladder_List =
{
	[1]={["nId"]=1, ["strName"] = "ʮ�����", ["nCount"] = 0, ["content"] = "����: <color=green>%d<color> ��", ["nLadderID"] = 3,["tbLadder"]=
	{
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52256, ["ny"] = 103264, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52864, ["ny"] = 103936, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52064, ["ny"] = 103456, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52704, ["ny"] = 104128, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 51872, ["ny"] = 103648, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52544, ["ny"] = 104320, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 51680, ["ny"] = 103840, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52384, ["ny"] = 104512, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 51488, ["ny"] = 104032, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52224, ["ny"] = 104704, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
	} },
	[2]={["nId"]=1, ["strName"] = "ʮ��Ƹ�", ["nCount"] = 0, ["content"] = "�Ƹ� <color=green>%d<color> ��", ["nLadderID"] = 36, ["tbLadder"]=
	{
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50656, ["ny"] = 105056, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 51168, ["ny"] = 105568, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50464, ["ny"] = 105248, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50976, ["ny"] = 105760, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50208, ["ny"] = 105472, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50720, ["ny"] = 106016, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 49984, ["ny"] = 105696, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50496, ["ny"] = 106240, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 49760, ["ny"] = 105920, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50272, ["ny"] = 106464, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
	} },
	[3]={["nId"]=1, ["strName"] = "�ν����", ["nCount"] = 0, ["content"] = "�ν�: <color=green>%d<color> ��", ["nLadderID"] = 10086, ["tbLadder"]=
	{
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 49280, ["ny"] = 103872, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 49280, ["ny"] = 103520, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 49664, ["ny"] = 103904, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 48928, ["ny"] = 103872, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 49344, ["ny"] = 104288, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
	} },
	[4]={["nId"]=1, ["strName"] = "���ظ���", ["nCount"] = 0, ["content"] = "����ʱ��: <color=green>%d<color> ��.", ["nLadderID"] = 10180, ["tbLadder"]=
	{
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50464, ["ny"] = 102624, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50464, ["ny"] = 102240, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50848, ["ny"] = 102656, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50080, ["ny"] = 102624, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 50496, ["ny"] = 103040, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
	} },
	[5]={["nId"]=1, ["strName"] = "��������", ["nCount"] = 0, ["content"] = "����: <color=green>%d<color> �ιھ�", ["nLadderID"] = 38, ["tbLadder"]=
	{
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52384, ["ny"] = 107040, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52384, ["ny"] = 107456, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52768, ["ny"] = 107072, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 51968, ["ny"] = 107040, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52384, ["ny"] = 106656, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
	} },
	[6]={["nId"]=1, ["strName"] = "Boss ����", ["nCount"] = 0, ["content"] = "����boss: <color=green>%d<color> ��.", ["nLadderID"] = 37, ["tbLadder"]=
	{
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 53600, ["ny"] = 105728, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 53600, ["ny"] = 105344, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 54016, ["ny"] = 105760, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 53184, ["ny"] = 105728, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
		{["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 53632, ["ny"] = 106144, ["strScript"] = "\\script\\honor\\honor_ladder.lua", ["strNpcName"] = ""},
	} },
}

-- ���Ӽ�¼�б�
tbHonor_Sys_2009.tbHonor_Tianzi_List =
{
	["nTemplate"] = 0, ["nSubworld"] = 897, ["nx"] = 52672, ["ny"] = 103360, ["strScript"] = "\\script\\honor\\honor_tianzi.lua", ["strNpcName"] = "������ʷ",
	["tbHistory"] = {},
}

tbHonor_Sys_2009.tbHonor_NPC_List =
{
    [1] = {["nTemplate"] = 92, ["nSubworld"] = 897, ["nx"] = 52064, ["ny"] = 104064, ["strScript"] = "\\script\\honor\\honor_master.lua", ["strNpcName"] = "����������",},
	[2] = {["nTemplate"] = 393, ["nSubworld"] = 897, ["nx"] = 49472, ["ny"] = 105888, ["strScript"] = "\\script\\tong\\npc\\tong_chefu.lua", ["strNpcName"] = "����",},
	[3] = {["nTemplate"] = 625, ["nSubworld"] = 897, ["nx"] = 50368, ["ny"] = 106816, ["strScript"] = "\\script\\tong\\npc\\tong_chuwuxiang.lua", ["strNpcName"] = "�������",},
}

-- ��������npc����ģ��
tbHonor_Sys_2009.tbNPC_Template_List = 
{
    [255] = {[0]=1415, [1]=1423, strName = "������"}, -- key ����id; 0 ��, 1 Ů ������ Ĭ���������ĵ���
    [-1] = {[0]=1415, [1]=1423, strName = "������"}, -- key ����id; 0 ��, 1 Ů ������ Ĭ���������ĵ���
	[0] = {[0]=1422, [1]=1422, strName = "����"}, -- key ����id; 0 ��, 1 Ů ����
	[1] = {[0]=1421, [1]=1420, strName = "����"}, -- key ����id; 0 ��, 1 Ů ����
	[2] = {[0]=1417, [1]=1416, strName = "�嶾"}, -- key ����id; 0 ��, 1 Ů ����
	[3] = {[0]=1415, [1]=1414, strName = "����"}, -- key ����id; 0 ��, 1 Ů �嶾
	[4] = {[0]=1423, [1]=1423, strName = "��ü"}, -- key ����id; 0 ��, 1 Ů ��ü
	[5] = {[0]=1428, [1]=1428, strName = "����"}, -- key ����id; 0 ��, 1 Ů ����
	[6] = {[0]=1413, [1]=1412, strName = "ؤ��"}, -- key ����id; 0 ��, 1 Ů ؤ��
	[7] = {[0]=1419, [1]=1418, strName = "����"}, -- key ����id; 0 ��, 1 Ů ����
	[8] = {[0]=1427, [1]=1426, strName = "�䵱"}, -- key ����id; 0 ��, 1 Ů �䵱
	[9] = {[0]=1425, [1]=1424, strName = "����"}, -- key ����id; 0 ��, 1 Ů ����
	[10] = {[0]=1430, [1]=1429, strName = "����"}, -- 0 ��, 1 Ů ����
}

tbHonor_Sys_2009.exit_portal = 
{
    {["nSubworld"] = 897, ["nx"] = 49408, ["ny"] = 106592},
    {["nSubworld"] = 897, ["nx"] = 49440, ["ny"] = 106560},
    {["nSubworld"] = 897, ["nx"] = 49408, ["ny"] = 106560},
    {["nSubworld"] = 897, ["nx"] = 49440, ["ny"] = 106624},
    {["nSubworld"] = 897, ["nx"] = 49440, ["ny"] = 106592},
    {["nSubworld"] = 897, ["nx"] = 49472, ["ny"] = 106624},
    {["nSubworld"] = 897, ["nx"] = 49472, ["ny"] = 106656},
    {["nSubworld"] = 897, ["nx"] = 49504, ["ny"] = 106656},
    {["nSubworld"] = 897, ["nx"] = 49504, ["ny"] = 106688},
    {["nSubworld"] = 897, ["nx"] = 49536, ["ny"] = 106720},
    {["nSubworld"] = 897, ["nx"] = 49536, ["ny"] = 106752},
    {["nSubworld"] = 897, ["nx"] = 49504, ["ny"] = 106720},
    {["nSubworld"] = 897, ["nx"] = 49536, ["ny"] = 106688},
    {["nSubworld"] = 897, ["nx"] = 49568, ["ny"] = 106752},
    {["nSubworld"] = 897, ["nx"] = 49600, ["ny"] = 106784},
    {["nSubworld"] = 897, ["nx"] = 49632, ["ny"] = 106848},
    {["nSubworld"] = 897, ["nx"] = 49632, ["ny"] = 106816},
    {["nSubworld"] = 897, ["nx"] = 49568, ["ny"] = 106720},
    {["nSubworld"] = 897, ["nx"] = 49600, ["ny"] = 106752},
    {["nSubworld"] = 897, ["nx"] = 49632, ["ny"] = 106784},
    {["nSubworld"] = 897, ["nx"] = 49664, ["ny"] = 106880},
    {["nSubworld"] = 897, ["nx"] = 49696, ["ny"] = 106912},
    {["nSubworld"] = 897, ["nx"] = 49728, ["ny"] = 106944},
    {["nSubworld"] = 897, ["nx"] = 49760, ["ny"] = 106944},
    {["nSubworld"] = 897, ["nx"] = 49664, ["ny"] = 106848},
    {["nSubworld"] = 897, ["nx"] = 49696, ["ny"] = 106880},
}
-- ϵͳ������ʼ��
function tbHonor_Sys_2009:honor_sys_startup()
	self:load_ladder();
	self:add_npcs();
	self:add_exit_portal();
end

-- �������������Ӽ�¼
function tbHonor_Sys_2009:load_ladder()
    local nCount = 0;
    
    -- ���а�
     for i = 1, getn(self.tbHonor_Ladder_List) do
        nCount = 0;
        for j = 1, getn(self.tbHonor_Ladder_List[i].tbLadder) do
            local strName;
            local nValue;
            local nSect;
            local nGender;
            local tbPlayer = self.tbHonor_Ladder_List[i].tbLadder[j];
            strName, nValue, nSect, nGender = Ladder_GetLadderInfo(self.tbHonor_Ladder_List[i].nLadderID,j);

            if (strName ~= nil and strName ~= "") then
                tbPlayer.strPlayerName = strName;
                tbPlayer.nValue = nValue;
                tbPlayer.nClass = nSect;
                tbPlayer.strNpcName = format("%s\n%s", self.tbHonor_Ladder_List[i].strName, tbPlayer.strPlayerName);
                if(self.tbNPC_Template_List[tbPlayer.nClass] == nil)then
                    tbPlayer.nTemplate = self.tbNPC_Template_List[-1][0];
                else
                    tbPlayer.nTemplate = self.tbNPC_Template_List[tbPlayer.nClass][nGender] or self.tbNPC_Template_List[-1][0];
                end
                self.tbHonor_Ladder_List[i].nCount = self.tbHonor_Ladder_List[i].nCount + 1;
            end
        end
    end
    
    -- ������ʷ
    nCount = NW_EmperorHistoryCount(); -- �϶�����һ����¼��
    
    for i = 1, nCount do
        local szEmperor;
	    local szTong;
	    local szTitle;
	    local nGender;
	    local nScore;
	    local nBeginTime;
	    local nSide;
	    local nIdx = nCount - i + 1;
	   
	    szEmperor, nGender, szTitle, szTong, nBeginTime, nSide, nScore, nEndTime = NW_EmperorHistory(nIdx);

	    if (nIdx == nCount) then
	        self.tbHonor_Tianzi_List.nTemplate = self.tbNPC_Template_List[10][nGender] or self.tbNPC_Template_List[10][0];
	    end
	    self.tbHonor_Tianzi_List.tbHistory[getn(self.tbHonor_Tianzi_List.tbHistory)+1] = 
	    {
	        szEmperor = szEmperor,
	        szTitle = szTitle,
	        szTong = szTong,
	        nBeginTime = nBeginTime,
	        nSide = nSide,
	        nScore = nScore,
	        nEndTime = nEndTime,
	    }
    end
end

-- ��ӵ���npcs
function tbHonor_Sys_2009:add_npcs()
    for i = 1, getn(self.tbHonor_NPC_List) do
        self:add_npc(self.tbHonor_NPC_List[i]);
    end
    
    self:add_npc(self.tbHonor_Tianzi_List);
    
    for i = 1, getn(self.tbHonor_Ladder_List) do
    	for j = 1, self.tbHonor_Ladder_List[i].nCount do
    		local nNpcIdx = self:add_npc(self.tbHonor_Ladder_List[i].tbLadder[j]);
    		if(nNpcIdx ~= nil and nNpcIdx >= 0) then
    				SetNpcParam(nNpcIdx, 1, i);
    				SetNpcParam(nNpcIdx, 2, j); --�����б��±�
    		end
    	end
    end

end

-- ���npc
function tbHonor_Sys_2009:add_npc(tbPara)
	local nSId = SubWorldID2Idx(tbPara.nSubworld);
	if (nSId >= 0) then
		local nNpcIdx = AddNpc(tbPara.nTemplate, 1, nSId, tbPara.nx, tbPara.ny, 1, tbPara.strNpcName);
		SetNpcScript(nNpcIdx, tbPara.strScript);
		return nNpcIdx;
	end;
	return -1;
end

function tbHonor_Sys_2009:add_exit_portal()
    for i = 1, getn(self.exit_portal) do
        AddMapTrap(self.exit_portal[i].nSubworld, self.exit_portal[i].nx, self.exit_portal[i].ny, "\\script\\honor\\honor_exit_portal.lua");
    end
end