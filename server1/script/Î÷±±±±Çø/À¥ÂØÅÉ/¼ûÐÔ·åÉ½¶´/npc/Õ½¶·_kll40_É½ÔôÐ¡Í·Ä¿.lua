-- 见性峰山洞迷宫 战斗NPC 山贼小头目 昆仑40级任务
-- by：Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+10) then			--带着任务
		SetTask(9,40*256+20)
		Msg2Player("Цnh b筰 t猲 s琻 t芻 ti觰 u m鬰, th� ra Huy誸 H錸 Th莕 Ki誱  b� th� l躰h c馻 t猲 ti觰 s琻 t芻 kia c蕋 gi蕌 ")
		AddNote("Цnh b筰 t猲 s琻 t芻 ti觰 u m鬰, th� ra Huy誸 H錸 Th莕 Ki誱  b� th� l躰h c馻 t猲 ti觰 s琻 t芻 kia c蕋 gi蕌  ")
	end
end;
