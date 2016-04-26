-- ����
IncludeLib("SETTING");
Include("\\script\\global\\login_head.lua")
-- ItemParticular={MagicID,IniLevel, NeedFaction, BookName, SkillName}
local faction_skill_list = {
	[0] = {[90] = {318, 319, 321}, [120] = {709}, [150] = {1055, 1056, 1057},},
	[1] = {[90] = {322, 325, 323}, [120] = {708}, [150] = {1058, 1059, 1060},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710}, [150] = {1069, 1070, 1071, 1110},},
	[3] = {[90] = {353, 355, 390}, [120] = {711}, [150] = {1066, 1067},},
	[4] = {[90] = {380, 328, 332}, [120] = {712}, [150] = {1061, 1062, 1114},},
	[5] = {[90] = {336, 337}, [120] = {713}, [150] = {1063, 1065},},
	[6] = {[90] = {357, 359}, [120] = {714}, [150] = {1073, 1074}},
	[7] = {[90] = {361, 362, 391}, [120] = {715}, [150] = {1075, 1076},},
	[8] = {[90] = {365, 368}, [120] = {716}, [150] = {1078, 1079},},
	[9] = {[90] = {372, 375, 394}, [120] = {717}, [150] = {1080, 1081},},
}

sbook_list =
{	-- ��ʽ��{����ID, ���ܵȼ�, ����ID, ���輶��, ����������, ��������}
	[27] = {302, 1, 2, 80, "'�����.�����滨' ",	"�����滨"},
	[28] = {351, 0, 2, 80, "'�ݾ���.�һ���' ",	"�һ���"},
	[33] = {365, 1, 8, 80, "̫��ȭ��-��3 ",	"����޼�"},
	[34] = {368, 1, 8, 80, "'̫��ȭ��-�� 2' ",	"�˽���һ"},
	[35] = {361, 1, 7, 80, "'������.ì��' ",		"������"},
	[36] = {362, 1, 7, 80, "'����.����' ",		"��������"},
	[37] = {325, 1, 1, 80, "'��������.�� 1' ",	"׷��� "},
	[38] = {323, 1, 1, 80, "�����̷�-�� 2 ", 	"׷������"},
	[39] = {322, 1, 1, 80, "��������-��3 ",	"����ն"},
	[40] = {336, 1, 5, 80, "'���̵���' ",			"������Ӱ"},
	[41] = {337, 1, 5, 80, "'����˫��' ",			"�������� "},
	[42] = {328, 1, 4, 80, "'���ؼ�",			"������ѩ"},
	[43] = {380, 1, 4, 80, "'��ü������ؼ�' ",	"��˪��Ӱ"},
	[45] = {339, 1, 2, 80, "'�ɵ���.�����Ӱ' ",	"�����Ӱ"},
	[46] = {342, 1, 2, 80, "'������.�Ź��ɾ�' ",	"�Ź��ɾ�"},
	[47] = {353, 1, 3, 80, "'�嶾�Ʒ�.��1' ",	"�m ����ʴ��"},
	[48] = {355, 1, 3, 80, "'�嶾����.��2' ",	"����ն "},
	[49] = {390, 0, 3, 80, "'�嶾������.��3' ",	"�o�Ͻ��"},
	[50] = {372, 1, 9, 80, "'������' ",			"��ѩ����"},
	[51] = {375, 1, 9, 80, "'������' ",			"�׶�����"},
	[52] = {394, 0, 9, 80, "'������' ",			"���ɴ��"},
	[53] = {391, 0, 7, 80, "���-����",		"�������"},
	[54] = {357, 1, 6, 80, "'ؤ���Ʒ�' ",			"��������"},
	[55] = {359, 1, 6, 80, "ؤ����� ",			"�����޹�"},
	[56] = {318, 1, 0, 80, "'����ȭ��.�� 1' ",	"��Ħ�ɽ�"},
	[57] = {319, 1, 0, 80, "'���ֹ���.��2' ",	"��ɨǧ��"},
	[58] = {321, 1, 0, 80, "'���ֵ���.��3' ",	"����ն "},
	[59] = {332, 0, 4, 80, "'�ն��ؼ�' ",			"�ն�����"},
}

function CheckIsCanGet150SkillTask()
		--�������150����- Modified By NgaVN - 20121207
	local nValue = GetTask(2885)
	if nValue > 0 then
		return
	end
	--�������150����������Ҫ����2������- Modified By NgaVN - 20121207
	local nTransLife = ST_GetTransLifeCount()
	local nHaveTSFlag = 0;
	if(nTransLife > 1 ) then
		nHaveTSFlag = 1
	end
	
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or  nFact > 9 then
		return
	end
	local tb90Skill = %faction_skill_list[nFact][90]
	local nHave90SkillFlag = 0
	for i = 1, getn(tb90Skill) do
		if HaveMagic(tb90Skill[i]) >= 0 then
			nHave90SkillFlag = 1 
			break
		end
	end
	local tb120Skill = %faction_skill_list[nFact][120]
	local nHave120SkillFlag = 0
	for i = 1, getn(tb120Skill) do
		if HaveMagic(tb120Skill[i]) >= 0 then
			nHave120SkillFlag = 1 
			break
		end
	end
	local tb150Skill = %faction_skill_list[nFact][150]
	local nHave150SkillFlag = 0
	for i = 1, getn(tb150Skill) do
		if HaveMagic(tb150Skill[i]) >= 0 then
			nHave150SkillFlag = 1 
			break
		end
	end 
	if nHave150SkillFlag == 0 then
		if nHaveTSFlag ==1 and nHave90SkillFlag == 1 and nHave120SkillFlag == 1 and GetLevel() >= 150 then
			Msg2Player("<color=yellow>��������Խ�150����������<enter>")
		else
			local szMsg = "�����150������������Ҫ"
			local nFlag = 0
			
			if nHave90SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s ѧ��90����", szMsg) 
				nFlag = 1
			end
			if nHave120SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s ѧ��120������", szMsg) 
				nFlag = 1
			end
			
			---�������150����������Ҫ����2������- Modified By NgaVN - 20121207
			if nHaveTSFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s ����2������", szMsg) 
				nFlag = 1
			end
			
			if GetLevel() < 150 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s �ﵽ150��", szMsg) 
				nFlag = 1
			end
			szMsg = format("<color=yellow>%s<color>", szMsg)
			Msg2Player(szMsg)
		end
	end
end

function LearnSkillByBook(index, list)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- ����ָ������
		Msg2Player("������"..list[index][5].."�о������ˣ��������ʲôҲû����")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- ��δ��ָ������
		Msg2Player("������"..list[index][5].."�о������ˣ����������. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- ��ѧ���ü���
		Msg2Player("������ "..list[index][5].."˼����ȥ������Ҳû��ѧ��ʲô�� ")
		return 1
	end

	AddMagic(list[index][1], list[index][2])										-- ѧ�Ἴ��
	
	CheckIsCanGet150SkillTask()

	WriteLog(date("%H%M%S")..": �˺�:"..GetAccount()..", ����:"..GetName()..", ʹ��: "..list[index][5].."��ѧ��: "..list[index][6]);
	Msg2Player("��ѧ������"..list[index][6].."'. ")
	return 0

end

function main(sel)
	Genre, DetailType, Particular=GetItemProp(sel)
	return LearnSkillByBook(Particular, sbook_list);
end

--�������150������ - Modified By NgaVN - 20121207
if login_add then login_add(CheckIsCanGet150SkillTask, 2) end