Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")

tbGmRole = {}
tbGmRole.nPak = curpack()
tbGmRole.tbAccount = 
{
	["jwob001"] = 
	{
		"jwob001"
	},
	["jwob002"] = 
	{
		"jwob002"
	},
	["jwob003"] = 
	{
		"jwob003"
	},
	["jwob004"] = 
	{
		"jwob004"
	},
	["jwob005"] = 
	{
		"jwob005"
	},
	["test3418"] = 
	{
		"2sfsdfsfs"
	},
	
}
tbGmRole.tbSkill = 
{
	732,
	733
}

function tbGmRole:CheckAccountAndRoleName()
	local szAccount = GetAccount()
	local szName = GetName()
	local tbRoleList = self.tbAccount[szAccount]
	if tbRoleList then
		for i=1, getn(tbRoleList) do
			if tbRoleList[i] == szName then
				return 1
			end
		end
	end
end

function tbGmRole:Change2GM()
	if not self:CheckAccountAndRoleName() then
		return
	end
	for i=1, getn(self.tbSkill) do
		AddMagic(self.tbSkill[i], 1)
	end
	
	local nLevel = GetLevel()
	if nLevel < 120 then
		ST_LevelUp(120-nLevel)
	end
	SetFightState(0)
	SetCamp(6)
	SetCurCamp(6)
	if CalcFreeItemCellCount() >= 1 then
		local nItemIndex = AddItem(6,1,2766,1,0,0)
		SetItemBindState(nItemIndex, -2)
	end
	
end

function tbGmRole:GMC_Menu()
	if not self:CheckAccountAndRoleName() then
		return
	end
	
	local szTitle = "<#16079>"
	local tbOpt = 
	{
		{"<#16076>", g_AskClientStringEx, {"20,3546,6226", 0, 256, "format:map,x,y", {self.NewWorld, {self}} }},
		{"<#16077>", g_AskClientStringEx, {GetName(), 0, 300, "role name", {self.FindRole, {self}} }},
		{"<#16078>"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbGmRole:NewWorld(szPos)
	local tbPos = lib:Split(szPos, ",")
	local nMapId = GetWorldPos()
	if nMapId == tbPos[1] then
		SetPos(tbPos[2], tbPos[3])
	else
		NewWorld(tbPos[1], tbPos[2], tbPos[3])	
	end
	
end

function tbGmRole:FindRole(szName)
	local nPlayerIndex = PlayerIndex
	local nPak = usepack(self.nPak)
	CallPlayerFunction(nPlayerIndex, QueryWiseManForSB, "tbGmRole_Finded", "tbGmRole_UnFind", 0, szName);
	usepack(nPak)
end

function tbGmRole:Finded(szTargetName, szMapName, nSubWorldID, nPosX, nPosY)
	local szTitle = format("<#16080><color=yellow>%s<color>:<color=yellow>%s<color>", szTargetName, szMapName)
	local tbOpt = 
	{
		{"<#16081>",self.NewWorld, {self, format("%d,%d,%d",nSubWorldID, nPosX, nPosY) }},
		{"<#16078>"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function tbGmRole_Finded(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	tbGmRole:Finded(TargetName, MapName, nSubWorldID, nPosX, nPosY)
end

function tbGmRole_UnFind(TargetName, MoneyToPay)
	Talk(1, "", format("<#16082>%s", TargetName))
end