-- 石鼓镇 职能 铁匠
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>C各种刀枪兵器啦，这里是石鼓镇买武器最好的地方!"

function main(sel)
	tiejiang_village();
end;

function yes()
Sale(25);  				--临时定为25
end;
