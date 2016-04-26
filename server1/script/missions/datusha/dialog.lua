Include("\\script\\missions\\datusha\\datusha.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
COST_MONEY = 100000
MAX_AWARD_COUNT = 100
DaTuShaRankAward = 
{
	[1] = 8e6,
	[2] = 7e6,
	[3] = 6e6,
	[4] = 5e6,
	[5] = 45e5,
	[6] = 4e6,
	[7] = 35e5,
	[8] = 3e6,
	[9] = 25e5,
	[10] = 15e5,
}
LastManAward = 
{
	[1]={szName="������ͼ��",tbProp={6,1,2714,1,0,0},nRate = 2.0,},
	[2]={szName="������ͼ��",tbProp={6,1,2715,1,0,0},nRate = 2.0,},
	[3]={szName="��������ͼ��",tbProp={6,1,2717,1,0,0},nRate = 2.0,},
	[4]={szName="��������ͼ��",tbProp={6,1,2718,1,0,0},nRate = 2.0,},
	[5]={szName="������ͼ��",tbProp={6,1,2720,1,0,0},nRate = 2.0,},	
	[6]={szName="����Ьͼ��",tbProp={6,1,2716,1,0,0},nRate = 2.0,},	
	[7]={szName="��������ͼ��",tbProp={6,1,2719,1,0,0},nRate = 2.0,},	
	[8]={szName="�����Ͻ�ָͼ��",tbProp={6,1,2721,1,0,0},nRate = 0.5,},	
	[9]={szName="�����½�ָͼ��",tbProp={6,1,2722,1,0,0},nRate = 0.5,},	
	[10]={szName="��������ͼ��",tbProp={6,1,2723,1,0,0},nRate = 0.5,},
	[11]={szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	[12]={szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nCount=1,nRate=19, nExpiredTime = 10080},	
	[13]={nExp_tl=1,nRate = 65,nCount = 10000000,},	
}

TotalRankAward = 
{
	{
		{nExp_tl = 32e6},
		{
			{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nRate = 5.0, nExpiredTime = 43200}
		}
	},
	{nExp_tl = 28e6},
	{nExp_tl = 24e6},
	{nExp_tl = 20e6},
	{nExp_tl = 18e6},
	{nExp_tl = 16e6},
	{nExp_tl = 14e6},
	{nExp_tl = 12e6},
	{nExp_tl = 10e6},
	{nExp_tl = 8e6},
}
function DaTuShaClass:Join()
	local pDungeon = DungeonList[896]
	if pDungeon then
		local nMapId, nX, nY = GetWorldPos()
		pDungeon.tbPlayer[GetName()] = {tbSignUpPos={nMapId, nX, nY}}
		
		pDungeon:GotoDaTuSha();
	end
end

function about(nStep)
	
	local szTitle = ""
	local tbOpt = {}	
	if nStep == 0 then
		szTitle = "<npc>�ʱ����ÿ���12:00, 19:00, 20:00, 21:00, ����120�����ϵ���Ҷ��������ұ���, ����ʱ��Ϊ10����, ����Ҫ��10����. ���ʼ�����ʹ������ļ��ܲ�ս, ��սʱ����30��,ÿ������5�θ�������, ���������ݻ����콱."
		tinsert(tbOpt, {"���ݹ���һ��ʲô���ĵط�", about, {1}})
		tinsert(tbOpt, {"��ʲô��Ʒ��", about, {2}})
	elseif nStep == 1 then
		szTitle = "<npc>���ݹ��ǽ�������͢����ѵ�����ڸ��ֵ����ܵط������и������˵Ľз��Ƿֳ�9������ľ��ݩu���俪ʼ�󣬴ӵ�3��ʼ��ÿ��3���ӽ���һ������ǧ����ް������������ʱ�Ʊ��뿪���ᱻ�������ڵ�30���������û�зֳ�ʤ�ܣ����е�������ҽ��ᱻ���������г�������ر����˪���ں�˪�л�ս�ȱ���˪��вͬʱ������Σ��."
		tinsert(tbOpt, {"�Ի�������һ��", about, {0}})	
	elseif nStep == 2 then
		szTitle = "<npc>ÿ�λҪ���ݱ��εĻ������콱������������Ψһ���Ҵ��ߣ�Ҳ������ȡ������ʿ�Ľ�Ʒ��ÿ�콫���ݰ�����ȡ�Ļ��ּ���������ǰʮ��������ʿ��Ʒ."
		tinsert(tbOpt, {"�Ի�������һ��", about, {0}})
	end
	tinsert(tbOpt, {"�����Ի�"})
	CreateNewSayEx(szTitle, tbOpt)	
end

function check_rank()
	
	local szMsg = format("����ܻ�����<color=green>%d<color><enter>", GetPlayerTotalScores())
	
	local szName, nValue = Ladder_GetLadderInfo(LadderId, 1);
	
	if (szName == nil or szName == "" or nValue == nil) then
		return Talk(1, "", szMsg.."��ʱ��û��ǰʮ�������а�.")
	end
	
	szMsg = szMsg.."ǰʮ�������а�: <enter>"	
	szMsg = szMsg..format("%s%s%s<enter>", strfill_center("����", 6, " "), strfill_center("����", 10, " "), strfill_center("�ܻ���", 8, " "))
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName and szName ~= "" and nValue > 0 then
			szMsg = szMsg..format("%s%s%s<enter>", strfill_center(tostring(i), 6, " "), strfill_center(szName, 10, " "), strfill_center(tostring(nValue), 8, " "))
		end
	end
	local tbOpt = 
	{
		{"����", dialog_main},
		{"�����Ի�"},
	}
	CreateNewSayEx("<npc>"..szMsg, tbOpt)
end

function round_award()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		return Talk(1, "", "����ʱ�䲻���콱")
	end
	if not DaTuShaClass.Rank then
		return
	end
	local szCurName = GetName()
	if DaTuShaClass.Scores[szCurName] == nil or DaTuShaClass.Scores[szCurName] == 0 then
		return Talk(1, "", "�㻹û�вμӾ��ݹ�����")
	end
	
	if DaTuShaClass.Scores[szCurName] < 0 then
		return Talk(1, "", "��������˽�Ʒ.")
	end
	local nCount = getn(DaTuShaClass.Rank)
	if nCount > MAX_AWARD_COUNT then
		nCount = MAX_AWARD_COUNT
	end
	local nRank = nil
	for i=1, nCount do
		local szName = DaTuShaClass.Rank[i][1]
		if (szCurName == szName) then
			nRank = i
			break
		end
	end
	if nRank then
		Msg2Player(format("��ս��������� %d, �������������������.", nRank))
		local nAwardCount = getn(DaTuShaRankAward)
		local nExp = DaTuShaRankAward[nRank]
		if nRank > nAwardCount then
			nExp = DaTuShaRankAward[nAwardCount]
		end
		if nExp then
			tbAwardTemplet:Give({nExp_tl = nExp}, 1, {"��ս���ݹ�","�̶�����"})
			DaTuShaClass.Scores[szCurName] = -1
		end
	else
		 Talk(1, "", format("����ս���������� %d������", MAX_AWARD_COUNT))
	end	
end

function last_man_award()
	local LastMan = DaTuShaClass.LastMan
	if LastMan and LastMan.szName and LastMan.szName == GetName() and LastMan.bFlag == nil then
		if CalcFreeItemCellCount() < 1 then
			return Talk(1, "",  format("������Ҫ <color=yellow>%d<color>�ռ�.", 1))
		end
		
		tbAwardTemplet:Give(LastManAward, 1, {"��ս���ݹ�","������ʿ�Ľ�Ʒ"})
		LastMan.bFlag = 1
	else
		Talk(1, "", "��û���ʸ��콱�����Ѿ������.")
	end
end

function final_award()
	local nHour = tonumber(GetLocalDate("%H"))
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	if not(nHour > 21 and nHour < 24) then
		return Talk(1, "", "���ڲ��������е��콱ʱ��.")
	end
	if GetTask(TSK_FINAL_AWARD) == nDate then
		return Talk(1, "", "���Ѿ��������.")
	end
	
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "",  format("����Ҫ��<color=yellow>%d<color> �ռ�.", 1))
	end
	
	local nRank = nil
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName == GetName() and nValue > 0 then
			nRank = i
			break
		end
	end
	if nRank and TotalRankAward[nRank] then
		tbAwardTemplet:Give(TotalRankAward[nRank], 1, {"��ս���ݹ�","������ʿ�Ľ�Ʒ"})
		SetTask(TSK_FINAL_AWARD, nDate)
	else
		return Talk(1, "", "�㲻��ǰʮ�����а���.")
	end
end

function give_award()
	local szTitle = "<npc>ÿ�λҪ���ݱ��εĻ������콱������������Ψһ���Ҵ��ߣ�Ҳ������ȡ������ʿ�Ľ�Ʒ��ÿ�콫���ݰ�����ȡ�Ļ��ּ���������ǰʮ��������ʿ��Ʒ."
	local tbOpt = 
	{
		
		{"������ȡÿս�Ľ�Ʒ", round_award},
		{"������ȡ [������ʿ]�Ľ�Ʒ" ,last_man_award},
		{"�������ܻ��ֽ���", final_award},
		{"�����Ի�"},
	}
	
	CreateNewSayEx(szTitle, tbOpt)
end

function join_datusha()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState ~= 1 then
			return
		end
	else
		return
	end
	if (ST_GetTransLifeCount() <= 0 and GetLevel() < 120) then
		return Msg2Player(format("����Ҫ��<color=yellow>%d<color>.", 120))
	end
	--Change request July 13, 2011 - Modified by DinhHQ - 20110713
--	if Pay(COST_MONEY) ~= 1 then
--		return Talk(1, "", format("��Ҫ�Ͻ� %d��������", COST_MONEY))
--	end
	if PlayerFunLib:GetTaskDailyCount(2710) >= 1 then
		if (CalcItemCount(-1, 6, 1, 30117, -1) < 1 or ConsumeEquiproomItem(1, 6, 1, 30117, 1) ~= 1) then
			Talk(1, "", "������Ѳμӹ�һ���ˣ���βμ�Ҫ��1��������")
			return
		else
			tbLog:PlayerActionLog("LoanChienCuuChauCoc","TruThanhCong1CuuChauLenh")
		end
	end
	PlayerFunLib:AddTaskDaily(2710, 1)
	pDungeon.tbPlayer[GetName()] = {}
	local nMapId, nX, nY = GetWorldPos()
	pDungeon.tbPlayer[GetName()].tbSignUpPos = {nMapId, nX, nY}
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "luanzhanjiuzhou")
	pDungeon:GotoDaTuSha()
	--Ghi log ���� key - Modified By DinhHQ -20120410
	if PlayerFunLib:GetTaskDailyCount(2710) == 1 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocMienPhi")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocThuPhi")
	end
end

function dialog_main()
	local szTitle = "<npc>Ϊ��Ϊ����ѡ���˲ţ���͢������������ѡ��һЩ����˫ȫ�ĸ��֡���ӭ��λ�����μ�."
	local tbOpt = 
	{
		{"����ս���ݹ��й�", about, {0}},
		{"���뿴�ҵ��ܻ��ֺ�ǰʮ����", check_rank},
		{"�����콱", give_award},
		{"��ֻ��·��"},
	}
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState == 1 then
			tinsert(tbOpt, 1, {"�����μ���ս���ݹ�", join_datusha, {}})
		end
	end
	
	
	CreateNewSayEx(szTitle, tbOpt)	
end

EventSys:GetType("AddNpcOption"):Reg("�Ƶƹ�Ů", "��ս���ݹ�", dialog_main)
