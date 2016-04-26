--

tb_xmas2007_city = 
{
	[1] 	= "凤翔",
	[37] 	= "汴京",
	[80]  = "扬州 ",
	[11]  = "成都",
	[78]  = "襄阳",
	[176] = "临安",
	[162]	= "大理",
	[321]	= "长白山南",
	[322]	= "长白山北",
}
tb_xmas2007_strattime = {8,15,22}
function YDBZ_get_randomlist(item,nmax)
	local ni
	for ni = 1,nmax do
		local p = random(1,nmax)
		item[ni],item[p] = item[p],item[ni]
	end
	return item
end

function xmas2007_findgirl_returnmin()
	local nmin = tonumber(date("%M"))
	local nhour = tonumber(date("%H"))
	local nsign = 0
	for ni,ntime in tb_xmas2007_strattime do 
		if nhour == ntime then
			nsign = 1
			break
		end
	end
	if nsign == 1 then
		local ntasknim = 0
		if nmin >=0 and nmin < 20 then
			ntasknim = 20
		elseif nmin >=20 and nmin < 40 then
			ntasknim = 40
		elseif nmin >=40 and nmin < 60 then
			ntasknim = 60	
		end	
		return ntasknim
	else
		return 0
	end
		return 0
end