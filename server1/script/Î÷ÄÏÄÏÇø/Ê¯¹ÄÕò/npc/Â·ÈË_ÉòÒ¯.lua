--石鼓镇 路人 沈爷 新手任务还钱
-- By: Dan_Deng(2003-09-04)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(197) == 1 then
		allbrother_0801_FindNpcTaskDialog(197)
		return 0;
	end
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 3) then		-- 任务启动
		if (GetSex() == 0) then
			Say("怎么了？想我给阿全删除他的账目啊？那不难，但是你要带钱来，300两，一分也不能少. ",2,"帮他们还钱/W23_pay_yes","不管他们 /W23_pay_no")
		else
			Say("怎么了？想我给阿全删除他的账目啊？那不难，但是你要带钱来，300两，一分也不能少. ",2,"帮他们还钱/W23_pay_yes","不管他们/W23_pay_no")
		end
	elseif (UTask_world23 >= 6) then
		Talk(1,"","可以了，因为你替他们还钱了，我不会让你丢脸，不去找他们算账了.")
	else				-- 非任务对话
		Talk(1,"","钱钱钱，什么都是钱，有钱就是老子，没钱就是缩头乌龟. ")
	end
end;

function W23_pay_yes()
	if (GetCash() >= 300) then
		Talk(2,"","不要小看他人，这是300两，拿去! ","哈哈，有钱当然好说话了.")
		SetTask(23,6)
		Pay(300)
		AddNote("阿马和阿全已经还清债了，快去告诉他们这个好消息. ")
		Msg2Player("阿马和阿全已经还清债了，快去告诉他们这个好消息. ")
	else
		Talk(1,""," 等我去拿300两! ")
	end
end

function W23_pay_no()
end
