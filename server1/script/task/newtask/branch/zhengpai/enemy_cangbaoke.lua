-------------------------------------------------------------------------
-- FileName		:	enemy_cangbaoke.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_藏宝客
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 == 40 ) then
		AddEventItem(504)
		Msg2Player("你获得了一本天残地缺棋谱。")
	end
	if ( GetItemCount(504) >= 5 ) then
		Talk(1,"","你已经获得了五本以上的天残地缺棋谱，就不要再难为藏宝客了，放他们一条生路吧。")
	end
end

