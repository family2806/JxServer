
Include("\\script\\lib\\composeclass.lua")
Include("\\script\\event\\shengdan_jieri\\200811\\timectrl.lua")
Include("\\script\\lib\\string.lua")
function shengdan0811_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	if not shengdan0811_IsActTime() then
		Talk(1,"", "活动已结束.")
		return 
	end
	szDescLink = szDescLink or "<npc>"
	local tbSay = 
	{
		"<dec>"..szDescLink.."今年生日从05-12-2008到24:00，04-01-2008.各位同道打算了解和参加哪个活动?",
		format("在下想了解这次活动./#shengdan0811_Content(%d,[[%s]])", nItemIndex, szDescLink),
		format("在下想参加这次活动/#shengdan0811_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"在下一定回来./OnCancel"	
	}
	CreateTaskSay(tbSay);
end

function shengdan0811_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = shengdan0811_MakeComposeListOpt(nItemIndex, szDescLink)
	
	
	
	tinsert(tbSay, 1, "<dec>"..szDescLink.."各位同道想把物品兑换成什么奖品呢?")
	tinsert(tbSay, "我一会回来./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="生日蜡烛", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 3},
			{szName="生日钟", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 3},
			{szName="生日袜", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 3},
			{szName="生日帖", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 3},
			{szName="福缘晶石", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="新娘蛋糕", tbProp={6, 1, 1848, 1, 0, 0}, nExpiredTime = 20090111

		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			
			{szName="生日蜡烛", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 1},
			{szName="生日钟", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 1},
			{szName="生日袜", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 1},
			{szName="生日帖", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 1},
			{szName="生日明星", tbProp={6, 1, 1847, 1, 0, 0}, nCount = 3},
			{szName="福缘晶石", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="巧克力蛋糕", tbProp={6, 1, 1849, 1, 0, 0}, nExpiredTime = 20090111
		}
		
	},
}


function shengdan0811_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."今年的生日活动从05-12-2008 到04-01-2009. 活动期间玩家可以通过大怪兽级蓝色礼盒和通过网上托管收集红色礼盒。打开礼盒，同道们可以得到在NPC雪老爷处兑换各种蛋糕的物品。使用各类蛋糕可以得到经验和有价值的奖品。除此之外，各位还可能会得到特别礼物：小冰晶，用在巧克力蛋糕上的白蜡烛和蓝蜡烛<enter>阁下需要有以下的物品来兑换蛋糕:<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..shengdan0811_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"知道了. /OnCancel"
	}
	CreateTaskSay(tbSay)
end

function shengdan0811_MakeComposeMsg(tbFormula, nType)
	if nType == 1 then
		return tbFormula.tbProduct.szName
	end
	local tbMaterial = tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = transferDigit2CnNum(tbMaterial[i].nJxb).." lng"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
	end
	szMsg = szMsg.."="..tbFormula.tbProduct.szName
	return szMsg
end

function shengdan0811_MakeComposeListOpt(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbOpt = {}
	for i=1, getn(%tbFormulaList) do
		tinsert(tbOpt, format("我想去  %s/#shengdan0811_Compose(%d,%d, [[%s]])",shengdan0811_MakeComposeMsg(%tbFormulaList[i], 1), nItemIndex, i, szDescLink))
	end
	return tbOpt
end

function shengdan0811_Compose(nItemIndex, nId, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = format("<dec>"..szDescLink.."兑换 %s 需要: <enter>%s, ", %tbFormulaList[nId].tbProduct.szName ,tbComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("确认/#shengdan0811_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"取消/OnCancel"
	}
	CreateTaskSay(tbSay)
end

function shengdan0811_ComposeConfirm(nItemIndex, nId)
	nItemIndex = nItemIndex or -1
	
	
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 0
		end
	end
	--这里判断背包空间
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("大侠背包空间不足!",0);
		return
	end
	
	if tbComposeClass:Compose(%tbFormulaList[nId], "shengdan0811_Compose"..shengdan0811_MakeComposeMsg(%tbFormulaList[nId]) ) == 1 then
		if tbItemJingnianshijian then
			 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
		end
		return 1
	end
	return 0
end



function OnCancel()
	
end


