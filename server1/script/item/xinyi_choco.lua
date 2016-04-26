IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE = 1553
function main(nItemIdx)
if (gb_GetModule("情人节礼盒") == 1) then
	if (GetSex() == 0) then
		if (GetTask(TSK_VALENTINE) >= 99) then
			Say("<#>您已经吃掉了<color=yellow>99块心意巧克力<color>，继续食用小心会蛀牙！", 0)
			return 1
		end
		AddOwnExp(1000000)
		AddSkillState(440, 20, 1,32400)--30分钟内获得双倍经验时间。
		AddSkillState(450, 20, 1,32400)--幸运值30分钟内增加20点。
		SetTask(TSK_VALENTINE, GetTask(TSK_VALENTINE) + 1)
		if (GetTask(TSK_VALENTINE) == 99) then
			Msg2Player("<#>您使用了一朵情浓玫瑰花获得100W点经验值，经验双倍及幸运增加20点半小时。")
		else
			Msg2Player("<#>您使用了一块心意巧克力获得100W点经验值，经验双倍及幸运增加20点半小时。您还可以使用"..(99 - GetTask(TSK_VALENTINE)).."块心意巧克力。")
		end
		return
	else
		Msg2Player("<#>心意巧克力只能侠士使用哟！")
		return 1
	end
end
end