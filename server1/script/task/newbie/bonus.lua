

TKID_NEWBIE_BONUS = 610		--是否发奖标志
TKID_NEWBIE_CANCLE = 604		--此任务变量用于存放连续取消任务的数量

Bonus = {
	SetBonusFlag = function(tasklvl) --设置奖励标识，并返回奖励标识
		local flag = 1 --0x0001 表示需要发普通奖励
		if(GetTask(TKID_NEWBIE_SUCCED)>19) then
			flag = flag + 256 --0x0100 表示需要发一轮的奖励
		end
		SetTask(TKID_NEWBIE_BONUS,flag)
		return flag
	end,
	PayExp = function(self,tasklvl) --奖励经验值，并清除普通奖励的经验
		local lspan,rspan = self[tasklvl]["Exp"][1],self[tasklvl]["Exp"][2]
		local flag = GetTask(TKID_NEWBIE_BONUS)
		AddOwnExp(random(lspan,rspan))
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayGold = function(self,tasklvl) --奖励金钱
		local lspan,rspan = self[tasklvl]["Gold"][1],self[tasklvl]["Gold"][2]
		local flag = GetTask(TKID_NEWBIE_BONUS)
		Earn(random(lspan,rspan))
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayChance = function(self,tasklvl) --奖励取消任务的机会
		local flag = GetTask(TKID_NEWBIE_BONUS)
		SetTask(TKID_NEWBIE_CANCLE,GetTask(TKID_NEWBIE_CANCLE)+1)
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayCircle = function(self,tasklvl) --完成1轮任务的奖励
		flag = GetTask(TKID_NEWBIE_BONUS)
		SetTask(TKID_FUYUAN,GetTask(TKID_FUYUAN)+10) --奖励10点福缘
		flag = mod(flag,256)
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PaySpecial = function(self,tasklvl) --特殊奖励
		local succed = NewbieTask.GetSucced()
		local additiveRate = 10 + succed
		local targetRate = random(1,10000000)
		local special = self.Special[tasklvl]
		local span = 0
		for i=1,getn(special) do
			span = span + special[i][3] + floor(special[i][3]*additiveRate/10000000)
			if(targetRate <= span) then --中大奖
				local bonuFlag = special[i][1]
				if(bonuFlag==BONUSFLAG_ITEM) then -- 发物品
					AddItem(special[i][4],special[i][5],special[i][6],1,0,0,0,0)
					WriteLog(date("%H%M%S").."：账号："..GetAccount().."，角色："..GetName().."，获得："..special[i][2])
					return special[i]
				elseif(bonuFlag == BONUSFLAG_EXP) then --奖经验
					AddOwnExp(special[i][4])
					WriteLog(date("%H%M%S").."：账号："..GetAccount().."，角色："..GetName().."，获得："..special[i][2])
					return special[i]
				elseif(bonuFlag == BONUSFLAG_GOLDEN) then --黄金装备
					AddGoldItem(0,special[i][4])
					WriteLog(date("%H%M%S").."：账号："..GetAccount().."，角色："..GetName().."，获得："..special[i][2])
					return special[i]
				else
					print("为止奖励")
					WriteLog(date("%H%M%S").."：账号："..GetAccount().."，角色："..GetName().."，不知什么原因，没有获得任何奖励。")
					return nil
				end
			end
		end
		return nil
	end,
}

