--西北北区 留仙洞二层4to留仙洞三层1
--TrapID：西北北区 27
--黄河源头迷宫 F2-F3 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q2","你看见一个机关，上面刻有几行字:")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q2()
	Say("炎帝原是太阳神，也是一位农业神，他保证天上的太阳发出光，帮助五谷生长。那时地球上的人不愁吃穿，因此人们尊称他是神农氏。神农氏也是一位医药神，他为人们尝了上百种草，最后中毒而死。火神有一个女孩，到东海玩时候不幸溺水身亡，从此变为一只小鸟，口含石头放入东海，想填满大海。你知道这个小鸟的名字吗？",4,"夸父/L60_S2_wrong","愚公/L60_S2_wrong","后羿/L60_S2_wrong","精卫/L60_S2_correct")
end

function L60_S2_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(12) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(12) == 1)) then
		Msg2Player("你按第4个答案，机关会带你到第3层. ")
		SetFightState(1);
		NewWorld(127, 1678, 2991);

	else
		Msg2Player("你乱按一通，但是没有什么反应")
	end
end;

function L60_S2_wrong()
	Msg2Player("你乱按一通，但是没有什么反应")
end;
