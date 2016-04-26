-- zuofanggongren.lua 
-- �������˽ű�
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")
IncludeLib("TIMER")
IncludeLib("RELAYLADDER")


-- ��ͬ�����±��ĵȴ�ʱ��
tbl_time_wait = {
	[TYPE_SHIJIN		  ] = 600,
	[TYPE_GUOREN		  ] = 300,
	[TYPE_DANHUANGLIANRONG] = 180,
	[TYPE_DANHUANGDOUSHA  ] = 180,
	[TYPE_LIANRONG		  ] = 180,
	[TYPE_DOUSHA		  ] = 180,
};

tbl_finish_stat = {
	[STAT_HUOMIAN_MAKING] = STAT_HUOMIAN_FINISH,	-- �������
	[STAT_BAOXIAN_MAKING] = STAT_BAOXIAN_FINISH,	-- �������
	[STAT_HONGKAO_MAKING] = STAT_HONGKAO_FINISH,	-- �濾���
};

tbl_making_msg = {
	[STAT_BAOXIAN_MAKING] = "<#> ��ʼ��<color=yellow>��<color>",
	[STAT_HONGKAO_MAKING] = "<#> ��ʼ<color=yellow>���±�<color>",
};

-- ��ͬ���͵��±�
tbl_mooncake = {
	"<#> ʲ���±�",
	"<#> �����±�",
	"<#> ���������±�",
	"<#> ���ƶ�ɳ�±�",
	"<#> �����±�",
	"<#> ��ɳ�±�",
};

tbl_mooncake_item = {
	{6, 1, 896, 1, 0, 0, 379}, -- ʲ���±�,
	{6, 1, 895, 1, 0, 0, 251}, -- �����±�,
	{6, 1, 894, 1, 0, 0, 188}, -- ���������±�,
	{6, 1, 893, 1, 0, 0, 187}, -- ���ƶ�ɳ�±�,
	{6, 1, 892, 1, 0, 0, 186}, -- �����±�,
	{6, 1, 891, 1, 0, 0, 185}, -- ��ɳ�±�,
};

-- �±��Ƿ���Ҫ���������е��������˴���ȡ����
tbl_mooncake_exchangable = {
	1, -- ʲ���±�
	1, -- �����±�
	0, -- ���������±�
	1, -- ���ƶ�ɳ�±�
	0, -- �����±�
	1, -- ��ɳ�±�
};

-- ������ͬ���͵��±���Ҫ�Ĳ���
tbl_mooncake_material = {
	--�� ���� ���� Ҭ˿ ��� ɰ�� ���� ��ɳ
	{0,	1, 1, 3, 4, 4, 1, 1},	-- ʲ���±���4���+4ɰ��+��ɳ+����+����+����+3Ҭ˿
	{0, 1, 2, 0, 6, 6, 0, 0},	-- �����±���6���+6ɰ��+1����+2����
	{2, 0, 0, 0, 5, 6, 2, 0},	-- ���������±���5���+6ɰ��+2����+2��
	{2, 0, 0, 0, 6, 5, 0, 2},	-- ���ƶ�ɳ�±���6���+5ɰ��+2��ɳ+2��
	{0, 0, 0, 0, 5, 8, 2, 0},	-- �����±���5���+8ɰ��+2����
	{0, 0, 0, 0, 8, 5, 0, 2},	-- ��ɳ�±���8���+5ɰ��+2��ɳ
};

-- ȷ��Ҫ�����±��ĶԻ�
tbl_mooncake_talk = {
	"<#> <color=red>ʲ���±�<color> ��Ҫ�� 4��ۣ�4ɰ�ǣ�1��ɳ��1���أ�1���ʣ�1������3Ҭ˿. ��˵����Ҭ˿ֻ���Ϸ����У��ܹ�ģ������������Ҫǧ��С�ģ���ʼ����?",
	"<#> <color=red>�����±�<color> ��Ҫ��6��ۣ�6ɰ�ǣ�1���ʣ�2����. ��һ�㻨������֮��ŵ��±�������ſ������±�����ɢ������ζ.����˵�ˣ����Կ�ʼ����?",
	"<#> <color=red>���������±�<color> ��Ҫ��5��ۣ�6ɰ�ǣ�2���أ�2��. Ҫ��������һ���������ڣ���һ���ں濾��ʱ��Ϳ����Ƥ�ϣ�����СʱͿһ��.��Ҫ��˵�ˣ����Կ�ʼ����?",
	"<#> <color=red>���ƶ�ɳ�±�<color> ��Ҫ��6��ۣ�5ɰ�ǣ�2��ɳ��2��. ��֪����Ҫ��������һ���������ڣ���һ���ڿ���ʱ��Ϳ����Ƥ�ϣ���СʱͿһ��.��Ҫ��˵�ˣ����Կ�ʼ����?",
	"<#> <color=red>�����±�<color> ��Ҫ��5��ۣ�8ɰ�ǣ�2����. �ؾ���Ҫ�����ӵ���ȥ����ͬʱҪ���ǽ�����һ�������ſ�����������ζ���±�.����˵�ˣ����Կ�ʼ����?",
	"<#> <color=red>��ɳ�±�<color> ��Ҫ��8��ۣ�5ɰ�ǣ�2��ɳ. ��ҪС������±������ĺó�Ҫ���ؾ����ö�ɳ��˵���ڽ�����֮��Ҫ��Ƥȥ�˲ſ����룬�����Ż�����ζ. ����˵�ˣ����Կ�ʼ�˰�?",
};

-- ��ͬ�±�״̬�ĶԻ�
tbl_maketalk = {
	-- �������
	[STAT_HUOMIAN_FINISH] = {
		"<#> �������, ���ڿ�ʼ���ڣ���ҪһЩʱ�䣬�����æ�ˣ����������ڼ��㲻���뿪��������ɺ��һ�����㣬�����ҽ����Ҫ���̸ϻ�����ԭ��ʱ��žûỵ��!",
		"<#> ��֪���ˣ���ʼ��!/keep_making_mooncake",
		"<#> һ�����!/cancel"},
	-- �������
	[STAT_BAOXIAN_FINISH] = {
		"<#>�������ˣ���ʼ�濾��Ҫһ��ʱ�䣬�����æ�ˣ��ڴ��ڼ��㲻���뿪�����򣬺����һ�����㣬��ס�����ҽ�������̵����ﲻȻ�Ļ��±��ͺ���!",
		"<#> ��֪���ˣ���ʼ��!/keep_making_mooncake",
		"<#> һ�����!/cancel"},
};


tbl_stoptalk = {
	-- ���ں���
	[STAT_HUOMIAN_MAKING] = {
		"<#> ��������ҿ�ʼ�����ˣ���Ҫһ��ʱ�䣬�����æ�ˣ������ڼ��㲻���뿪��������ɺ��һ�����㣬�����ҽ����Ҫ���̸ϻ�����ԭ��ʱ��žûỵ��!",
		"<#> ��֪���ˣ���ʼ��!/resume_making_mooncake",
		"<#> һ�����!/cancel"},
	-- ���ڰ���
	[STAT_BAOXIAN_MAKING] = {
		"<#> ��ͺ��ˣ����ڿ�ʼ���ڣ���Ҫһ��ʱ�䣬Ҫ���æ�ˣ���������ʱ���㲻���뿪��������ɺ��һ�����㣬�����ҽ����Ҫ���̸ϻ�����ԭ��ʱ��žûỵ��!",
		"<#> ��֪���ˣ���ʼ�ɣ�resume_making_mooncake",
		"<#> һ�����!/cancel"},
	-- ���ں濾
	[STAT_HONGKAO_MAKING] = {
		"<#> �ڰ����ˣ����ڿ�ʼ�濾��Ҫһ��ʱ�䣬�����æ�ˣ��ڴ��ڼ��㲻���뿪�����򣬺����һ�����㣬��ס�����ҽ�������̵����ﲻȻ�Ļ��±��ͺ���!",
		"<#> ��֪���ˣ���ʼ�ɣ�resume_making_mooncake",
		"<#> һ�����!/cancel"},
};

-- ��������
tbl_stepname = {
	[STAT_HUOMIAN_MAKING] = "<#> ����",	-- ���ں���
	[STAT_BAOXIAN_MAKING] = "<#> ����",	-- ���ڰ���
	[STAT_HONGKAO_MAKING] = "<#> �濾",	-- ���ں濾
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

-- ȷ��Ҫ�������±�����
function confirm_mooncake(ltype)
	Say(tbl_mooncake_talk[ltype], 2,
		"����./" .. format("#make_mooncake(%d)", ltype),
		"������Ҫ��һ��!/cancel")
end

-- �Ի��������±�
function talk_makemooncake()
	local caption = "<#> �±�ʦ��: ���ǳ������±��Ķ����ط������������±��������������޵Ŀ���. ��Ҫ�������±�?"
	Say(caption,
		7,
		"<#> ��Ҫ����ɳ�±�/" .. format("#confirm_mooncake(%d)", TYPE_DOUSHA),
		"<#> ��Ҫ�������±�/" .. format("#confirm_mooncake(%d)", TYPE_LIANRONG),
		"<#> ��Ҫ�����ƶ�ɳ�±�/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGDOUSHA),
		"<#> ��Ҫ�����������±�/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGLIANRONG),
		"<#> ��Ҫ�������±�/" .. format("#confirm_mooncake(%d)", TYPE_GUOREN),
		"<#> ��Ҫ��ʲ���±�/" .. format("#confirm_mooncake(%d)", TYPE_SHIJIN),
		"<#> ��ֻ��·������/cancel")
end

-- �Ի�������±�����״̬
function talk_querymooncake(varv)
	local ltype = floor(varv / 1000)	-- �±�����
	local stat = mod(varv, 1000)	-- �±�״̬
	name = tbl_mooncake[ltype]
	-- �±�������
	if (stat == STAT_PARCHED or stat == STAT_HUOMIAN_PARCHED) then
		Say("<#> �͹��治����˼���ҿ�����ô�ö�û�����±��Ѿ�������!",
			1,
			"<#> �õ��������±�/#take_parched_mooncake("..stat..")")
	-- �±�������
	elseif (stat == STAT_HONGKAO_FINISH) then
		close_hint()
		local caption = ""
		if (tbl_mooncake_exchangable[ltype] == 1) then
			caption = "<#> ��λ�͹�, <color=red>" .. tbl_mooncake[ltype] .. "<color> �Ѿ������ˣ����𣿸Ͽ�����һ�£���˵������һλ��ϲ�����±����������ˣ�����±���ȥ����˵�����������벻���������أ�"
		else
			caption = "<#> ��λ�͹�, <color=red>" .. tbl_mooncake[ltype] .. "<color> �Ѿ������ˣ����𣿸Ͽ�����һ��!"
		end
		Say(caption, 1, "<#> �õ��±�/" .. format("#take_mooncake(%d)", ltype))
	elseif (tbl_stoptalk[stat] ~= nil) then		-- ������
		-- ��ͣ
		if (TM_IsTimerSuspending(TIMER_MOONCAKE) == 1) then
			Say(tbl_stoptalk[stat][1], 2, tbl_stoptalk[stat][2], tbl_stoptalk[stat][3])
		-- �±�������
		else
			local talk = "<#> �͹ٲ�Ҫ�ż�, <color=red>" .. tbl_mooncake[ltype] .. "<color> ����<color=red>" .. tbl_stepname[stat] .. "<color>, ����׶ν������һ������!"
			Talk(1, "", talk)
		end
	elseif (tbl_maketalk[stat] ~= nil) then		-- �������
		close_hint()
		-- ��ͣ��ʱ
		TM_SuspendTimer(TIMER_MOONCAKE)
		Say(tbl_maketalk[stat][1], 2, tbl_maketalk[stat][2], tbl_maketalk[stat][3])
	else
		print("MOONCAKE: something is wrong!!!")
	end
end

-- ���㵱ǰ������Ҫ������ʱ��
function get_make_time()
	return random(30, 60)
end

-- ����������ϵ��±�ԭ��
function consume_material(ltype)
	local material_list = tbl_mooncake_material[ltype]
	-- ���ԭ���Ƿ����
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			local curr_count = CalcEquiproomItemCount(material_item[2], material_item[3], 1, -1)
			if (curr_count < want_count) then
				Talk(1, "", "<#>�͹٣������ϵĲ��ϲ������ҹ�ԭ��֮��������!")
				return 0
			end
		end
	end
	-- ����ԭ��
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			ConsumeEquiproomItem(want_count, material_item[2], material_item[3], 1, -1)
		end
	end
	return 1
end

-- ��ʼ�����±�
function make_mooncake(ltype)
	if (consume_material(ltype) == 1) then
		local varv = ltype * 1000 + STAT_HUOMIAN_MAKING
		nt_setTask(VARV_MOONCAKE, varv)
		-- DEBUG
		--print(format("make_mooncake: nt_setTask(%d, %d)", VARV_MOONCAKE, varv))
		local resttime = get_make_time()
		TM_SetTimer(resttime * 18,
			TIMER_MOONCAKE,
			1,	-- ��ʱ��ִֻ��һ�� 
			2);	-- ��ʱ���������ʱ��Ϊ׼
		-- DEBUG
		--print(format("TM_SetTimer(%d, %d, %d, %d)", resttime * 18, TIMER_MOONCAKE, 1, 2))
		TM_SuspendTimer(TIMER_MOONCAKE)
		
		Say("<#>�����Ļ�������<color=red>����<color>, ��Ҫһ��ʱ�䣬�����æ�ˣ���������ڼ��㲻���뿪��������ɺ��һ�����㣬�����ҽ����Ҫ���̸ϻ�����ԭ��ʱ��žûỵ��!",
			2,
			"<#> ��֪���ˣ���ʼ�ɣ�resume_mooncake",
			"<#> һ�����!/cancel")
	end
end

-- �ָ������±�
function resume_mooncake()
	Msg2Player("<#> ���ڿ�ʼ<color=yellow>���� <color>��y!")
	TM_ResumeTimer(TIMER_MOONCAKE)
end

-- ���������±�
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
			1,	-- ��ʱ��ִֻ��һ�� 
			2);	-- ��ʱ���������ʱ��Ϊ׼
	end
end

-- ��ȡ�������±�
function take_parched_mooncake(stat)
	local varv = GetTask(VARV_MOONCAKE)
	local lstat = mod(varv, 1000)		-- �±�״̬
	if (lstat == STAT_HUOMIAN_PARCHED or lstat == STAT_PARCHED) then
		nt_setTask(VARV_MOONCAKE, 0)
		AddItem(6,1,890,1,0,0)
		Msg2Player("<#> ��õ�һ�����õ��±�")
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

-- ��ȡ���õ��±�
function take_mooncake(ltype)
	local varv = GetTask(VARV_MOONCAKE)
	local stat = mod(varv, 1000)		-- �±�״̬
	local type = floor(varv / 1000)		-- �±�����
	if (type == ltype and stat == STAT_HONGKAO_FINISH) then
		nt_setTask(VARV_MOONCAKE, 0)
		local cakename = tbl_mooncake[ltype]
		local item = tbl_mooncake_item[ltype]
		AddItem(item[1], item[2], item[3], item[4], item[5], item[6])
		Msg2Player("<#> ��õ�һ��<color=yellow>" .. cakename .. "<color>")
		if (ltype == 1) then
			AddGlobalNews("<#> ��ϲ���"..GetName().."<#> ������ʲ���±�")
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

-- ������ɵ���Ӧ����
function timeout_make(ltype, stat)
	local finish_stat = tbl_finish_stat[stat];
	-- DEBUG
	--print(format("Msg2Player(%s)", tbl_notice[finish_stat]))
	Msg2Player(tbl_notice[finish_stat])

	-- ��ǰ�׶�����ˣ��ȴ����ִ����һ����
	-- DEBUG
	--print(format("timeout_make(%d, %d)", ltype, stat))
	nt_setTask(VARV_MOONCAKE, ltype * 1000 + finish_stat)
	-- DEBUG
	--print(format("timeout_make: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + finish_stat))
	TM_SetTimer(tbl_time_wait[ltype] * 18,
		TIMER_MOONCAKE,
		1,	-- ��ʱ��ִֻ��һ�� 
		2);	-- ��ʱ���������ʱ��Ϊ׼
	-- ����������ȡ�±��Ķ�ʱ��
	start_hint()
end

-- �ȴ���ʱ����Ӧ����
function timeout_wait(ltype, stat)
	close_hint()
	-- �ȴ���ʱ�䵽�ˣ���һ�û��ִ����һ�����±�����
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

-- ��ͬ״̬�Ķ�ʱ��
tbl_timer = {
	[STAT_HUOMIAN_MAKING] = timeout_make,	-- ���ں���
	[STAT_HUOMIAN_FINISH] = timeout_wait,	-- �������
	[STAT_BAOXIAN_MAKING] = timeout_make,	-- ���ڰ���
	[STAT_BAOXIAN_FINISH] = timeout_wait,	-- �������
	[STAT_HONGKAO_MAKING] = timeout_make,	-- ���ں濾
	[STAT_HONGKAO_FINISH] = timeout_wait,	-- �濾���
};

-- ��ʱ��
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

-- ����˵��
function about_mooncake(step)
	if (step == 1) then
		Talk(1,"#about_mooncake(2)","<#> �±�ʦ��:���±�Ҫ����<color=red>3<color> �׶�. ѡ����Ҫ�������±����࣬׼����ԭ�ϣ�������������: <color=red>'����<color>', <color=red>'����'<color>, <color=red>'�濾'<color>. �����������׶ξ�������±�.")
	elseif (step == 2) then
		Talk(1, "#about_mooncake(3)","<#> ÿ���׶ζ��й̶�������ʱ�䣬���һ���׶�֮�󣬽��б�����(�������±�Խ��ζ�����ʱ��Խ��) , <color=red>50��50������<color>��������ÿ���׶�֮�󽫻�õ�һ���ľ���ֵ.")
	elseif (step == 3) then
		Talk(1, "","<#>����������ڼ�û�о����������Ľ׶λ�����ȡ�±�������Ϊʧ�ܣ�ֻ�ܵõ�<color=red>�������±�<color>.")

	end
end

function main()
	local varv = GetTask(VARV_MOONCAKE)
	-- DEBUG
	--print(format("GetTask(%d):%d", VARV_MOONCAKE, varv))
	if (varv == 0) then
		local caption = "<#> ��������±�����Զ��. ���������±���֤�ó�. �͹�Ҫ����?"
		Say(caption,
			3,
			"<#> ����Ҫ���±�/talk_makemooncake",
			"<#> �����±����/#about_mooncake(1)",
			"<#> ������һ��!/cancel")
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
	SyncTaskValue(taskid) -- ͬ�����ͻ���
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
	
	
