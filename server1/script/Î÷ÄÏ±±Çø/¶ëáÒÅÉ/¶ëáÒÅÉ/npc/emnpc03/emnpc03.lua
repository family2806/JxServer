--description: 峨嵋派秦倚风
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 20) then					--入门任务
		Msg2Player("接秦倚风的第二个考验，是回答3个关于乐曲的问题")
		Say("你知道琴棋书画吗？让我来考考你：你知道下面哪一首乐曲是用琵琶演奏的吗？", 3, "苏武牧羊/False4", "高山流水/False4", "十面埋伏/True4")
	elseif (Uworld36 == 40) then 					--入门任务：已完成前两关
		Talk(1,"","看来你倒不是一个俗人，不过还要<color=Red>何怜飘<color>师妹考考你，她就在上面的<color=Red>半山坡 <color>!")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--尚未入门
--		Talk(1,"","秦倚风：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？")
	elseif (GetFaction() == "emei") then   				--已经入门，尚未出师
		Talk(1,"","师妹，有空我们一起切磋琴艺如何?")
	else							-- 其它对话
		Talk(1,"","欲将心事付瑶琴。知音少，弦断有谁听?")
	end
end;

function False4()
	Say("不对。", 3, "苏武牧羊/False4", "高山流水//False4", "十面埋伏/True4");
end;

function True4()
	Say("答对了。第二个问题：下面哪个不属于四大名琴？", 3, "黄钟/True5", "绿绮/False5", "焦尾/False5");
end;

function False5()
	Say("答不出来啦？", 3, "黄钟/True5", "绿绮/False5", "焦尾/False5");
end;

function True5()
	Say("这都难不倒你？看来我要对你另眼相看了。你知道名曲《广陵散》是谁写的吗？", 3, "老子/False6", "嵇康/True6", "屈原 /False6");
end;

function False6()
	Say("不知道了吧？我看你还是知难而退吧！", 3, "老子/False6", "嵇康/True6", "屈原/False6");
end;

function True6()
	Talk(1,"","看来你倒不是一个俗人，不过还要<color=Red>何怜飘<color>师妹考考你，她就在上面的<color=Red>半山坡<color>!")
	Uworld36 = SetByte(GetTask(36),1,40)
	SetTask(36,Uworld36)
	AddNote("在迎客石见秦倚风，回答正确关于乐曲的三个问题，过第二关")
	Msg2Player("在迎客石见秦倚风，回答正确关于乐曲的三个问题，过第二关，到半山坡接何怜飘的考验. ")
end;
