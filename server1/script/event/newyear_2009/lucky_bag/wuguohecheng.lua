Include("\\script\\lib\\string.lua");
Include("\\script\\event\\newyear_2009\\taskctrl.lua");

local wuguo_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>只用这些原料不能兑换五果贺春奖励，大侠先去吧原料找够吧<color>",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "番荔枝",	tbProp={6, 1, 1886, 1, 0, 0}, 	nCount = 2},
			{szName = "椰子", 	tbProp={6, 1, 1887, 1, 0, 0}, 	nCount = 1},
			{szName = "木瓜", tbProp={6, 1, 1888, 1, 0, 0}, 	nCount = 1},
			{szName = "芒果", 	tbProp={6, 1, 1889, 1, 0, 0},	nCount = 1},
			{szName = "无花果",	tbProp={6, 1, 1890, 1, 0, 0},	nCount = 3},
		},
		tbProduct = 
		{
			szName = "五果贺春奖励",
			[1] =
			{
				{szName="如意帖", 	tbProp={6, 1, 1016, 1, 0, 0},	nRate = 50},
				{szName="彩色帖", tbProp={6, 1, 1053, 1, 0, 0}, 	nRate = 50},
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
				Msg2Player("大侠已拿到最高经验，不能再从五果贺春活动中领取奖励了!");
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
		return Talk(1, "", "活动结束了.")
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("打下不到50级或者是未充值因此不能参加此活动.", 0);
		return 1;
	end
	
	tbFormulaList = tbFormulaList or %wuguo_tbFormulaList
	newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_wuguo_Compose:MakeOptByProductName("我要领取", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."如果找够番荔枝，椰子，木瓜，芒果，无花果这五种水果将会得到更多的幸运.");
	tinsert(tbSay , getn(tbSay)+1, "结束对话/OnCancel");
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


--只在对话时产生一次
function newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_wuguo_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_wuguo_Compose", tbFormulaList)
	end
end
