Include("\\script\\event\\cookies2007\\head.lua");

function iscookies2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070414 and nDate <= 20070424) then
		return 1;
	else
		return 0;
	end;
end;

function cookies2007_main()
	Say("小贩: 老夫只是做小本买卖，最近又买了一点货回来, 打算在3月3日卖. 岂料在路上遇到土匪把所有货物和钱财都抢光了. 老夫请各位大侠帮助拿回货物和钱财", 3,
			"我已经找过了/want_take_cookiesma",
			"我想了解3月3日的活动/about_cookies2007", 
			"我一会回来/OnCancel");
end;

function want_take_cookiesma()
	if (checkcookies2007Limit() ~= 1) then
		Say("小贩: 真不好意思, 只有<color=yellow>50级以上已充值的玩家<color> 才可以接受做饼原料包.", 0);
		return 0;
	end;
	if (iscookies2007() == 1) then
		sure_task_cookiesma();
	else
		Say("小贩: [活动还未进行] 我的货物袋里装的都是优质原料, 多谢大侠关心.",0);
		return 0;
	end
end;

function sure_task_cookiesma()
	if (iscookies2007() == 1) then
			if GetCash() < 100000 then 
				Say("小贩: 老夫丢失了<color=yellow>10万两<color>, 不知道大侠看到没有?",0);
				return 0;
			end
			if CalcFreeItemCellCount() < 1 then 
				Say("小贩: 请整理背包! 老夫有小礼物要送给大侠.",0);
				return 0;
			end
			local nsum = CalcEquiproomItemCount(6,1,1393,-1);
			if nsum < 20 then
				Say("小贩: 大侠还未找齐货物袋, 老夫丢失了<color=yellow>20袋货物<color> 的啊",0);
				return 0;
			end	
			if ConsumeEquiproomItem(20,6,1,1393,-1) ~= 1 then
				WriteLog(format("[2007年3月3日] \t%sName:%s\tAccount:%s\t 取消货物袋失败.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
				Say("小贩: 取消货物袋失败.",0);
				return 0;
			else
				WriteLog(format("[2007年3月3日]\t%sName:%s\tAccount:%s\t 成功取消货物袋.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			end
			Pay(100000);
			AddItem(6,1,1394,1,0,0);
			Say("小贩: 这是做饼原料，大侠赶快去找一位女侠一起做饼.", 0);
		--end;
	end;
end;

function about_cookies2007()
	Talk(3,"","小贩: 活动期间, 所有打怪练功的玩家都有机会捡到<color=yellow>货物袋<color>. 之后, 带着20个 <color=yellow>货物袋<color> 和<color=yellow>10万两<color>到各大城市的NPC小贩那里换取<color=yellow>做饼原料包<color>.","男女组队(50及以上已充值) 可以到各个城市，新手村或者风景区一同做饼."," 做饼过程中, 玩家将要进行和面, 淘绿豆皮, 把馅放入饼里的步骤, 添加柴火越麻利则做出来的饼就越香.");
end;

function OnCancel()
	
end