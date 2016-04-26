--西北北区 留仙洞五层3to留仙洞六层
--TrapID：西北北区 41
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q5","你看到一个机关，上面刻有：")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q5()
	Say("黄帝在天庭的中心，副将有土神厚土。黄帝造车，因此称为轩辕氏，你知道轩是指车的哪部分吗？",4,"车轮/L60_S5_wrong","车轴/L60_S5_wrong","两个用木头做的畜物像/L60_S5_correct","车后的木头库/L60_S5_wrong")
end

function L60_S5_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(15) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(15) == 1)) then
		Msg2Player("你按第3个答案，机关启动带你到一个密室")
		SetFightState(1);
		NewWorld(130, 1547, 3143);
	else
		Msg2Player("你乱按一通但是没有反应")
	end
end;

function L60_S5_wrong()
	Msg2Player("你乱按一通但是没有反应")
end;
