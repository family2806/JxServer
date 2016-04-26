--西北南区 永乐镇 铁匠对话
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>想要什么武器？要什么有什么!"

function main(sel)
	tiejiang_village()
end;


function yes()
Sale(83);  			--弹出交易框
end;
