--西北北区 留仙洞四层4to留仙洞五层1
--TrapID：西北北区 37
--黄河源头迷宫 F4-F5 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q4","你看到一个机关，上面刻着几行字：")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q4()
	Say("宇宙初开，天地相距不远，人类可以走楼梯上天庭，玉皇说：凡人和天神这样子实在是混沌，于是命令天神们把天地隔远，你知道下面这些成语的玄机吗?",4,"天荒地老/L60_S4_wrong","天地平分/L60_S4_correct","天南地北/L60_S4_wrong","天高地阔/L60_S4_wrong")
end

function L60_S4_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(14) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(14) == 1)) then
		Msg2Player("你按面前的第二个，机关会带你到第五层")
		SetFightState(1);
		NewWorld(129, 1694, 3143);
	else
		Msg2Player("你乱按一通，但是没有反应")
	end
end;

function L60_S4_wrong()
	Msg2Player("你乱按一通，但是没有反应")
end;
