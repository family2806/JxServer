-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 擂台美女
-- 文件名　：npc_beauty.lua
-- 创建者　：子非魚
-- 创建时间：2011-05-03 10:26:19

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
	tbDailog.szTitleMsg = "<npc>他们说只要听我奏完这首歌就会感觉精神振奋，修炼时候也可以提高一些功力，你听听看是不是果真像传说的这么奇怪?"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tinsert(tbDailog, {"这么厉害，那么我要听听看.", onBeautyState, {szName, nParam1}});
	tinsert(tbDailog, {"算了，我对那些玩笑没有兴趣."})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
	
end

function onBeautyState(szName, nParam1)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:AddDoubleState", szName, nParam1);
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex);
end
