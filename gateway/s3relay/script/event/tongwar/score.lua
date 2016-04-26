Include("\\script\\lib\\common.lua")

TONGWAR_LGTYPE = 10		-- 战队类型

--战队公用Task
TONGWAR_LGTASK_TONGCNT	= 1	-- 共联盟数(无效)
TONGWAR_LGTASK_WIN		= 2	-- 胜利次数
TONGWAR_LGTASK_LOSE		= 3	-- 失败次数
TONGWAR_LGTASK_TIE		= 4	-- 平局次数
TONGWAR_LGTASK_RESULT	= 5	-- 比赛积分
TONGWAR_LGTASK_POINT	= 6	-- 累加净积分
TONGWAR_SCORELOG = "relay_log\\tongwar"

-- 联盟名称表
TONGWAR_LGNAME = {"凤翔","成都","大理","汴京","襄阳","扬州","临安"}

RESULT_WIN	= 1		-- 胜利
RESULT_LOSE	= 2		-- 失败
RESULT_TIE	= 3		-- 平局

function tongwar_score(szParam)		-- szParam[1]: 战队甲; szParam[2]: 战队乙; szParam[3]: 胜负情况; szParam[4]: 净胜分.
	local szlogfile = TONGWAR_SCORELOG..date("%y%m").."\\score.log"
	local params = split(szParam, " ")
	local team1 = tonumber(params[1])
	local team2 = tonumber(params[2])
	local result = tonumber(params[3])
	local net_score = tonumber(params[4])
	OutputMsg("-------------------TONGWAR MSG---------------------------")
	OutputMsg("Recieve "..team1.." VS "..team2.." result: "..result.." net_score: "..net_score);
	OutputMsg("-------------------TONGWAR MSG---------------------------")
	local win_side, lose_side
	if (result == RESULT_WIN) then		-- 甲方胜
		win_side = team1
		lose_side = team2

	elseif (result == RESULT_LOSE) then
		win_side = team2				-- 乙方胜
		lose_side = team1
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." LOST !\n")
	elseif (result == RESULT_TIE) then		-- 双方战平
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_TIE, 1)			-- 甲方平局场次加1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_TIE, 1)			-- 乙方平局场次加1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_RESULT, 1)		-- 甲方比赛积分加1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_RESULT, 1)		-- 乙方比赛积分加1
	end
	if (win_side and lose_side) then
		OutputMsg(win_side)
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[win_side], TONGWAR_LGTASK_WIN, 1)		-- 胜方得胜场次加1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[lose_side], TONGWAR_LGTASK_LOSE, 1)		-- 负方得负场次加1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[win_side], TONGWAR_LGTASK_RESULT, 3)	-- 胜方比赛积分加3
--		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[lose_side], TONGWAR_LGTASK_RESULT, 0)	-- 负方比赛积分加0
	end
	LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_POINT, net_score)	-- 累加甲方净积分
	LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_POINT, -net_score)	-- 累加乙方净积分
	local result1 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_RESULT)
	local result2 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_RESULT)
	local point1 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_POINT)
	local point2 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_POINT)

	if (result == RESULT_WIN) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." WIN ! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	elseif (result == RESULT_LOSE) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." LOSE ! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	elseif (result == RESULT_TIE) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." TIE! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	else
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." ERROR?! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	end


	-- 总积分排行
	Ladder_NewLadder(10225, TONGWAR_LGNAME[team1], result1)
	Ladder_NewLadder(10225, TONGWAR_LGNAME[team2], result2)
	-- 净积分排行
	Ladder_NewLadder(10226, TONGWAR_LGNAME[team1], point1)
	Ladder_NewLadder(10226, TONGWAR_LGNAME[team2], point2)
end
