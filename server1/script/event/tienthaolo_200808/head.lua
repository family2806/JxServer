-- Event ��ȡ��Ч�ɲ�¶Vinagame
--Th�ng 8 n�m 2008
-- Created by TuanNA5

TTL_DATE_START = 0808150000
TTL_DATE_END = 0809152400

TTL_GOT_TIME = 1980

MAX_TTL = 8

function get_thaolo()
	local nUsedTime = 0;
	local nTimes = 0;
	
	if check_thaolo_date() == 0 then
		Say("�˴λ�ѽ���.",0)
		return 0
	end	
	
	nUsedTime = GetTask(TTL_GOT_TIME)
	nTimes = MAX_TTL - nUsedTime
	
	if nTimes < 0 then
		nTimes = 0
	end
	
	strTalk = "�� 10/08/2008 - 10/09/2008ʱ���ڣ����ѽ�����8����Ч�ɲ�¶�� �ɲ�¶���������յ���2Сʱ�ڷ������á����ѻ�ʣ"..nTimes.." �Ρ����ʱ�䵽��û�����ɲ�¶��������������."
	
	Say(strTalk,2,"������/say_yes","������Ҫ/say_no")
	
end

function say_yes()
	if check_thaolo_date() == 1 then
		local nUsedTime = GetTask(TTL_GOT_TIME)
		if nUsedTime >= 0 and nUsedTime < 8 then
			AddSkillState(440, 1, 1, 64800 * 2);
			SetTask(TTL_GOT_TIME, GetTask(TTL_GOT_TIME) +1)
			Say("�ɲ�¶��ʼ��������",0)
			Msg2Player("�����2Сʱ�ڵ��ɲ�¶����")
			WriteLog("[�ɲ�¶�\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." ����ɲ�¶")
		else
			Say("�����칺�ɲ�¶��",0)
			Msg2Player("�����칺8���ɲ�¶")
			return 0
		end	
	end
end

function check_thaolo_date()
	local nDate = tonumber(GetLocalDate("%y%m%d%H%M"));
	if nDate >=  TTL_DATE_START and nDate <= TTL_DATE_END then
		return 1
	end
	return 0
end

function say_no()
end