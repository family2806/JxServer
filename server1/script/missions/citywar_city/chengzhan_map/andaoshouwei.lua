--暗道守卫
function main()
	Say("这是用于秘密离城袭击敌军的密道！你想使用这个密道吗?", 2, "想 /OnGo", "不想 /OnCancel");
end

function OnGo()
	local mapid = 221
	local i = random(0,1);
	
	if (i == 0) then
		NewWorld(mapid,1739,3513)
	else
		NewWorld(mapid,1836,3405)
	end
	
	SetFightState(1);
end

function OnCancel()
end
