--西北南区 凤翔府 铁匠铺老板对话

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>铁匠：想买点啥兵器？随便挑，随便看，没事儿。"
function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(19);  			--弹出交易框
end;

