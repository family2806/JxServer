--西南北区 成都府 路人16辛员外对话 峨嵋派40级任务
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+50) then 		
		UTask_emsub03 = GetByte(GetTask(29),3)
		if (UTask_emsub03 == 0) then 
			Say("辛员外：在下平生最喜欢结交江湖侠客，朋友们送了个外号叫“赛孟尝”，本是谬赞，可是最近有人说在下是沽名钓誉，在下心中十分不忿。不知女侠可否为在下解答几个疑惑？", 2, "请问/L40_V3_Q1", "我还有别的事/no")
		elseif (UTask_emsub03 == 3) then 
			L40_V3_Q1()
		elseif (UTask_emsub03 == 5) then 
			L40_V3_Q2()
		elseif ((UTask_emsub03 == 10) and (HaveItem(168) == 0)) then
			AddEventItem(168)
			Talk(1,"","女侠不用客气，你需要就拿去吧")
		else
			Talk(1,"","能与女侠做朋友真是辛某的荣幸.")
		end
	else
		Talk(1,"","辛员外：在下平生最喜欢结交江湖侠客，朋友们送了个外号，叫做“赛孟尝”，实在是谬赞了。")
	end
end;

function no()
	Talk(1,"","那我不麻烦女侠了!")
end;

function L40_V3_Q1()
	Say("辛员外：孟尝君是哪国人啊？", 4, "楚国/f1", "齐国/L40_V3_Q2", "赵国/f1", "魏国/f1")
end;

function f1()
	Talk(1,"","辛员外：好像不对吧？我上次这么说还被别人耻笑了一番。")
	SetTask(29, SetByte(GetTask(29),3,3))
end;

function L40_V3_Q2()
	Say("辛员外：哦，原来他是齐国人啊！战国四公子里，除了孟尝君、信陵君和平原君以外，你知不知道还有一个是谁呀？", 4, "龙阳君/f2", "靖郭君/f2", "春申君/L40_V3_prise", "少原君/f2")
end;

function f2()
	Talk(1,"","辛员外：好像不对吧？我怎么没听说过呢？")
	SetTask(29, SetByte(GetTask(29),3,5))
end;

function L40_V3_prise()
	Talk(4, "select", "对了，怎么我没想到呢？听说以前孟尝君有3000食客，我虽然没有这样的气魄，但是很喜欢结交像女侠这样的朋友。女侠需要我帮助吗?", "我正在找碧玺戒指 ", "紫莽不早说，我有一个碧玺戒指，送给你吧!", "多谢员外! ")
end;

function select()
	AddEventItem(168)
Msg2Player("得到碧玺戒指。")
	SetTask(29, SetByte(GetTask(29),3,10))
	AddNote("在成都辛员外处找到玛瑙戒指. ")
end;
