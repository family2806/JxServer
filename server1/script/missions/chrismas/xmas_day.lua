-- Created by Danielsun 2006-12-07
-- ʥ���ڻ
-- xmas_entry()
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\basic.lua")

TB_SnowMan = {
	-- 1.[�ɹ�]ѩ���� 2.[�ɹ�]ѩ��ID 3.[�ɹ�]���� 4.[ʧ��]ѩ���� 5.[ʧ��]ѩ��ID 6.[ʧ��]���� 7,��Ǯ 8,��ȡ��Ʒ�� 9,��ȡ��ƷID
	{"Χ��Χ���ѩ��(�ر�)",  1319,   60,   "Χ��Χ���ѩ��(��ͨ)",    1322,  40,	1000,	"�Ϲϱ�", 1325},
	{"Χ��Χ���ѩ��(�ر�)",  1320,   60,   "Χ��Χ���ѩ��(��ͨ)",    1323,  40,	3000,	"ѩ��",	1326},
	{"�ر�ѩ��",  					1321,   80,   					 "��ͨѩ��",    1324,  20,	5000,			"��", 1327},
}

TB_Material = {
 --1.��Ʒ��	2.����
 [1319] ={
	["6,1,1312"] = {"ѩ��",			10	},
	["6,1,1313"] =	{"���ܲ�",		1	},
	["6,1,1314"] =	{"��֦",	2	},
	["6,1,1315"] =	{"ʥ��ñ",		1	},
	["6,1,1316"] =	{"��Χ��",	1	},
	},
 [1320] ={
	["6,1,1312"] = {"ѩ��",			10	},
	["6,1,1313"] =	{"���ܲ�",		1	},
	["6,1,1314"] =	{"��֦",	2	},
	["6,1,1315"] =	{"ʥ��ñ",		1	},
	["6,1,1317"] =	{"��Χ��",	1	},
	},
 [1321] ={
	["6,1,1312"] = {"ѩ��",			10	},
	["6,1,1313"] =	{"���ܲ�",		1	},
	["6,1,1314"] =	{"��֦",	2	},
	["6,1,1315"] =	{"ʥ��ñ",		1	},
	["6,1,1318"] =	{"��Χ��",		1	},
	},
}

TB_Message = {
	-- ��������
	"��Χ��Χ���ѩ�� (�ر�) ��Ҫ 10 ��ѩ, 1 ���ܲ�, 2 ��֦, 1 ñ��, 1 ��Χ�� ��1000��.",
	"��Χ��Χ���ѩ�� (�ر�) ��Ҫ 10 ��ѩ, 1 ���ܲ�, 2 ��֦, 1 ñ��, 1 ��Χ�� ��3000��.",
	"��ѩ�� (�ر�)  ��Ҫ 10 ��ѩ, 1 ���ܲ�, 2 ��֦, 1 ñ��, 1 ���� ��5000��.",
}

GiftMsg = {
	-- ��ȡ��������
	"���Ϲϱ�Ҫһ��Χ�ź�Χ���ѩ�� (�ر�)",
	"��ѩ��Ҫһ��Χ����Χ���ѩ�� (�ر�)",
	"������Ҫһ���ر�ѩ��",
}

TSKTMP_ITEM_NUMC = 20;

function xmas_entry()
	aryDescribe = {
		"<dec><npc>��ʥ������",
		"��ѩ��/want_snowman",
		"������/want_gift",
		"�������飬���ʱ������/cancel",
		}
	CreateTaskSay(aryDescribe)
end
	
function want_snowman()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>�������.", "֪����/cancel"});
		return 
	end;
	aryDescribe = {
		"<dec><npc>�кܶ���ѩ�ˣ�ÿ�ֵĲ��϶���һ��������������?",
		"��Χ�ź�Χ���ѩ�� (�ر�)/#do_snowman(1)",
		"��Χ����Χ���ѩ�� (�ر�)/#do_snowman(2)",
		"���ر�ѩ��/#do_snowman(3)",
		"�������飬���ʱ������/cancel",
	}
	CreateTaskSay(aryDescribe)
end

function do_snowman(snown)
	SetTaskTemp(TSKTMP_ITEM_NUMC, snown);
	aryDescribe = TB_Message[snown]
	GiveItemUI("��ѩ��",aryDescribe,"do_snow_process","cancel",1)
end

function do_snow_process(nItemCount)
	local nItemNumC = GetTaskTemp(TSKTMP_ITEM_NUMC);
	local nItemPart = TB_SnowMan[nItemNumC][2]
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material[nItemPart] do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	
	--�����Ʒƥ��
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		if(GetCash() < TB_SnowMan[nItemNumC][7]) then
			aryDescribe = {
				"<dec><npc>��ѩ����Ҫ��"..TB_SnowMan[nItemNumC][7].."Ǯ�������ϵ�Ǯ����",
				"֪����/cancel"
				}
			CreateTaskSay(aryDescribe)
			return
		end
		
		if (TB_Material[nItemPart][szItemKey] == nil) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", ���"..GetItemName(nCurItemIdx)..",�Ҳ���Ҫ������û�ȥ��",
												"������!/#do_snowman("..nItemNumC..")",
												"��һ�����./cancel"	}	);
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		tb_enhanceitem_count[szItemKey][2] = nCurItemName;
		if(tb_enhanceitem_count[szItemKey][1] > TB_Material[nItemPart][szItemKey][2] ) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", ��Ҫ������ô��<color=yellow>"..nCurItemName.."<color>����ò����ķų�ȥ.",
													"������!/#do_snowman("..nItemNumC..")",
													"��һ�����./cancel"	}	);
				return
		end
	end
	
	for szkey, tb_item in TB_Material[nItemPart] do
			if (tb_enhanceitem_count[szkey][1] ~= TB_Material[nItemPart][szkey][2]) then
				CreateTaskSay( { "<dec><npc>�����Ƿ�ԭ���� <color=yellow>"..tb_enhanceitem_count[szkey][2].."<color>������ԭ�ϲ�������������.",
			"������!/#do_snowman("..nItemNumC..")",
			"��һ�����./cancel"	}	);
				return
			end
	end
		
	--ɾ����
	for i=1, nItemCount do
		local nIdx = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog("[��ѩ��]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t ɾ����Ʒʧ��\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	Pay(TB_SnowMan[nItemNumC][7])
	
	 --����Ʒ
	 local str = "";
	 PItem = random() * 100;
	if(PItem < TB_SnowMan[nItemNumC][3]) then
	 
		str = "�����ɹ�<color=yellow>"..TB_SnowMan[nItemNumC][1].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][2],1,0,0)
	else
		str = "�����ɹ�<color=yellow>"..TB_SnowMan[nItemNumC][4].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][5],1,0,0)
	end
	Msg2Player(str)
	WriteLog("[��ѩ��]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str);
end

function want_gift()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>�������.", "֪����/cancel"});
		return 
	end;
	aryDescribe = {"<dec><npc>�һ�������Ӧ������:\n ϵ����Χ���ѩ��---�Ϲϱ�\n ϵ�ź�Χ���ѩ��---ѩ��\n �ر�ѩ��---�� \n ѡ��һ�����",
								 "�Ϲϱ�/#do_gift(1)",
								 "ѩ��/#do_gift(2)",
								 "��/#do_gift(3)",
								 "��ʱ����Ҫ/cancel",
		}
		CreateTaskSay(aryDescribe)
end

function do_gift(ngift)
		local Gcount = CalcEquiproomItemCount(6,1,TB_SnowMan[ngift][2],1)
		if(Gcount == 0) then
			Talk(1,"","������û��"..TB_SnowMan[ngift][1]..". ���ܶһ�����"..TB_SnowMan[ngift][8]..".")
		else  
			ConsumeEquiproomItem(1,6,1,TB_SnowMan[ngift][2],1)
			AddItem(6,1,TB_SnowMan[ngift][9],1,0,0)
			Msg = "��ɹ��һ�"..TB_SnowMan[ngift][8]
			Msg2Player(Msg)
			WriteLog("[��ѩ��]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t exchange "..GetItemName(GetGiveItemUnit(i)).." for "..TB_SnowMan[ngift][8]);
		end
end


function pack(...)
	return arg
end

function cancel()
	SetTaskTemp(TSKTMP_ITEM_NUMC, 0);
end