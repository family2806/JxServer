if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_NEWBIELEVELUP = 1080	--本次活动需要用到的任务变量编号
TKVAL_NEWBIELEVELUP_OPEN = 1 --接任务以后，1080号任务变量设为1

ENewbieLevelUp = {
	To20Level = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			return
		end
		local level = GetLevel()
		if(level ==1) then
			for i=1,19 do
				AddOwnExp(100000)
			end
			SetTask(TKID_NEWBIELEVELUP,TKVAL_NEWBIELEVELUP_OPEN)
		end
	end,
	PayDoubleExp = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			Talk(1,"","不好意思！活动时间已经结束了!")
			return
		end
		local ret = ENewbieLevelUp.validate()
		if(ret ==1) then
			Talk(1,"","不好意思！你的等级已经超过60级了，不能领取2小时双倍经验.")
			return
		end
		if(ret == 2) then
			Talk(1,"","不好意思！你不是新人物因此不能领取2小时双倍经验")
			return
		end
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461, 1, 1,2*60*60*18)
		Talk(1,"","欢迎参加‘新手练级’活动，这是2小时双倍经验的奖励")
		Msg2Player("你已领取2小时双倍经验的奖励")
		return
	end,
	validate = function()
		local level = GetLevel()
		if (level > 60) then
			return 1
		end
		local flag = GetTask(TKID_NEWBIELEVELUP)
		if (flag ~= TKVAL_NEWBIELEVELUP_OPEN) then
			return 2
		end
		return 0
	end
}

function BTNNewbieLevelUp()
	local msg = "欢迎参加‘新手练级’活动'."
	local btns = {
		"我来领取2小时双倍经验/PayDoubleExp",
		"了解此次活动/AboutNewbieLevelUp",
	}
	Say(msg,getn(btns),btns)
end

function PayDoubleExp()
	ENewbieLevelUp.PayDoubleExp() 
end

function AboutNewbieLevelUp()
	local msg = ": 活动期间，只要新人物升到20级并在60级以下就可以到礼官处领取2小时双倍经验"
	local btns = {
		"返回/BTNNewbieLevelUp",
		"离开/Quit"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end
