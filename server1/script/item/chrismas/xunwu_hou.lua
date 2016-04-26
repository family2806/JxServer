----------------------------------------------------------------
	--FileName:	xunwu_hou.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	圣诞节活动奖励——寻物猴
	--			功能：每天可使用10次，每使用一次便能随机获得一件装备
-----------------------------------------------------------------
Uworld0001 = 2001
MAX_USETIME = 10
--第一字节为本日使用次数
--第二字节为最后使用的日期
function main()
	use_day = GetByte(GetTask(Uworld0001), 2)
	
	nDay = tonumber(date("%d"))
	if (use_day ~= nDay) then
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, 0))
	end
	use_time = GetByte(GetTask(Uworld0001), 1)
	if (use_time >= MAX_USETIME) then
		Talk(1, "", "寻物猴累的睡着了，看来它不睡饱是不会醒的。")
	else
		--AddItem()
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("您获得了一件随机装备")
	end
	return 1
end