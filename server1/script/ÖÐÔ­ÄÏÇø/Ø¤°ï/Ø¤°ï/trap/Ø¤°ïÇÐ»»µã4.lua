--中原北区 丐帮 战斗状态切换Trap
--Trap Id 48
--By 苏宇 2003年10月28日

function main(sel)

if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在城内
	SetPos(1550, 3497)		-- 设置走出Trap点，目的点在城外	
	SetFightState(1)		-- 转换为战斗状态
else			       		-- 玩家处于战斗状态，即在城外
	SetPos(1546, 3507)		-- 设置走出Trap点，目的点在城内	
	SetFightState(0)		-- 转换为非战斗状态
end;
end;