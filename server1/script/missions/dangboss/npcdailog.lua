
Include("\\script\\missions\\dangboss\\dangbaossclass.lua")

Include("\\script\\lib\\composeclass.lua")
Include("\\script\\event\\qingren_jieri\\200902\\event.lua");	


if not tbDangBossDailog then
	tbDangBossDailog = tbBaseClass:new()
end




function tbDangBossDailog:_init(tbTaskCtrl)
	self.szClassName = "tbDangBossDailog"
	self.tbTask = tbTaskCtrl
	self.nStartDate = 090117
	self.nEndDate = 090217
end

function tbDangBossDailog:IsActDay()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	--return self.nStartDate <= nDate and nDate <= self.nEndDate
	return 1
end

function tbDangBossDailog:Main()
	Talk(1, "", "�ݱջ.")
	do return end
	if self:IsOpenModule() ~= 1 then
		return Talk(1, "", "�ݱջ.")
	end
	
	if self:IsActDay() ~= 1 then
		return Talk(1, "", "��ѽ���.")
	end
	
	local tbSay = 
	{
		"<dec><npc>���չٸ��ڽ�����֯������������Ҫȥ��?",
		format("���뱨���μӶ���/#%s:DailogSignUp(1)", self.szClassName),
		format("����Ӯ�����콱/#%s:GetAward(1)", self.szClassName),
		format("�����˽⶷��/#%s:Explain()", self.szClassName),
		"�����Ի�/OnCancel",
		
	}
	
	CreateTaskSay(tbSay)
end

function tbDangBossDailog:Explain(nStep)
	local tbSay = 
	{
		"<dec><npc>ÿ��20:00-21:00���ʼ. ��20:00��20:00��21:00��21:10;80�����ϵĳ�ֵ�߿��Ե��ⱨ��, ÿ��ֻҪ100��. һ���˽���ɽ���, ����˽�����. �����5����֮�ڴ�ܽ��㽫��ý��㱦��. ���û�д����ô��ɽ�����˽��õ��ٸ�������.",
		"֪����/OnCancel",
	}
	
	CreateTaskSay(tbSay)
end


function tbDangBossDailog:DailogSignUp(nStep)
	
	local nMapId = 895
	local nMoney = 0
	
	local nCurMatchId = tbDangBoss:GetMissionV(tbDangBoss.tbMissionV.MATCH_ID, nMapId)
	local nContinueCount = self.tbTask:GetContinueCount(nCurMatchId) + 1
	local nMissionState = tbDangBoss:GetMissionState(nMapId)
	local nPlayerCount = tbDangBoss:GetMSPlayerCount(0, nMapId)
	if nStep == 1 then
		if nMissionState == 2 then
			nMoney = nContinueCount * 1e5
			local tbSay = 
			{
				format("<dec><npc>����ʱ���ѹ�, ����Ҫ�� %d�����ſ��Խ���. ȷ��֧����", nMoney),
				format("��Ȼ, ��Ҫȥ����/#%s:DailogSignUp(2)", self.szClassName),
				"������!/OnCancel",
			}
			return CreateTaskSay(tbSay)
		end
		
	elseif nStep == 2 then
		if nMissionState == 2 then
			nMoney = nContinueCount * 1e5
		end
		
		if GetCash() < nMoney then
			return Talk(1, "", format("��������,��Ҫ %d", nMoney))
		end
	end	
	
	if tbDangBoss:IsPlayerEligible() ~= 1 then
		Talk(1, "", format("%d�����Ϻ�%s �ſ��Բμ�", tbDangBoss.nMinLevel, (tbDangBoss.bIsCharged == 1 and "�Ͻ�") or ""))
		return 0
	end
	
	if nMissionState ~= tbDangBoss.READY_STATE and nMissionState ~= tbDangBoss.BATTLE_STATE then
		Talk(1, "", "���ϧ����ʱ���ѹ�. ���³���")
		return 0
	end
	if nPlayerCount >= tbDangBoss.nMaxPlayerCount then
		Talk(1, "", format("���������Ѵﵽ  %d. ���ϧ, ���³���", tbDangBoss.nMaxPlayerCount))
		return 0
	end
	
	
	
	local nMapId, nPosX16, nPosY16 = GetWorldPos()
	self.tbTask:SetLastPos(nMapId, nPosX16, nPosY16)
	tbDangBoss:GotoBattlePlace()
end

local tbItem = 
{
	{nExp = 1e7},
	{
		{szName="һ��Ǭ����", tbProp={6, 1, 2126, 1, 0, 0}, nExpiredTime = 60*24*30, nRate = 0.5},
		{szName="�쾧�׾���", tbProp={6, 1, 2183, 1, 0, 0}, nRate = 3},
		
		{szName="8��������ʯ", tbProp={6, 1, 147, 8, 0, 0}, nRate = 16},
		{szName="7��������ʯ", tbProp={6, 1, 147, 7, 0, 0}, nRate = 21},
		{nExp = 1e7, nRate = 10},
		
		{nExp = 2e7, nRate = 8},
		
	
		
		{nExp = 5e7, nRate = 2},
		
		
		{szName="�����ؼ�", tbProp={6, 1, 26, 1, 0, 0}, nRate = 8},
		{szName="ϴ�辭", tbProp={6, 1, 22, 1, 0, 0}, nRate = 8},
		{szName="�ƽ�֮��", tbProp={6, 1, 907, 1, 0, 0}, nRate = 5, nExpiredTime = 60*24*7},
		{szName="��Ȼ�Ի͹�", tbProp={6, 1, 2270, 1, 0, 0} , nExpiredTime = 60*24*7, nRate= 18.5},
	}
}

function tbDangBossDailog:GetAward(nStep, nCurCount)
	local nTotalCount = self.tbTask:GetAwardCount()
	
	if nTotalCount == 0 then
		return Talk(1, "", "���ź�, ��εĶ������Ӯ�Ҳ�����������������.")
	end
	
	if nStep == 1 then
		local tbSay = 
		{
			format("<dec><npc>���տ��� %d ��Ʒ, <color=red>(������첻�������û����)<color>����:", nTotalCount),
			format("��ȫ��#%s:GetAward(2, %d)", self.szClassName, nTotalCount),
			format("ֻ��1��/#%s:GetAward(2, 1)", self.szClassName, 1),
			"�����Ի�/OnCancel"
		}
		CreateTaskSay(tbSay)
	elseif nStep == 2 then
		if CalcFreeItemCellCount() >= nCurCount then
			tbAwardTemplet:GiveAwardByList(%tbItem, "��������潱Ʒ", nCurCount)
			self.tbTask:PayAwardCount(nCurCount)
		else
			Talk(1, "", format("�����ռ䲻����ȡ %d ��Ʒ", nTotalCount))
		end
	end	
end

function tbDangBossDailog:IsOpenModule()
	return gb_GetModule("chunjie2009_dangboss")
end

tbDangBossDailog:_init(tbDangBossTaskCtrl)
