Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
DATE_START	= 20111124
DATE_END	= 20111201
tbVnShop = {}
tbVnShop.tbFormula = 
{
	szComposeTitle = "买玫瑰种子",
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
	tbMaterial = 
		{
			{szName="银两",nJxb=300000, nCount = 1},
		},
	tbProduct = {szName = "玫瑰种子", tbProp = {6,1,30156,1,0,0}, nExpiredTime = 20111201},
}

function tbVnShop:Main()
	if self.IsAcitve() == 1 then
		self:ComposeItem()
	else
		Talk(1, "", "目前大侠没有任何玫瑰种子，请大侠谅解!")
	end	
end

function tbVnShop:ComposeItem()
	pCompos = tbActivityCompose:new(self.tbFormula, "买玫瑰种子");
	pCompos:ComposeDailog(1);
end

function tbVnShop:IsAcitve()
	local now = tonumber(date("%Y%m%d"));
	if (now >= DATE_END or now < DATE_START) then
		return 0;
	end
	return 1;	
end

local pEventType = EventSys:GetType("AddNpcOption")
if tbVnShop:IsAcitve() == 1 then
	nId = pEventType:Reg("小贩", "Mua 玫瑰种子", tbVnShop.Main,{tbVnShop})
end	