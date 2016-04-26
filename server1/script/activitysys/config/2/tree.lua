Include("\\script\\activitysys\\config\\2\\head.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\config\\2\\award.lua")

Tree2Owner = {}
Tree = {}
Tree.STATE2FEATURE = 
{
	[1] = 1490,
	[2] = 1491,
	[3] = 1492,
	[4] = 1493,
	[5] = 1494,
	[6] = 1495,
	
}
Tree.tbAward = tbAwardList["TreeAward"]

Tree.Decoration = 
{
	[1] = ITEM_XMAS_APPLE,
	[2] = ITEM_XMAS_LANTERN,
	[3] = ITEM_XMAS_CANDY,
	[4] = ITEM_XMAS_BELL,
	[5] = ITEM_XMAS_STAR,
}
Tree.PARAM_STATE = 1
--Avoid npc name too long - Modified By DinhHQ - 20111201
--Tree.szNameSuffix = "%s ʥ����"
Tree.szNameSuffix = "%s"
function Tree:Create(szOwner, nMapIndex, nX32, nY32)
	
	local nState = 1
	
	local nFeartueId = self.STATE2FEATURE[nState]
	if not nFeartueId then
		return
	end
	local szNpcName = format(self.szNameSuffix, szOwner)
	local nNpcIndex = AddNpc(nFeartueId, 1, nMapIndex, nX32, nY32, 0, szNpcName);
	
	Tree2Owner[nNpcIndex] = szOwner;
	SetNpcTimer(nNpcIndex, 60*18*20)
	SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\2\\tree.lua")
	SetNpcParam(nNpcIndex, self.PARAM_STATE, nState)
	
end

function Tree:ChangeFeature(nNpcIndex, nFeatureId)
	ChangeNpcFeature(nNpcIndex, 0, 0, nFeatureId)
	SetNpcParam(nNpcIndex, self.PARAM_STATE, nFeatureId)
end

function Tree:Destroy(nNpcIndex)
	Tree2Owner[nNpcIndex] = nil
	DelNpc(nNpcIndex)
end

function Tree:Dialog()
	local nNpcIndex = GetLastDiagNpc()
	if not self:CheckOwner(nNpcIndex, GetName()) then
		return 
	end
	local nState =  GetNpcParam(nNpcIndex, self.PARAM_STATE)
	if nState <= 0 then
		return
	end
	local nCount = getn(self.Decoration)
	local tbOpt = 
	{
		{"����"}
	}
	if nState <= nCount then
		local tbItem = self.Decoration[nState]
		tinsert(tbOpt, 1, {format("ʹ��%s װ��ʥ����", tbItem.szName), self.Decorate, {self, nNpcIndex}})
	else
		tinsert(tbOpt, 1, {"��ȡʥ����Ʒ", self.GetAward, {self, nNpcIndex}})
	end
	CreateNewSayEx("Gi�ng Sinh vui v? <enter> ʥ������ʥ��������ʥ���ӣ�ʥ�����ǿ����ڳ���ɽ���ҵ�����ѧ���Ե�����ɽ�ϣ����Ƕ���������ɳĮ��Ī�߿ߣ����ն���ÿ��19::00-23:00���������Ե����׶��������������������ҡ����׶�������ʥ�����.", tbOpt)
end

function Tree:Decorate(nNpcIndex)
	if not self:CheckOwner(nNpcIndex, GetName()) then
		return 
	end
	local nCount = getn(self.Decoration)
	local nState =  GetNpcParam(nNpcIndex, self.PARAM_STATE)
	if nState <= 0 or nState > nCount then
		return
	end
	
	local tbItem = self.Decoration[nState]
	local tbProp = tbItem.tbProp
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) <= 0 then
		Talk(1, "", format("��û��Я��%s.", tbItem.szName))
		return 
	end
	ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	local nFeatureId = self.STATE2FEATURE[nState + 1]
	if nFeatureId then
		self:ChangeFeature(nNpcIndex, nFeatureId)
	end
	SetNpcParam(nNpcIndex, self.PARAM_STATE, nState + 1)
	if nState == nCount then
		local nX32, nY32 = GetNpcPos(nNpcIndex)
		NpcCastSkill(nNpcIndex, 251, 1, nX32, nY32)
	end
end

function Tree:CheckOwner(nNpcIndex, szOwner)
	if format(self.szNameSuffix, szOwner) ~= GetNpcName(nNpcIndex) then
		Talk(1, "", "�ⲻ�����ֵ���.")
		return
	end
	return 1
end

function Tree:GetAward(nNpcIndex)
	
	if not self:CheckOwner(nNpcIndex, GetName()) then
		return 
	end
	local nCount = getn(self.Decoration)
	local nState =  GetNpcParam(nNpcIndex, self.PARAM_STATE)
	if nState > nCount then
		tbAwardTemplet:Give(self.tbAward, 1, {EVENT_LOG_TITLE, "get tree award"})
		SetNpcParam(nNpcIndex, self.PARAM_STATE, nState + 1)
		self:Destroy(nNpcIndex)
	end
end

function main()
	%Tree:Dialog()
end
function OnTimer(nNpcIndex, nTimeOut)
	%Tree:Destroy(nNpcIndex)
end

