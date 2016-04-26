-- �ڸ����飺����ϵͳ���
-- By: wangbin(2009-5-24)

Include("\\script\\nationalwar\\head.lua")
Include( "\\script\\lib\\say.lua" )
Include("\\script\\item\\tianziyuxi.lua")
IncludeLib("ITEM")

function main()
	Say("�ڸ������ּ",
		7,
		"���ӵǻ�/nw_enthrone",
		"������ּ/ng?ch?nw_emperororder",
		"����گ��/nw_kingorder",
		"��/nw_accept",
		"�����Ǹ˳�/nw_comment",
		"����ֱ�飨ʷ�ǣ�/nw_history",
		"��ֻ������/Cancel")
end

-- ���ӵǻ�
function nw_enthrone()
	if (NW_IsEmperor() == 1) then
		Say("�ǻ����Ѿ����ˣ��ѵ�����������?")
		return
	end
	local result = NW_GetTask(NW_TASKNO_WARRESULT)
	if (result == 0 and NW_GetEmperorName() == "") then
		Say("��λӢ��־�����ˣ�����Ҫ��ʱ����.")
	elseif (result == 1 or result == 2) then
		local master = ""
		local side = 0
		if (result == 1) then
			-- ��Ӯ
			_, master = GetCityOwner(CITYIDX_LINAN)
			side = 1
		else
			-- ��Ӯ
			_, master = GetCityOwner(CITYIDX_BIANJING)
			side = 0
		end
		if (GetName() ~= master) then
			Say("�������Ӳ��Ƿ����ܵ���")
		else
			NW_Enthrone(side)
			NW_SetTask(NW_TASKNO_WARRESULT, 100 + result)
		end
	else
		Say("��������Ӣ�����㻹�ǽ�����ʵ��.")
	end
end

-- ������ּ
function nw_emperororder()
	Say("������ּ",
		7,
		"��������/nw_emperororder_setnationtitle",
		"����ͬ��/nw_emperororder_congratulate",
		"��������/nw_emperororder_absolve",
		"����ս��/nw_emperororder_message",
		"��Ǯ/nw_emperororder_levy",
		"����/nw_emperororder_forbidtalkdlg",
		"��ֻ����/Cancel")
end

-- ����گ��
function nw_kingorder()
	Say("��Ϊһ��֮�ף�ӵ�����Ȩ��",
		3,
		"�����/nw_kingorder_instate",
		"����˰��/nw_kingorder_taxdlg",
		"����ʲô/Cancel")
end

-- ��ȡ
function nw_accept()
	Say("׳ʿ��ս��ɱ������",
		5,
		"��ȡ��ս����/nw_accept_token",
		"��ȡ�ʵ۽���/nw_accept_domainring",
		"��ȡ���ӽ���/nw_accept_empirering",
		"��ȡ��������/nw_accept_empireseal",
		"��ֻ��·������/Cancel")
end

-- ��ȡ/��ս����
function nw_accept_token()
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("�ѵ����ﲻ�����ν�����?")
		return
	end
	tong, master = GetCityOwner(city)
	if (GetTong() ~= tong) then
		Say("���㲻�񱾹����ڣ��ѵ����ǵй����?")
		return
	end
	if (master ~= GetName() and NW_GetDuty() == NWPOSITION_NONE) then
		Say("�޹��˲��ܲμӹ��Ҵ���")
		return
	end
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("װ����λ����,���������.")
		return
	end
	local count = 10
	if (free < count) then
		count = free
	end
	local token = TAB_TOKEN[city]
	for i = 1, count do
		local item = AddItem(token[1], token[2], token[3], 1, 0, 0)
		if (item ~= 0) then
			local timeout = GetLocalTime() + SECONDS_ONEDAY
			ITEM_SetExpiredTime2(item, timeout)
			SyncItem(item)
		end
	end
	Say(format("����<color=red>%d<color> ��ս���ƣ������Ҫ�Ļ� ���Զ���.", count))
end

-- ��ȡ/��ȡ�ۻʽ���
function nw_accept_domainring()
		
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));	
	
	local nWiner = mod(NW_GetTask(NW_TASKNO_WARRESULT), 100);
	local city   = GetCityArea()

	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("�ѵ����ﲻ�����ν�����?")
		return
	end
	
	if nWiner ~= 1 and nWiner ~= 2 then
		Say("��δ����˭������")
		return
	end

	if nWiner == 1 and city ~= CITYIDX_BIANJING then
		Say("�����͸�������׳־�ո���ɽ���ˣ��뵽�ҵĳ����콱!")
		return
	end
	
	if nWiner == 2 and city ~= CITYIDX_LINAN then
		Say("�����͸�������׳־�ո���ɽ���ˣ��뵽�ҵĳ����콱!")
		return
	end
	
	tong, master = GetCityOwner(city)
	if (NW_IsEmperor() == 1) then
		Say("����Ӧ����ȡ<color=red>���ӽ���<color>.")
	elseif (GetTong() ~= tong) then
		Say("����Ĵ�磬һ���ǵз����")
	elseif (master ~= GetName()) then
		Say("�޹��˵Ȳ��ܲμӹ��Ҵ���")
	elseif (NW_GetTask(NW_TASKNO_GETDOMAINRING) ~= 0) then
		Say("�������콱��.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("ս�¼����������ӭս.")
	else
		local free = FindFreeRoomByWH(2, 3)
		if (free ~= 1) then
			Say("װ����λ����,���������.")
			return
		end
		
		local item = AddItem(0,10,7,1,0,0)
		if (item == 0) then
			WriteLog(format("[NW]Failed to give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("�в���֮��, ������ʱ���ܽ�����.")
		else
			
			if nWeek == 0 then	nWeek = 7;	end
			if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
			local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
			ITEM_SetExpiredTime(item, nExpiredDate, 120000)
			SyncItem(item)
			
			NW_SetTask(NW_TASKNO_GETDOMAINRING, 1)
			WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("����Ϊ<color=red>����<color>, ���������.")
		end
		
		
	end
end

-- ��ȡ/��ȡ���ӽ���
function nw_accept_empirering()
		
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("�ѵ����ﲻ�����ν�����?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>���ӵĽ���<color> ֻ����������ȡ��˭��ð������?")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("�������콱��.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("ս�¼����������׼��ӭս.")
	else
		local free = FindFreeRoomByWH(2, 4)
		if (free ~= 1) then
			Say("װ����λ����,���������.")
			return
		end
		
		if nWeek == 0 then	nWeek = 7;	end
		if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
		local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
		local itemHorse = AddItem(0,10,7,1,0,0)
		if (itemHorse == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("�в���֮��, ������ʱ���ܽ�����.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
		ITEM_SetExpiredTime(itemHorse, nExpiredDate, 120000)
		SyncItem(itemHorse)
		
		-- �Ѿ��ɹ���ȡ��������Ʒ
		NW_SetTask(NW_TASKNO_GETEMPIRERING, 1) 
		
		local itemBeijin = AddGoldItem(0,142)
		if (itemBeijin == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,142)] to %s", GetName()))
			Say("�в���֮��, ������ʱ���ܽ�����.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,142)] to %s", GetName()))
		ITEM_SetExpiredTime(itemBeijin, nExpiredDate, 120000)
		SyncItem(itemBeijin)
		
		local itemYaDian = AddGoldItem(0,141)
		if (itemYaDian == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,141)] to %s", GetName()))
			Say("�в���֮��, ������ʱ���ܽ�����.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,141)] to %s", GetName()))
		ITEM_SetExpiredTime(itemYaDian, nExpiredDate, 120000)
		SyncItem(itemYaDian)
		
		Say("���µĽ���Ϊ<color=red>������ָ������ָ��, ����<color>.")
	end
end

-- ��ȡ/��ȡ��������
function nw_accept_empireseal()
	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("�ѵ����ﲻ�����ν�����?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("ֻ�����Ӳ�����ȡ���������������Ǵ󵨣���ð������")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRESEAL) ~= 0) then
		Say("����<color=red>��������<color> ��.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("ս�¼����������׼��ӭս.")
	else
		local free = CalcFreeItemCellCount()
		if (free == 0) then
			Say("װ����λ����,���������.")
			return
		end
		local itemidx = AddItem(6, 1, 2059, 1, 0, 0)
		if (itemidx == 0) then
			WriteLog(format("[NW]Failed to give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			Say("�в���֮��, ������ʱ���ܽ�����.")
		else
			WriteLog(format("[NW]Give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			tbItemTianZiYuXi:GiveCallBack(itemidx)
			NW_SetTask(NW_TASKNO_GETEMPIRESEAL, 1)
			Say("�������������� �������ȡ.")
		end
	end
end

-- �����Ǹ˳�
function nw_comment()
	Say("��Ȼ���ӵ�Ȩ���ߣ�����Ҳ����С������.",
		3,
		"���۵�������/nw_comment_commit",
		"�����۽��/nw_comment_query",
		"û��ʲô��/Cancel")
end

-- ����ֱ��
function nw_history()
	Say("������࣬��������ʷ�����У��ӹ������м���?",
		4,
		"������ʷ/nw_history_emperor",
		"�ι�ʷ��/nw_history_song",
		"���ʷ��/nw_history_jin",
		"��ֻ������һ��./Cancel")
end

-- ������ּ/��������
function nw_emperororder_setnationtitle()
	if (NW_IsEmperor() ~= 1) then
		Say("����ֻ�е������Ӳ�������.")
	else
--		local year, mon, day, hour, min, sec, wday = MakeDateTime(7)
--		if (wday == 0 or wday > 2) then

		if 	NW_GetTask(NW_TASKNO_NATIONALTITLE) ~= 0 then
			Say("�������£������Ѵ����ķ��������ٸ���.")
		else
			nw_emperororder_inputtitle()
		end
	end
end

-- ������ּ/�������ţ����������
function nw_emperororder_inputtitle()
--	AskClientForString(
--		"nw_oninputnationtitle",
--		"",
--		1,
--		NW_MAXLEN_NATIONTITLE,
--		"�����������ţ�")

	Say(
		"�ױ���ѡ�����",
		5,
		format("%s/#nw_oninputnationtitle(\"%s\")", "����", "����"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "����", "����"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "����", "����"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "����", "����"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "����", "����")
		)
end

-- ������ּ/�������ţ��ص�����
function nw_oninputnationtitle(title)
	if (NW_IsEmperor() ~= 1) then
		Say("��Ҽ�ð��������?")
		return
	end
	local len = strlen(title)
	if (len == 0) then
		nw_emperororder_inputtitle()
	elseif (len > NW_MAXLEN_NATIONTITLE) then
		Say("�������£��������̫���ˣ����ռǲ�ס.",
			2,
			"����������/nw_emperororder_inputtitle",
			"����������/Cancel")
	elseif (NW_CheckText(title) ~= 1) then
		Say("�ù�����Ҫ�ڿ��ഫ���������£��ĺ��鸽",
			2,
			"����������/nw_emperororder_inputtitle",
			"����������/Cancel")
	else
		local emperor = NW_GetEmperorName()
		AddGlobalCountNews(format("[�ı�ָʾ]����<color=red>%s<color> �ù��ų� \"<color=red>%s<color>\".", emperor, title), 5)
		NW_SetNationTitle(title)
		NW_SetTask(NW_TASKNO_NATIONALTITLE, 1)
		Say("����ּ")
	end
end

--������ּ/����ͬ��
function nw_emperororder_congratulate()
	if (NW_IsEmperor() ~= 1) then
		Say("�Ӵ�������Ҫ��������")
		return
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_CONGRATULATION) + SECONDS_ONEWEEK) then
		Say("���£� ���ǹ��ཫ�ܺķ��Ҳ�����?")
	else
		Say("�����Ǻ�ʱ�����������������?",
			2,
			"����!/nw_emperororder_congratulate_inputwords",
			"�� /Cancel")
	end
end

-- ������ּ/����ͬ�죺�趨�ش�
function nw_emperororder_congratulate_inputwords()
	AskClientForString(
		"nw_emperororder_congratulate_words",
		"",
		1,
		NW_MAXLEN_CONGRATULATIONWORDS,
		"�����дף��:")
end

-- ������ּ/����ͬ�죺�趨�ش�
function nw_emperororder_congratulate_words(words)
	if (NW_IsEmperor() ~= 1) then
		Say("��Ҽ�ð��������?")
		return
	end
	local len = strlen(words)
	if (len == 0) then
		Say("���Ķ��䲻�ã��������˵һ��.")
	elseif (len > NW_MAXLEN_CONGRATULATIONWORDS) then
		Say("ף��̫�������պ��Ѽ�ס")
	elseif (NW_CheckText(words) ~= 1) then
		Say("ף���в�����Ĵʣ��������˼.")
	else
		-- ����30����
		NW_OpenCongratulation(words, 30)
		NW_SetTask(NW_TASKNO_CONGRATULATION, GetCurServerTime())
		AddGlobalCountNews(format("[����ͬ��] ��������Ƶ��ת��\"<color=red>%s<color>\" ף�����Ӷ����õ�����!", words), 10)
		Say("����ּ������ȥ����.")
	end
end

-- ������ּ/��������
function nw_emperororder_absolve()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("�������������ӵ�Ȩ��")
			return
		end
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_ABSOLVE) + SECONDS_ONEWEEK) then
		Say("���´ȱ������½�֪�����ǣ������������̫����")
	else
		Say("����ּ�� ���������·���")
		NW_SetTask(NW_TASKNO_ABSOLVE, time)
		AddGlobalCountNews("[��������] ���з���һ����������Ժ���ͷ�Ի�������ؼ�", 3)
	end
end

-- ������ּ/ļ��
function nw_emperororder_levy()
	if (NW_IsEmperor() ~= 1) then
		Say("��������Ȩ��")
		return		
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_LEVY) + SECONDS_ONEWEEK) then
		Say("�����Ѿ�Ǯһ���ˣ��پ�һ�ν����������ڵİ�Թ")
	else
		NW_SetTask(NW_TASKNO_LEVY, time)
		NW_Levy(10000, 80)
		AddGlobalCountNews("[���Ӿ�Ǯ] ������ּ�����г����Ǯ�����ÿ�ּ", 3)
	end
end

-- ������ּ/����گ��
function nw_emperororder_message()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("����گ�������ӵ�Ȩ��")
			return
		end
	end
	local currtime = GetCurServerTime()
	local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
	if (tasktime ~= 0 and currtime <= tasktime + SECONDS_ONEWEEK and
		NW_GetTask(NW_TASKNO_MESSAGECOUNT) >= NW_MAXCOUNT_MESSAGE) then
		Say("���·���گ��̫���ˣ����ն�������.")
	else
		nw_emperororder_inputmessage()
	end
end

-- ������ּ/����گ�飺��������
function nw_emperororder_inputmessage()
	AskClientForString(
		"nw_emperororder_onmessage",
		"",
		NW_MINLEN_MESSAGE,
		NW_MAXLEN_MESSAGE,
		"������گ��")
end

-- ������ּ/����گ�飺���ݼ��
function nw_emperororder_onmessage(msg)
	local len = strlen(msg)
	if (len < NW_MINLEN_MESSAGE or len > NW_MAXLEN_MESSAGE) then
		Say("گ�������ӵķ��ԣ�̫�̻���̫�������ܱ����˼",
			2,
			"����������/nw_emperororder_inputmessage",
			"��������/Cancel")
	elseif (NW_CheckText(msg) ~= 1) then
		Say("گ���в��׵Ĵ�, �������˼.",
			2,
			"����������/nw_emperororder_inputmessage",
			"��������/Cancel")
	else
		local currtime = GetCurServerTime()
		local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
		local count = 1
		if (tasktime == 0 or currtime > tasktime + SECONDS_ONEWEEK) then
			NW_SetTask(NW_TASKNO_MESSAGETIME, currtime)
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		else
			count = NW_GetTask(NW_TASKNO_MESSAGECOUNT) + 1
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		end
		AddGlobalCountNews(format("[����گ��] <color=red>%s<color>", msg), 3)
		Say(format("����ס�ˣ����ܱ��¿����ٷ�<color=red>%d<color> ��", NW_MAXCOUNT_MESSAGE - count))
	end
end

-- ������ּ/����
function nw_emperororder_forbidtalkdlg()
	if (NW_IsEmperor() ~= 1) then
		Say("��Ҽ�ð��������?")
		return
	end
	local tasktime = NW_GetTask(NW_TASKNO_FORBIDCHATTIME)
	local currtime = GetCurServerTime()
	if (tasktime ~= 0 and currtime < tasktime + SECONDS_ONEDAY) then
		Say("���»����������������ƽ˳����.")
	else
		Say("���ܱ��¿��Խ��ԣ������������۶ϡ��������������",
			2,
			"���Ѿ�����/nw_emperororder_forbidtalk",
			"��������/Cancel")
	end
end

-- ������ּ/���ԣ����������
function nw_emperororder_forbidtalk()
	AskClientForString(
		"nw_emperororder_forbidtalk_input",
		"",
		1,
		32,
		"��������Ҫ���Ե�����:")
end

-- ������ּ/���ԣ������������
function nw_emperororder_forbidtalk_input(name)
	NW_ForbidChat(name, 30)
	local currtime = GetCurServerTime()
	NW_SetTask(NW_TASKNO_FORBIDCHATTIME, currtime)
	AddGlobalCountNews(format("[����گ��]\"<color=red>%s<color>\"��ŭ���ӣ����԰�Сʱʾ��.", name), 3)
	Say(format("����ּ������ <color=red>%s<color> ��Сʱ��", name))
end

-- �����Ǹ˳�/���鵱������
function nw_comment_commit()
	Say("�����������ģ�������ȻȨ���ߣ�����Ҳ������ƭ����.",
		3,
		"��������/nw_comment_celebratedlg",
		"�߸�����/nw_comment_criticizedlg",
		"û��ʲô��/Cancel")
end

-- �����Ǹ˳�/��ѯ������
function nw_comment_query()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Ŀǰ��û�����ӣ����պ�ϣ���и�����ͳһ����")
		return
	end
	local goodness, badness = NW_GetRemark()
	local value = floor(goodness - badness)
	local title = ""
	if (value > 3000) then
		title = "ʥ��"
	elseif (value >= 1001) then
		title = "����"
	elseif (value >= 101) then
		title = "��Ϊ"
	elseif (value >= -100) then
		title = "�徻"
	elseif (value >= -1000) then
		title = "��Ϊ"
	elseif (value >= -3000) then
		title = "ӹ��"
	else
		title = "���"
	end
	Say(format("����������<color=yellow>%s<color>,�ƶ���<color=yellow>%d<color>, ���� <color=yellow>%s<color>.", emperor, value, title))
end

-- �����Ǹ˳�/���鵱������/�������ӣ��������
function nw_comment_celebratedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Ŀǰ��û�����ӣ����պ�ϣ���и�����ͳһ����")
		return
	end
	GiveItemUI(
		"��������",
		"��������Ӣ��������������",
		"nw_comment_celebrate",
		"Cancel")
end

-- �����Ǹ˳�/���鵱������/��������
function nw_comment_celebrate(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 197) then
			Say("ֻ���������������")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(total_count)
	nw_comment_query()
end

-- �����Ǹ˳�/���鵱������/�������ӣ��������
function nw_comment_criticizedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Ŀǰ��û�����ӣ����պ�ϣ���и�����ͳһ����")
		return
	end
	GiveItemUI(
		"�߸�����",
		"���������޵£��������߸�",
		"nw_comment_criticize",
		"Cancel")
end

-- �����Ǹ˳�/���鵱������/��������
function nw_comment_criticize(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 198) then
			Say("ֻ���÷������߸�����")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(-total_count)
	nw_comment_query()
end

tbHistoryScoreTitle = 
{
    [1] = {nValue = -3000, strTitle = "���"},
    [2] = {nValue = -1001, strTitle = "ӹ��"},
    [3] = {nValue = -101, strTitle = "��Ϊ"},
    [4] = {nValue = 100, strTitle = "�徻"},
    [5] = {nValue = 1000, strTitle = "��Ϊ"},
    [6] = {nValue = 3000, strTitle = "����"},
    [7] = {nValue = 3000, strTitle = "ʥ��"},
}

tbHistoryCapital = 
{
    [0] = "�꾩",
    [1] = "�ٰ�",
}

function history_page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"�뿪/Cancel",};
    local tbContent = {};
    local tbTianzi = {}
	
	for i = tb_pageinfo.from, tb_pageinfo.to do
	    local strGeneration;
	    tbTianzi.szEmperor, _, tbTianzi.szTitle, tbTianzi.szTong, tbTianzi.nBeginTime, tbTianzi.nSide, tbTianzi.nScore, tbTianzi.nEndTime = NW_EmperorHistory(tb_pageinfo.total - i + 1, str_parameter);
	    local strEmperor;
	    local strBeginTime;
	    local strEndTime;
	    local strTitle;
	    local strTong;
	    local strScore;
	    local strCapital;
	    
	    if (tbTianzi.nEndTime == 0) then
	        strGeneration = "����ʥ��";
	    else
	        strGeneration = format("��<color=red>%d<color>������", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "��ϵ"
	        strTitle = "��ϵ"
	        strBeginTime = "<color=yellow>V?color>";
	        strEndTime = "<color=yellow>V?color>";
	        strTong = "��ϵ"
	        strScore = "��ϵ"
	        strCapital = "��ϵ"
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> �� <color=green>%02d<color> �� <color=green>%02d<color> ��", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));
	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>V?color>";
	        else
	            strEndTime = format("<color=green>%d<color> �� <color=green>%02d<color> �� <color=green>%02d<color> ��", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
	        end
	        
	        strTong = tbTianzi.szTong;
	        for j = 1, getn(tbHistoryScoreTitle) do
                if ((strScore == nil or strScore == "") and tbTianzi.nScore <= tbHistoryScoreTitle[j].nValue) then
                    strScore = tbHistoryScoreTitle[j].strTitle;
                end
            end
            if (strScore == nil or strScore == "") then
                strScore = tbHistoryScoreTitle[getn(tbHistoryScoreTitle)].strTitle;
            end
            strCapital = tbHistoryCapital[tbTianzi.nSide];
	    end
	    tbContent[getn(tbContent) + 1] = 
        {
            format("%s: <color=yellow>%s<color>", strGeneration, strEmperor),
        }
        tbContent[getn(tbContent) + 1] = 
        {
			format("����: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("�ǹ�: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("���: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("��λ %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("�ʳ�: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("�������ۣ� <color=yellow>%s<color>", strScore),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            "--------------------------------------------",
        }
	end
   
    local var_width = {50}
    local var_align = 1
	
	strContent = maketable(tbContent, var_width, var_align);
	
    return strContent, tbOption;
end
-- ����ֱ��/����ʷ��
function nw_history_emperor()
	saypage(NW_EmperorHistoryCount(), 3, "history_page_gen", -1);
end

-- ����ֱ��/�ι�ʷ��
function nw_history_song()
	saypage(NW_EmperorHistoryCount(1), 3, "history_page_gen", 1);
end

-- ����ֱ��/���ʷ��
function nw_history_jin()
	saypage(NW_EmperorHistoryCount(0), 3, "history_page_gen", 0);
end

-- ����گ��/�ַ��
function nw_kingorder_instate()
	Say("���ڰ����油�����δ�")
end

-- ����گ��/����˰�ʶԻ�
function nw_kingorder_taxdlg()
	city = GetCityArea()
	tong, master = GetCityOwner(city)
	if ((city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) or master ~= GetName()) then
		Say("��������˰���ǹ�������Ȩ")
		return
	end
	Say("����������˰����?",
		2,
		"����!/nw_kingorder_tax",
		"�� /Cancel")
end

-- ����گ��/����˰�ʶԻ�
function nw_kingorder_tax()
	city = GetCityArea()
	OpenCityManageUI(city)
end
