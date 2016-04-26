--description: 永乐镇_牛牛妈
--author: wangzg
--date: 2003/7/18
--modify 2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main(sel)
	UTask_world37=GetTask(65)
	if ((UTask_world37==0) and (GetLevel() >= 2)) then		-- 要求等级超过2级
		Say("我家牛牛一天到晚说要去当大侠，现在又不知道跑到哪去了，真是急死人了我家牛牛一天到晚说要去当大侠，现在又不知道跑到哪去了，真是急死人了",2,"大嫂别担心，我帮你找/yes", "不去找/no")
	elseif (UTask_world37==2) then
		Talk(1,"","大嫂别担心，我帮你找")
	else
		Talk(1,"","到处都不太平，孩子又不听话，真是操心啊!")
	end
end;

function yes()
	Talk(1,"","你真是好人，就麻烦你帮忙了")
	SetTask(65,2)
	AddNote("接任务：帮牛牛妈找孩子")
	Msg2Player("接任务：帮牛牛妈找孩子")
end

function no()
end
