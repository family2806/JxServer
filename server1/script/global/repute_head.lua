-- ReputeHead.lua
-- By: Dan_Deng(2003-08-23) 任务声望相关工具

function ReturnRepute(default_repute,max_level,reduce_rate)		-- 接收标准声望奖励与任务等级，然后根据玩家实际等级决定应奖励多少声望
	player_level = GetLevel()
	if (GetLevel() <= max_level) then		-- 如果玩家等级不超过任务标准等级10级，则可以获得正常声望奖励
		player_repute = default_repute
	else															-- 否则在10级以上每超过一级减3%声望奖励
		player_repute = floor(default_repute * (1 - (player_level - max_level) * reduce_rate / 100))
		if (player_repute < 1) then				-- 如果声望奖励小于1，则奖励1点声望
			player_repute = 1 
		end
	end
	return player_repute				-- 返回应得声望奖励
end

function GetLevelRepute(i)			-- 返回每一等级所需声望
	Repute_level = {0,8,30,75,150,240,450,750,1200,2250,3600}			-- 每一等级声望定义（注意更新）
	if (i <= 0) then
		return 0
	else
		return Repute_level[i + 1]
	end
end

function GetReputeLevel(i)			-- 返回声望等级（任务中根据声望等级判断，而等级定义则在此处统一控制）
	if (i >= 3600) then				-- 缺省24000,10级
		return 10
	elseif (i >= 2250) then		-- 缺省15000,9级
		return 9
	elseif (i >= 1200) then			-- 缺省8000,8级
		return 8
	elseif (i >= 750) then			-- 缺省5000,7级
		return 7
	elseif (i >= 450) then			-- 缺省3000,6级
		return 6
	elseif (i >= 240) then			-- 缺省1800,5级
		return 5
	elseif (i >= 150) then			-- 缺省1000,4级
		return 4
	elseif (i >= 75) then			-- 缺省500,3级
		return 3
	elseif (i >= 30) then			-- 缺省200,2级
		return 2
	elseif (i >= 8) then			-- 缺省50,1级
		return 1
	elseif (i >= 0) then			-- 0，0级
		return 0
	else								-- 出错了
		return -1
	end
end

function GetReputeStr(Repute_Level)
	if (Repute_Level == 1) then
		Repute_title = "初出江湖"
	elseif (Repute_Level == 2) then
		Repute_title = "无名小辈"
	elseif (Repute_Level == 3) then
		Repute_title = "默默无闻"
	elseif (Repute_Level == 4) then
		Repute_title = "初显锋芒"
	elseif (Repute_Level == 5) then
		Repute_title = "小有名气"
	elseif (Repute_Level == 6) then
		Repute_title = "名头响亮"
	elseif (Repute_Level == 7) then
		Repute_title = "威镇一方"
	elseif (Repute_Level == 8) then
		Repute_title = "傲视群雄"
	elseif (Repute_Level == 9) then
		Repute_title = "一代宗师"
	elseif (Repute_Level == 10) then
		Repute_title = "笑傲江湖"
	else
		Repute_title = "平民百姓"
	end
	return Repute_title
end

function nothing()
end
