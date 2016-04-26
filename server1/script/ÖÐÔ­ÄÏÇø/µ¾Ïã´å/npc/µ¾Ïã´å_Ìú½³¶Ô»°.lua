--中原南区 稻香村 铁匠对话

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>我打落了很多中意的武器"

function main(sel)
	tiejiang_village();
end;


function yes()
Sale(89);  			--弹出交易框
end;
