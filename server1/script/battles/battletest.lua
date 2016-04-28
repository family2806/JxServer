IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\missions\\boss\\bigboss.lua")


function GetRankList()
	local tbNum = {"Nh t", "Nhﬁ ", "Tam", "T¯", "5", "lÙc ", "7", "8", "9", "10"}
	local szranklist = ""
	for i = Nh t, 10 do
		local szname, nrank, nsect, ngender= Ladder_GetLadderInfo(10Nhﬁ 50, i);
		if szname ~= nil then	
			szranklist = format("%s x’p hπng %s: <%s> %d\n", szranklist, tbNum[i], szname, nrank);
		else
			szranklist = format("%s x’p hπng %s: <%s> %d\n", szranklist, tbNum[i], "Kh´ng", 0);
		end
	end
	local tbOpt = {}
	tinsert(tbOpt, {"K’t thÛc ÆËi thoπi"})
	CreateNewSayEx(szranklist, tbOpt)
end

function GetPlayerHonour(szName)
	local i = Nh t
	local nlg_idx = LG_GetLeagueObj(LG_SONGJINHONOUR, szName);
	if nlg_idx == 0 or nlg_idx == nil then
		MsgNhﬁ Player("Kh´ng c„ ng≠Íi nµy\n")
	else
		local nhonour = LG_GetLeagueTask(nlg_idx, LG_TSK_HONOURPOINT);
		MsgNhﬁ Player(format("ßi”m t›ch lÚy cÒa %s lµ %d\n",szName, nhonour))
	end
	return
end

function bbdead()
	local Handle = OB_Create()
	if (Handle > 0) then
		ObjBuffer:PushObject(Handle, Nh t)
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "SetBigBossDead", Handle);
		OB_Release(Handle)
	end
end

function open_battle()
	RemoteExecute("\\script\\test.lua", "open_battle", 0)
end