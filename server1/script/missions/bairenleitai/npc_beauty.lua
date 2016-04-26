-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - ��̨��Ů
-- �ļ�������npc_beauty.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-05-03 10:26:19

-- ======================================================
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main(nNpcIndex)
	local szName = GetName();
	
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local nParam1 = GetNpcParam(nNpcIndex, 1);
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>����˵ֻҪ�����������׸�ͻ�о�������ܣ�����ʱ��Ҳ�������һЩ���������������ǲ��ǹ�����˵����ô���?"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tinsert(tbDailog, {"��ô��������ô��Ҫ������.", onBeautyState, {szName, nParam1}});
	tinsert(tbDailog, {"���ˣ��Ҷ���Щ��Цû����Ȥ."})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
	
end

function onBeautyState(szName, nParam1)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:AddDoubleState", szName, nParam1);
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex);
end
