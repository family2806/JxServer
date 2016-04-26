-- 漠北草原 职能 铁匠
-- By: li_xin(2005-01-18)
--update:zhaowenyi(2005-02-20)增加紫色及黄金装备铸造

Include("\\script\\global\\紫色及黄金装备铸造.lua")
function main(sel)
	--Say(" 百里内，谁不知道我的大名，从刀剑棍枪，18般武器都有，客官想买哪种？想制造玄晶装备或者黄金装备，都要来找我，一定价格公道!", 3, "交易/yes", "制造/onFoundry", "顺便路过/no")
	Say("百里内，谁不知道我的大名，从刀剑棍枪，18般武器都有，客官想买哪种？想制造玄晶装备或者黄金装备，都要来找我，一定价格公道!", 
			2, 
			"交易/yes", 
--			"制造/onFoundry", 
			"顺便路过/no")
end;

function yes()
	Sale(13);  				
end;

function no()
end;
