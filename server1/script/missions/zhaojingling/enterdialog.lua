Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local tbPaiMingAward = 
{
	[1] = 
	{
		nExp_tl = 20e6	
	},
	[2] = 
	{
		nExp_tl = 15e6
	},
	[3] = 
	{
		nExp_tl = 13e6
	},
	[4] = 
	{
		nExp_tl = 10e6
	},
	[5] = 
	{
		nExp_tl = 8e6
	},
	[6] = 
	{
		nExp_tl = 6e6
	},
	[7] = 
	{
		nExp_tl = 5e6
	},
	[8] = 
	{
		nExp_tl = 4e6
	},
	[9] = 
	{
		nExp_tl = 3e6
	},
	[10] = 
	{
		nExp_tl = 2e6
	},
}

local tbAllPaiMingAward = 
{
	[1]={
		[1]={szName="�����ر�",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 3,},
		[2]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 4,},
		[3]={nJxb=1,nRate = 20.0,nCount = 30000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 60000000,},
	},
	[2]={
		[1]={szName="�����ر�",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 2,},
		[2]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 3,},
		[3]={nJxb=1,nRate = 20.0,nCount = 24000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 48000000,},
	},
	[3]={
		[1]={
			[1]={szName="�����ر�",tbProp={6,1,2375,1,0,0},},
			[2]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},},
			nRate = 25.0,
		},
		[2]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},nRate = 25.0,},
		[3]={nJxb=1,nRate = 25.0,nCount = 22000000,},
		[4]={nExp_tl=1,nRate = 25.0,nCount = 44000000,},
	},
	[4]={
		[1]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 18000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 36000000,},
	},
	[5]={
		[1]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 16000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 32000000,},
	},
	[6]={
		[1]={szName="�����ر�",tbProp={6,1,2375,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 12000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 24000000,},
	},
	[7]={
		[1]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 10000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 20000000,},
	},
	[8]={
		[1]={szName="ˮ���Ʊ�",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 8000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 16000000,},
	},
	[9]={
		[1]={nJxb=1,nRate = 50.0,nCount = 5000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 10000000,},
	},
	[10]={
		[1]={nJxb=1,nRate = 50.0,nCount = 3000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 6000000,},
	},
}

local szRemoteScript = "\\script\\event\\zhaojingling\\event.lua"

function dialogmain()
	local tbOpt = {}
	local szTitleMsg = "<npc>�����ˣ�����ѵ���Լ��ķ�Ӧ���������ҵ������<color=yellow> ľ�� <color> ����ý���"
	local szTitleMsg = format("%s, ÿ����ֻ��<color=yellow>%d<color>�λ��������Ѳμӣ�Ŭ����ϰŶ", szTitleMsg, MAXGAMETIME)
	tinsert(tbOpt, {"�������Կ�", onok})
	tinsert(tbOpt, {"��ȡ����", getaward})
--	tinsert(tbOpt, {"�鿴ǰһ���ǰʮ��", querytopten})
	tinsert(tbOpt, {"����ѵ��ľ��һ��", detail})	
	tinsert(tbOpt, {"Ŀǰ�Һ�æ���Ժ����.", oncancel})
	CreateNewSayEx(szTitleMsg, tbOpt)
end

function onok()
	local tbOpt = {}
	tinsert(tbOpt, {"����!", wantjoin})
	tinsert(tbOpt, {"���м��£�����һ��", oncancel})
	CreateNewSayEx("<npc>��ȥ�Ǳ�׼���ɣ���һ�Ὣ��ʼװ��", tbOpt)
end

function wantjoin()
	if checkjoingame() ~= 1 then
		return
	end
	dojoingame()
end

function detail()
	local tbOpt = {}
	tinsert(tbOpt, {"��֪����!", oncancel})
	CreateNewSayEx("<npc>ѵ��ľ��һ����<color=yellow>15<color> ���ӣ����У�<color=yellow>5<color> ����׼���������μӺ��㽫�ᱻ��׼���������ʼ���㽫������Ѳ�߳�������������㿴�� <color=yellow> ľ��<color>ֻ�������<color=yellow> ������<color> ��������У���������ᱻ���˵�ס����ʱ�������ʹ�õ�����Ӧ�����������ֻ��Ҫ���ҵ��ܶ� <color=yellow> ľ��<color> �������Ӧ�Ľ���", tbOpt)
end

function oncancel()
end

function checkjoingame()
	if PlayerFunLib:CheckTotalLevel(MINLEVEL, "125����125�����ϻ�����������׳ʿ�����ܲμ�ľ�˻", ">=") ~= 1 then
		return
	end
	local nCurHour = tonumber(GetLocalDate("%H"))
	if nCurHour >= 0 and nCurHour < 12 then
		Talk(1, "", "ÿ��12ʱ��24ʱ����ʼץľ�˻��Ŀǰ���ǻʱ��")
		return
	end
	local nTimes = GetTaskA(TSK_PLAYTIMES, TSK_DAYKEY)
	if nTimes >= MAXGAMETIME then
		Talk(1, "", "ÿ��ֻ�ܲμ�3�������������ɡ�")
		return
	end
	
	if GetTask(TSK_RANK) ~= 0 and GetTask(TSK_COUNT_ONETIME) > 0 then
		Talk(1, "", "��Ҫ��ȡ����������εĽ������ܼ����μӣ���ȥ�콱�ɡ�")
		return
	end

	return 1
end

function dojoingame()
	local nMapId, nX, nY = GetWorldPos()
	SetTask(TSK_LEAVERMAPID, nMapId)
	SetTask(TSK_LEAVERPOSX, nX)
	SetTask(TSK_LEAVERPOSY, nY)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\zhaojingling\\templet\\gametemplet.lua", "GameTemplet:MoveTo", PREPARE_MAP, POSPATH, 2, PREPAREPOSENDLINE)	
end

function getaward()
	local tbOpt = {}
	tinsert(tbOpt, {"��ȡÿ����������", getonetimeaward})
	--Change request 14/7/2011 - Modified by DinhHQ - 20110714
--	tinsert(tbOpt, {"ÿ������������", getallpaimingaward})
	CreateNewSayEx("<npc>������֮ǰ���εĽ�������ܼ����μ�����ı���", tbOpt)		
end

function checkbox()
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight) >= nCount then
		return 1
	else
		local szMsg = format("Ϊ���������ĲƲ��������� %d %dx%d װ����λ", nCount, nWidth, nHeight)
		Talk(1,"", szMsg)
		return
	end
end

function getonetimeaward()
	local nRank = GetTask(TSK_RANK)
	local nCount = GetTask(TSK_COUNT_ONETIME)
	if nRank <= 0 or nRank > 10 then
		Talk(1, "", "û��Ҫ��Ľ���")
		return
	end
	if nCount <= 0 then
		Talk(1, "", "û��Ҫ��Ľ���")
		return		
	end
	
	if checkbox() ~= 1 then
		return
	end
	tbAwardTemplet:GiveAwardByList(%tbPaiMingAward[nRank], "��ȡÿ��ÿ�˻��������")
	SetTask(TSK_RANK, 0)
end

function getallpaimingaward()
	local nIsAward = GetTaskA(TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY)
	if nIsAward > 0 then
		Talk(1, "", "�����������Ѿ�����")
		return
	end
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_GetFormerPaiMing", obj.m_Handle, "receivepaiming", 0)
	obj:Destroy()		
end

function receivepaiming(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing ~= nil and nPaiMing <= 10 then
		if dogetallpaimingaward(nPlayerIndex, nPaiMing) == 1 then
			CallPlayerFunction(nPlayerIndex, AddTaskA, TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY, 1)
			CallPlayerFunction(nPlayerIndex, Msg2Player, format("��ȡ���������� %s", nPaiMing))
		end
	else
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "û��Ҫ��Ľ���")
	end
end

function dogetallpaimingaward(nPlayerIndex, nPaiMing)
	if CallPlayerFunction(nPlayerIndex, checkbox) ~= 1 then
		return 
	end 
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbAllPaiMingAward[nPaiMing], "��ȡÿ��ľ�˻��������")
	return 1
end

function querytopten()
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_QueryTopTen", obj.m_Handle, "displaytopten", 0)
	obj:Destroy()			
end

function displaytopten(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	if tbTopTen == nil then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ŀǰ��û������")
		return
	end
	local nCount = getn(tbTopTen)
	if nCount == 0 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ŀǰ��û������")
		return
	end
	local szMsg = format("%-32s%-10s\n", "����", "����")
	for i=1, nCount do
		local szTemp = format("%-32s%-10d\n", tbTopTen[i][1], tbTopTen[i][2])
		szMsg = szMsg.. szTemp
	end
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szMsg, {{"�����Ի�"}})
end


