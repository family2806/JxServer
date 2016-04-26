----------------------------------------------------------------
	--FileName:	sanwei_yaohu.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	圣诞节活动奖励——三味药壶
	--			功能：每天可使用10次，每使用一次便能获得一颗三味仙丹（服用可涨2万经验）
-----------------------------------------------------------------
Uworld0001 = 2000
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
		Talk(1, "", "三味药壶每天只能炼制"..MAX_USETIME.."颗丹药。")
	else
		--AddItem()三味仙丹
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("您获得了一颗三味仙丹")
	end
	return 1
end