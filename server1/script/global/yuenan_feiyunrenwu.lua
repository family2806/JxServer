--Խ�Ϸ�������:���ʼ��������ﵽ�涨�ĵȼ���60����90����100��������ɵ�NPC����ȡ��Ӧ�Ľ���
--			a.	��Ҵﵽ60���󣬿��Ե��ٰ�������(����166/191) �Ի�����ȡ����������Ϊ��������
--				�������ԣ��������������ɫװ��һ��(��ָ�����/����������/����)��
--			b.	��Ҵﵽ90���󣬿��Ե�����������(����195/205) �Ի�����ȡ����,����Ϊ������������
--				���ԣ��������������ɫ����һ��(����������������ɶ���)��
--			c.	��Ҵﵽ100���󣬿��Ե��������̹Ŵ�(����201/199) �Ի�����ȡ����������Ϊ��������һƥ��


--Date:		November fifteenth 2006
--Author:	liaozhishan
--Right:	Kingsoft all rights reserved@
--file:		yuenan_feiyunrenwu.lua

if (not __H_V_FEIYUNACTION__) then	--__H_V_FEIYUNACTION__
	__H_V_FEIYUNACTION__ = 1;

Include([[\script\lib\gb_taskfuncs.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl60.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl90.lua]]);

--	Date define field: following lines lies date defination;
V_FY_SZ_ACTIONNAME = "v_feiyun06_permanent";	-- Խ�������Ի
V_FY_TK_GETSIGN = 1781;

tab_Reference = {
	[60] = {60, 150, 160},
	[90] = {90, 150, 190},
	[100] = {100, 160, 190},
};

--	common interface following
function v_fy_is_active()	-- Active check up
	do return 0 end		-- ��ѽ��������ùر� by �ӷ��~
	if (gb_GetTask(V_FY_SZ_ACTIONNAME, 1) ~= 0) then
		return 0;
	end;
	return 1;
end;

function v_fy_is_newrole()	--make sure Role is of new type 
	local nPoint = GetExtPoint(6);
	local nBit = GetBit(nPoint, 7);
	if (nBit == 1) then
		return 1;
	end;
	return 0;
end;

--	check if he has gotten the level prize;
--	return value: has gotten return 1; in opposition return 0
function v_fy_is_got(nLevel)
	if (not tab_Reference[nLevel]) then
		return 0;
	end;
	
	local UWorld1781 = GetTask(V_FY_TK_GETSIGN);
	if (UWorld1781 >= 250) then
		return 0
	end;
	local table = tab_Reference[nLevel];
	for i = 1, getn(table) do
		if (UWorld1781 == table[i]) then
			return 0;
		end;
	end;
	return 1;
end;

--	check get prize
--	return value: yes return 1; no return 0;
function v_fy_awardcheck(nLevel)
	if (GetLevel() < nLevel) then
		Say("�㻹δ�ﵽ�ȼ�Ҫ��!", 0);
		return 0;
	end;
	
	if (v_fy_is_got(nLevel) == 0) then
		Say("������ȡ���������ܼ�����ȡ��!", 0);
		return 0;
	end;
	
	if (v_fy_is_newrole() == 0) then
		Say("�����Ǵ����˺��棬�����콱.", 0);
		return 0;
	end;
	return 1;
end;

--	add a number into task
function v_fy_tkvalueadd(nTaskID, nAddend)
	SetTask(nTaskID, ( GetTask(nTaskID) + nAddend ) );
	SyncTaskValue( nTaskID );
end;

--	common interface above

--	field level 60:	Prize when a role level up at 60:
function v_fy_60_entrance()
	Say("������������ˮ����������ʧ�أ��������ټ�����Ӣ����ʿ��̸��ͬʱ��һ��֪��װ������λ�Ѵﵽ60����Ӣ�ۺ��ܡ�", 2, 
	"��ȡ60������/v_fy_60_next",
	"˳��·����������!/no");
end;

function v_fy_60_next()
	local tab_Content = {
		"�������ָ/v_fy_60_ring",
		"������ȡ���� (����)/v_fy_60_yu",
		" �����(����)/v_fy_60_necklace",
		"�뿪/no"
	};
	Say("������ȡʲô����?", getn(tab_Content), tab_Content);
end;

function v_fy_60_ring()	--��ȡ60���Ľ�ָ
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_vn_fy_ring[nSeries]));
	local Index2 = random(1, getn(tab_vn_fy_ring[nSeries][Index1]));
	local str = "�����1 <color=yellow>��ĸ�̽�ָ?color>";
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	AddItemEx(4,tab_vn_fy_ring[nSeries][Index1][Index2],0, 0,3,0, 6,0,200, 6,6,6,6,0,0)
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_necklace()	--��ȡ60���Ļ����(����)
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local tab_award = tab_vn_fy_hushenhu;
	if (nSex == 1) then	-- ����Ǹ�Ů��ɫ
		tab_award = tab_vn_fy_xianglian;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "���껤���";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,1, 6,0,200, 6,6,6,6,0,0);
	elseif (nSex == 1) then	-- ����Ǹ�Ů��ɫ
		szItemName = "����ʯ����";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,0, 6,0,200, 6,6,6,6,0,0);
	end;
	local str = "����� <color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_yu()	--��ȡ60��������
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	
	local tab_award = tab_vn_fy_yupei;
	if (nSex == 1) then	-- ����Ǹ��н�ɫ
		tab_award = tab_vn_fy_xiangrang;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "��������";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,1, 6,2,200, 6,6,6,6,0,0)
	elseif (nSex == 1) then	-- ����Ǹ��н�ɫ
		szItemName = "��������";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,0, 6,0,200, 6,6,6,6,0,0)
	end;
	local str = "�����<color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 90:
function v_fy_90_entrance()
	Say("������������ˮ����������ʧ�أ������ټ�Ӣ����ʿ�ȹ���ͬʱ��1��������Ѵ�90����Ӣ�ۺ���.", 2, 
	"��ȡ90������/v_fy_90_next",
	"˳��������!/no");
end;

v_fy_90_tab_weapon = {
	["cuiyan"] = {"��絶", "����ն"},
	["emei"] = {"������(��ü��)", "������ (��ü��"},
	["tangmen"] = 	 {"������", "���µ�", "��ȸ��"},
	["wudu"] = {"��絶(�嶾��)", "��絶(�嶾��)"},
	["tianwang"] = {"�����", "���촸", "��絶"},
	["shaolin"] = {"��絶", "�𹿰�"},
	["wudang"] = {"������(�䵱��)", "������(�䵱��"},
	["kunlun"] = {"��絶", "������"},
	["gaibang"] = 	 {"�𹿰�(ؤ����)", "����(ؤ���)"},
	["tianren"] = {"�����(�����)", "�����(������)"}
};

function v_fy_90_next()
	local player_Faction = GetFaction();	-- Get Faction Name
--	player_Faction = "tianren";
	if (not player_Faction or not v_fy_90_tab_weapon[player_Faction]) then		-- skip if role not in Faction
		Say("�����ȼ���������������.", 0);
		return
	end;

	local tab_Content = {}
	for i = 1, getn(v_fy_90_tab_weapon[player_Faction]) do
		tinsert(tab_Content, "������ȡ"..v_fy_90_tab_weapon[player_Faction][i].."/#v_fy_90_weapon([["..player_Faction.."]],"..i..")");
	end;
	tinsert(tab_Content, "�뿪/no");

	Say("������ȡʲô����", getn(tab_Content), tab_Content);
end;

-- Get tanle
function v_fy_90_gettable(player_Faction)
	if (player_Faction == "cuiyan") then
		return tab_vn_fy_cym, tab_vn_fy_cym_add
	elseif(player_Faction == "emei") then
		return tab_vn_fy_emp, tab_vn_fy_emp_add
	elseif(player_Faction == "tangmen") then
		return tab_vn_fy_tm, tab_vn_fy_tm_add
	elseif(player_Faction == "wudu") then
		return tab_vn_fy_wdj, tab_vn_fy_wdj_add
	elseif(player_Faction == "tianwang") then
		return tab_vn_fy_twb, tab_vn_fy_twb_add
	elseif(player_Faction == "shaolin") then
		return tab_vn_fy_slp, tab_vn_fy_slp_add
	elseif(player_Faction == "wudang") then
		return tab_vn_fy_wdp, tab_vn_fy_wdp_add
	elseif(player_Faction == "kunlun") then
		return tab_vn_fy_klp, tab_vn_fy_klp_add
	elseif(player_Faction == "gaibang") then
		return tab_vn_fy_gb, tab_vn_fy_gb_add
	elseif(player_Faction == "tianren") then
		return tab_vn_fy_trj, tab_vn_fy_trj_add
	end;
	return nil;
end;

-- Get the prize of level up to 90
function v_fy_90_weapon(player_Faction, i)
	if (v_fy_awardcheck(90) == 0) then
		return
	end;
	
	local table = {};
	local _t = {};
	table, _t = v_fy_90_gettable(player_Faction);
	if (not table or not _t) then
		return
	end;
	local nIndex = random(1, getn(table[i]));
	local str = "�����<color=yellow>"..v_fy_90_tab_weapon[player_Faction][i].."<color>.";
	if (player_Faction == "emei" or player_Faction == "wudang")  then
		str = "�����<color=yellow>������<color>.";
	elseif (player_Faction == "gaibang") then
		str = "�����<color=yellow>�𹿰�<color>.";
	elseif (player_Faction == "wudu") then
		str = "�����<color=yellow>��絶<color>.";
	elseif (player_Faction == "tianren") then
		str = "�����<color=yellow>�����<color>.";
	end;
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 90);
	AddItemEx(_t[i][1],table[i][nIndex],_t[i][3], _t[i][4],_t[i][5],_t[i][6], _t[i][7],_t[i][8],_t[i][9], _t[i][10],_t[i][11],_t[i][12],_t[i][13],_t[i][14],_t[i][15]);
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 100:
function v_fy_100_entrance()
	Say("������������ˮ����������ʧ�أ��������ټ�����Ӣ����ʿ������ͬʱ�ͳ�������������л��λӢ�ۡ�.", 2, 
	"��ȡ100������/v_fy_100_next",
	"˳�㿴������!/no");
end;

function v_fy_100_next()
	if (v_fy_awardcheck(100) == 0) then
		return
	end;
	
	-- ��һƥ����
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 100);
	AddItem(0, 10, 8, 1, 0, 0, 0);
	Msg2Player("�����<color=yellow>��������color>");
end;


function no()
end;


end;	--__H_V_FEIYUNACTION__
