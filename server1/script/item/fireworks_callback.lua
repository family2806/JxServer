FireWorks_RADIUS = 3
function doBlessFireWorks(szParam)
	local aryParam = split(szParam, " ")
	local targetname = aryParam[1]
	
	local mapid = tonumber(aryParam[2])
	local posx = tonumber(aryParam[3])
	local posy = tonumber(aryParam[4])
	local rolename = aryParam[5]
	if (SubWorldID2Idx(mapid) < 0) then
		return
	end
	local oldSubWorld = SubWorld
	local oldPlayerIndex = PlayerIndex
	local tbPos = cutround_in8(posx, posy, 8)
	SubWorld = SubWorldID2Idx(mapid)
	pidx = SearchPlayer(targetname)
	if (pidx <= 0 or pidx == nil) then
		PlayerIndex = 1
	else
		PlayerIndex = pidx
		Msg2Player("您的朋友<color=yellow>"..rolename.."<color>给您发了一张烟花贺卡，并祝您万事顺意，合家安康！")
	end
	for i = 1, getn(tbPos) do
		CastSkill(687, 1, tbPos[i][1] * 32, tbPos[i][2] * 32)
	end
	PlayerIndex = oldPlayerIndex
	SubWorld = oldSubWorld
end

function cutround_in8(x, y, npart)
	local tb = {}
	local angle = 0
	for i = 1, npart do
		local x1, y1 = floor(x + tonumber(format("%2.2f",cos(angle)*FireWorks_RADIUS))), floor(y + tonumber(format("%2.2f",sin(angle)*FireWorks_RADIUS)))
		angle = angle + floor(360/npart)
		tb[i] = {x1, y1}
	end
	return tb;
end

--将字符串拆分成数组形势
function split(str, str_sep)
	if (not str_sep) then
		str_sep = ","
	end
	local tb = {}
	local n_seplen = strlen(str_sep)
	local n_start = 1
	local n_at = strfind(str, str_sep, n_start)
	while n_at do
		tb[getn(tb)+1] = strsub(str, n_start, n_at - 1)
		n_start = n_at + n_seplen
		n_at = strfind(str, str_sep, n_start)
	end
	tb[getn(tb)+1] = strsub(str, n_start)
	return tb
end