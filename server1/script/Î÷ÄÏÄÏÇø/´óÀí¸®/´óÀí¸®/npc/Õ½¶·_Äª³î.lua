--Ī��Ů
--by xiaoyang (2004\12\15)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 30) then
		Talk(1,"Uworld1001_give","��Ҫ��Ϊ���ܴ����ң�����Ҳ��ж����������Ƕ��֣��س���˵!")
	end
end

function newtask1()
	AddOwnExp(20000)
	Msg2Player("Ī������س���˵")

end

function Uworld1001_give()

	SetMemberTask(1001,30,40,newtask1) --����3end
	
end
		
