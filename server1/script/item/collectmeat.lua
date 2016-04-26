 Include("\\script\\task\\newtask\\newtask_head.lua")
 
function IsPickable( nItemIndex, nPlayerIndex )
	return 1
end
 
function PickUp( nItemIndex )
	local Uworld1065 = nt_getTask(1065)+1
	local Uworld1066 = nt_getTask(1066)
	local Uworld1000 = nt_getTask(1000)
	nt_setTask(1065,Uworld1065)
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then 
		Msg2Player("你已获得了三块鲜肉，可以去找武师对话了。")
	elseif ( Uworld1000 == 180) and ( Uworld1065 >= 5 ) then
		Msg2Player("你已获得了五块鲜肉，可以去找武师对话了。")
	elseif ( Uworld1065 == 1 ) and ( Uworld1066 == 0 ) then
		Msg2Player("你现在可以到各新手村外的武师处接一些买卖鲜肉的任务咯。做这种任务不但可以拿到金钱，也许还可以获得声望哦。")
	elseif ( Uworld1066 ~= 0 ) then
		if ( Uworld1066 == Uworld1065 ) then
			Msg2Player("你已经获得了足够的鲜肉，可以回去找武师交任务了。")
		end
	end
	return 0 ; --删除物品
end