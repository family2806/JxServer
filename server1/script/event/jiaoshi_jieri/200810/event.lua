
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\compose.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\timectrl.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
function jiaoshi0810_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	if not jiaoshi0810_IsActTime() then
		Talk(1,"", "活动结束了.")
		return 
	end
	
	local tbSay = 
	{
		"<dec>"..szDescLink.."越南的教师节是尊崇教师恩德的日子，老师们为教育我们成人作出了贡献. 借此机会，我有礼物要送给各位出色孝顺的弟子. 你们想参加这次活动吗?",
		format("弟子想了解活动内容/#jiaoshi0810_Content(%d, [[%s]])", nItemIndex, szDescLink),
		format("弟子想参加活动/#jiaoshi0810_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"弟子知道了，我一会回来./OnCancel"	
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = jiaoshi0810_MakeComposeListOpt(nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink.."答谢恩师活动从14-11-2008到23-11-2008. 活动期间，弟子们可以用在行走江湖过程中搜集到的物品做为送给恩师的礼物.")
	tinsert(tbSay, "弟子只是捎带探望恩师./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="玄晶矿石 (1级)", tbProp={6, 1, 147, 1, 0, 0},nCount = 1},
			{szName="福缘晶石", tbProp={6, 1, 1835, 1, 0, 0},nCount = 3},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="家传秘籍", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="玄晶矿石 (2级)", tbProp={6, 1, 147, 2, 0, 0},nCount = 1},
			{szName="福缘晶石", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="家传秘籍", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="神秘密图", tbProp={6, 1, 196},nCount = 1},
			{szName="福缘晶石", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="家传秘籍", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[4] =
	{
		tbMaterial = 
		{
			{szName="神秘密图",tbProp={6, 1, 196}, nCount = 10},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="家传秘籍", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	}
}


function jiaoshi0810_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."我只希望早日再见到各位弟子以解我对你们长长的思念之情.你们不必带着些贵重的礼物，只需一些简单的就可以，这是各位弟子在锻炼过程中的成绩凭证.<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..jiaoshi0810_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"弟子知道了，多谢恩师！/OnCancel"
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_MakeComposeMsg(tbFormula)
	local tbMaterial = tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = jiaoshi0810_TransferDigit2CnNum(tbMaterial[i].nJxb).." 两"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
		
	end
	return szMsg
end

function jiaoshi0810_MakeComposeListOpt(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbOpt = {}
	for i=1, getn(%tbFormulaList) do
		tinsert(tbOpt, format("%s/#jiaoshi0810_Compose(%d,%d, [[%s]])",jiaoshi0810_MakeComposeMsg(%tbFormulaList[i]), nItemIndex, i, szDescLink))
	end
	return tbOpt
end

function jiaoshi0810_Compose(nItemIndex, nId, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = format("<dec>"..szDescLink.."兑换 %s 需要: <enter>%s, ", %tbFormulaList[nId].tbProduct[1].szName ,jiaoshi0810_ComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("确认/#jiaoshi0810_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"取消/OnCancel"
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_ComposeConfirm(nItemIndex, nId)
	nItemIndex = nItemIndex or -1
	
	
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 0
		end
	end
	
	
	if jiaoshi0810_ComposeClass:Compose(%tbFormulaList[nId], "jiaoshi0810_Compose"..jiaoshi0810_MakeComposeMsg(%tbFormulaList[nId]) ) == 1 then
		if tbItemJingnianshijian then
			 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
		end
		return 1
	end
	return 0
end



function OnCancel()
	
end


