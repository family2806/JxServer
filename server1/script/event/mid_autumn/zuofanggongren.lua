-- zuofanggongren.lua 
-- 作坊工人脚本
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")
IncludeLib("TIMER")
IncludeLib("RELAYLADDER")


-- 不同类型月饼的等待时间
tbl_time_wait = {
	[TYPE_SHIJIN		  ] = 600,
	[TYPE_GUOREN		  ] = 300,
	[TYPE_DANHUANGLIANRONG] = 180,
	[TYPE_DANHUANGDOUSHA  ] = 180,
	[TYPE_LIANRONG		  ] = 180,
	[TYPE_DOUSHA		  ] = 180,
};

tbl_finish_stat = {
	[STAT_HUOMIAN_MAKING] = STAT_HUOMIAN_FINISH,	-- 和面完成
	[STAT_BAOXIAN_MAKING] = STAT_BAOXIAN_FINISH,	-- 包馅完成
	[STAT_HONGKAO_MAKING] = STAT_HONGKAO_FINISH,	-- 烘烤完成
};

tbl_making_msg = {
	[STAT_BAOXIAN_MAKING] = "<#> 开始做<color=yellow>馅<color>",
	[STAT_HONGKAO_MAKING] = "<#> 开始<color=yellow>烤月饼<color>",
};

-- 不同类型的月饼
tbl_mooncake = {
	"<#> 什锦月饼",
	"<#> 果仁月饼",
	"<#> 蛋黄莲蓉月饼",
	"<#> 蛋黄豆沙月饼",
	"<#> 莲蓉月饼",
	"<#> 豆沙月饼",
};

tbl_mooncake_item = {
	{6, 1, 896, 1, 0, 0, 379}, -- 什锦月饼,
	{6, 1, 895, 1, 0, 0, 251}, -- 果仁月饼,
	{6, 1, 894, 1, 0, 0, 188}, -- 蛋黄莲蓉月饼,
	{6, 1, 893, 1, 0, 0, 187}, -- 蛋黄豆沙月饼,
	{6, 1, 892, 1, 0, 0, 186}, -- 莲蓉月饼,
	{6, 1, 891, 1, 0, 0, 185}, -- 豆沙月饼,
};

-- 月饼是否需要到明月镇中的明月老人处换取奖励
tbl_mooncake_exchangable = {
	1, -- 什锦月饼
	1, -- 果仁月饼
	0, -- 蛋黄莲蓉月饼
	1, -- 蛋黄豆沙月饼
	0, -- 莲蓉月饼
	1, -- 豆沙月饼
};

-- 制作不同类型的月饼需要的材料
tbl_mooncake_material = {
	--蛋 杏仁 花生 椰丝 面粉 砂糖 莲蓉 豆沙
	{0,	1, 1, 3, 4, 4, 1, 1},	-- 什锦月饼：4面粉+4砂糖+豆沙+莲蓉+杏仁+花生+3椰丝
	{0, 1, 2, 0, 6, 6, 0, 0},	-- 果仁月饼：6面粉+6砂糖+1杏仁+2花生
	{2, 0, 0, 0, 5, 6, 2, 0},	-- 蛋黄莲蓉月饼：5面粉+6砂糖+2莲蓉+2蛋
	{2, 0, 0, 0, 6, 5, 0, 2},	-- 蛋黄豆沙月饼：6面粉+5砂糖+2豆沙+2蛋
	{0, 0, 0, 0, 5, 8, 2, 0},	-- 莲蓉月饼：5面粉+8砂糖+2莲蓉
	{0, 0, 0, 0, 8, 5, 0, 2},	-- 豆沙月饼：8面粉+5砂糖+2豆沙
};

-- 确定要制作月饼的对话
tbl_mooncake_talk = {
	"<#> <color=red>什锦月饼<color> 需要： 4面粉，4砂糖，1豆沙，1莲蓉，1杏仁，1花生，3椰丝. 听说这种椰丝只在南方才有，很贵的！如果是这样我要千万小心，开始了吗?",
	"<#> <color=red>果仁月饼<color> 需要：6面粉，6砂糖，1杏仁，2花生. 拿一点花生碾碎之后放到月饼里，这样才可以是月饼从内散发出香味.不多说了，可以开始了吗?",
	"<#> <color=red>蛋黄莲蓉月饼<color> 需要：5面粉，6砂糖，2莲蓉，2蛋. 要两个蛋，一个用来做馅，另一个在烘烤的时候涂在外皮上，个半小时涂一次.不要多说了，可以开始了吗?",
	"<#> <color=red>蛋黄豆沙月饼<color> 需要：6面粉，5砂糖，2豆沙，2蛋. 你知道吗？要两个蛋，一个用于做馅，另一个在烤的时候涂在外皮上，半小时涂一次.不要多说了，可以开始了吗?",
	"<#> <color=red>莲蓉月饼<color> 需要：5面粉，8砂糖，2莲蓉. 秘诀是要把莲子的心去掉，同时要和糖搅拌在一起，这样才可以做出来美味的月饼.不多说了，可以开始了吗?",
	"<#> <color=red>豆沙月饼<color> 需要：8面粉，5砂糖，2豆沙. 不要小看这个月饼，做的好吃要有秘诀，拿豆沙来说，在浸泡完之后要把皮去了才可以碾，这样才会有香味. 不多说了，可以开始了吧?",
};

-- 不同月饼状态的对话
tbl_maketalk = {
	-- 和面完成
	[STAT_HUOMIAN_FINISH] = {
		"<#> 和面完成, 现在开始做馅，需要一些时间，靠你帮忙了，所以做馅期间你不能离开明月镇，完成后我会告诉你，听到我叫你就要立刻赶回来，原料时间放久会坏掉!",
		"<#> 我知道了！开始吧!/keep_making_mooncake",
		"<#> 一会回来!/cancel"},
	-- 包馅完成
	[STAT_BAOXIAN_FINISH] = {
		"<#>馅做好了，开始烘烤，要一点时间，靠你帮忙了，在此期间你不能离开明月镇，好了我会告诉你，记住听到我叫你就立刻到这里不然的话月饼就糊了!",
		"<#> 我知道了！开始吧!/keep_making_mooncake",
		"<#> 一会回来!/cancel"},
};


tbl_stoptalk = {
	-- 正在和面
	[STAT_HUOMIAN_MAKING] = {
		"<#> 如果这样我开始发面了，需要一点时间，靠你帮忙了，做馅期间你不能离开明月镇，完成后我会告诉你，听到我叫你就要立刻赶回来，原料时间放久会坏掉!",
		"<#> 我知道了！开始吧!/resume_making_mooncake",
		"<#> 一会回来!/cancel"},
	-- 正在包馅
	[STAT_BAOXIAN_MAKING] = {
		"<#> 面和好了，现在开始包馅，需要一点时间，要你帮忙了，因此在这段时间你不能离开明月镇，完成后我会告诉你，听到我叫你就要立刻赶回来，原料时间放久会坏掉!",
		"<#> 我知道了！开始吧！resume_making_mooncake",
		"<#> 一会回来!/cancel"},
	-- 正在烘烤
	[STAT_HONGKAO_MAKING] = {
		"<#> 馅包好了，现在开始烘烤，要一点时间，靠你帮忙了，在此期间你不能离开明月镇，好了我会告诉你，记住听到我叫你就立刻到这里不然的话月饼就糊了!",
		"<#> 我知道了！开始吧！resume_making_mooncake",
		"<#> 一会回来!/cancel"},
};

-- 步骤名称
tbl_stepname = {
	[STAT_HUOMIAN_MAKING] = "<#> 和面",	-- 正在和面
	[STAT_BAOXIAN_MAKING] = "<#> 包馅",	-- 正在包馅
	[STAT_HONGKAO_MAKING] = "<#> 烘烤",	-- 正在烘烤
};

tbMOONCAKE_LADDERID = {
				{ 10189, 40 },
				{ 10190, 41 },
				{ 10191, 42 },
				{ 10192, 43 },
				{ 10193, 44 },
				{ 10194, 45 },
}


function resume_making_mooncake()
	TM_ResumeTimer(TIMER_MOONCAKE)
	
end

-- 确定要制作的月饼类型
function confirm_mooncake(ltype)
	Say(tbl_mooncake_talk[ltype], 2,
		"对了./" .. format("#make_mooncake(%d)", ltype),
		"不！我要想一想!/cancel")
end

-- 对话：制作月饼
function talk_makemooncake()
	local caption = "<#> 月饼师傅: 我们厂有做月饼的独门秘方，做出来的月饼可以满足最挑剔的客人. 你要做哪种月饼?"
	Say(caption,
		7,
		"<#> 我要做豆沙月饼/" .. format("#confirm_mooncake(%d)", TYPE_DOUSHA),
		"<#> 我要做莲蓉月饼/" .. format("#confirm_mooncake(%d)", TYPE_LIANRONG),
		"<#> 我要做蛋黄豆沙月饼/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGDOUSHA),
		"<#> 我要做蛋黄莲蓉月饼/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGLIANRONG),
		"<#> 我要做果仁月饼/" .. format("#confirm_mooncake(%d)", TYPE_GUOREN),
		"<#> 我要做什锦月饼/" .. format("#confirm_mooncake(%d)", TYPE_SHIJIN),
		"<#> 我只是路过看看/cancel")
end

-- 对话：检查月饼制作状态
function talk_querymooncake(varv)
	local ltype = floor(varv / 1000)	-- 月饼类型
	local stat = mod(varv, 1000)	-- 月饼状态
	name = tbl_mooncake[ltype]
	-- 月饼烤焦了
	if (stat == STAT_PARCHED or stat == STAT_HUOMIAN_PARCHED) then
		Say("<#> 客官真不好意思，我看你这么久都没有来月饼已经烤焦了!",
			1,
			"<#> 得到烤焦的月饼/#take_parched_mooncake("..stat..")")
	-- 月饼做好了
	elseif (stat == STAT_HONGKAO_FINISH) then
		close_hint()
		local caption = ""
		if (tbl_mooncake_exchangable[ltype] == 1) then
			caption = "<#> 这位客官, <color=red>" .. tbl_mooncake[ltype] .. "<color> 已经做好了，香吗？赶快欣赏一下！听说镇上有一位很喜欢吃月饼的明月老人，你把月饼带去给他说不定会有意想不到的礼物呢！"
		else
			caption = "<#> 这位客官, <color=red>" .. tbl_mooncake[ltype] .. "<color> 已经做好了，香吗？赶快欣赏一下!"
		end
		Say(caption, 1, "<#> 得到月饼/" .. format("#take_mooncake(%d)", ltype))
	elseif (tbl_stoptalk[stat] ~= nil) then		-- 制作中
		-- 暂停
		if (TM_IsTimerSuspending(TIMER_MOONCAKE) == 1) then
			Say(tbl_stoptalk[stat][1], 2, tbl_stoptalk[stat][2], tbl_stoptalk[stat][3])
		-- 月饼制作中
		else
			local talk = "<#> 客官不要着急, <color=red>" .. tbl_mooncake[ltype] .. "<color> 还在<color=red>" .. tbl_stepname[stat] .. "<color>, 这个阶段结束了我会告诉你!"
			Talk(1, "", talk)
		end
	elseif (tbl_maketalk[stat] ~= nil) then		-- 步骤完成
		close_hint()
		-- 暂停计时
		TM_SuspendTimer(TIMER_MOONCAKE)
		Say(tbl_maketalk[stat][1], 2, tbl_maketalk[stat][2], tbl_maketalk[stat][3])
	else
		print("MOONCAKE: something is wrong!!!")
	end
end

-- 计算当前步骤需要的制作时间
function get_make_time()
	return random(30, 60)
end

-- 消耗玩家身上的月饼原料
function consume_material(ltype)
	local material_list = tbl_mooncake_material[ltype]
	-- 检查原料是否充足
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			local curr_count = CalcEquiproomItemCount(material_item[2], material_item[3], 1, -1)
			if (curr_count < want_count) then
				Talk(1, "", "<#>客官，你身上的材料不够，找够原料之后再来吧!")
				return 0
			end
		end
	end
	-- 消耗原料
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			ConsumeEquiproomItem(want_count, material_item[2], material_item[3], 1, -1)
		end
	end
	return 1
end

-- 开始制作月饼
function make_mooncake(ltype)
	if (consume_material(ltype) == 1) then
		local varv = ltype * 1000 + STAT_HUOMIAN_MAKING
		nt_setTask(VARV_MOONCAKE, varv)
		-- DEBUG
		--print(format("make_mooncake: nt_setTask(%d, %d)", VARV_MOONCAKE, varv))
		local resttime = get_make_time()
		TM_SetTimer(resttime * 18,
			TIMER_MOONCAKE,
			1,	-- 定时器只执行一次 
			2);	-- 计时以玩家在线时间为准
		-- DEBUG
		--print(format("TM_SetTimer(%d, %d, %d, %d)", resttime * 18, TIMER_MOONCAKE, 1, 2))
		TM_SuspendTimer(TIMER_MOONCAKE)
		
		Say("<#>这样的话我着手<color=red>和面<color>, 需要一点时间，靠你帮忙了，因此做馅期间你不能离开明月镇，完成后我会告诉你，听到我叫你就要立刻赶回来，原料时间放久会坏掉!",
			2,
			"<#> 我知道了！开始吧！resume_mooncake",
			"<#> 一会回来!/cancel")
	end
end

-- 恢复制作月饼
function resume_mooncake()
	Msg2Player("<#> 现在开始<color=yellow>和面 <color>y!")
	TM_ResumeTimer(TIMER_MOONCAKE)
end

-- 继续制作月饼
function keep_making_mooncake()
	local varv = GetTask(VARV_MOONCAKE)
	local ltype = floor(varv / 1000)
	local stat = mod(varv, 1000)
	if (stat < STAT_MAX) then
		stat = stat + 1
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + stat)
		
		if (tbl_making_msg[stat] ~= nil) then
			Msg2Player(tbl_making_msg[stat])
		end
	
		local nExp = makecake_addexp(GetLevel(), 0.20)
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
		-- DEBUG
		--print(format("keep_making_mooncake: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + stat))
		
		TM_SetTimer(get_make_time() * 18,
			TIMER_MOONCAKE,
			1,	-- 定时器只执行一次 
			2);	-- 计时以玩家在线时间为准
	end
end

-- 领取烤焦的月饼
function take_parched_mooncake(stat)
	local varv = GetTask(VARV_MOONCAKE)
	local lstat = mod(varv, 1000)		-- 月饼状态
	if (lstat == STAT_HUOMIAN_PARCHED or lstat == STAT_PARCHED) then
		nt_setTask(VARV_MOONCAKE, 0)
		AddItem(6,1,890,1,0,0)
		Msg2Player("<#> 你得到一个烤好的月饼")
		CastSkill(358, 1)
		local nExp = 0;
		if (stat == STAT_PARCHED) then
			nExp = makecake_addexp(GetLevel(), 0.20)
		else
			nExp = makecake_addexp(GetLevel(), 0.10)
		end
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
	end
end

-- 领取做好的月饼
function take_mooncake(ltype)
	local varv = GetTask(VARV_MOONCAKE)
	local stat = mod(varv, 1000)		-- 月饼状态
	local type = floor(varv / 1000)		-- 月饼类型
	if (type == ltype and stat == STAT_HONGKAO_FINISH) then
		nt_setTask(VARV_MOONCAKE, 0)
		local cakename = tbl_mooncake[ltype]
		local item = tbl_mooncake_item[ltype]
		AddItem(item[1], item[2], item[3], item[4], item[5], item[6])
		Msg2Player("<#> 你得到一个<color=yellow>" .. cakename .. "<color>")
		if (ltype == 1) then
			AddGlobalNews("<#> 恭喜玩家"..GetName().."<#> 做好了什锦月饼")
		end
		ladder_mooncake_ladder(ltype)
		local nExp = makecake_addexp(GetLevel(), 0.60)
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
		WriteLog(date("%y-%m-%d,%H:%M,") .. GetAccount() .. "(".. GetName().. ") get a " .. cakename)
		CastSkill(item[7],1)
	end
end

-- 制作完成的响应函数
function timeout_make(ltype, stat)
	local finish_stat = tbl_finish_stat[stat];
	-- DEBUG
	--print(format("Msg2Player(%s)", tbl_notice[finish_stat]))
	Msg2Player(tbl_notice[finish_stat])

	-- 当前阶段完成了，等待玩家执行下一步骤
	-- DEBUG
	--print(format("timeout_make(%d, %d)", ltype, stat))
	nt_setTask(VARV_MOONCAKE, ltype * 1000 + finish_stat)
	-- DEBUG
	--print(format("timeout_make: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + finish_stat))
	TM_SetTimer(tbl_time_wait[ltype] * 18,
		TIMER_MOONCAKE,
		1,	-- 定时器只执行一次 
		2);	-- 计时以玩家在线时间为准
	-- 启动提醒领取月饼的定时器
	start_hint()
end

-- 等待超时的响应函数
function timeout_wait(ltype, stat)
	close_hint()
	-- 等待的时间到了，玩家还没有执行下一步则月饼烤焦
	if (stat == STAT_HONGKAO_FINISH ) then
		--yuebing guoshi 
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + STAT_PARCHED)
		-- DEBUG
		--print(format("timeout_wait: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + STAT_PARCHED))
	else
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + STAT_HUOMIAN_PARCHED)
		-- DEBUG
		--print(format("timeout_wait: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + STAT_HUOMIAN_PARCHED))
	end

end

-- 不同状态的定时器
tbl_timer = {
	[STAT_HUOMIAN_MAKING] = timeout_make,	-- 正在和面
	[STAT_HUOMIAN_FINISH] = timeout_wait,	-- 和面完成
	[STAT_BAOXIAN_MAKING] = timeout_make,	-- 正在包馅
	[STAT_BAOXIAN_FINISH] = timeout_wait,	-- 包馅完成
	[STAT_HONGKAO_MAKING] = timeout_make,	-- 正在烘烤
	[STAT_HONGKAO_FINISH] = timeout_wait,	-- 烘烤完成
};

-- 定时器
function OnTimer()
	local varv = GetTask(VARV_MOONCAKE)
	local ltype = floor(varv / 1000)
	local stat = mod(varv, 1000)
	if (ltype >= TYPE_MIN and
		ltype <= TYPE_MAX and
		stat >= STAT_MIN and
		stat <= STAT_MAX) then
		timer = tbl_timer[stat]
		if (timer ~= nil) then
			timer(ltype, stat)
		end
	end
end

-- 帮助说明
function about_mooncake(step)
	if (step == 1) then
		Talk(1,"#about_mooncake(2)","<#> 月饼师傅:做月饼要进行<color=red>3<color> 阶段. 选择需要制作的月饼种类，准备好原料，制作步骤如下: <color=red>'和面<color>', <color=red>'包馅'<color>, <color=red>'烘烤'<color>. 经过这三个阶段就完成了月饼.")
	elseif (step == 2) then
		Talk(1, "#about_mooncake(3)","<#> 每个阶段都有固定的制作时间，完成一个阶段之后，将有保质期(做出的月饼越美味保存的时间越久) , <color=red>50和50级以上<color>玩家在完成每个阶段之后将会得到一定的经验值.")
	elseif (step == 3) then
		Talk(1, "","<#>如果在制作期间没有经过接下来的阶段或者领取月饼，就视为失败，只能得到<color=red>烤焦的月饼<color>.")

	end
end

function main()
	local varv = GetTask(VARV_MOONCAKE)
	-- DEBUG
	--print(format("GetTask(%d):%d", VARV_MOONCAKE, varv))
	if (varv == 0) then
		local caption = "<#> 明月镇的月饼声名远播. 我们做的月饼保证好吃. 客官要买吗?"
		Say(caption,
			3,
			"<#> 我想要做月饼/talk_makemooncake",
			"<#> 与做月饼相关/#about_mooncake(1)",
			"<#> 让我想一想!/cancel")
	else
		talk_querymooncake(varv)
	end
end

function makecake_addexp(level, percent)
	if ( percent == nil or percent == 0 ) then
		return 0
	end
	local ratio = random( 15, 20 ) * percent ;
	local nExp = 0;
	if ( level == 50 ) then
		nExp = floor( 700 * ratio )
	elseif ( level > 50 and level < 100 ) then
		nExp = floor(( 700 + floor((level - 50)/5) * 100) * ratio )
	elseif ( level > 100 ) then
		nExp = floor( 1700 * ratio )
	else
		nExp = 0
	end
	return nExp
end

function nt_setTask(taskid, value)
	SetTask(taskid, value)
	SyncTaskValue(taskid) -- 同步到客户端
end

	
function ladder_mooncake_ladder(ltype)
	local RoleName = "";
	local Data = "";
	local mooncake_data = 0;
	local mapid = SubWorldIdx2ID(SubWorld);
	local ladderid = tbMOONCAKE_LADDERID[ltype][1]
	local glbvalueid = tbMOONCAKE_LADDERID[ltype][2]
	
	SetGlbValue(glbvalueid, GetGlbValue(glbvalueid) + 1)
	if (ltype == 4 or ltype == 5 or ltype == 6 ) then
		if ( GetGlbValue(glbvalueid) ~= 5) then
			return
		end
	end
	
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(ladderid, i);
		if ( RoleName == tostring(mapid) ) then
			mooncake_data = tonumber(Data)
			break
		end
	end
	
	if (mooncake_data == "" or mooncake_data == nil) then
		mooncake_data = 0
	end
	
	Ladder_NewLadder(ladderid, tostring(mapid), mooncake_data + GetGlbValue(glbvalueid), 1)
	SetGlbValue(glbvalueid, 0)
end
	
	
