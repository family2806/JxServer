-- ���ص��� 2011.03.01
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")

Include("\\script\\item\\heart_head.lua")
Include("\\script\\item\\forbiditem.lua")

Include("\\script\\activitysys\\g_activity.lua")

ChuangGuan30 = 
{
	tbGroup = {},
	tbPlayer = {},
	tbRegist = {},
	tbMapList = {[CHUANGGUAN30_MAP_ID] = 1,},
	nCount = 0,
	bActive = 0,			-- boss�Ƿ����
	nChuangguan30Timeid = nil
} 

ChuangGuan30.tbForbitItemType = --���� Υ������
{
	"TRANSFER","MATE"
}
ChuangGuan30.szMapType = "�ϰ��ܷ�" --�ı��ͼ��ʾ

--Drop Item when kill final boss - Modified By DinhHQ - 20120312
--Give message to all player in map about the lucky award - Modifed by DinhHQ - 20110510
function AnnounceLuckyAward(strAwardName)		
	local strMsg = format("���<color=yellow>%s<color>�Ѿ��ɹ����� %s����õ��ر����� <color=yellow>%s<color>", GetName(), "���ϰ��ܷ���", strAwardName)
	Msg2Team(strMsg)			
	Msg2SubWorld(strMsg)
	AddGlobalNews(strMsg)	
end
tbVnItemAwardEx = {
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[1]={{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},},
	[10]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},},
	[11]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},},
	[12]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},},
	[13]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},},
	[14]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},},
	[15]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},},
	[16]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},},
	[17]={{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},},
	[18]={{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},},
	[19]={{szName="������յ�",tbProp={6,1,2397,1,0,0},nCount=1,nRate=10},},
	[20]={{szName="�������ε�",tbProp={6,1,2379,1,0,0},nCount=1,nRate=10},},
	[21]={{szName="������յ�",tbProp={6,1,2397,1,0,0},nCount=1,nRate=10},},
	[22]={{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=10},},
	[23]={{szName="�����ؼ�",tbProp={6,1,26,1,0,0},nCount=1,nRate=15},},
}

function ChuangGuan30:Init()
	self.tbGroup = {}
	self.tbPlayer = {}
	self.tbRegist = {}
	self.bActive = 0
end

function ChuangGuan30:Regist(szType, pFun, ...)
	local nRegId = EventSys:GetType(szType):Reg(CHUANGGUAN30_MAP_ID, pFun, unpack(arg))
	self.tbRegist[szType] = self.tbRegist[szType] or {}
	tinsert(self.tbRegist[szType], nRegId)
end

function ChuangGuan30:RegistAll()
	self:Regist("EnterMap", self.OnEnterMap, self)
	self:Regist("LeaveMap", self.OnLeaveMap, self)
end

function ChuangGuan30:Unregist()
	if self.tbRegist then
		for szType, tbId in self.tbRegist do
			for i=1, getn(tbId) do
				EventSys:GetType(szType):UnReg(CHUANGGUAN30_MAP_ID, tbId[i])
			end
		end
	end
end

function ChuangGuan30:SetState()
	SetTaskTemp(200,1)
	SetFightState(0)
	SetLogoutRV(1)
	SetPunish(0)
--Cho ph�p t?��i trong map 30 - Modified by DinhHQ - 20110508
	SetCreateTeam(1)
	SetPKFlag(1)
	ForbidChangePK(1)
	DisabledUseTownP(1)
	ForbidEnmity(1)
end

function ChuangGuan30:OnEnterMap()
	
	-- ���boss�Ѿ������ˣ�������߻ر�����
	if self.bActive == 1 then
		self.KickOut()
	end
	
	-- ���з���
	-- todo���õ���ɫ��ʼ��ͼ������Ľӿ���ɶ����֪�� wangjingjun
	local nMapId = GetTask(PLAYER_MAP_TASK)
	local szName = GetName()
	self.tbGroup[nMapId] = self.tbGroup[nMapId] or {}
	tinsert(self.tbGroup[nMapId],szName)
	self.tbPlayer = self.tbPlayer or {}
	self.tbPlayer[szName] = 1
	self.nCount = self.nCount + 1
	SetDeathScript("\\script\\missions\\challengeoftime\\chuangguang30.lua")
	WriteLog("�����ͼ�������".. szName)
	SetTmpCamp(nMapId) -- ����player����Ӫ
	self:SetState()
end
--Add exp award - Modified By DinhHQ - 20120313
function ChuangGuan30:GiveAward(nGroupId, nCount)
	if GetTask(PLAYER_MAP_TASK) == nGroupId then
		local tbPro = {			
			{szName="����ֵ",nExp = 10e6},
		}
		tbAwardTemplet:GiveAwardByList(tbPro, "jixuchuangguang award", 1)
		tbAwardTemplet:GiveAwardByList(tbVnItemAwardEx, "jixuchuangguang item award", 1)
	end
end

function ChuangGuan30:KickOut()
	-- �߻ر�����
	SetLogoutRV(0)
	NewWorld(11,3207,4978) -- �ɶ���߱��
end

function ChuangGuan30:OnLeaveMap()
	local szName = GetName()
	self.tbPlayer[szName] = 0
	self.nCount = self.nCount - 1
	SetCurCamp(GetCamp())
	SetTmpCamp(0)							--ȡ����ʱ��Ӫ
	SetTaskTemp(200,0)
	SetFightState(0)
	SetPunish(1)
	SetCreateTeam(1)
	SetPKFlag(0)
	ForbidChangePK(0)
	SetTask(PLAYER_MAP_TASK,0)
	SetDeathScript("")
	ForbidEnmity(0)
	
end

function OnDeath(nPlayerIndex)
	ChuangGuan30:KickOut()
end
function ChuangGuan30:OnNpcDeath(nNpcIndex, nPlayerIndex)
	local _,_, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if nMapId ~= CHUANGGUAN30_MAP_ID then
		return 
	end
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	if nNpcId < map_new_Ncp[2].nNpcId and nNpcId > map_new_Ncp[11].nNpcId then
		return 
	end

	local nGroup = CallPlayerFunction(nPlayerIndex, GetTask, PLAYER_MAP_TASK)
	local nMemberNumber = 0
	-- ����������
	local nCount = AWARD_COUNT	

	for _, szName in(self.tbGroup[nGroup]) do
		if self.tbPlayer[szName] == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				local nNowCount = random(0, nCount)
				if nMemberNumber == 1 then		-- ����ǰΪ���һ���ˣ���ʣ�µı��䶼����
					nNowCount = nCount
				end
				--Adjust number of awards to 2 - Modified by DinhHQ - 20110504
				--CallPlayerFunction(nPlayerIndex, self.GiveAward, self, nGroup, nNowCount)
				CallPlayerFunction(nPlayerIndex, self.GiveAward, self, nGroup, 2)
			
				nCount = nCount - nNowCount	-- ʣ��ɷ���ı�����
				nMemberNumber = nMemberNumber - 1  -- ʣ��δ�������Ա
			end
		end
	end
	
	self:OnMessage(nGroup)
	self:KickOutAll()
end


function ChuangGuan30:OnMessage(nGroup)
	local tbAllPlayer = {}
	local batch = 30
	local n_level = 1
	for _, szName in(self.tbGroup[nGroup]) do
		if self.tbPlayer[szName] == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				tbAllPlayer[getn(tbAllPlayer)+1] = nPlayerIndex;
			end
		end
	end
	G_ACTIVITY:OnMessage("Chuanguan", batch, tbAllPlayer, n_level);
end

function ChuangGuan30:KickOutAll()
	for szName, bFlag in self.tbPlayer do
		if bFlag == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			CallPlayerFunction(nPlayerIndex, self.KickOut, self)
		end
	end
	-- ��״̬����Ϊbossδ����
	self.bActive = 0
	self.tbGroup = {}
end

function ChuangGuan30:OnAddBoss()
	local nBossid = random(2,11)
	-- ���ص��� by wangjingjun 2011.03.02
	-- ����µ�npc������λ�õ����껹��֪��
	local szFile = "\\settings\\maps\\liandandong\\npc_3.txt"
	local x,y = get_file_pos(szFile, random(2,50), 1)
	basemission_CallNpc(map_new_Ncp[nBossid], CHUANGGUAN30_MAP_ID, x, y)
	local Msg = format("%s������, ��λӢ�۸Ͽ��ж�!",map_new_Ncp[nBossid].szName)
	Msg2Player(Msg)
	self.bActive = 1
end

function ChuangGuan30:FightState()
	for szName, bFlag in self.tbPlayer do
		if bFlag == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			CallPlayerFunction(nPlayerIndex, SetFightState, 1)
		end
	end
end

function ChuangGuan30:GameTime()
	if self.nCount == 0 then
--		WriteLog("��ǰ��ͼû�����")
		return 0
	end
	self:OnAddBoss()
	self:FightState()
	return 0
end

function ChuangGuan30:SetForbitItem()
	local szMapType = self.szMapType
	set_MapType(CHUANGGUAN30_MAP_ID, szMapType)
	
	for i=1, getn(self.tbForbitItemType) do
		if self.tbForbitItemType[i] == "MATE" then
			FORBITMAP_LIST[CHUANGGUAN30_MAP_ID] = 1
		end
		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end

function ChuangGuan30:AddTime()
--	WriteLog("���ü�ʱ��******************")
	local nTimeOut = CHUANGGUAN30_TIME_LIMIT + LIMIT_SIGNUP + 60;
	local nId = SubWorldID2Idx(CHUANGGUAN30_MAP_ID)
	if (SubWorldID2Idx(CHUANGGUAN30_MAP_ID) >= 0) then
		if self.nChuangguan30Timeid then
			DelTimer(self.nChuangguan30Timeid)		
		end
		self.nChuangguan30Timeid = AddTimer(nTimeOut * 18,"ChuangGuan30:GameTime",0)
		 
--		 WriteLog("id = " .. tostring(id) .. "################")
	end
end


ChuangGuan30:Unregist()
ChuangGuan30:SetForbitItem()
ChuangGuan30:Init()
ChuangGuan30:RegistAll()
