Include("\\script\\event\\newyear_2009\\lucky_bag\\hongbaohecheng.lua");
Include("\\script\\event\\newyear_2009\\lucky_bag\\wuguohecheng.lua");
Include("\\script\\event\\newyear_2009\\xinnianyanhua\\xinnianyanhua.lua");
Include("\\script\\event\\qingren_jieri\\200902\\event.lua");

function main()
	local arytalk = {"<dec><npc>现在正是过年的时候，大侠犹豫什么呢?"};
	
	if (newyear0901_hongbao_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "幸运压岁包活动/#newyear0901_hongbao_dialogmain()";
	end
	
	if (newyear0901_wuguo_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "五果盘活动#newyear0901_wuguo_dialogmain()";
	end
	
	if (newyear0901_yanhua_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "烟花贺春活动/#newyear0901_yanhua_dialogmain()";
	end
	
	if (valentine2009_isCarryon() == 1) then
		arytalk[getn(arytalk)+1]	= "情人礼活动/#valentine2009_main()";
	end
	
	arytalk[getn(arytalk)+1]	= "我正在忙，别的时候再过来吧！/OnCancel";
	
	CreateTaskSay(arytalk);
end