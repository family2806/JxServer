IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\missions\\boss\\bigboss.lua")


function GetRankList()
	local tbNum = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
	local szranklist = ""
	for i = 1, 10 do
		local szname, nrank, nsect, ngender= Ladder_GetLadderInfo(10250, i);
		if szname ~= nil then	
			szranklist = format("%s 排名 %s: <%s> %d\n", szranklist, tbNum[i], szname, nrank);
		else
			szranklist = format("%s 排名 %s: <%s> %d\n", szranklist, tbNum[i], "没有", 0);
		end
	end
	local tbOpt = {}
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx(szranklist, tbOpt)
end

function GetPlayerHonour(szName)
	local i = 1
	local nlg_idx = LG_GetLeagueObj(LG_SONGJINHONOUR, szName);
	if nlg_idx == 0 or nlg_idx == nil then
		Msg2Player("没有此人\n")
	else
		local nhonour = LG_GetLeagueTask(nlg_idx, LG_TSK_HONOURPOINT);
		Msg2Player(format("经验值%s 为 %d\n",szName, nhonour))
	end
	return
end

function bbdead()
	local Handle = OB_Create()
	if (Handle > 0) then
		ObjBuffer:PushObject(Handle, 1)
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "SetBigBossDead", Handle);
		OB_Release(Handle)
	end
end

function open_battle()
	RemoteExecute("\\script\\test.lua", "open_battle", 0)
end