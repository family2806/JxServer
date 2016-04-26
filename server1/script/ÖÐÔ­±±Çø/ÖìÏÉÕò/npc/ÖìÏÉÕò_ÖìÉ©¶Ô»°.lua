--description: 新手村_朱嫂
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==0)  then
		Say("你有没有看见我家那个死鬼到哪里去了。哼，今天没活干也不呆家里，说他两句就跑掉，一定是到哪里喝酒去了。你能帮我把他找回来么?", 2, "可以，我帮你/yes", "不关心他人夫妻的事 /no")
	elseif (UTask_world46==2)  then
		Talk(1,"","他一定又去喝酒了!")
	else
		Talk(1,"","我们老百姓，不需要升官发财，只要一个安稳的日子就行. ")
	end
end

function yes()
	Talk(1,"","他一定又去喝酒了!")
	SetTask(74,2)
	AddNote("接任务：帮朱嫂找老公. ")
	Msg2Player("接任务：帮朱嫂找老公. ")
end

function no()
end
