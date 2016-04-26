-- 西南南区 翠烟门to禁地迷宫　翠烟60级任务
--Trap ID：西南南区 17
-- By: Dan_Deng(2003-09-09)

function main(sel)
	UTask_cy = GetTask(6)
	if (UTask_cy > 60*256) and (GetFaction() == "cuiyan") then
		SetFightState(1)
		NewWorld(158, 1584, 3191);
	elseif (UTask_cy <= 60*256) then
--		SetPos()
		Talk(1,"","不能进入本门禁地!")
	else
--		SetPos()
		Talk(1,"","这是翠烟禁地，不能进入!")
	end
end;
