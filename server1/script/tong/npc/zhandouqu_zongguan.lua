function main()
	Say("<#>战斗区域总管：为了内部帮会和与其他帮会比武，我可以帮你们改变帮派，但是，当离开战斗区域，就不能恢复原来的样子了，你想暂时更换帮派吗？" ,5, "正方/camp1", "左派方/camp2", "中立方/camp3", "恢复成开始派方/retorecamp", "我还不想换./cancel");
end

function camp1()
	SetCurCamp(1);
	Msg2Player("暂时换成正派.");
end

function camp2()
	SetCurCamp(2);
	Msg2Player("暂时换成左派.");
end

function camp3()
	SetCurCamp(3);
	Msg2Player("暂时换成中立.");
end

function retorecamp()
	SetCurCamp(GetCamp())
end

function cancel()
end

