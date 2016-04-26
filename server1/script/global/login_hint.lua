Include("\\script\\lib\\common.lua")
Include("\\script\\global\\rename_head.lua")

--�����
EVENTS_TB = {
--	{
--		--��ʾ�����
--		ndate = {051101, 051131},	--��ֹ���ڣ���ѡ
--		ntime = {2000, 2359},		--��ֹʱ�䣬��ѡ
--		level = {1, 200},			--��ֹ���𣬿�ѡ
--		taskequal = {taskid, taskvalue},	--���������ȣ���ѡ
--		tasknot = {taskid, taskvalue},		--����������ȣ���ѡ
--		checkfunc = func			--��⺯������ѡ����������nil��ʾ�����������򴥷�
--		
--		--�����
--		name = "ĳĳ�",			--����ƣ�����
--		describe = "��˵������",	--�˵����Ҳ������һ�����������ַ�������ѡ
--		detail =
--[[�����������д�ܶ����֣���ϸ������Ļ��
--���������ŵ���ʽ�������ɻ��С�
--����Ҳ������һ�����������ַ���]],	--����飬��ѡ \___����ֻ��ѡ��һ
--		callback = nil,				--�ص���������ѡ /
--		link = nil,					--Describe�Ի�link��Ϣ����ѡ��ʹ��detailʱ��Ч��
--	},
	{
		ndate = {070414,070424},
		name = "3��3��",
		describe = "��<color=yellow>14/4/2007<color> �� <color=yellow>24/4/2007<color>, �ڻʱ���ڣ������ڴ�����������е���ҽ��л����<color=yellow>�����<color>. ���Ż������������������NPC�̷�����ȡ <color=yellow>ԭ�ϴ����<color>.",
	},
	{	--3����ǰ�����������
		level = {1, 3},
		tasknot = {1014, 2},
		name = "��������",
		describe = "�����ṩ�ĳ�ѧ������",
		callback = Uworld1000_word,
	},
	{	--����������������
		level = {80, 119},
		name = "������������������'��������'",
		describe = "����Ե���Ա�������μ���������.",
		detail =
[[��������������׼���׶Σ���ĵȼ����Բμ�<color=yellow>������Ӫ<color>.
����λ��: <color=yellow>�꾩 (222, 191)<color>, <color=yellow>�ٰ�(182, 204)<color>.]],
	},
	{	--�������������߼�
		level = {120, 200},
		name = "������������������'��������'",
		describe = "����Ե���Ա�������μ���������.",
		detail =
[[��������������׼���׶Σ���ĵȼ����Բμ�<color=yellow>������Ӫ<color>.
����λ��<color=yellow>���� (200, 197)<color>, <color=yellow>����(219, 190)<color>.]],
	},
	{	--�Ի�֮ҹ
		name = "�Ի�֮ҹ",
		describe = "�����������½�ħ����ơ��Ի�ҹ��ÿ��7ʱ30��. ",
		detail =
[[ĿǰΪ�����˳ʱ�䣬Ϊ��ʢ���л����������ʿ�������������˾���'�Ի�ҹ'�. ���ÿ��19��30�ֿ�ʼ��ÿ�λ30���ӡ��������ݿ���ȥ������˽�.]],
	},

	-- {
	-- 	name = "<#>��ɫ����",
	-- 	describe = "<#>�����ڲ��������У����Ľ�ɫ����������ҵĽ�ɫ��������������������ϵͳ�Ѱ����Զ��������������Ҫ���¸ı��ɫ���Ļ����뵽�����ִ�������ƹ�Ա��ѡ���޸Ľ�ɫ������ֻ�ܸ���һ�ν�ɫ������������ϸ�Ķ���Ӧ˵����",
	-- },
	-- {
	-- 	name = "<#>������",
	-- 	describe = "�����ڲ��������У������ڵİ�ᣬ����������������������������������ϵͳ�Ѱ������ڵİ���Զ����������������Ҫ���¸ı������Ļ����뵽�����ִ�������ƹ�Ա��ѡ���޸İ����������ֻ�ܸ���һ�ΰ��������������ϸ�Ķ���Ӧ˵����",
	-- },
}

EVENT_HINT_LINK = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy060\\enemy060_st.spr>����Ļ����:<link>"
EVENT_HINT_TIMES = 3	--ÿ��������ʾ����

--����нϸ��ӵĻ��Ҫ�Զ���һЩ��������������Include����ʹ�ã�
--	if EVENTS_TB then EVENTS_TB[getn(EVENTS_TB)+1] = {����} end
--�ķ�ʽ���
--=================================================================
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
--=================================================================

--��½ʱ���õĺ���
function event_hint_login(bExchangeIn)
	-- ��������ľͲ�������ʾ��
	if (bExchangeIn == 1) then
		return
	end
	local n_date = tonumber(GetLocalDate("%y%m%d"));
	local n_time = tonumber(GetLocalDate("%H%M"));
	local n_times;
	if (GetTask(2308) ~= n_date) then	--���ǽ����½��
		SetTask(2308, n_date);
		SetTask(2309, 0);
		n_times = 0;
	else
		n_times = GetTask(2309);
	end
	if (n_times >= EVENT_HINT_TIMES) then	--�Ѵﵽ��ʾ������������ʾ
		return
	end
	
	local n_level = GetLevel();
	local tb = {};
	for i = 1, getn(EVENTS_TB) do
		if event_hint_check(EVENTS_TB[i], n_date, n_time, n_level) then	--��������
			tb[getn(tb)+1] = i;
		end
	end
	if (getn(tb) == 1) then	--ֻ��һ�����ֱ����ʾ����
		event_show_detail(tb, 1);
	elseif (getn(tb) > 0) then	--����
		event_show_all(tb);
	end
	
	SetTask(2309, n_times + 1)
	
	bingfu_hint()	--������������ʱ��ӵĸ����ȼ�������ʾ�������ڹ淶��ʹ��
end

--���ĳ����Ƿ���Ҫ֪ͨ��ǰ���
function event_hint_check(tb_event, n_date, n_time, n_level)
	local tb = tb_event.ndate;
	if (tb) then	--�޶�����
		if (n_date < tb[1] or n_date > tb[2]) then	--���ڲ���
			return
		end			
	end
	tb = tb_event.ntime;
	if (tb) then	--�޶�ʱ��
		if (n_time < tb[1] or n_time > tb[2]) then	--���ڲ���
			return
		end			
	end
	tb = tb_event.level;
	if (tb) then	--�޶�����
		if (n_level < tb[1] or n_level > tb[2]) then	--���𲻷�
			return
		end			
	end
	tb = tb_event.taskequal
	if (tb) then	--����������
		if (GetTask(tb[1]) ~= tb[2]) then
			return
		end			
	end
	tb = tb_event.tasknot
	if (tb) then	--�����������
		if (GetTask(tb[1]) == tb[2]) then
			return
		end			
	end
	local func = tb_event.checkfunc
	if (func) then	--�����ж�
		if (not func()) then
			return
		end			
	end
	return 1
end

--��ʾ���л
function event_show_all(tb)
	local str = "<enter>";
	local tb_option = {};
	for i = 1, getn(tb) do
		local tb_event = EVENTS_TB[tb[i]];
		str = str .. "<color=red>" .. tb_event.name .. "<color><enter>";
		if (tb_event.describe) then
			local str_des
			if (type(tb_event.describe) == "function") then
				str_des = tb_event.describe()
			else
				str_des = tostring(tb_event.describe)
			end
			str = str .. "  " .. str_des .. "<color><enter>";
		end
		if (tb_event.detail or tb_event.callback) then
			tb_option[getn(tb_option)+1] = tb_event.name.."����/#event_show_detail({"..join(tb).."},"..i..")";
		end
	end
	tb_option[getn(tb_option)+1] = "���첻����������/event_hint_stop";
	tb_option[getn(tb_option)+1] = "��֪����!/no";
	Describe(EVENT_HINT_LINK..str, getn(tb_option), tb_option);
end

--��ʾĳһָ������飨ȫ������ǰ�ڼ�����
function event_show_detail(tb, n)
	local tb_event = EVENTS_TB[tb[n]];
	if (tb_event.callback) then
		tb_event.callback();
	else
		local str = "<enter><color=red>"..tb_event.name.."<color><enter>"
		local tb_option = {};
		if (getn(tb) > 1) then
			tb_option[1] = "�һ����˽������/#event_show_all({"..join(tb).."})";
		end
		tb_option[getn(tb_option)+1] = "���첻��������/event_hint_stop";
		tb_option[getn(tb_option)+1] = "��֪����!/no";
		if (tb_event.link) then
			str = tb_event.link .. str
		else
			str = EVENT_HINT_LINK .. str
		end
		if (tb_event.detail) then
			if (type(tb_event.detail) == "function") then
				str = str .. tb_event.detail()
			else
				str = str .. tb_event.detail
			end
		elseif (tb_event.describe) then
			if (type(tb_event.describe) == "function") then
				str = str .. tb_event.describe()
			else
				str = str .. tostring(tb_event.describe)
			end
		end
		Describe(str, getn(tb_option), tb_option);
	end
end

function event_hint_stop()
	SetTask(2309, EVENT_HINT_TIMES);
end

function bingfu_hint()
	-- ��ɫ������ʾ
	local msg = ""
	if (check_renamerole() == 1) then
		msg = msg .. "<#>�����ڲ��������У�ϵͳ�Ѱ����Զ��������뵽�����ִ�������ƹ�Ա��ѡ��<color=red>�޸Ľ�ɫ��<color>��"
	end
	-- ��������ʾ
	if (check_renametong() == 1) then
		msg = msg .. "<#>�����ڲ��������У�ϵͳ�Ѱ������ڵİ���Զ��������뵽�����ִ�������ƹ�Ա��ѡ��<color=red>�޸İ����<color>��"
	end
	if (check_castellan_remedy() == 1) then
		msg = msg .. "<#>��Ϊ����������ϵͳ�Զ������������ڰ��ĳ��й���Ȩ�������Ե������ִ�������ƹ�Ա��<color=red>��ȡ��Ӧ�Ĳ���<color>����ȡ��Ჹ���Ĺ�����<color=red>������һ������<color>��Ч��"
	end
	
	if (msg ~= "") then
		Say(msg, 1, "<#>֪����/cancel")
	end
end

if login_add then login_add(event_hint_login, 0) end

