Include("\\script\\lib\\composeex.lua")
Include("\\script\\vng_event\\ngusackettinh\\head.lua")

if (not tbNSKT_ItemCompose) then
	tbNSKT_ItemCompose = {}
end

tbNSKT_ItemCompose.tbCrystalCompose = 
	{
		["三色结晶"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("五彩结晶活动\t 合成 %s", "三色结晶"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "木结晶", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "火结晶", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "土结晶", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "三色结晶", tbProp = {6,1,30077,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["三色结晶"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("五彩结晶活动\t 合成 %s", "三色结晶"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "木结晶", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "水结晶", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "火结晶", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "土结晶", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "三色结晶", tbProp = {6,1,30076,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["五色结晶"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("五色结晶活动\t 合成 %s", "五色结晶"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "金结晶", tbProp = {6,1,30069,1,0,0}, nCount = 1},
								{szName = "木结晶", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "水结晶", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "火结晶", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "土结晶", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "五色结晶", tbProp = {6,1,30075,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["翻羽"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("五彩结晶活动\t 换%s", "翻羽"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "召回令牌", tbProp = {6,1,30074,1,0,0}, nCount = 60},								
							},
						tbProduct = {szName = "翻羽", tbProp = {0,10,7,1,0,0},nCount=1,nExpiredTime=259200},
					},
					pCompos = nil;
			},
			["翻羽无限使用"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("五彩结晶活动\t 换%s", "翻羽无限使用"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "召回令牌", tbProp = {6,1,30074,1,0,0}, nCount = 200},								
							},
						tbProduct = {szName = "翻羽", tbProp = {0,10,7,1,0,0},nCount=1,},
					},
					pCompos = nil;
			},
		["星星"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("五彩结晶活动\t 换%s", "星星"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "幸运星星", tbProp = {6,1,30078,1,0,0}, nCount = 1},
								{szName = "松树", tbProp = {6,1,30082,1,0,0}, nCount = 1},								
							},
						tbProduct = 
							{
								{szName="幸福星星",tbProp={6,1,30080,1,0,0},nRate=80,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="平安星星",tbProp={6,1,30079,1,0,0},nRate=15,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="白星星",tbProp={6,1,30081,1,0,0},nRate=5,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
							},
					},
					pCompos = nil;
			}
	}
	
function tbNSKT_ItemCompose:compose(szItemName)
	local tbItem = self.tbCrystalCompose[szItemName];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("合成 [%s]", szItemName));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end