
Include("\\script\\lib\\composeclass.lua")
Include("\\script\\event\\shengdan_jieri\\200811\\timectrl.lua")
Include("\\script\\lib\\string.lua")
function shengdan0811_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	if not shengdan0811_IsActTime() then
		Talk(1,"", "��ѽ���.")
		return 
	end
	szDescLink = szDescLink or "<npc>"
	local tbSay = 
	{
		"<dec>"..szDescLink.."�������մ�05-12-2008��24:00��04-01-2008.��λͬ�������˽�Ͳμ��ĸ��?",
		format("�������˽���λ./#shengdan0811_Content(%d,[[%s]])", nItemIndex, szDescLink),
		format("������μ���λ/#shengdan0811_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"����һ������./OnCancel"	
	}
	CreateTaskSay(tbSay);
end

function shengdan0811_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = shengdan0811_MakeComposeListOpt(nItemIndex, szDescLink)
	
	
	
	tinsert(tbSay, 1, "<dec>"..szDescLink.."��λͬ�������Ʒ�һ���ʲô��Ʒ��?")
	tinsert(tbSay, "��һ�����./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="��������", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 3},
			{szName="������", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 3},
			{szName="������", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 3},
			{szName="������", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 3},
			{szName="��Ե��ʯ", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="���ﵰ��", tbProp={6, 1, 1848, 1, 0, 0}, nExpiredTime = 20090111

		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			
			{szName="��������", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 1},
			{szName="������", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 1},
			{szName="������", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 1},
			{szName="������", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 1},
			{szName="��������", tbProp={6, 1, 1847, 1, 0, 0}, nCount = 3},
			{szName="��Ե��ʯ", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="�ɿ�������", tbProp={6, 1, 1849, 1, 0, 0}, nExpiredTime = 20090111
		}
		
	},
}


function shengdan0811_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."��������ջ��05-12-2008 �յ�04-01-2009. ��ڼ���ҿ���ͨ������޼���ɫ��к�ͨ�������й��ռ���ɫ��С�����У�ͬ���ǿ��Եõ���NPCѩ��ү���һ����ֵ������Ʒ��ʹ�ø��൰����Եõ�������м�ֵ�Ľ�Ʒ������֮�⣬��λ�����ܻ�õ��ر����С�����������ɿ��������ϵİ������������<enter>������Ҫ�����µ���Ʒ���һ�����:<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..shengdan0811_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"֪����. /OnCancel"
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
			szName = transferDigit2CnNum(tbMaterial[i].nJxb).." l��ng"
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
		tinsert(tbOpt, format("����ȥ  %s/#shengdan0811_Compose(%d,%d, [[%s]])",shengdan0811_MakeComposeMsg(%tbFormulaList[i], 1), nItemIndex, i, szDescLink))
	end
	return tbOpt
end

function shengdan0811_Compose(nItemIndex, nId, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = format("<dec>"..szDescLink.."�һ� %s ��Ҫ: <enter>%s, ", %tbFormulaList[nId].tbProduct.szName ,tbComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("ȷ��/#shengdan0811_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"ȡ��/OnCancel"
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
	--�����жϱ����ռ�
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("���������ռ䲻��!",0);
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


