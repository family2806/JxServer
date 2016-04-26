Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
tbChectfour = {};
tbChectfour.tbCompose = 
{
				["神秘之书"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("换原料\t 合成 %s", "神秘之书"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "紫水晶", tbProp = {4,239,1,1,0,0}, nCount = 1},
									{szName = "绿水晶", tbProp = {4,240,1,1,0,0}, nCount = 1},
									{szName = "蓝水晶", tbProp = {4,238,1,1,0,0}, nCount = 1},
									{szName = "1级玄晶", tbProp = {6,1,147,1,-1,0}, nCount = 50},
									{szName = "2级玄晶", tbProp = {6,1,147,2,-1,0}, nCount = 50},
									{szName = "3级玄晶", tbProp = {6,1,147,3,-1,0}, nCount = 50},
									{szName = "九州令", tbProp = {6,1,30117,1,0,0}, nCount = 1},
									{szName = "龙血丸", tbProp = {6,1,2117,1,0,0}, nCount = 1},
									{szName = "千宝库令", tbProp = {6,1,2813,1,0,0}, nCount = 1},
									{szName = "行侠令", tbProp = {6,1,2566,1,0,0}, nCount = 50},
									{szName = "铁罗汉", tbProp = {6,1,23,-1,-1,0}, nCount = 2},
								},
							tbProduct = {szName = "神秘之书", tbProp = {6,1,30181,1,0,0}, nExpiredTime = 60*24*7},
						},
						pCompos = nil;
				},
				["开箱4"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("交物品\t 可以?%s", "开箱4"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "神秘之书", tbProp = {6,1,30181,1,0,0}, nCount = 3},
									{szName = "神秘钥匙", tbProp = {6,1,30182,1,0,0}, nCount = 1},
								},
							pProductFun = function (self)
								OpenStoreBox(3)
								Msg2Player("你获得打开存有秩序物的箱子")
							end,
							pLimitFun = function (self) 
								return %tbChectfour:LimitStoreBox()
							end,
						},
						pCompos = nil;
				},
}

function tbChectfour:CreateDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbChectfour:ComposeItem(strItemName)
	local tbItem = self.tbCompose[strItemName]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, strItemName);			
		end
		tbItem.pCompos:ComposeDailog(0);
	end
end
--神秘之书
function tbChectfour:main()
	local tbMainDialog = tbChectfour:CreateDialog()
	tbMainDialog.szTitleMsg = "不懂我能帮你什么?"
	tbMainDialog:AddOptEntry("换神秘之书", tbChectfour.ComposeItem, {tbChectfour, "神秘之书"})
	tbMainDialog:AddOptEntry("交物品开箱4", tbChectfour.ComposeItem, {tbChectfour, "开箱 4"})
	tbMainDialog:Show()
end	

function tbChectfour:CheckStoreBox()
	for i=1, 2 do
		if CheckStoreBoxState(i) == 0 then
			return i
		end 
	end
	return 0
end

function tbChectfour:LimitStoreBox()
		if tbChectfour:CheckStoreBox() > 0 then
			Msg2Player(format("大侠还未打开箱子%d",tbChectfour:CheckStoreBox() + 1))
			return 0
		end
		if CheckStoreBoxState(3) > 0 then
			Msg2Player("大侠已打开4号箱子，不能开了")
			return 0
		end
		return 1
end