-- description	: �رձ�����ʱ��
-- author		: wangbin
-- datetime		: 2005-07-13

Include("\\script\\missions\\challengeoftime\\include.lua")

function timeout()
	Msg2MSAll(MISSION_MATCH, "<#> ������ʱ���ѽ�������Ķ�����սʧ��");
end

function OnTimer()
	timeout();
	-- �ر��Լ�
	close_close_timer();
	-- ��������
	close_match();
	-- �رչ��涨ʱ��
	close_board_timer();
end
