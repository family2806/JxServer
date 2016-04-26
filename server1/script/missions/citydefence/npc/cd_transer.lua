----------------------------------------------------------------
--FileName:	transer.lua
--Creater:	firefox
--Date:		2005-
--Comment:	周末活动：卫国战争之烽火连城
--			功能：战场内车夫，负责将玩家传送到报名点
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
--TASKID_FIRE_ADDR
function main()
	Say("车夫:战势激烈！早知道我就报名去前方了！对了！你有什么要说吗？",2,"我有重要的事情要和将军说！请随我到后营！/sure2leave", "没什么，我只是来玩的./OnCancel" )
end

function sure2leave()
	--bt_getsignpos(camp)
	local mapid = SubWorldIdx2ID( SubWorld )
	if ( mapid == tbDEFENCE_MAPID[1] ) then
		camp = 1;
	else
		camp = 2;
	end
	SetLogoutRV(0);
	SetRevPos(tbDEFENCE_SIGNMAP[camp], random(3))
	NewWorld(bt_getsignpos(camp))
end

function OnCancel()
end