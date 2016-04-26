--description: 峨嵋派妙隐相公
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(207) == 1 then
		allbrother_0801_FindNpcTaskDialog(207)
		return 0;
	end
	UTask_em = GetTask(1);
	if (UTask_em == 10*256+20) then					--接到10级任务
		if (HaveItem(19) == 1) then
			Talk(1,"","我等你的好消息! ")
		else
			Talk(3, "L10_step1", "妙隐师姐已经把你们的事情告诉我了，我会想办法帮助你们破镜重圆，你能把另一半镜子给我吗? ", "那就拜托你了，你打算怎么做?", "到成都找铁匠试试，看看有什么办法?")
		end
	elseif (UTask_em == 10*256+60) then 					--铜镜已补好
		Talk(2, "", "大哥，看！我已经把铜镜修好了! ", "太好了，你快去把铜镜交给我娘子吧! ")
	elseif (UTask_em == 10*256+70) and (HaveItem(20) == 1) then		--任务最后一步
		Talk(2, "", "大哥，妙隐师姐托我把这面修补好的铜镜交给你，她要我问你愿不愿意等她三年，三年后她就会回到你的身边.", "麻烦你告诉我娘子，别说三年，就是三十年，我也会等下去的")
		DelItem(20)
		SetTask(1, 10*256+80)
		AddNote("把铜镜交给妙隐的相公，转达他的心血给妙隐")
		Msg2Player("把铜镜交给妙隐的相公，转达他的心血给妙隐 ")
	elseif (UTask_em >= 10*256+80) then 					--任务完成后的对话
		Talk(1,"","多久我都等")
	else
		Talk(1,"","我们夫妻什么时候才能相遇?")
	end
end;

function L10_step1()
	AddEventItem(19)
--	SetTask(1, 14)
	AddNote("在山脚找到妙隐的相公，获得一半铜镜. ")
	Msg2Player("在山脚找到妙隐的相公，获得一半铜镜. ")
end;
