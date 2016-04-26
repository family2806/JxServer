Include("\\script\\global\\login_head.lua")
-- 120����������ͷ�ļ�

LV120_SKILL_STATE = 2450	-- ��ŵ�ǰ����״̬��ȫ�������������ʼֵΪ1��Ϊ0��ʾ�����Ѿ����
LV120_SKILL_ID = 2463		-- ��¼���120������ID
LOCK_MAP_SEQUENCE =		-- ��Ž���ͼ˳���ȫ���������
{
	{2451, 2452, 2453, 2454, 2455, 2456},	-- ��һ��������ͼ˳��
	{2457, 2458, 2459, 2460, 2461, 2462},	-- �ڶ���������ͼ˳��
}

DGJ_WULINMIJI	= {6, 1, 1120}	-- ��̫Ѱ���������ؼ�
COFFIN_MAP		= {6, 1, 1119}	-- �꾩�����·����ͼ
COFFIN			= {6, 1, 1121}	-- ���ع�ľ
LOCK_MAP1		= {6, 1, 1122}	-- ��ľ����ͼ ��һ����
LOCK_MAP2		= {6, 1, 1123}	-- ��ľ����ͼ �ڶ�����
CADAVER			= {6, 1, 1124}	-- ������ʬ
LV120SKILLBOOK	= {6, 1, 1125}	-- 120�����ܾ�Ҫ

COFFIN_POSITION = {37, 1832, 3439, 6, 6}	-- �ײ�����λ��{��ͼ, X����, Y����, X���, Y���}

LV120SKILL_NEW_NPC =	-- �½�NPC�б�
{	-- ��ʽ {NpcId, MapId, X, Y, Name, Script},
	{1203, 57, 1583, 3203, " ", "\\script\\task\\lv120skill\\npc\\��ɽ����_���½��������ؼ�.lua"},
}

ORG_WULIMIJI	= {6, 1, 26}		-- ��ͨ�������ؼ�
BANRUOXINJING	= {6, 1, 12}		-- �����ľ�
XISUIJING		= {6, 1, 22}		-- ϴ�辭
XINGHONGBAOSHI	= {4, 353, 1}		-- �ɺ챦ʯ
CRYSTAL =
{
	{4, 238, 1},		-- ��ˮ��
	{4, 239, 1},		-- ��ˮ��
	{4, 240, 1},		-- ��ˮ��
}
BLUE_C = 1
PURPLE_C = 2
GREEN_C = 3

LOCK_MAP1_KEY =			-- ��һ������
{
	{1,  CRYSTAL[GREEN_C]},
	{3,  CRYSTAL[PURPLE_C]},
	{11, CRYSTAL[BLUE_C]},
	{14, CRYSTAL[BLUE_C]},
	{22, CRYSTAL[PURPLE_C]},
	{24, CRYSTAL[GREEN_C]},
}

LOCK_MAP2_KEY =			-- �ڶ�������
{
	{2,  CRYSTAL[GREEN_C]},
	{6,  CRYSTAL[PURPLE_C]},
	{10, CRYSTAL[BLUE_C]},
	{15, CRYSTAL[BLUE_C]},
	{19, CRYSTAL[GREEN_C]},
	{23, CRYSTAL[PURPLE_C]},
}

FACTION_TEXT = 			-- ��������ı�����
{
	[0] = {"<link=image[0,14]:\\spr\\npcres\\enemy\\enemy037\\enemy037_pst.spr>", "���ʷ���", "����"},	-- ����
	[1] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy084\\enemy084_pst.spr>", "��Ӣ", "����"},		-- ����
	[2] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy077\\enemy077_pst.spr>", "�Ƴ�", "����"},		-- ����
	[3] = {"<link=image[0,12]:\\spr\\npcres\\enemy\\enemy091\\enemy091_pst.spr>", "�����ɾ�", "����"},	-- �嶾
	[4] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy055\\enemy055_pst.spr>", "����ʦ̫", "����"},	-- ����
	[5] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy098\\enemy098_pst.spr>", "������", "����"},		-- ����
	[6] = {"<link=image[0,19]:\\spr\\npcres\\enemy\\enemy071\\enemy071_pst.spr>", "������", "����"},	-- ؤ��
	[7] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy103\\enemy103_pst.spr>", "���պ���", "����"},	-- ����
	[8] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy046\\enemy046_pst.spr>", "��һ����", "����"},	-- �䵱
	[9] = {"<link=image[0,22]:\\spr\\npcres\\enemy\\enemy065\\enemy065_pst.spr>", "ȫ����", "����"},	-- ����
}

FACTION_BOOK =			-- ���ɼ�����
{
	[0] = {{6, 1, 56}, {6, 1, 57}, {6, 1, 58}},				-- ����
	[1] = {{6, 1, 37}, {6, 1, 38}, {6, 1, 39}},				-- ����
	[2] = {{6, 1, 27}, {6, 1, 28}, {6, 1, 45}, {6, 1, 46}},	-- ����
	[3] = {{6, 1, 47}, {6, 1, 48}, {6, 1, 49}},				-- �嶾
	[4] = {{6, 1, 42}, {6, 1, 43}, {6, 1, 59}},				-- ����
	[5] = {{6, 1, 40}, {6, 1, 41}},							-- ����
	[6] = {{6, 1, 54}, {6, 1, 55}},							-- ؤ��
	[7] = {{6, 1, 35}, {6, 1, 36}, {6, 1, 53}},				-- ����
	[8] = {{6, 1, 33}, {6, 1, 34}},							-- �䵱
	[9] = {{6, 1, 50}, {6, 1, 51}, {6, 1, 52}},				-- ����
}

DIALOG_UI_TEXT =			-- �Ի�UI��ʾ
{
	{"<link=image[0,10]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>", "���½�"},			-- 1 ���½�
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby040\\passerby040s2.spr>", "�꾩����"},	-- 2 �꾩����
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby072\\passerby072s1.spr>", "������"},	-- 3 ������
	{"<link=image:\\spr\\Ui3\\120����������\\task_wulin.spr>", "�����ؼ�"},						-- 4 ��Ѱ���������ؼ�
	{"<link=image:\\spr\\Ui3\\120����������\\bianjing_southeast.spr>", "�꾩�����·����ͼ"},	-- 5 �꾩�����·����ͼ
	{"<link=image:\\spr\\Ui3\\120����������\\task_coffin.spr>", "���ع�ľ"},					-- 6 ���ع�ľ
	{"<link=image:\\spr\\Ui3\\120����������\\task_lockinfo.spr>", "��ľ����ͼ"},				-- 7 ��ľ����ͼ
	{"<link=image:\\spr\\Ui3\\120����������\\task_corpse.spr>", "������ʬ"},					-- 8 ������ʬ���˹�ǰ��
	{"<link=image:\\spr\\Ui3\\120����������\\task_corpse1.spr>", "������ʬ"},					-- 9 ������ʬ���˹���
	{"<link=image:\\spr\\Ui3\\120����������\\task_stunt.spr>", "120����"},				-- 10 120�����ܾ�Ҫ
	{"<link=image:\\spr\\Ui3\\120����������\\������1-01.spr>", "��Ƭ1��ľ����ͼ"},			-- 11-16 ��ľ����ͼһ ��Ƭ
	{"<link=image:\\spr\\Ui3\\120����������\\������1-02.spr>", "��Ƭ1��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-03.spr>", "��Ƭ1��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-04.spr>", "��Ƭ1��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-05.spr>", "��Ƭ1��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-06.spr>", "��Ƭ1��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-01.spr>", "��Ƭ2��ľ����ͼ"},			-- 17-22 ��ľ����ͼ�� ��Ƭ
	{"<link=image:\\spr\\Ui3\\120����������\\������2-02.spr>", "��Ƭ2��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-03.spr>", "��Ƭ2��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-04.spr>", "��Ƭ2��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-05.spr>", "��Ƭ2��ľ����ͼ"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-06.spr>", "��Ƭ2��ľ����ͼ"},
}

LV120SKILL_LIST =			-- 120�������б�
{
	[0] = {709, 1, 0, 120, "120����", "���������"},	-- ����
	[1] = {708, 1, 1, 120, "120����",	"������"},		-- ����
	[2] = {710, 1, 2, 120, "120����",	"��Ӱ��"},		-- ����
	[3] = {711, 1, 3, 120, "120����",	"������"},		-- �嶾
	[4] = {712, 1, 4, 120, "120����",	"���·��"},	-- ����
	[5] = {713, 1, 5, 120, "120����",	"������"},		-- ����
	[6] = {714, 1, 6, 120, "120����",	"��������"},	-- ؤ��
	[7] = {715, 1, 7, 120, "120����",	"ħ������"},	-- ����
	[8] = {716, 1, 8, 120, "120����",	"���ٲ�Ⱦ"},	-- �䵱
	[9] = {717, 1, 9, 120, "120����",	"��������"},	-- ����
}

g_DescTable = {}		-- ȫ����ʱ�Ի��ַ�������

function init_lv120skill()					-- ��ʼ������
	if (GetTask(LV120_SKILL_STATE) == 0) then
		SetTask(LV120_SKILL_STATE, 1)
	end
	SyncTaskValue(LV120_SKILL_STATE)
	SyncTaskValue(LV120_SKILL_ID);
	lv120skill_debug()	-- �Զ������쳣
end

function describe_talk(tDialog, szCall)		-- �Ի�����
	local i = 0
	if (getn(tDialog) == 0) then return end
	repeat
		i = i + 1
	until (g_DescTable[i] == nil)
	g_DescTable[i] = tDialog
	if (szCall == nil) then szCall = "" end
	describe_basic(1, i, szCall)	
end

function describe_basic(nSeq, idxTable, szCallback)		-- �Ի��ݹ麯�����ڲ���
	local tDialog = g_DescTable[idxTable]
	if (nSeq == getn(tDialog)) then
		if (szCallback == "") then
			Describe(tDialog[nSeq], 1, "�����Ի�/quit")
		else
			Describe(tDialog[nSeq], 1, "�����Ի� /"..szCallback)
		end
		g_DescTable[idxTable] = nil
		return
	end
	Describe(tDialog[nSeq], 1, "�����Ի� /#describe_basic("..(nSeq + 1)..", "..idxTable..", [["..szCallback.."]])")
end

function npc_string(nNpc, szDisplay, bFaction)			-- ���NPC�����˵�����ַ���
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..tab[2].."<link>:"..szDisplay
end

function speak_string(nNpc, szDisplay, bFaction)		-- �����Ҷ�NPC��˵�����ַ���
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..GetName().."<link>:"..szDisplay
end

function self_string(nNpc, szDisplay, bFaction)			-- �������԰��ַ���
	if (nNpc == 0) then		-- 0��ʾ��ͼʾ
		return "<color=orange>"..szDisplay.."<color>"
	end
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1].."<link><color=orange>"..szDisplay.."<color>"
end

function add_lv120skillnpc()			-- �������NPC
	for i = 1, getn(LV120SKILL_NEW_NPC) do
		local Tab = LV120SKILL_NEW_NPC[i]
		local idxMap = SubWorldID2Idx(Tab[2]);
		if (idxMap >= 0) then
			local idxNpc = AddNpc(Tab[1], 1, idxMap, Tab[3] * 32, Tab[4] * 32, 1, Tab[5])
			SetNpcScript(idxNpc, Tab[6])
		end
	end
end

function generate_sequence(tab)			-- �����������

	local nCount = getn(tab)
	local temp, nSeq, bAct = {}, 0, 0

	for i = 1, nCount do
		tinsert(temp, i)
		if (GetTask(tab[i]) < 1) or (GetTask(tab[i]) > getn(tab)) then bAct = 1 end	-- ����в��Ϸ�������ȫ���ؽ�
	end

	if (bAct == 1) then
		for i = 1, nCount do
			nSeq = random(1, getn(temp))
			SetTask(tab[i], temp[nSeq])
			SyncTaskValue(tab[i])
			tremove(temp, nSeq)
		end
	end

end

function add_item(tab)							-- ��ӵ���
	return AddItem(tab[1], tab[2], tab[3], 1, 0, 0)
end

function display_clip(nLockMap, nSeq, szCall)	-- ��ʾһ����Ƭ
	local nIndex = 10 + 6 * (nLockMap - 1) + GetTask(LOCK_MAP_SEQUENCE[nLockMap][nSeq])
	Describe(DIALOG_UI_TEXT[nIndex][1]..DIALOG_UI_TEXT[nIndex][2].."<link>", 2, "ȷ��/"..szCall, "�ر�quit")
end

function lv120skill_report()					-- �����ű������
	local tDialog
	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	if (nFaction == 0) or (nFaction == 8) or (nFaction == 6) or (nFaction == 4) then	-- ����
		tDialog =
		{
			npc_string(nFaction, "��ѽ��ԭ������֪���˹��¡��������ͻȻ�䶯�����ι�����ͷ��β�������ܲ�����Ҳ�뵽������£�������Ϊ"..szCall.." ������֯������¡�Ȼ��һЩ������ʿ�س�������������¡����Ƿ���üĿ��һ������¶������üĿ��ʾ����ָ��ıΪ�����̽�!", 1),
			speak_string(nFaction, "����������������ˣ�����������ı��ֻ�е�����ֶ��﷢�֣���ʬ�������µ�ӡ���ڽ�����δ���ֹ������⣬���ֺܶ��쳣�������Ƿ����µ�����а��?", 1),
			npc_string(nFaction, "Ϊ�˱������Σ��������壬��׼���˶Ը����µĶԲߡ��Һ�һЩ���ֱչش�����һ���ϳ˾�ѧ����һ�����ҵ�����Ҫ��üĿ������ֵ�ñ���Ҿ����������ϳ��书��ϣ�����Ժ���������Ϊ����.", 1),
			speak_string(nFaction, "��л "..szCall.."��ѭ"..szCall.."��ѵ.", 1),
			npc_string(nFaction, "ʱ����ȣ����Ը��书ֻ�ܴ���һ���֣��Ժ�ҪŬ�����������书ֻ�����㣬�������ɵ��ӻ���֪����Ϊ�˷�ֹ���£����ѽ��ھ�д���ˣ����Լ��о��ɡ��������ڵ����ʣ������������ġ����ˣ���ȥ׼��<color=white> �������м��ܣ�����һ��<color>.", 1),
			speak_string(nFaction, "����"..szCall.." ������������.", 1),
		}
	elseif (nFaction == 2) or (nFaction == 1) or (nFaction == 5) then					-- ����
		tDialog =
		{
			npc_string(nFaction, "��ѽ��ԭ������֪���˹��¡��������ͻȻ�䶯�����ι�����ͷ��β�������ܲ�����Ҳ�뵽������£�������Ϊ"..szCall.." ������֯������¡�Ȼ��һЩ������ʿ�س�������������¡����Ƿ���üĿ��һ������¶������üĿ��ʾ����ָ��ıΪ�����̽�!", 1),
			speak_string(nFaction, "����������������ˣ�����������ı��ֻ�е�����ֶ��﷢�֣���ʬ�������µ�ӡ���ڽ�����δ���ֹ������⣬���ֺܶ��쳣�������Ƿ����µ�����а��?", 1),
			npc_string(nFaction, "Ϊ�˷�ֹ���̵���ı�����ѽ����˻����İ��е��顣�Һ�һЩ���ֱչش�����һ���ϳ˾�ѧ����һ�����ҵ�����Ҫ��üĿ������ֵ�ñ���Ҿ����������ϳ��书��ϣ�����Ժ���������Ϊ����.", 1),
			speak_string(nFaction, "��л "..szCall.."��ѭ"..szCall.."��ѵ.", 1),
			npc_string(nFaction, "ʱ����ȣ����Ը��书ֻ�ܴ���һ���֣��Ժ�ҪŬ�����������书ֻ�����㣬�������ɵ��ӻ���֪����Ϊ�˷�ֹ���£����ѽ��ھ�д���ˣ����Լ��о��ɡ��������ڵ����ʣ������������ġ����ˣ���ȥ׼��<color=white> �������м��ܣ�����һ��<color>.", 1),
			speak_string(nFaction, "����"..szCall.." ������������.", 1),
		}
	elseif (nFaction == 3) or (nFaction == 9) then										-- а��
		tDialog =
		{
			npc_string(nFaction, "��ѽ��ԭ������֪���˹��¡��������ͻȻ�䶯�����ι�����ͷ��β�������ܲ�����Ҳ�뵽������£�������Ϊ"..szCall.." ������֯������¡�Ȼ��һЩ������ʿ�س�������������¡����Ƿ���üĿ��һ������¶������üĿ��ʾ����ָ��ıΪ�����̽�!", 1),
			speak_string(nFaction, "����������������ˣ�����������ı��ֻ�е�����ֶ��﷢�֣���ʬ�������µ�ӡ���ڽ�����δ���ֹ������⣬���ֺܶ��쳣�������Ƿ����µ�����а��?", 1),
			npc_string(nFaction, "������ô����������أ���ˣ����ѽ��а��е��飬ͬʱȷ�������������̶����ǲ������������ʱ���������»��ҡ��Һ�һЩ���ֱչش�����һ���ϳ˾�ѧ����һ�����ҵ�����Ҫ��üĿ������ֵ�ñ��"..szCall.."���꣬�ܶ��е�ʶ��Ӣ�۲��ܵ��Σ����ǣ���һ�����ҵ�����Ҫ��üĿ������ֵ�ñ���Ҿ����������ѧ���Ժ������������", 1),
			speak_string(nFaction, "��л "..szCall.."��ѭ"..szCall.."��ѵ.", 1),
			npc_string(nFaction, "ʱ����ȣ����Ը��书ֻ�ܴ���һ���֣��Ժ�ҪŬ�����������书ֻ�����㣬�������ɵ��ӻ���֪����Ϊ�˷�ֹ���£����ѽ��ھ�д���ˣ����Լ��о��ɡ��������ڵ����ʣ������������ġ����ˣ���ȥ׼��<color=white> �������м��ܣ�����һ��<color>.", 1),
			speak_string(nFaction, "����"..szCall.." ������������.", 1),
		}
	elseif (nFaction == 7) then															-- ����
		tDialog =
		{
			npc_string(nFaction, "���ǲ���Ϊ���̵̽��ӣ�û��ʲô�ܹ���������۾������������ͻȻ���ң�����û���뵽�����������̽�����������¶ˣ����������Ѳµ��ˣ���Ҳ�����㡣��������̽��ټ���һЩ���ָ��֣�������һ�ּ�ǿ��а��������Ķ�������ڹײ����ʬ�壬�������ǵĹ��ͣ�Ҳ�������Ҵ�������һ�δ�����.", 1),
			speak_string(nFaction, "����Ӣ�����ҽ�Ϊ���ͳһ���µĴ�ҵ��������", 1),
			npc_string(nFaction, "��ζ��Һ����ܣ���ϢҲû�д�������ɣ����˸ո�͸¶����Ϣ�����ˡ���Щʬ�嶼���ι��ɵļ����Ҳ���Ǹ������������ˡ����������Ҳ����Ҫ�㱣�ܣ����Ǳ��ŵ��ˡ����ǣ�����������ı���ˣ����Ե��δ��Σ������������Ҵ������ѧ����Ҫ���������������Ρ�", 1),
			speak_string(nFaction, "��л"..szCall.."��ѭ"..szCall.."��ѵ.", 1),
			npc_string(nFaction, "ʱ����ȣ����Ը��书ֻ�ܴ���һ���֣��Ժ�ҪŬ�����������书ֻ�����㣬�������ɵ��ӻ���֪����Ϊ�˷�ֹ���£����ѽ��ھ�д���ˣ����Լ��о��ɡ��������ڵ����ʣ������������ġ����ˣ���ȥ׼��<color=white> �������м��ܣ�����һ��<color>.", 1),
			speak_string(nFaction, "����"..szCall.." ������������.", 1),
		}
	end
	describe_talk(tDialog)
	SetTask(LV120_SKILL_STATE, 18)
	SyncTaskValue(LV120_SKILL_STATE)
end

function lv120skill_submit()				-- �ύ����ȫ��������UI
	GiveItemUI("������ȫ��������", "�ѱ������м�����Ž�ȥ���ܻ��120�����ؼ�.", "submit_skillbook", "quit")
end

function submit_skillbook(nCount)			-- �ύ����ȫ��������

	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	local idxBook, g, d, p = 0, 0, 0, 0
	local book, temp = {}, {}

	if (nCount == 0) then
		lv120skill_submit()
		return
	end

	for i = 1, getn(FACTION_BOOK[nFaction]) do
		tinsert(temp, FACTION_BOOK[nFaction][i])
	end

	for i = 1, nCount do
		idxBook = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxBook)
		for j = 1, getn(temp) do
			if (g == temp[j][1]) and (d == temp[j][2]) and (p == temp[j][3]) then
				tremove(temp, j)
				tinsert(book, idxBook)
				break
			end
		end
	end

	if (getn(temp) == 0) then
		local tDialog =
		{
			npc_string(nFaction, "�����������вŵ����������󰡣����Ѹ����ؾ��ˣ����Լ��о�һ�¾Ϳ���������", 1),
			speak_string(nFaction, "��л"..szCall.."��лָ�̣�������ȥ������.", 1),
			self_string(10, "һ����������ѧ���������ϳ˾���"),
		}
		describe_talk(tDialog)
		for i = 1, getn(book) do
			if (RemoveItemByIndex(book[i]) ~= 1) then		-- ȡ��������ϵļ�����
				WriteLog("120������ -���������м�����-- ɾ���쳣������.  Player ="..GetName().." Time = "..date("%y.%m.%d"))
				Msg2Player("ϵͳ��������ϵ�����̽��!")
				return
			end
		end
		idxBook = add_item(LV120SKILLBOOK)	-- ���120��������
		Msg2Player("����1"..GetItemName(idxBook))
		SetTask(LV120_SKILL_STATE, 19)
		SyncTaskValue(LV120_SKILL_STATE)
	else
		Describe("��Ҫ����һ�����м��ܵ��飬��"..szCall.." ������120���ϳ˼����� ",2, "����/lv120skill_submit", "�ر�/quit")
	end

end

function calc_item(tab)
	return	CalcItemCount(-1, tab[1], tab[2], tab[3], -1)
end

-- ��������쳣
function lv120skill_debug()
	local state = GetTask(LV120_SKILL_STATE)
	if (state <= 1) or (state >= 19) then return end
	if (state == 5) then debug_item(DGJ_WULINMIJI) return end
	if (state == 9) then debug_item(COFFIN_MAP) return end
	if (state >= 10) and (state <= 15) then debug_item(COFFIN) return end
	if (state == 16) then debug_item(CADAVER) return end
end

function debug_item(Item)
	if (calc_item(Item) < 1) then
		if (CalcFreeItemCellCount() < 1) then
			Msg2Player("��120��������������������װ��������һ����λ��ͬʱ�����µ�¼��ϵͳ�͹黹����ʧȥ�Ķ���.")
			return
		end
		local idxItem = add_item(Item)
		Msg2Player("������øո�ʧȥ�Ķ���"..GetItemName(idxItem)..", ���ڿ��Լ���120������")
	end
end

function quit()
end


-- 120��������һ�
function lvl120skill_learn()
	Describe("��ʲô�ѽ���?",4,
		"���뻻120������/lvl120skill_getbook",
		"��ô��ѧ��120����/lvl120skill_learninfo",
		"��ϰ120���ܷ���/lvl120skill_skillinfo",
		"��������/no");
end;

function lvl120skill_skillinfo()
	local szInfo = format("%s%s%s%s%s%s%s%s%s%s",
			"<enter><color=green>1. ��ֻ�� <color>",
			"<enter>��������Ĺ����һ��Ĺ֣���boss���ƽ�boss;",
			"<enter>��еĹ֣����ڵ�һ�صĹ֣�ɱ��boss;",
			"<enter>�����еĹ֣����ڻƽ������еĹ�;",
			"<enter>�ν�ս����ʹ�û��ֻ�ȡ����ֵ�����ǣ����ܳ���ÿ������.", 
			"<enter><color=green>2. ί������<color>",
			"<enter>ʹ�ð׾��輼�ܣ���׾��輼�ܣ���׾�����Ч����.",
			"<enter>�׾��輼�ܣ�ʹ�ú����120���ܵ���ϰ�ȣ�ÿ�������ϰ�Ƚ�����һ��.",
			"<enter>��׾��輼��: Ч����һ��׾��輼��������ÿ�������ϰ�Ƚ�����һ��",
			"<enter>��׾�����Ч: Ч����һ��׾��輼��������ÿ�������ϰ�Ƚ�����һ��;"
			);
	Describe(szInfo,
		2,
		"����/lvl120skill_learn",
		"�����Ի�/no")
end;

function lvl120skill_learninfo()
	Describe("�ﵽ120���ĸ��֣����Ե������ɻ�ȡ120�����飬ʹ����󣬽�ѧ��120���ܣ�ÿ��ֻ�ܻ�һ��<enter>��ȡ��Ҫ���أ�һ�������ľ���һ������90�����飬һ���ɺ챦ʯ��һ��ˮ��.", 
		2,
		"����/lvl120skill_learn",
		"�����Ի�/no")
end;

function lvl120skill_getbook()
	-- ԭ������е�19����������ԭֵ���һ�������ɹ���ֱ����Ϊ19
	local nstate = GetTask(LV120_SKILL_STATE);
	local nlevel = GetLevel();
	local nfact = GetLastFactionNumber();
	if (nstate == 19) then
		Describe("�����ź�������ʹ��120������",1 , "�����Ի�/no");
	elseif (nlevel < 120) then
		Describe("�ȼ�����120�����ܻ���",1 , "�����Ի�/no");
	elseif (nfact < 0 or nfact > 9) then
		Describe("��δ�������ɣ�������������",1 , "�����Ի�/no");
	else
		if (lvl120skill_delallitem() == 1) then
			SetTask(LV120_SKILL_STATE, 19);
			add_item(LV120SKILLBOOK);
			Msg2Player("��120������ɹ�")
			WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tget a lvl120skillbook",
				GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount()))
		else
			Describe("�����ź���������Ʒ����Ҫ������!", 1,"�����Ի�/no");
			Msg2Player("��Ҫ�ռ���Ʒ��һ�������ľ���һ������90�����飬һ���ɺ챦ʯ��һ��ˮ��.");
		end;
	end;
end;
-- 120��������һ�

function lvl120skill_delallitem()
	if (lvl120skill_calccount(BANRUOXINJING) < 1) then
		return 0;
	end;
	local nfact = GetLastFactionNumber();
	for i = 1, getn(FACTION_BOOK[nfact]) do
		if (lvl120skill_calccount(FACTION_BOOK[nfact][i]) < 1) then
			return 0;
		end;
	end;

	if (lvl120skill_calccount(XINGHONGBAOSHI) < 1) then
		return 0;
	end;
	
	if (lvl120skill_calccrystal() < 1) then
		return 0;
	end;
	
	lvl120skill_delitem(BANRUOXINJING, 1);
	for i = 1, getn(FACTION_BOOK[nfact]) do
		lvl120skill_delitem(FACTION_BOOK[nfact][i], 1);
	end;
	lvl120skill_delitem(XINGHONGBAOSHI, 1);
	lvl120skill_delscrystal(1);
	return 1;
end;

function lvl120skill_calccount(tb_item)
	return CalcEquiproomItemCount(tb_item[1], tb_item[2], tb_item[3], -1);
end;
function lvl120skill_delitem(tb_item, ncount)
	if (ncount <= 0) then
		return 0;
	end;
	local np = ConsumeEquiproomItem(ncount, tb_item[1], tb_item[2], tb_item[3], -1);
	if (np == 1) then
		WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tDeleteItem Count=%d,G=%d,D=%d,P=%d,L=%d",
					GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
					ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	else
		print(format("Error!!!! DeleteItem Fail!!! Count=%d,G=%d,D=%d,P=%d,L=%d",
				ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	end;
end;
function lvl120skill_calccrystal()
	local nsum = 0;
	for i = 1, getn(CRYSTAL) do
		nsum = nsum + lvl120skill_calccount(CRYSTAL[i]);
	end;
	return nsum;
end;
function lvl120skill_delscrystal(ncount)
	for i = 1, getn(CRYSTAL) do
		local ncrst = lvl120skill_calccount(CRYSTAL[i]);
		if (ncrst > ncount) then
			ncrst = ncount;
		end;
		lvl120skill_delitem(CRYSTAL[i], ncrst);
		ncount = ncount - ncrst;
		if (ncount <= 0) then
			break
		end;
	end;
end;



-- //Խ�ϰ治��������ʱ���������ʼ��
if (GetProductRegion() ~= "vn") then
	login_add(init_lv120skill, 2)
end
