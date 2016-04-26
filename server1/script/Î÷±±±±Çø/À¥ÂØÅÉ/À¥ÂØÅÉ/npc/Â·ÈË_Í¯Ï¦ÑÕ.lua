-- 昆仑 弟子 童夕颜 入门任务
-- by：Dan_Deng(2003-07-30)

function main()
	UTask_kl = GetTask(9)
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 1) then
			Talk(2,"Uworld31_get_Monkey","小子，这个金丝猴好可爱，送给我吧!","今后就有人陪我玩了！呵呵，好可爱！带给父亲看看!")
		else
			Talk(1,"","抓猴子容易吗?")
		end
	elseif (Uworld31 == 0) and (GetFaction() ~= "kunlun") and (GetLevel() >= 10) then		--入门任务
		Say("我从小到大都没有离开过昆仑，父亲说外面的人很坏，不准我和外界接触。我无聊死了！听说快活林有很多猴子，要是有一只金丝猴和我作伴不知有多好呢!你可以抓一只给我吗?","没有问题!/enroll_get_yes","我没有时间去抓猴子/enroll_get_no")
	elseif (Uworld31 >= 20) then
		Talk(1,"","金丝狐太可爱了，我太喜欢了")
	else
		Talk(1,"","外面的世界是怎么样的?")
	end
end;

function Uworld31_get_Monkey()
	DelItem(8)
	Uworld31 = SetByte(GetTask(31),2,20)
	SetTask(31,Uworld31)
	Msg2Player("童夕颜很喜欢你捉的猴子. ")
	AddNote("童夕颜很喜欢你捉的猴子. ")
end

function enroll_get_yes()
	Talk(1,"","捉只猴子有什么难的，我现在就去抓给你!")
	Uworld31 = SetByte(GetTask(31),2,10)
	SetTask(31,Uworld31)
	Msg2Player("接任务：帮童夕颜到快活林捉1只金丝猴")
	AddNote("接任务：帮童夕颜到快活林捉1只金丝猴")
end;

function enroll_get_no()
end;
