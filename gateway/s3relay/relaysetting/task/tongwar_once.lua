TONGWAR_LGTYPE = 10
TONGWAR_LGMTASK_JOB = 1
LOGFILE = "relay_log\\tongwar.log"
function TaskShedule()
	-- 设置方案名称
	TaskName("参加武林第一帮争夺战 ")
	-- 只执行一次
	TaskInterval( 244000 )
	TaskCountLimit( 1 )
end

function TaskContent()
	for i = 1, 7 do
		local strCityName = GetCityAreaName(i)
		local strCityTongName = GetCityOwner(i)
		if (FALSE(LG_GetLeagueObj(TONGWAR_LGTYPE, strCityName))) then
			nLeagueID = LG_CreateLeagueObj()
			LG_SetLeagueInfo(nLeagueID, TONGWAR_LGTYPE, strCityName)
			LG_ApplyAddLeague(nLeagueID, "", "")
			LG_FreeLeagueObj(nLeagueID)
			
			if (not FALSE(strCityTongName))then
				nMemberID = LGM_CreateMemberObj()
				--设置社团成员的信息(角色名、职位、社团类型、社团名称)
				LGM_SetMemberInfo(nMemberID, strCityTongName, 1, TONGWAR_LGTYPE, strCityName)
				LGM_ApplyAddMember(nMemberID, "", "")
				LGM_FreeMemberObj(nMemberID)
				LG_ApplySetMemberTask(TONGWAR_LGTYPE, strCityName, strCityTongName, TONGWAR_LGMTASK_JOB, 1)
			end
			WriteStringToFile(LOGFILE, strCityName.."\t"..strCityTongName.."\n")
		end
	end
end


function _msg(...)
local str = ""
	for i = 1, getn(arg) do
		str = str.." "..arg[i]
	end
	OutputMsg(str)
end

--如果为nil或0，返回1，否则返回0
function FALSE(value)
	if (value == 0 or value == nil or value == "") then
		return 1
	else
		return nil
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
