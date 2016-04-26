-- 丐帮 战斗NPC 孟远才 20级任务
-- by：Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 20*256+10) then			--带着20级任务
		Talk(2,"","我教训你是为了替帮中兄弟出口气，要你尝尝被人教训的滋味。如果你再敢胡作非为，我可不管你是谁的亲戚，照打不误!","不敢了，我再也不敢了!")
		SetTask(8,20*256+20)
		AddNote("已教训孟远才一场 ")
		Msg2Player("已教训孟远才一场 ")
	end
end;
