--西北北区 留仙洞三层3to留仙洞四层1
--TrapID：西北北区 33
--黄河源头迷宫 F3-F4 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q3","你看到一个机关，上面刻着")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q3()
	Say("少昊的父亲是太白金星，他在一个贫穷的村庄生活，因此又称穷桑氏。少昊曾在东方建立鸟王国，国内的文武百官都是鸟。其中燕子是四个礼官中的一只，你知道它的长官是什么礼官吗",4,"春 /L60_S3_correct","夏/L60_S3_wrong","秋/L60_S3_wrong","冬 /L60_S3_wrong")
end

function L60_S3_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(13) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(13) == 1)) then
		Msg2Player("你按答案一，机关会带你到第四层")
		SetFightState(1);
		NewWorld(128, 1586, 3217);
	else
		Msg2Player("你乱按一通还没有任何反应")
	end
end;

function L60_S3_wrong()
	Msg2Player("你乱按一通还没有任何反应")
end;
