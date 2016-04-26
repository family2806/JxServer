--莫愁女
--by xiaoyang (2004\12\15)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 30) then
		Talk(1,"Uworld1001_give","不要以为你能打晕我，如果我不中毒，你哪里是对手，回城再说!")
	end
end

function newtask1()
	AddOwnExp(20000)
	Msg2Player("莫愁让你回城再说")

end

function Uworld1001_give()

	SetMemberTask(1001,30,40,newtask1) --环节3end
	
end
		
