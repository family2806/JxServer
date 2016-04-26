--龙门镇 职能 铁匠
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>卖各种上好的武器！龙门镇最好的武器!"

function main(sel)
		tiejiang_village()
end;

function yes()
Sale(25);  				--弹出交易框
end;
