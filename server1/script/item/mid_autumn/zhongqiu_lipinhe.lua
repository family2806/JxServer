-- 中秋礼品盒脚本
-- lixin 2005-8-31

zq_tab_award = {	--中秋礼品盒可以获得的物品，概率，
	{	"1级面粉",	0.43145	,	 528 ,	},
	{	"2级面粉",	0.05	,	 529 ,	},
	{	"3级面粉",	0.015	,	 530 ,	},
	{	"4级面粉",	0.003	,	 531 ,	},
	{	"5级面粉",	0.0005	,	 532 ,	},
	{	"6级面粉",	0.00005	,	 533 ,	},
	{	"1级莲蓉",	0.43145	,	 534 ,	},
	{	"2级莲蓉",	0.05	,	 535 ,	},
	{	"3级莲蓉",	0.015	,	 536 ,	},
	{	"4级莲蓉",	0.003	,	 537 ,	},
	{	"5级莲蓉",	0.0005	,	 538 ,	},
	{	"6级莲蓉",	0.00005	,	 539 ,	},
}

function main()
	local base = 100000
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( zq_tab_award ) do
		sum = sum + zq_tab_award[i][2] * 100000
		if( sum >= num ) then
			zq_award( zq_tab_award[i] )
			break
		end
	end
end

function zq_award( item )
	local name = item[1]
	AddEventItem( item[ 3 ] )
	Msg2Player("恭喜，你获得了1个"..name)
	Talk(1,"","礼官：恭喜你获得了<color=yellow>"..name.."<color>！")
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName().."，从中秋礼品盒中得到  "..name)
end