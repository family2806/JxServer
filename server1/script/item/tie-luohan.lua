IncludeLib("SETTING")
--Create by yfeng ,2004-3-9
--铁罗汉用来研习，可以增加实战经验，
--以每10级为一个段，所增加的经验为该级别段内玩家升级所需经验
--的总和的平均值的1/10,并按一定的几率获得这1/10的经验，否则，获得少部分经验
--具体：10级段内100%获得1/10经验，100级段内5%获得1/10经验
--其他情况最多不能获得超过1/10经验的50%
--1级以下按1级算，100级以上，按100级算
--该物品不限制使用次数，但纪录使用的次数
--任务变量82用于记录该物品的使用次数
--如果超过这个数字，则不能使用该物品了。

TASKIDDAY 	= 2595;
TASKIDEXP	= 2596;
GETMAXEXP	= 150000000;	-- 每天可以获得的经验上限
function main(sel)
	exps={
		{430,100},
		{2960,90},
		{9490,80},
		{22515,70},
		{48190,50},
		{104980,30},
		{246310,20},
		{609360,15},
		{1511850,10},
		{3611636,5}
	}
	msg={
		"你对着铁罗汉研习了半天，结果获得一些实战经验。",
		"你对着铁罗汉研习了半天，结果获得不少实战经验。",
		"你对着铁罗汉研习了半天，结果没有获得任何效果。",
		"你对着铁罗汉研习了半天，结果获得了少许经验。",
	}
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(TASKIDDAY) ~= nDate ) then
		SetTask(TASKIDDAY, nDate)
		SetTask(TASKIDEXP, 0);
	end
	num = GetTask(82) --取使用次数，靠没有人能使用40多亿次吧，不做纠错处理了
	level = GetLevel()
	if(level <1) then 
		level =1
	end
	if(level > 130) then
		Msg2Player(msg[3])
		return 1
	end
	if(level >100) then
		level = 100
	end	
	levelseg = floor((level-1)/10)+1
	rnd = random(100)
	if(rnd > exps[levelseg][2]) then --获得少许经验
		nExp = floor(exps[levelseg][1]*rnd/200);
		if (nExp + GetTask(TASKIDEXP) > GETMAXEXP) then
			Msg2Player(msg[4]);
			return 1
		end
		AddOwnExp(nExp)
		Msg2Player(msg[1])
		SetTask(TASKIDEXP, GetTask(TASKIDEXP) + nExp);
		SetTask(82,num+1)
		return 0
	end
	--命好，获得不少经验
	if (exps[levelseg][1] + GetTask(TASKIDEXP) > GETMAXEXP) then
		Msg2Player(msg[4]);
		return 1
	end
	AddOwnExp(exps[levelseg][1])
	Msg2Player(msg[2])
	SetTask(TASKIDEXP, GetTask(TASKIDEXP) + exps[levelseg][1]);
	SetTask(82,num+1)
	return 0
end