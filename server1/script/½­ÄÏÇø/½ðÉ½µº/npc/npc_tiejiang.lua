-- 西山屿 职能 铁匠
-- By: li_xin(2005-01-27)
--update:zhaowenyi(2005-02-20)增加紫色及黄金装备铸造

Include("\\script\\global\\紫色及黄金装备铸造.lua")
function main(sel)
	--Say("想要在西山屿，没有我厉害的兵器恐怕要吃亏啊。你想要买什么？还想要制造玄晶装备或黄金装备就来找我，价格一定合理!", 3, "交易/yes", "制造/onFoundry", "只是路过/no")
	Say("想要在西山屿，没有我厉害的兵器恐怕要吃亏啊。你想要买什么？还想要制造玄晶装备或黄金装备就来找我，价格一定合理!", 
			2, "交易/yes", 			
			"只是路过/no")
end;

function yes()
	Sale(13);  				
end;

function no()
end;
