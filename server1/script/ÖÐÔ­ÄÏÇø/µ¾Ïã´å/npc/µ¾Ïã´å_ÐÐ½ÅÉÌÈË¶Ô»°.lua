--description: 新手村_行脚商人
--author: wangzg	
--date: 2003/7/21
--update 2003/7/28 yuanlan


function main()
	UTask_world38=GetTask(66)
	if (UTask_world38 == 2) then
		Say("想买麝香吗？我有正宗名药，只要200两! ", 2 ,"买/yes","不买/no")
	else	
		Talk(1,"","作为行脚商人，走南闯北，真是不易，看我手中的货物，很难弄到好货!")
	end
end;

function yes()
	if (GetCash()<200) then
		Talk(1,"","等你有钱了来找我!")
	else
		Pay(200)
		AddEventItem(142)
		Msg2Player("从行脚商人处买到麝香. ")
		AddNote("从行脚商人处买到麝香. ")
	end
end

function no()
end
