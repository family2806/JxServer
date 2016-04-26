Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
if not tbVNG_LY2011_NpcDeath then
	tbVNG_LY2011_NpcDeath = {}
end

function tbVNG_LY2011_NpcDeath:onNPCDeath(nNpcIndex)
	if(tbVNG_LY2011:isActive() ~= 1) then
		return 0
	end
	local tbBanhChung = {szName="粽子",tbProp={6,1,30086,1,0,0},nExpiredTime=tbVNG_LY2011.nEndDay}
	--boss sat thu cap 90	
	if(NpcFunLib:CheckKillerdBoss(90, nNpcIndex) == 1)then	
		--PlayerFunLib:GetItem(tbBanhChung, 4,  "[VNG][LunarYear2011][Boss 杀手90]")				
		return 0
	end	
	--thuy tac dau linh
	if (NpcFunLib:CheckBoatBoss(nNpcIndex) == 1) then
		PlayerFunLib:GetItem(tbBanhChung, 6,  "[VNG][LunarYear2011][水贼头领]")
		return 1
	end		
	--boss the gioi
	if (NpcFunLib:CheckWorldBoss(nNpcIndex) == 1) then
		PlayerFunLib:GetItem(tbBanhChung, 20,  "[VNG][LunarYear2011][Boss世界]")
		return 1
	end
	--quai thuong
	local szMapIDList = "322, 321, 340, 75, 93, 225, 226, 227, 144, 152";
	if (NpcFunLib:CheckInMap(szMapIDList, nNpcIndex) == 1) then
		local tbBanhTet = {szName="节日饼",tbProp={6,1,30087,1,0,0},nExpiredTime=tbVNG_LY2011.nEndDay}
		NpcFunLib:DropSingleItem(tbBanhTet, 1, "5", nNpcIndex)
		return 1;
	end	
end
function tbVNG_LY2011_NpcDeath:killerBoss()
	if(tbVNG_LY2011:isActive() ~= 1) then
		return 0
	end
	local tbBanhChung = {szName="粽子",tbProp={6,1,30086,1,0,0},nExpiredTime=tbVNG_LY2011.nEndDay}
	PlayerFunLib:GetItem(tbBanhChung, 4,  "[VNG][LunarYear2011][Boss 杀手90]")
end