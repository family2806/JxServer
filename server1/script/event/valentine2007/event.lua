Include("\\script\\event\\valentine2007\\head.lua");

function isValentine2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070213 and nDate <= 20070215) then
		return 1;
	else
		return 0;
	end;
end;

function Valentine2007_main()
	Say("月老：不知从何时起，江新村又开始一股那么甜蜜的空气。为庆祝这个特别的节日，老夫将送给各位大侠一些 <color=yellow>玫瑰种子<color>. 各位可以和那个人到山清水秀之地，自己种<color=yellow>玫瑰树<color> 给自己.", 3,
			"好，我想领玫瑰种子/want_take_roseseed",
			"我想了解情人节活动/about_valentine2007", 
			"我稍候回来/no");
end;

function want_take_roseseed()
	if (checkValentine2007Limit() ~= 1) then
		Say("月老：真是不好意思，老夫只送玫瑰种子给玩家<color=yellow>80级以上且充值<color>.", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
		Say("月老: <color=yellow>从13/02/2007 到15/02/20007<color>, 80级以上且充值的武林人士可以找老夫领取<color=yellow>1<color> 玫瑰种子，你想领取吗?", 2, 
		"是的，我想领取玫瑰种子/sure_task_roseseed",
		"我有事要走了/no");
	else
		Say("月老：每天只能获得<color=yellow>1<color> 玫瑰种子。今天你不是已经领过了吗?", 0);
	end;
end;

function sure_task_roseseed()
	if (isValentine2007() == 1) then
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
			AddItem(6,1,1361,1,0,0);
			SetTask(TSK_VALENTINE_ROSE_DATE, nDate)
			WriteLog(format("[L?Tinh Nh﹏ 2007]\t%sName:%s\tAccount:%s\t 已领过1颗玫瑰种子.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			Say("月老：玫瑰种子在这，请快去找那一半来种玫瑰树.", 0);
		end;
	end;
end;

function about_valentine2007()
	Say("月老：在活动期间，80级以上充值玩家每天可以获得一颗玫瑰种子，与其他派别的玩家组队一起种花。在种的时候，在树上会出现标记，点击玫瑰树获取一个浇水、施肥、除草、驱虫任务，如果在规定时间内完成任务，操作越正确，玫瑰花会更美丽。快去参加吧!", 0);
end;


