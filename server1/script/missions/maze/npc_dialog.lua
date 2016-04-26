-- �Խ��Ȼ���ʹ
Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\global\\station.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\head.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

LEVEL_MIN = 120

LIMITS = {
	MIN_TEAMSIZE = 6,
	FLAG_CHECKTIME = 1,
}

-- ����
NpcChefu = {
	m_Caption = "������ȥ�ģ�",
	m_Options = {
		"����ȥ����",
		"����ȥ�ɶ�",
		"����ȥ����",
		"����ȥ�꾩",
		"����ȥ����",
		"����ȥ����",
		"����ȥ�ٰ�",
		"�Ķ���ȥ"
	}
}
function NpcChefu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcChefu:OnAnswer(player, sel)
	if (sel > 0 and sel < 8) then
		local mapid, x, y = GetStationPos(sel)
		if (mapid ~= nil and NewWorld(mapid, x, y) == 1) then
			player:Msg2Player("�������������ߡ� ")
		end
	end
end

-- �ܾ�
NpcZhoujun = {
	m_Caption = "��ӭ�������Ϸ�����������ʹ.",
	m_Options = {
		"�ҵ��������������Ӣ���������",
		"��������ȡ�հ׵�����������",
		"������ȡ��Ӫ�����������ռ�����",
		"��ֻ������",
	}
}

function NpcZhoujun:Say(player)
	do
		player:Say("�ù�����ʱ�ر�.")
		return
	end
	return self.m_Caption, self.m_Options
end

function NpcZhoujun:OnAnswer(player, nIndex)
	if (nIndex == 1) then
		local nTask = player:GetTask(TASK_MAZEINVITATION)
		if (nTask == 0) then
			player:Say("��ԭ�£���δ��ø�����.")
		elseif (nTask == 1) then
			if (player:CalcFreeItemCellCount() == 0) then
				player:Say("������װ������������.")
				return
			end
			player:Describe(
				format("%s �������Ϸ������Ĵ����������������������������Σ�����ɽ�������������������Ϸ򽫴�ͷ��β������. <enter> �ҵ�ɽׯ֮ǰ����̽�ر����������ı�����£���������ı��һ�����ҹ��ľ����ս��Ϊ�˿������ǵ���ı������ɽ�ھ���ѡ�ɺ�ѵ��һЩ��������Ǳ����˵��ڹ�����ɱ���ǵ����졣���ǵ�ׯ����ϲ���ռ�������Ϊ�˷�ֹ������ܣ����ԣ������������˽�ڣ�����ң�ѡ���˾�Ӣ��ʿ����. <enter> ����Ҫı���£���ׯԸ��򿪽�ڣ������Ӣ�ۼ�����һ����ϰ�书��ͬʱҲ���ױ�ׯ�������������Щ���ｫ�͸����������Ӣ�ۡ�����Ҫ�ҵ�һλ�����ĸ��֡���������������ׯ�е��ޱ����ҡ����Ǳ�ׯ������<color=red> �������� <color>, �������Ʒ�����ϣ�����������ʱ���뽣ڣ��ϣ����������ͨ��ѵ������ü�Ʒװ����������һ���ܱ�Ч�����.", player:GetName()),
				1,
				"֪����/Cancel")
			if (player:AddItem(6, 1, 2623, 1, 0, 0) > 0) then
				player:SetTask(TASK_MAZEINVITATION, 2)
			end
		elseif (nTask == 2) then
			player:Say("������������ˣ�����Ҫ������")		
		end
	elseif (nIndex ~= 4) then
		player:Say("��������ʱ���� ")
	end
end

-- ��ҩʦ
NpcLiuyaoshi = {}
function NpcLiuyaoshi:Say(player)
	player:Sale(99, 1)
end

-- С����
NpcXiaozhuzhu = {
	m_Caption = "���������á�����һλ�����ǵ�����ɽׯ��һ����С���飬���ʴ���������ʲô����",
	m_Options = {
		"���ܽ�ڣ����",
		"��ڣ����",
		--"�������ҿ��Խ��뽣ڣ�Ĵ���",
		"��ֻ��·��",
	}
}
NpcXiaozhuzhu.tbTSK_JoinTotal = 3075
function NpcXiaozhuzhu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcXiaozhuzhu:CheckTime()
	if (LIMITS.FLAG_CHECKTIME == 0) then
		return 1
	end
	local _, _, _, _, m = MakeDateTime(5, GetCurServerTime())
	if (m > 30) then
		return 0
	else
		return 1
	end
end

function NpcXiaozhuzhu:CheckTeam(player)
	local count = player:GetTeamSize()
	if (count < LIMITS.MIN_TEAMSIZE) then
		player:Say("120������6-8����Ӳ��ܽ�ȥ.")
		return 0
	elseif (self:CheckTime() == 0) then
		player:Say("ֻ����30����ǰ����.")
		return 0
	end
	local mapid, _, _ = player:GetWorldPos()
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		if (not mate) then
			return 0
		elseif (mate:GetLevel() < LEVEL_MIN) then
			player:Say(format("��ӳ�Ա<color=red>%s<color> �ȼ�����.", mate:GetName()))
			return 0
		elseif(self:VnCheckNLPass(mate) == 0) then	--�����������
			player:Say(format("�Բ���,<color=red>%s<color> û���������ơ������������뽣ڣ��������.", mate:GetName()))
			return 0
		elseif (self:VnGetJoinTotal(mate) == 0) then --��������
			player:Say(format("<color=red>%s<color>������뽣ڣ�����Ĵ�����������.", mate:GetName()))
			return 0	
--		elseif (MazePermission:CheckPermission(mate) == 0) then
--			player:Say(format("�Բ���,<color=red>%s<color> �����������뽣ڣ����.", mate:GetName()))
--			return 0
--		elseif (MazePermission:QueryLeftCount(mate) == 0) then
--			player:Say(format("<color=red>%s<color>������뽣ڣ�����Ĵ�����������.", mate:GetName()))
--			return 0
		else
			local m, _, _ = mate:GetWorldPos()
			if (m ~= mapid) then
				player:Say("Ҫ�����г�Ա���ڸ������ܽ���μӱ���.")
				return 0
			end
		end
	end
	return 1
end

function NpcXiaozhuzhu:Enter(player, maze)
	AddStatDataTeamEnterMazeCount(1)
	local count = player:GetTeamSize()
	local members = {}
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		tinsert(members, mate)
	end
	for i = 1, getn(members) do
		local mate = members[i]
		self:VnSetJoinTotal(mate) --����ȥ��ڣ�Ĵ���
		self:VnConsumeNLPass(mate) -- ������
		maze:Join(mate)
		if (not maze:Enter(mate)) then
			maze:Log(format("[MAZE ERROR]player(%s) failed to enter maze(%d)", mate:GetName(), maze.m_Id))
			player:Msg2Player(format("���ǶԲ�����ӳ�Ա(%s)��ʱ���ܽ��뽣ڣ.", mate:GetName()))
		else
			mate:Msg2Player("�����Ķ����ѽ��뽣ڣ����ʼѵ��.")
			AddStatDataPlayerEnterMazeCount(1)
			MazePermission:ReduceLeftCount(mate)
		end
	end
end

function NpcXiaozhuzhu:OnAnswer(player, sel)
	if (sel == 1) then
		player:Describe(
			"120������6-8����ӣ�ÿСʱ��ǰ��ʮ���ӿ��Ե������ﱨ������������븱�������븱�����㽫�ᱻת����ڣ�ķ����ڣ�ֻ��Ҫ��ɷ����ڵ����������ӽ������μӽ������ķ��䣬�ܳɹ�������󷿼�ĸ��֣����Լ�������ɽׯׯ���ͻ����������ʸ�����ڽ�ڣ�����¼��ķ�����ս�������ˣ�����Ե��򻨳����ƣ��κú���Է���������ڽ���ս���ķ��䡣ÿ��ÿ�βμӽ���3�λ�������򻨳����ˡ�ÿ�βμӸ��������ʱ��Ϊ30���ӡ�ף�����ˡ�",
			1,
			"Bi�t r�i/Cancel")
	elseif (sel == 2) then	
		if (player:IsCaptain() == 0) then
			player:Say("ֻ�жӳ���������������뽣ڣ")
			return
		elseif (self:CheckTeam(player) == 0) then
			return
		elseif (MazeList:CheckCount() == 0) then
			player:Say("���Թ��������Ѵ����ޣ����Ժ�����.")
			return
		end
		local maze = Maze:New()
		if (not maze) then
			player:Say("��μ��Թ��ѹ��ˣ����Ժ�����.")
			return
		end
		maze:SetCaptainName(player:GetName())
		self:Enter(player, maze)
	elseif (sel == 3) then
		local count = MazePermission:QueryLeftCount(player)
		if (count <= 0) then
			player:Say("�����㲻�ܽ��뽣ڣ������.")
		else
			player:Say(format("������뽣ڣ���ۼƴ���Ϊ<color=red>%d<color> ��.", count))
		end
	end
end
function NpcXiaozhuzhu:VnCheckNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	if CalcItemCount(3, 6, 1, 2623, -1) < 1 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer	
	return 1
end
function NpcXiaozhuzhu:VnConsumeNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	ConsumeItem(3, 1, 6, 1, 2623, -1)
	PlayerIndex = nOldPlayer
end
function NpcXiaozhuzhu:VnGetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	if PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal) >= 3 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer
	return 1
end
function NpcXiaozhuzhu:VnSetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	PlayerFunLib:AddTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal, 1);
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	PlayerIndex = nOldPlayer
end
function LoadNpc()
	DlgNpcManager:AddNpc("���", 1614, 949, 49344, 102720, NpcZhoujun)
	DlgNpcManager:AddNpc("����", 1615, 949, 49408, 101408)
	DlgNpcManager:AddNpc("����", 1616, 949, 49152, 101856)
	DlgNpcManager:AddNpc("�ھ�", 1617, 949, 49536, 100576)
	DlgNpcManager:AddNpc("����", 1618, 949, 49760, 100576)
	DlgNpcManager:AddNpc("��־", 1619, 949, 49760, 103488)
	DlgNpcManager:AddNpc("С����", 1620, 949, 50880, 100736, NpcXiaozhuzhu)
	DlgNpcManager:AddNpc("��ҩʦ", 1621, 949, 50496, 100608, NpcLiuyaoshi)
	DlgNpcManager:AddNpc("����", 238, 949, 51264, 101984, NpcChefu)
end

AutoFunctions:Add(LoadNpc)
