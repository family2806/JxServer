-- �ξ� ·��_��ɮ.lua  ϴ�㹦��NPC

Include("\\script\\missions\\clearskill\\clearhole.lua");

function main()
	-- �Ƿ�״̬
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("����ϴ�赺������. ");
		Say("GM: <color=red>�㲻�ܽ�ϴ�赺���ѱ�ϵͳ��¼����ȥ�ҷ�����˵�����! <color> ", 1, "�뿪ϴ�赺/LeaveHere_yes")
		return -1;
	end
	
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "��ĵȼ���δ�ﵽ"..CSP_NEEDLEVEL.."�����뿪ϴ�赺. ")
		return -1;
	end

	nType = GetTask(CSP_TID_ClearType);
	if (nType == CSP_CTYPE_SKILL) then -- ֻϴ���ܵ�
		local tbOpt = 
		{
			"ϴ���ܵ�/DoClearSkill",
			"ϴǱ�ܵ�/add_prop",
			"��ϴ/OnCancel",
			"����ϴ��/Help",
			"�뿪ϴ�赺 /LeaveHere",
		}
		Say("��ֻ��ϴ <color=blue> ���ܵ�<color>. ͬ��ϴ��", getn(tbOpt), tbOpt)
	elseif (nType == CSP_CTYPE_PROP) then -- ֻ��Ǳ�ܵ�
		local tbOpt = 
		{
			"ϴǱ�ܵ�/DoClearProp",
			"����Ǳ�ܵ�/add_prop",
			"��ϴ /OnCancel",
			"����ϴ�� /Help",
			"�뿪ϴ�� /LeaveHere",
		}
		Say("��ֻ��ϴ<color=blue> Ǳ�ܵ�<color>. ͬ��ϴ��? ", getn(tbOpt), tbOpt)
	else -- if (nType == CSP_NEEDJEWEL_ALL) then -- ȫϴ(nType������0����3)
		local tbOpt = 
		{
			 "ϴ���ܵ�/DoClearSkill",
			 "ϴǱ�ܵ�/DoClearProp", 
			 "����Ǳ�ܵ�/add_prop", 
			 "��ϴ /OnCancel", 
			 "����ϴ��/Help", 
			 "�뿪ϴ�赺/LeaveHere"
		}
		Say("��ͬ��ϴ����? ", getn(tbOpt),tbOpt)
	end;
end

function add_prop()
	Say("˵���������Լ�ʲô����ֵ?", 4,
			"��������/add_prop_str",
			"�Լ���/add_prop_dex",
			"�Լ��⹦/add_prop_vit",
			"�Լ��ڹ�/add_prop_eng")
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "������������ֵ: ");
end

function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "����������ֵ: ");
end

function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "�������⹦��ֵ:");
end

function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "�������ڹ���ֵ: ");
end

function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end

function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end

function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end

function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end

function DoClearSkill()
	Say("��ͬ��ϴ����ֵ��? ", 2, "ϴ����ֵ/DoClearSkillCore","��ϴ/OnCancel")
end
function DoClearSkillCore()
--	if (Pay(100000) == 0) then
--		Say("�������Բ���ÿ��ϴ����10�����������ϴ���Ǯ������", 0)
--		return
--	end

	i = HaveMagic(210)		-- �Ṧ�������
	j = HaveMagic(400)		-- ���ٸ���ƶ���������
	n = RollbackSkill()		-- ������ܲ��������м��ܵ㣨�����Ṧ�����⼼�ܣ�
	x = 0
	if (i ~= -1) then x = x + i end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
	if (j ~= -1) then x = x + j end
	rollback_point = n - x			-- �Ѽ��ܵ㵱�����е������������ȿ۳��Ṧ��
	if (rollback_point + GetMagicPoint() < 0) then		-- ���ϴ���˸���������0��Ϊ�Ժ���ϴ�㱣����
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
	if (j ~= -1) then AddMagic(400,j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
	Msg2Player("ϴ��ɹ������Ѿ����Է������"..rollback_point.."�i���ܵ�������·���. ")
	Talk(1,"KickOutSelf","ϴ��ɹ������Ѿ����Է������"..rollback_point.."���ܵ�������·���. ")
end;

function DoClearProp()
	Say("��ͬ��ϴǱ�ܵ���? ", 2, "ϴǱ�ܵ�/DoClearPropCore", "��ϴ/OnCancel")
end

function DoClearPropCore()
		base_str = {35,20,25,30,20}			-- �����������������ֵ
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1

		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- ���ѷ���Ǳ�����ã�task(88)��������ֱ�ӽ��������������ȣ�
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
end;

function OnCancel()
end;

function Help()
	strHelp = 
	{
		"ϴ��֮������Ե������ľ�ˣ���������һ�����ɽ��ʵ��ս����Ȼ���뿪�������������. ",
		"ֻ��Ҫ�㲻�뿪�����ҽ�������ϴ��?",
		"������ľ׮(3000����) ;  ɳ��(10000����) ; ľ�ˣ�30000 ����) ����ʵ��ϴ��Ч��!",
		"�������������Խ�ɽ����������ʧ�ܣ�Ҳ������ʲô��ʧ",
		"���ɽ������ͺ�խ�����Ҳֻ����20�ˣ���������Ѿ������˾Ͳ��ý�����. ",
		"���ɽ������ͺ�խ�����Ҳֻ����20�ˣ���������Ѿ������˾Ͳ��ý�����. ",
		"���ʲôʱ��о����ܵ㹻�˾������ң��һ���㷵���ϵط�"
	}
	Talk(7, "", strHelp[1], strHelp[2], strHelp[3], strHelp[4], strHelp[5], strHelp[6], strHelp[7]);
end;

function LeaveHere()
	Say("����Ϊ��ϴ�����˰��������뿪��? ",2, "���뿪/LeaveHere2", "������������/OnCanCel")
end

function LeaveHere2()
	Say("�뿪ϴ�赺������뷵�ؽ����ѣ�����Ȼ����뿪����", 2, "��������뿪�����ط� /LeaveHere_yes", "����Ȼ������/OnCanCel")
end

function LeaveHere_yes()
	W,X,Y = GetWorldPos();
	LeaveTeam()
	CSP_LeaveClearMap(W);
end
