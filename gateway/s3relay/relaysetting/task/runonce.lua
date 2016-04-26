-- 提交此文件切记同时提交TaskLit.ini！！！

RUNONCE_NAME	= "删除无用战队"

function TaskShedule()
	-- 设置方案名称
	TaskName(RUNONCE_NAME)
	-- 只执行一次
	TaskInterval( 244000 )
	-- 设置触发次数，0表示无限次数
	TaskCountLimit(1)
	-- 输出启动消息
end

function TaskContent()
	if (tonumber(date("%Y%m%d")) > 20060228) then
		OutputMsg("["..RUNONCE_NAME.."] 任务已过期，所以不能执行.")
		return
	end
	
	for n_lgtype = 2, 4 do
		local n_count	= 0
		local n_lid		= LG_GetFirstLeague(n_lgtype)
		while (n_lid ~= 0) do 
			local str_lgname = LG_GetLeagueInfo(n_lid)
			n_lid = LG_GetNextLeague(n_lgtype, n_lid)
			LG_ApplyRemoveLeague(n_lgtype, str_lgname)
			n_count	= n_count + 1
		end
		OutputMsg("删除战队，类型:"..n_lgtype..". 数量:"..n_count)
	end

	OutputMsg("已完成任务 ["..RUNONCE_NAME.."]!")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
