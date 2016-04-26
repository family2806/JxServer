Include("\\script\\event\\guoqing_jieri\\200908\\head.lua")
Include("\\script\\lib\\compose_jinnang.lua")

local tbCrystal = tbBaseClass:new()

tbCrystal.szName = "水晶"
function tbCrystal:_init(nCount)
	
	self.nCount = nCount
end
function tbCrystal:pGetCount()
	return CalcEquiproomItemCount(4, 239, 1, -1) + CalcEquiproomItemCount(4, 240, 1, -1) + CalcEquiproomItemCount(4, 238, 1, -1)
end
function tbCrystal:pConsume(nConsumeCount)
	for i=1, nConsumeCount do
		if ConsumeEquiproomItem(1, 4, 238, 1, -1) == -1 then
			if ConsumeEquiproomItem(1, 4, 239, 1, -1) == -1 then
				if ConsumeEquiproomItem(1, 4, 240, 1, -1) == -1 then
					return
				end
			end
		end
	end
	return 1
end

tbGuoqing0908.tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="风衣帽", tbProp={6, 1, 2097}, nCount = 5},
			{szName="玄晶矿石(2级)", tbProp={6, 1, 147, 2}},
			{nJxb = 6e4},
		},
		tbProduct = {szName="风衣帽", tbProp={6, 1, 2098, 1, 0, 0}, nExpiredTime = 20090914}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="和平帽", tbProp={6, 1, 2098}},
			tbCrystal:new(1),
		},
		tbProduct = 
		{
			szName = "自由帽", 
			[1] = {szName="自由帽", tbProp={6, 1, 2099, 1, 0, 0}, nExpiredTime = 20090914, nRate = 95},
			[2] = {szName="幸福帽", tbProp={6, 1, 2100, 1, 0, 0}, nExpiredTime = 20090914, nRate = 5},
		}
		
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="和平帽", tbProp={6, 1, 2098}},
			tbCrystal:new(2),
		},
		tbProduct = {szName="幸福帽", tbProp={6, 1, 2100, 1, 0, 0}, nExpiredTime = 20090914},

		
	},
}

tbGuoqing0908.ComposeList = tbComposeListForJinNang:new("tbGuoqing0908_compose", tbGuoqing0908.tbFormulaList)

function tbGuoqing0908:ComposeDailogMain(nItemIndex, szDescLink)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > self.nComposeEndDate then
		return Talk(1, "" ,"活动结束了.")
	end
	
		
	local szTitle = "各位要选哪种方式?"
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = self.ComposeList:MakeOptBytbMaterialList("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "对话结束/OnCancel")
	CreateTaskSay(tbSay)	
end

function tbGuoqing0908:GetJinnang()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > self.nEndDate then
		return Talk(1, "" ,"活动结束了.")
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "你未达到领取此物品的条件")
		return
	end
	
	if self.tbTask:GetJinNangState() == 1 then
		Say("L?Quan"..":".."我没有记错的话你已经领过了吧?",1, "真不好意思！在下忘记了./OnCancel")
		return 
	end
	local tbItem = {szName="锦囊事件", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.nComposeEndDate, tbParam = {self.nComposeEndDate, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by guoqin0908")
	self.tbTask:SetJinNangState(1)
end
