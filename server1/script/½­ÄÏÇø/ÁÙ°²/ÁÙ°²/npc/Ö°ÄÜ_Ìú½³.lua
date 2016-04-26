-- 临安　职能　铁匠
-- by：Dan_Deng(2003-09-16)
--update:zhaowenyi(2005-02-20)增加紫色及黄金装备铸造

Include("\\script\\global\\global_tiejiang.lua")


TIEJIANG_DIALOG = "<dec><npc>这间铁匠铺是从我祖父那一辈留下来的，已经有些念头了，在这临安城里也略有薄名，请问要买点什么呀？";
function main()
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(1);  				--弹出交易框
end;

