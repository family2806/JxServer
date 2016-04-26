Include("\\script\\lib\\string.lua");
Include("\\script\\event\\newyear_2009\\taskctrl.lua");

local wuguo_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>ֻ����Щԭ�ϲ��ܶһ�����ش�������������ȥ��ԭ���ҹ���<color>",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "����֦",	tbProp={6, 1, 1886, 1, 0, 0}, 	nCount = 2},
			{szName = "Ҭ��", 	tbProp={6, 1, 1887, 1, 0, 0}, 	nCount = 1},
			{szName = "ľ��", tbProp={6, 1, 1888, 1, 0, 0}, 	nCount = 1},
			{szName = "â��", 	tbProp={6, 1, 1889, 1, 0, 0},	nCount = 1},
			{szName = "�޻���",	tbProp={6, 1, 1890, 1, 0, 0},	nCount = 3},
		},
		tbProduct = 
		{
			szName = "����ش�����",
			[1] =
			{
				{szName="������", 	tbProp={6, 1, 1016, 1, 0, 0},	nRate = 50},
				{szName="��ɫ��", tbProp={6, 1, 1053, 1, 0, 0}, 	nRate = 50},
			},
			[2] = {nExp = 8e6},
			[3] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(newyear0901_TSK_GetExp_Wuguo, 800 + GetTask(newyear0901_TSK_GetExp_Wuguo));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(newyear0901_TSK_GetExp_Wuguo) + 800 > 40000) then
				Msg2Player("�������õ���߾��飬�����ٴ�����ش������ȡ������!");
				return 0;
			else
				return 1;
			end
			
		end
	},
}

function newyear0901_wuguo_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	newyear0901_ResetTask();
	
	if (newyear0901_wuguo_IsActDate() ~= 1) then
		return Talk(1, "", "�������.")
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("���²���50��������δ��ֵ��˲��ܲμӴ˻.", 0);
		return 1;
	end
	
	tbFormulaList = tbFormulaList or %wuguo_tbFormulaList
	newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_wuguo_Compose:MakeOptByProductName("��Ҫ��ȡ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."����ҹ�����֦��Ҭ�ӣ�ľ�ϣ�â�����޻���������ˮ������õ����������.");
	tinsert(tbSay , getn(tbSay)+1, "�����Ի�/OnCancel");
	CreateTaskSay(tbSay);
end

function newyear0901_wuguo_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end


--ֻ�ڶԻ�ʱ����һ��
function newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_wuguo_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_wuguo_Compose", tbFormulaList)
	end
end
