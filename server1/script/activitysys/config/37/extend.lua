Include("\\script\\activitysys\\config\\37\\head.lua")
Include("\\script\\activitysys\\config\\37\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")


function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1566,2944,},
		[2] = {78,1572,3232,},
		[3] = {162,1588,3145,},
	}
	local tbNpc = {	
			szName = "ʥ������", 
			nLevel = 95,
			nNpcId = 1880,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:YDBZ_GiveStar(YDBZ_mission_match, nTeam)
	local pidx,nj
	local tbPlayer = {}
	local nPlayerCount = 0
	local nOldPlayer = PlayerIndex
	
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_mission_match, idx, nTeam )
		if pidx > 0 then
			PlayerIndex = pidx
			if PlayerFunLib:CheckTotalLevel(150, "", ">=") == 1 then
				nPlayerCount = nPlayerCount + 1
				tbPlayer[nPlayerCount] = {pidx, 1}
			end
		end
		
		if idx == 0 then
			break;
		end
	end 
	
	for nj = 1, nPlayerCount do
		CallPlayerFunction(tbPlayer[nj][1], PlayerFunLib.GetItem, PlayerFunLib, ITEM_XMAS_STAR, 1, EVENT_LOG_TITLE, "YDBZ_GiveStar")
	end	
end

-- ������ȡ����
function pActivity:GiveXmasTrousers()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then	-- ���һ�μ�¼��ʱ�����ȡʱ����ͬһ��
		nLastOnLineTime = self:GetTask(TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()
		-- ����ʱ���ɻ�õ�ʥ�����ӵĸ���
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else -- ���һ�μ�¼ʱ�����ȡ��ʱ����ͬһ��
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS
	end
	
	nCount = nHour * 10
	if nCount <= 0 then
		Msg2Player("���ϴ���ȡ���ʱ��,�������ʱ�䲻��1Сʱ��������ȡ")
		return 
	end
	local nMaxCount = 50 -  self:GetTaskDaily(TSK_XMAS_TROUSERS_DAILY)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("�����㲻������ȡ�ˣ�����������.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	
	-- ������ȡ��ʱ��
	self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)

	PlayerFunLib:GetItem(ITEM_XMAS_TROUSERS,nMaxCount, EVENT_LOG_TITLE, "GiveXmasTrousers")
	--�3 - modified by DinhHQ - 20111215
	local tbPumpkinPie = {szName="�Ϲϱ�",tbProp={6,1,30166,1,0,0},nExpiredTime=20120101,}
	PlayerFunLib:GetItem(tbPumpkinPie,floor(nMaxCount/10)*40, EVENT_LOG_TITLE, "GivePumpkinPie")
	self:AddTaskDaily(TSK_XMAS_TROUSERS_DAILY, nMaxCount)
end


function pActivity:CheckRandom(nSuccess, szFailLog)
	local rcur=random(1,100)
	if rcur <= nSuccess then
		return 1
	else
		Msg2Player("���ź�,�˴κϳ�ʧ���ˣ�������һ��!")
		szFailLog = szFailLog or ""
		%tbLog:PlayerActionLog(szFailLog, EVENT_LOG_TITLE)
		return 0
	end
end

-- �ϳ�ʥ�����
function pActivity:ComposeXmasGift(nCount)
	for i=1,nCount do
		local nSuccess = 70
		if self:CheckRandom(nSuccess,"GhepHopQuaNoelThatBai") == 1 then
			PlayerFunLib:GetItem({szName = "ʥ�����", tbProp={6,1,3080,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "�ɹ��ϳ�ʥ�����")
		end
	end
end

-- �ϳ�ʥ�����ˣ�С��
function pActivity:ComposeXmasPerson_S(nCount)
	for i=1,nCount do
	--Change request Event Noel - Modified by DinhHQ - 20111129
		local nSuccess = 70
		if self:CheckRandom(nSuccess, "�ϳ�ѩ�ˣ�С��ʧ��") == 1 then
			PlayerFunLib:GetItem({szName = "ʥ�����ˣ�С��", tbProp={6,1,3077,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "�ϳ�ѩ�ˣ�С���ɹ�")
		end
	end
end

function pActivity:GiveItemAward(tbAward, tbComposeLog, szLogAction, nTaskId)
	tbAwardTemplet:Give(tbAward, 1 , {EVENT_LOG_TITLE, szLogAction})
	local nCount = self:GetTask(nTaskId) + 1
	self:SetTask(nTaskId, nCount)
	if tbComposeLog[nCount] then
		tbLog:PlayerActionLog(tbComposeLog[nCount], EVENT_LOG_TITLE)
	end
end

function pActivity:UseXmasPerson_S()
	local tbAward = 
	{
		[1]={nExp=2000000,},
	}
	local tbUseLog = {
		[500] = "ʹ��500��ѩ�ˣ�С��",
		[1000] = "ʹ��1000��ѩ�ˣ�С��",
		}

	self:GiveItemAward(tbAward, tbUseLog, "UseXmasPerson_S", TSK_XMAS_PERSON_S_LIMIT)
end

function pActivity:UseXmasPerson_M()
	local tbAward = 
	{
		[1]={szName="������ʯ",tbProp={6,1,147,1,0,0},},
		[2]={nExp_tl=1,},
	}
	local tbUseLog = {
		[50] = "ʹ��50��ѩ��(��)",
		[100] = "ʹ��100��ѩ��(��)",
		[150] = "ʹ��150��ѩ��(��)",
		[200] = "ʹ��200��ѩ��(��)",
		}
	
	self:GiveItemAward(tbAward, tbUseLog,"ʹ��ѩ��(��)��ȡ��Ʒ", TSK_XMAS_PERSON_M_LIMIT)
end

function pActivity:UseXmasPerson_L()
	local tbAward = 
	{
		[1]={nExp=10e6,},
		[2]={
			{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.04},
			{szName="���ڽ���",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
			{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
			{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
			{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
			{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
			{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
			{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
			{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
			{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
			{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
			{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
			{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
			{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1},
			{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.02},
			{szName="�������",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
			{szName="������",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
			{szName="�ν��б���",tbProp={6,1,30083,1,0,0},nCount=2,nRate=2},
			{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},
			{szName="������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2},
			{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2},
			{szName="�ƽ�ӡ(ǿ)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="�ƽ�ӡ (��)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="���������",tbProp={6,1,2520,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
			{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
			{szName="Ǭ���컯��(��) ",tbProp={6,1,215,1,0,0},nCount=5,nRate=3},
			{szName="��ç֮��(ñ��)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={1,0,0,0,0,0}},
			{szName="��ç֮��(�·�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={5,0,0,0,0,0}},
			{szName="��ç֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={0,0,0,0,0,0}},
			{szName="��ç֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={8,0,0,0,0,0}},
			{szName="��ç֮��(Ь)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={7,0,0,0,0,0}},
			{szName="��ç֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={3,0,0,0,0,0}},
			{szName="��ç֮��(�Ͻ�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},
			{szName="��ç֮��(�½�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},
			{szName="��ç֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={4,0,0,0,0,0}},
			{szName="��ç֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={6,0,0,0,0,0}},
			{szName = "�i����ֵ", nExp=8000000,nRate=35},
			{szName = "�i����ֵ", nExp=10000000,nRate=16},
			{szName = "�i����ֵ", nExp=15000000,nRate=6},
			{szName = "�i����ֵ", nExp=20000000,nRate=1.37},
			{szName = "�i����ֵ", nExp=50000000,nRate=0.5},
			{szName = "�i����ֵ", nExp=100000000,nRate=0.5},
			{szName = "�i����ֵ", nExp=200000000,nRate=0.01},
		},		
	}
	local tbUseLog = {
		[50] = "ʹ��g50��ѩ��(��)",
		[100] = "ʹ��100��ѩ��(��)",
		[200] = "ʹ��200��ѩ��(��)",
		[300] = "ʹ��300��ѩ��(��)",
		[400] = "ʹ��400��ѩ��(��)",
		[500] = "ʹ��500��ѩ��(��)",
		[600] = "ʹ��600��ѩ��(��)",
		[700] = "ʹ��700��ѩ��(��)",
		[800] = "ʹ��800��ѩ��(��)",	
		}
	local tbExtAward = {
		[50] = {nExp=20000000,},
		[100] = {nExp=20000000,},
		[200] = {nExp=20000000,},
		[300] = {nExp=20000000,},
		[400] = {nExp=30000000,},
		[500] = {nExp=40000000,},
		[600] = {nExp=50000000,},
		[700] = {nExp=60000000,},
		[800] = {nExp=100000000,},
	}
	--�����ѩ��ʹ�ô�꽱��- Modified By DinhHQ - 20111129
	local nCount = self:GetTask(TSK_XMAS_PERSON_L_LIMIT) + 1
	if tbExtAward[nCount] then
		tbAwardTemplet:Give(tbExtAward[nCount], 1 , {EVENT_LOG_TITLE, tbUseLog[nCount]})
	end
	self:GiveItemAward(tbAward, {}, "SuDungNguoiTuyet(lon)NhanVatPham", TSK_XMAS_PERSON_L_LIMIT)	
end

function pActivity:UseXmasGift()
	local tbAward = 
	{
		[1]={nExp=1e6,},		
	}
	local tbUseLog = {
		[1000] = "SuDung1000HopQuaNoel",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasGift", TSK_XMAS_GIFT_LIMIT)	
end

function pActivity:UseXmasCake()
	local tbAward = 
	{
		nExp=500000,
	}
	local tbUseLog = {
		[1000] = "ʹ��1000ʥ����",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasCake", TSK_XMAS_CAKE_LIMIT)	
end

function pActivity:PlayerOnLogin()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0
	if nDate ~= nNowDate then	-- �������¼����ͬһ��
		nCurrentOnLineTime = GetGameTime()
		self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)
	end
end

function pActivity:CheckTimeGetCompensation()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112020900 or nNowDate >= 201112040000 then
		Talk(1, "", "��ԭ�£�Ŀǰ�ѹ��콱ʱ��")
		return nil
	end
	return 1
end
--Ho�t ��ng th?3 - Modified By DinhHQ - 20111215
function pActivity:CheckTimeGetFreeExp()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112240000 or nNowDate >= 201112252400 then
		Talk(1, "", "��ԭ�£�Ŀǰ�ѹ��콱ʱ��")
		return nil
	end
	return 1
end

function pActivity:UseXmasPerson_Pink()
	local nUsedCount = GetTask(2916)
	local nCurCount = nUsedCount + 1
	if nCurCount > 1500 then
		Talk(1, "", "ʹ����Ʒ�ﵽ���ޣ�������ʹ����.")
		return nil
	end
	SetTask(2916, nCurCount)	
	if GetTask(2916) ~= nCurCount then
		return nil
	end
	local tbExpAward = {
		[1] = {szName = "�i����ֵ", nExp = 6e6},
		[2] = {{szName="Ng�i Sao",tbProp={6,1,3081,1,0,0},nCount=1,nRate=40, nExpiredTime = 20120101},},
	}
	tbAwardTemplet:Give(tbExpAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	local tbBonusAward = {
		[100] = {{szName = "�i�����Ӿ���ֵ", nExp = 5e6}, "ʹ��100O��ʥ�����˽���"},
		[200] = {{szName = "�i�����Ӿ���ֵ", nExp = 10e6}, "ʹ��200O��ʥ�����˽���"},
		[300] = {{szName = "�i�����Ӿ���ֵ", nExp = 10e6}, "ʹ��300O��ʥ�����˽���"},
		[400] = {{szName = "�i�����Ӿ���ֵ", nExp = 20e6}, "ʹ��400O��ʥ�����˽���"},
		[500] = {{szName = "�i�����Ӿ���ֵ", nExp = 20e6}, "ʹ��500O��ʥ�����˽���"},
		[600] = {{szName = "�i�����Ӿ���ֵ", nExp = 20e6}, "ʹ��600O��ʥ�����˽���"},
		[700] = {{szName = "�i�����Ӿ���ֵ", nExp = 20e6}, "ʹ��700O��ʥ�����˽���"},
		[800] = {{szName = "�i�����Ӿ���ֵ", nExp = 30e6}, "ʹ��800O��ʥ�����˽���"},
		[900] = {{szName = "�i�����Ӿ���ֵ", nExp = 30e6}, "ʹ��900O��ʥ�����˽���"},
		[1000] = {{szName = "�������", tbProp = {0,11,561,1,0,0}, nExpiredTime = 20160, nCount=1}, "ʹ��1000O��ʥ�����˽���"},
		[1100] = {{szName = "�i�����Ӿ���ֵ", nExp = 40e6}, "ʹ��1100O��ʥ�����˽���"},
		[1200] = {{szName = "�i�����Ӿ���ֵ", nExp = 40e6}, "ʹ��1200O��ʥ�����˽���"},
		[1300] = {{szName = "�i�����Ӿ���ֵ", nExp = 40e6}, "ʹ��1300O��ʥ�����˽���"},
		[1400] = {{szName = "�i�����Ӿ���ֵ", nExp = 50e6}, "ʹ��1400O��ʥ�����˽���"},
		[1500] = {{szName="������",tbProp={6,1,2349,1,0,0},nCount=1}, "ʹ��1500O��ʥ�����˽���"},
	}
	if tbBonusAward[nCurCount] then
		tbAwardTemplet:Give(tbBonusAward[nCurCount][1], 1 , {EVENT_LOG_TITLE, tbBonusAward[nCurCount][2]})
		Msg2Player(format("ף�ظ���ʹ�õ�%dʥ��������Ʒ�������%s", nCurCount, tbBonusAward[nCurCount][1].szName))
	end
	local tbItemAward = {
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1},
		{szName="���ڽ���",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
		{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
		{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
		{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
		{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
		{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
		{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
		{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
		{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
		{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
		{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
		{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.3},
		{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
		{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.03},
		{szName="Ӣ����",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="�ر�׾���",tbProp={6,1,1157,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="����������",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1.2},
		{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1.5},
		{szName="����",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=259200},
		{szName="����",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=129600},
		{szName="������Ѫ��",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1.2},
		{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1.6},
		{szName="�ƽ�ӡ(ǿ��)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="�ƽ�ӡ (����)",tbProp={0,3221},nCount=1,nRate=0.11,nQuality = 1,nExpiredTime=10080,},
		{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName = "�i����ֵ", nExp=5000000,nRate=40},
		{szName = "�i����ֵ", nExp=8000000,nRate=13},
		{szName = "�i����ֵ", nExp=10000000,nRate=10},
		{szName = "�i����ֵ", nExp=15000000,nRate=5},
		{szName = "�i����ֵ", nExp=20000000,nRate=1},
		{szName = "�i����ֵ", nExp=50000000,nRate=0.5},
		{szName = "�i����ֵ", nExp=100000000,nRate=0.01},
	}
	tbAwardTemplet:Give(tbItemAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	
end

pActivity.nPak = curpack()
