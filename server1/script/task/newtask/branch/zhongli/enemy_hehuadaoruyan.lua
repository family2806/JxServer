-------------------------------------------------------------------------
-- FileName		:	enemy_hehuadaoruyan.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	战斗_荷花盗如烟
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1055 = nt_getTask(1055)
Uworld1012 = nt_getTask(1012)
	if ( Uworld1012 >= 20 ) and ( Uworld1055 == 100 ) then
		nt_setTask(1012,0)
		SetMemberTask(1055,100,110,zhengbranch4) 
	elseif ( Uworld1055 == 100 ) then
		Uworld1012 = Uworld1012 + 10
		nt_setTask(1012,Uworld1012)
		Talk(1,"","不要以为你可以得意，还有我们姐妹在此!")
	end
end

function zhengbranch4()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("你已打败荷花盗，可以回来见冷枪镖局主人复命.")
	Talk(1,"","我想杀尽天下男人?")
end

