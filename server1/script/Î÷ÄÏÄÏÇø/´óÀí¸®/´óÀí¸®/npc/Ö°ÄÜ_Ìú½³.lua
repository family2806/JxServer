-- 大理 职能 铁匠
-- By: Dan_Deng(2003-09-16)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>我的铁匠店为学武制造兵器而建，刀剑棍枪，十八般兵器都有，大侠想买哪种?"

function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;

function yes()
	Sale(16);  				--临时定为25
end;

