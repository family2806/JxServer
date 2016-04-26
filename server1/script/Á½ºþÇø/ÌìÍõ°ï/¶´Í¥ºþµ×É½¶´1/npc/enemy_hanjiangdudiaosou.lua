-------------------------------------------------------------------------
-- FileName		:	enemy_hanjiangdudiaosou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_寒江独钓叟
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 215 ) then
		Talk(1,"Uworld1002_give","龙断在这，你拿去......")
	end
end

function zhongtask4()
	AddOwnExp(230000)
	Msg2Player("你拿到了战枪龙断，回去见傅南冰.")

end

function Uworld1002_give()

	SetMemberTask(1002,215,220,zhongtask4) 
	
end
