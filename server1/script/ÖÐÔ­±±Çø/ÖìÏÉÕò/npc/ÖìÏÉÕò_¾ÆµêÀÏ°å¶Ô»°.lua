--中原北区 朱仙镇 路人酒店掌柜的对话
--朱仙镇新手任务: 找手环
--by Dan_Deng(2003-07-21)

--使用变量: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if ((UTask_world40 == 3) or (UTask_world40 == 4)) then
		Talk(1,"sele_buy","有五香豆腐吗?")
	else
		i = random(0,1)
		if (i==0) then
			Talk(1,"","朱仙镇的第一特产就是本店的五香豆腐.")
		else
			Talk(1,"","请客官进坐.")
		end
	end
end;

function sele_buy()
	Say("这个是朱仙镇的特产，当然有，但是，价格有点贵，100两白银.",2,"买/yes","太贵了 /no")
end;

function yes()
	if(GetCash() >= 100)then
		Talk(1,"","可以，一份五香豆腐!")
		Pay(100);
		AddEventItem(187);
		Msg2Player("你获得一份五香豆腐");
		AddNote("买到一份五香豆腐 ")
--		SetTask(68,4);
	else
		Talk(1,"","本馆不做亏本生意，什么时候够钱了再来吧.")
	end
end;

function no()
end;
