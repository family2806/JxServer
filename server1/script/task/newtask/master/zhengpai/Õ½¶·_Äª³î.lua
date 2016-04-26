--莫愁女
--by xiaoyang (2004\12\15)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 30) then
		SetMemberTask(1001,30,40,newtask1) --环节3end
	end
end

function newtask1()
	AddOwnExp(20000)
	AddExp_Skill_Extend(20000)
	Msg2Player("莫愁让你回城说话.")
	Talk(1,"","莫愁:别以为你这几下真把我打倒了,不中毒的话,你哪是我对手.回城里说话.")
end
		
