-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - 
-- �ļ�������npc_enter.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-05-03 16:50:24

-- ======================================================
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")

function bairen_dialog()
	
	local tbOpt = {};
	tinsert(tbOpt, {"����ȥ�ʳ�˾��̨",onEnterHunbredArena});
	tinsert(tbOpt, {"���ڻʳ�˾��̨",onHelpHunbredArena})
	tinsert(tbOpt, {"�����Ի�", oncancel})
	CreateNewSayEx("<npc>�ʳ�˾��̨����������һ���������µĻ���.������������������ս�߾ͻ��������£���������ֱ�ӵ��ʳ�Ϊ��Ч����", tbOpt)
end

function onEnterHunbredArena()
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:NpcEnter")	
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhBachNhanLoiDai")
end

function onHelpHunbredArena()
	local tbOpt = {};
	tinsert(tbOpt, {"����ȥ�ʳ�˾��̨",onEnterHunbredArena});
	tinsert(tbOpt, {"�����Ի�", oncancel});
	
	CreateNewSayEx("<npc>�ʳ�˾��̨{{����ÿ�� 12:00���𣬵�0:00����}}. <enter> �ʳ�˾��̨��ʱ����5����̨������{{��̨1 }} ������̨��ֻ���������̨��ȡ��ʤ���ſ��Եõ�������ʿ�ĳ���."
		.."ÿ����̨��{{3����}},����ڴ��ڼ�˫������ʤ������ʱ{{��ȥ��ɱ�˽����һ��}}�����������������������ֵ���ս."
		.."���û�и��ָ���ս�������ʳ�˾�����ɳ�ʮ�����ɵĸ�����̨��ս������Ҫ��{{ 3 ���� }}�ڴ�ܣ�����ͻᱻ�϶�Ϊʧ��"
		.."<enter>ע�⣺Ҫ���Ṧ������̨����",
		tbOpt);
end
