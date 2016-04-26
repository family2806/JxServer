
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\compose.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\timectrl.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
function jiaoshi0810_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	if not jiaoshi0810_IsActTime() then
		Talk(1,"", "�������.")
		return 
	end
	
	local tbSay = 
	{
		"<dec>"..szDescLink.."Խ�ϵĽ�ʦ��������ʦ���µ����ӣ���ʦ��Ϊ�������ǳ��������˹���. ��˻��ᣬ��������Ҫ�͸���λ��ɫТ˳�ĵ���. ������μ���λ��?",
		format("�������˽�����/#jiaoshi0810_Content(%d, [[%s]])", nItemIndex, szDescLink),
		format("������μӻ/#jiaoshi0810_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"����֪���ˣ���һ�����./OnCancel"	
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = jiaoshi0810_MakeComposeListOpt(nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink.."��л��ʦ���14-11-2008��23-11-2008. ��ڼ䣬�����ǿ����������߽����������Ѽ�������Ʒ��Ϊ�͸���ʦ������.")
	tinsert(tbSay, "����ֻ���Ӵ�̽����ʦ./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="������ʯ (1��)", tbProp={6, 1, 147, 1, 0, 0},nCount = 1},
			{szName="��Ե��ʯ", tbProp={6, 1, 1835, 1, 0, 0},nCount = 3},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="�Ҵ��ؼ�", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="������ʯ (2��)", tbProp={6, 1, 147, 2, 0, 0},nCount = 1},
			{szName="��Ե��ʯ", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="�Ҵ��ؼ�", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="������ͼ", tbProp={6, 1, 196},nCount = 1},
			{szName="��Ե��ʯ", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="�Ҵ��ؼ�", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[4] =
	{
		tbMaterial = 
		{
			{szName="������ͼ",tbProp={6, 1, 196}, nCount = 10},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="�Ҵ��ؼ�", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	}
}


function jiaoshi0810_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."��ֻϣ�������ټ�����λ�����Խ��Ҷ����ǳ�����˼��֮��.���ǲ��ش���Щ���ص����ֻ��һЩ�򵥵ľͿ��ԣ����Ǹ�λ�����ڶ��������еĳɼ�ƾ֤.<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..jiaoshi0810_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"����֪���ˣ���л��ʦ��/OnCancel"
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_MakeComposeMsg(tbFormula)
	local tbMaterial = tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = jiaoshi0810_TransferDigit2CnNum(tbMaterial[i].nJxb).." ��"
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
	local szMsg = format("<dec>"..szDescLink.."�һ� %s ��Ҫ: <enter>%s, ", %tbFormulaList[nId].tbProduct[1].szName ,jiaoshi0810_ComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("ȷ��/#jiaoshi0810_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"ȡ��/OnCancel"
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


