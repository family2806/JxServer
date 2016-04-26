----description: 新手村_牛牛
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- 等待检测并删除武器的函数，现在先只允许给钱

function main(sel)
	UTask_world37=GetTask(65)
	if (UTask_world37==2) then		--已经接到任务
		Say("我要去当大侠了，像你一样到处行侠仗义",2,"劝说/reason", "支持/help")
	elseif (UTask_world37==9) then		--选择劝说
		Say("做大侠很难的，练功也要很久",0)
	elseif (UTask_world37==10) then		--选择支持
		Say("我要去当大侠了，像你一样到处行侠仗义",0)	
	else
		Say("书上那些大侠很威风，要是可以像他们一样就好了",0)
	end
end;

function reason()		--选择劝说牛牛
	Talk(3,"prise","外面的坏人很凶的，你还这么小，基本功也没练好怎么去行侠仗义呀?","嗯，你说的也对，那等我长大了就去行侠仗义!","对，先把基本功练好，以后好去打坏人. ")
end;

function prise()
	Talk(1,"","那我先回家了。谢谢你，我这里有点金创药，就送给你吧!")
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	SetTask(65,9)
	AddRepute(6)		-- 声望加6点
	AddNote("找到牛牛，劝他回家，任务完成. ")
	Msg2Player("劝说牛牛回家，任务完成. ")
	Msg2Player("得到三包金创药")
	Msg2Player("你的江湖青势增加6点. ")
end;

function help()			--选择帮助牛牛
--	Say("玩家：小小年纪，倒挺有志气。",3,"送一把武器/arm","送一点银子/money","我再想想/wait")
	Say("小小年纪，倒挺有志气!",2,"送一点银子/money","我再想想/wait")		--等能够检测武器再用上面这句，现在先只给钱
end

function arm()
	if x==0 then	--如果没有武器
		Say("我现在没有武器?",3,"送一把武器/arm","送一点银子/money","我再想想/wait")
	else 
		--给武器
		Talk(1,"","谢谢你，你真好!")
		AddOwnExp(100)
		SetTask(65,10)
		AddNote("找到牛牛，给他一把武器，支持他的大侠梦")
	end
end

function money()
	if (GetCash() < 100) then
--		Say("玩家：哎呀，我身上没带什么钱。",3,"送一把武器/arm","送一点银子/money","我再想想/wait")
		Talk(1,"","我身上没带钱，等我回来")		--等能够检测武器再用上面这句，现在先只给钱
	else
		Pay(100)
		Talk(1,"","谢谢你，你真好!")
		AddOwnExp(100)
		SetTask(65,11)
		AddRepute(4)
		AddNote("找到牛牛，给他一把武器，支持他的大侠梦。完成任务")
		Msg2Player("找到牛牛，给他一把武器，支持他的大侠梦。完成任务")
		Msg2Player("你的江湖经验增加! ")
		Msg2Player("你的江湖青势增加4点. ")
	end
end

function wait()
end
