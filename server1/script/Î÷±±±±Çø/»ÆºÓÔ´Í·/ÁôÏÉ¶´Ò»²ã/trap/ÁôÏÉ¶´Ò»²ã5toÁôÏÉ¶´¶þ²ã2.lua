--西北北区 留仙洞一层5to留仙洞二层2
--TrapID：西北北区 23
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q1","你看到一个机关，上面刻着字：")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q1()
	Say("传说伏羲是雷神的儿子，他从自然的火雷中拿到了火种带到人间，伏羲之后，才有了钻，用钻取火是谁发明的? ",4,"孟母/L60_S1_wrong","衰人/L60_S1_correct","女娲/L60_S1_wrong","王母/L60_S1_wrong")
end

function L60_S1_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(11) == 1))) then
		Msg2Player("你看见一个机关，上面刻着：")
		SetFightState(1);
		NewWorld(126,1483,3039)
	else
		Msg2Player("你胡乱按了一通但是没有反应")
	end
end;

function L60_S1_wrong()
	Msg2Player("你胡乱按了一通但是没有反应")
end;
