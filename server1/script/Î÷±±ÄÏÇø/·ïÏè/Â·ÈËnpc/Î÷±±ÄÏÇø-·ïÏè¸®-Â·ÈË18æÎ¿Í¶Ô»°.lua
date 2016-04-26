--西北南区 凤翔府 路人18嫖客对话
--西北南区 凤翔府 华山绝顶传送NPC 199,201
function main(sel)
	if(GetLevel() >= 60)then
		Say("一看你就是绝世大侠.你是从华山顶下来的吧？只要500两，我就把人带到这!",2,"真的吗, 去试试看! /yes","不关心，不想去. /no")
	else
		Say("嫖客：这万紫园的妹子可真不错啊，让人回味无穷，可是如果我再不回去，今晚就又要跪搓衣板了！",0)
	end
end;

function yes()
	if(GetCash() >= 500)then
		Pay(500);
		NewWorld(2, 2600, 3600);		
	else
		Say("500两能做什么啊?",0)
	end
end;

function no()
	Say("下山要来找我啊!",0)
end;
