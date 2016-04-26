-- 江南区 桃花岛 路人_船夫.lua
-- by: Dan_deng(2004-05-15)

Include("\\script\\missions\\autohang\\head.lua")
g_mapList = {235, 236, 237, 238, 239, 240, 241};
function main()
	-- 免费双经验
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- 免费双经验日子
		Say("这附近桃花岛的灵气很盛. 不用腊八粥也可以练功. 这么好的机会.要知道充分利用. 如果想反悔要付1800两银两. ", 2, "回城/go_yes", "不回/no")		
		return 1;
	end
	
	nValue = GetTask(AEXP_TASKID);
	if (nValue > AEXP_TIME_UPDATE) then -- 仍有挂机时间
		Say("这位客官! 看你的神气一定是用了这里传说中的腊八粥对吧?听说只有桃花岛上的腊八粥才有功效. 只有一小时，要尽量使用. N誹 nh?mu鑞 v?th祅h th?ph秈 tr?1800 ng﹏ ln如果要回城需要支付1800两银两.", 2, "回城/go_yes", "不回/no")
	else 
		Say("这位客官! 看你的神气一定是用了这里传说中的腊八粥对吧?听说只有桃花岛上的腊八粥才有功效. 只有一小时，要尽量使用. N誹 nh?mu鑞 v?th祅h th?ph秈 tr?1800 ng﹏ ln如果要回城需要支付1800两银两.", 2, "回城/go_yes", "不回/no")
	end
end

function go_yes()
	if (GetCash() >= 1800) then
		Pay(1800)
		Msg2Player("坐稳了！我们回城")
		SetAutoHangMapFlag(0) -- 设置退出挂机地图标记(放开原来被屏蔽的公聊、回城等功能)
		
		-- 记录离开时的在线时间
		nOLTime = GetGameTime();
		SetTask(AEXP_OLTIME_TASKID, nOLTime);
		
		back_home();
		SetFightState(1)
	else
		Talk(1,"","要回城的话付1800两银两.快拿钱来")
	end
end;

function back_home()
	nSubWorldID = SubWorldIdx2ID();

	if (nSubWorldID == g_mapList[1]) then
		NewWorld(176, 1614, 2561) -- 临安
	elseif (nSubWorldID == g_mapList[2]) then
		NewWorld(80, 1345, 3359) -- 扬州
	elseif (nSubWorldID == g_mapList[3]) then
		NewWorld(78, 1299, 3483) -- 襄阳
	elseif (nSubWorldID == g_mapList[4]) then
		NewWorld(37, 1938, 2459) -- 汴京
	elseif (nSubWorldID == g_mapList[5]) then
		NewWorld(162, 1642, 2935) -- 大理
	elseif (nSubWorldID == g_mapList[6]) then
		NewWorld(11,3100,4822) -- 成都
	elseif (nSubWorldID == g_mapList[7]) then
		NewWorld(1, 1528, 2733) -- 凤翔
	else
		Msg2Player("暴雷! 你是从哪个城市来桃花岛的? 请向GM反应!");
	end	
end;

function no()
end;
