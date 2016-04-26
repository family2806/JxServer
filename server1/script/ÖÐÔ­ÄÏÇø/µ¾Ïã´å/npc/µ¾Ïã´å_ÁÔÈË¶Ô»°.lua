--description: 新手村_猎人
--author: wangzg	
--date: 2003/7/21
--update 2003/7/28 yuanlan

function main()
	UTask_world38=GetTask(66)
	if (UTask_world38==2) then
		Say("我命不错，最近上山打到一只猛虎，虎骨是贵重药材，我想买150两.", 2 ,"买/yes","不买/no")
	else	
		Say("在这里打猎的人，我是第二，就没人第一! ",0)	
	end
end;

function yes()
	if (GetCash() < 150) then
		Talk(1,"","等有钱了，你来找我!")
	else
		Pay(150)
		AddEventItem(185)
		Msg2Player("从猎人处买虎骨")
		AddNote("从猎人处买虎骨")
	end
end;

function no()
end
	
