--中原北区 汴京府 铁匠2对话

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>王铁匠：清货大甩卖，随便看看吧——"

function main(sel)
	tiejiang_city();
end;

function yes()
Sale(7);  			--弹出交易框
end;
