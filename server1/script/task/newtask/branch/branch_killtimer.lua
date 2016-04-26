-- 杀怪记数脚本
-- by xiaoyang(2005\1\23)

Include("\\script\\task\\newtask\\newtask_head.lua")

function killwolfone(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1011 = nt_getTask(1011)
	local Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 == 80 ) and ( Uworld1011 == 10 ) then
		nt_setTask(1011,20)
		Msg2Player("你已成功获得了狼骨，可以回去找傲云宗回复了。")
	end
	PlayerIndex = oldPlayerIndex
end

function killhedgehog(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1012 = nt_getTask(1012)
	local Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 == 20 ) and ( Uworld1012 == 10 ) then
		nt_setTask(1012,20)
		Msg2Player("你已成功杀掉了刺猬，可以去扬州找江一萧了。")
	end
	PlayerIndex = oldPlayerIndex
end

function killmonkey(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1012 = nt_getTask(1012)
	local Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 == 80 ) and ( Uworld1012 == 10 ) then
		nt_setTask(1012,20)
		Msg2Player("你已成功取得了五十副猴脑，可以回成都找冷枪镖局的主人了。")
	end
	PlayerIndex = oldPlayerIndex
end

function killcayman(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1013 = nt_getTask(1013)
	local Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 == 20 ) and ( Uworld1013 == 10 ) then
		nt_setTask(1013,20)
		Msg2Player("你已成功杀掉了黑叶猴，可以回汴京找拓跋怀川了。")
	end
	PlayerIndex = oldPlayerIndex
end

function killwolftwo(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1013 = nt_getTask(1013)
	local Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 == 20 ) and ( Uworld1013 == 10 ) then
		nt_setTask(1013,20)
		Msg2Player("你已成功杀掉了黄狼，可以回汴京找拓跋怀川了。")
	end
	PlayerIndex = oldPlayerIndex
end