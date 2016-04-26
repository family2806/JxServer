--中原北区 朱仙镇 铁匠对话
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>需要什么武器尽管说，没有什么做不了的!"

function main(sel)
	tiejiang_village()
end;


function yes()
Sale(86);  			--弹出交易框
end;
