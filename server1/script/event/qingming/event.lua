Include("\\script\\event\\revival\\event.lua")

function AddDoubleExp()
	Uworld1075 = GetTask(1075)	--记录玩家上次登陆游戏的世界时刻，按字节从低到高，
								--第一字节为时，第二字节为日，第三字节为月，第四字节为年
	Uworld1076 = GetTask(1076)	--记录玩家上次登陆游戏时在游戏世界总在线时间
	
	pre_login_hour = GetByte(GetTask(1075), 1)
	pre_login_date = GetByte(GetTask(1075), 2)
	pre_login_month = GetByte(GetTask(1075), 3)
	pre_login_year = GetByte(GetTask(1075), 4)
	
	now_login_hour = tonumber(date("%H"))
	now_login_date = tonumber(date("%d"))
	now_login_month = tonumber(date("%m"))
	now_login_year = tonumber(date("%y"))
	
	SetTask(1075, SetByte(GetTask(1075), 1, now_login_hour))
	SetTask(1075, SetByte(GetTask(1075), 2, now_login_date))
	SetTask(1075, SetByte(GetTask(1075), 3, now_login_month))
	SetTask(1075, SetByte(GetTask(1075), 4, now_login_year))
	
	sub_year = now_login_year - pre_login_year
	sub_month = now_login_month - pre_login_month
	sub_date = now_login_date - pre_login_date
	sub_hour = now_login_hour - pre_login_hour
	
	pre_online_totalframe = Uworld1076
	now_online_totalframe = GetGameTime()
	SetTask(1076, now_online_totalframe)
	
	if (GetGameTime() == 0) then
		return
	end
	
	sub_online = floor((now_online_totalframe - pre_online_totalframe)/60/60)	--在线时间
																					--秒转换成小时
	if (pre_login_year == 0 and pre_login_month == 0 and pre_login_date == 0 and pre_login_hour == 0 and now_online_totalframe > 0) then
		--如果没有记录过登录时刻，则认为一个月没上线
		offline = 30
	else
		offline = SubOffLine(sub_year, sub_month, sub_date, sub_hour, sub_online, 30)
	end
	ChangeExpState(offline)	--给于双倍经验状态
end

function SubOffLine(y, m, d, h, o, flag)
	local tt = 0
	tt = floor(((y * 365 + m * flag + d) * 24 + h - o)/24)
	return tt
end

function ChangeExpState(key)
	if(key >= 30) then
		AddSkillState(440, 1, 1, 10 * 60 * 60 * 18)	--10小时双倍经验
		PutMessage("你得到10小时双倍经验")
	elseif(key >= 21) then
		AddSkillState(440, 1, 1, 8 * 60 * 60 * 18)	--8小时双倍经验
		PutMessage("你得到8小时双倍经验")
	elseif(key >= 14) then
		AddSkillState(440, 1, 1, 6 * 60 * 60 * 18)	--6小时双倍经验
		PutMessage("你得到6小时双倍经验")
	elseif(key >= 7) then
		AddSkillState(440, 1, 1, 4 * 60 * 60 * 18)	--4小时双倍经验
		PutMessage("你得到4小时双倍经验")
	elseif(key >= 3) then
		AddSkillState(531, 5, 1, 4 * 60 * 60 * 18)	--4小时1.5倍经验
		PutMessage("你得到4 小时1.5 倍经验")
	end
	revival_player(key)
end