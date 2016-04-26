Include("\\script\\vng_event\\VuonCaySinhNhat\\plant.lua")

DATE_START	= 20110624
DATE_END	= 20110707

function IsAcitve()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= DATE_END or now < DATE_START) then
		return 0;
	end
	return 1;	
end

function plant_tree()
	if (tbSeed:Check() == 0) then
		return 0
	end
	local kind = tbSeed:RandomKind()
	if (tbSeed:Grow(kind) == 1) then
		return 1
	else		
		return 0
	end
end

function main(nItemIndex)
	if IsAcitve() ~= 1 then
		Msg2Player("已过活动时间，不能种树了.")
		return 1
	end	
	if plant_tree() == 1 then
		return 0
	end
	return 1
end
