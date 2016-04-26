if not GREATNIGHT_HUANGZHIZHANG  then
GREATNIGHT_HUANGZHIZHANG = 1

Include("\\script\\lib\\gb_taskfuncs.lua")
GN_EVENTNAME = "��֮�»"
TB_HUANGZHIZHANG_EVENT = {
		"�ν�ս��",
		"��ʹ����",
		"��սʱ��",
		"Ұ������",
		--"ͬ�������������ƪ��ͬ����������",
	}
GN_HUANG_EVENTID = 1
GN_HUANG_SWITH = 2
GN_HUANG_DATE = 3
function greatnight_huang_event(event)
	--���û��ʼ
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		return 1
	end
	local award_times = gn_getaward_times()	--����������������
	--��ٲ�ѯ����
	if (event == nil) then
		--��1��ʾ����3�������� 0���ID��������������
		return 0, gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID), award_times
	end
--	--�����ǻʱ��
--	if (tonumber(GetLocalDate("%H%M")) < 2055 or tonumber(GetLocalDate("%H%M")) > 2255) then
--		return 1
--	end
	--���δ��ʼ
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) == 0) then
		return 1
	end
	
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == event) then
		return award_times
	end
	
	return 1
end

function gn_getaward_times()
--	local nWeek = tonumber(GetLocalDate("%w"))
--	if (nWeek == 6 or nWeek == 0) then
--		return 3	--��ĩ3��
--	else
		return 2	--ƽʱ2��
--	end
end

function huang_event_hint()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return format("%s%s%s%s%s",
				"��֮�»�� <color=yellow>21h00 ��23h00<color> ÿ��. �ڴ�ʱ��βμ�һ��Ҫ��, ��������ȡ˫������ <enter>���յ�Ҫ����<enter>",
				"�ν��ս <enter>",
				"��սʱ�� gian <enter>",
				"Ұ������ <enter>",
				"ÿ��<color=yellow>8��<color>,��ҿ��Ե���ٴ��˽�ϸ��. ��Ҫ��ʧ��ȡ������������Ļ���")
		
	else
		return format("����֮�¡����ʱ����<color=yellow>21h00��23h00<color> ÿ��. �����ǣ� <enter><color=yellow>%s<color><enter><enter>��λ�����Ͽ챨���μ�.",
					TB_HUANGZHIZHANG_EVENT[eventid])
	end
end

function huang_event_name()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return "����֪��"
	else
		return TB_HUANGZHIZHANG_EVENT[eventid]
	end
end

function huang_event_msg()
	local name = huang_event_name()
	return format("����ġ���֮�»������21h00��ʼ,��ȡ˫����������ػ�ǣ�<color=yellow>%s<color>",name)
end

function seed_birth_city()
	local MapStr = "���ݶ���";
	if (1 == gb_GetTask("�Ի�����", 1)) then
		MapStr = "������";
	end;
	return format("��������12h00����ʼ��֮�µĻ, �ƽ�֮����������<color=yellow>%s<color>",MapStr)
end

if EVENTS_TB then 
EVENTS_TB[getn(EVENTS_TB)+1] = {	--��֮��
			name = "�Ի�",
			describe = seed_birth_city
		}
EVENTS_TB[getn(EVENTS_TB)+1] = {	--��֮��
			name = "��֮��",
			describe = huang_event_msg
		}
end
end
