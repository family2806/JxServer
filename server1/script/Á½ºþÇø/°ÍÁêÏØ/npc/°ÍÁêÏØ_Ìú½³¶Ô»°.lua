--两湖区 巴陵县 铁匠对话
--update:zhaowenyi(2005-02-20)增加紫色及黄金装备铸造

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>我这里的生意红火得很，就连天王帮的兄弟们也经常来我这里打制兵器的。想要铸造紫色装备或者黄金装备的话也要来找我，绝对物有所值啊！"

function main(sel)
	tiejiang_village()
end;


function yes()
Sale(37);  			--弹出交易框
end;
