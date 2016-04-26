-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 
-- 文件名　：npc_enter.lua
-- 创建者　：子非魚
-- 创建时间：2011-05-03 16:50:24

-- ======================================================
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")

function bairen_dialog()
	
	local tbOpt = {};
	tinsert(tbOpt, {"我想去皇城司擂台",onEnterHunbredArena});
	tinsert(tbOpt, {"关于皇城司擂台",onHelpHunbredArena})
	tinsert(tbOpt, {"结束对话", oncancel})
	CreateNewSayEx("<npc>皇城司擂台给江湖高手一个闻名天下的机会.如果做擂主连续打败挑战者就会名扬天下，甚至可以直接到皇城为国效力。", tbOpt)
end

function onEnterHunbredArena()
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:NpcEnter")	
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhBachNhanLoiDai")
end

function onHelpHunbredArena()
	local tbOpt = {};
	tinsert(tbOpt, {"我想去皇城司擂台",onEnterHunbredArena});
	tinsert(tbOpt, {"结束对话", oncancel});
	
	CreateNewSayEx("<npc>皇城司擂台{{将于每日 12:00开起，到0:00结束}}. <enter> 皇城司擂台暂时设有5个擂台，其中{{擂台1 }} 是主擂台，只有在这个擂台上取得胜利才可以得到武林人士的承认."
		.."每次上台是{{3分钟}},如果在此期间双方不分胜负，届时{{将去被杀伤较轻的一方}}做擂主，继续接受其他高手的挑战."
		.."如果没有高手敢挑战擂主，皇城司将会派出十大门派的高手上台挑战，擂主要在{{ 3 分钟 }}内打败，否则就会被认定为失败"
		.."<enter>注意：要用轻功跑上擂台比武",
		tbOpt);
end
