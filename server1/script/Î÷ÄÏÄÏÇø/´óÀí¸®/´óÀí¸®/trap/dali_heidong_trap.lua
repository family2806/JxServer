--增加大理黑洞trap点
--

Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

function add_trap_daliheidong()
	local tbpoint =
	{
		tbtoppoint={1832,3232},
		nleftstep = 80,
		nrightstep = 75,
	}
	local nMapID = 162 --大理
	local szScriptfile = "\\script\\西南南区\\大理府\\大理府\\trap\\大理黑洞.lua"
	local tballpoint = getRectanglePoint(tbpoint)
	for nx,tbp in tballpoint do
		AddMapTrap(nMapID,floor(tbp[1]*32),floor(tbp[2]*32),szScriptfile)
	end
end