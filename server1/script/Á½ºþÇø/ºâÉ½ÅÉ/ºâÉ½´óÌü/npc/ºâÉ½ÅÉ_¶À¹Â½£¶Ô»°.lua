--两湖区 衡山派 独孤剑对话 世界任务：武林向背
-- By: Dan_Deng(2004-02-03)

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\chuangong.lua")
Include("\\script\\task\\lv120skill\\head.lua")		-- 120级技能任务

Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()

	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog.szTitleMsg = "<npc>好久不见！找我有什么事?"
	tbDailog:AddOptEntry("我是特来拜访一下盟主你", old_main)
	tbDailog:AddOptEntry("盟主知道月歌岛真的存在吗?", yuegedao_help)
	tbDailog:Show()
	
--	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
--		Describe(strimg..GetName().."好久不见了，近日找我有什么事？",3,"我是特来拜访一下盟主你。/old_main", "我想打听关于传功的事情。/chuangong_info", "我想取消上次的传功申请!/cg_undo")
--	else
--		Describe(strimg..GetName().."好久不见了，近日找我有什么事？",2,"我是特来拜访一下盟主你。/old_main", "我想打听关于传功的事情。/chuangong_info" )
--		Describe(strimg..GetName().."好久不见了，近日找我有什么事？",1,"我是特来拜访一下盟主你。/old_main");
--	end
end

function old_main()
	Uworld39 = GetTask(39)
	Uworld40 = GetTask(40)
	Udate = tonumber(date("%Y%m%d"))						-- 需要转换成数值才能直接进行比较
	if (Uworld39 == 10) then									-- 任务进行中
		if (Uworld40 == 1023) then									-- bin(1111111111)，任务完成
			U39_prise()
		else
			Talk(1,"U39_progress", 11332)
		end
	elseif (Uworld39 == 0) or ((Udate > Uworld39) and (Uworld39 > 20040101)) then			-- 任务启动条件：大于20级，声望等级大于2级，任务未做过或已完成超过1日
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) then
			Say(11333 ,2,"不成问题，我可以做. /U39_yes","我现在很忙,别的时候再说. /no")
		else
			Talk(3,"", 11334, 11335, 11336)
		end
	elseif (Uworld39 >= Udate) then								-- 任务已完成，未到重复时间
		Talk(2,"", 11337, 11338)
	else																	-- 其它(???)
		Talk(1,"", 11339)
		SetTask(39,0)
		SetTask(40,0)
	end
end;

function U39_yes()
	Talk(1,"", 11340)
	SetTask(39,10)
	SetTask(40,0)
	Earn(10000)
	Msg2Player("接受武林态度任务: 替独孤剑去试探各门派的态度，是否愿同心灭金. ")
	AddNote("接受武林态度任务: 替独孤剑去试探各门派的态度，是否愿同心灭金. ")
end

function U39_prise()
	Talk(2,"", 11341, 11342)
	SetTask(39,date("%Y%m%d"))					-- 变量改为当前日期
	SetTask(40,0)									-- 子变量复位
	i = 10+random(1,10)							-- 声望随机奖励11---20点
	AddRepute(i)
	Msg2Player("完成独孤剑的武林态度任务，你的名望增加"..i.."点.")
	AddNote("回来衡山大鼎，完成独孤剑的武林态度任务")
end

function U39_progress()
	Uworld40 = GetTask(40)
	faction_list = {"峨眉派","唐门","天王帮","天忍教","武当派","翠烟门","少林派","丐帮","昆仑派","五毒教"}
	str = ""
	for i = 1,10 do									-- 检查已置位的门派，列表顺序如上面数组顺序
		if (GetBit(Uworld40,i) == 1) then
			if (str == "") then
				str = faction_list[i]
			else
--				str = str + "、" + faction_list[i]
--				str = format("%s、%d", str, faction_list[i])
				str = str..", "..faction_list[i]
			end
		end
	end
	if (str == "") then								-- 根据检查结果相应对话
		Talk(1,"", 11343)
	else
		Talk(1,"","你现在已去调查各门派: "..str..", 希望可以快一点. ")
	end
end

function no()
end

function biguan_talk()
	if (GetLevel() < 120) then
		describe_talk({npc_string(1, "你还没有到120级，功力不足，最好还是不要插手这件事.")})
	elseif (GetLastFactionNumber() == -1) then
		describe_talk({npc_string(1, "你无门无派，我和你也没有什么联系.")})
	else
		local szTemp = "Huynh "
		if (GetSex() == 1) then
			szTemp = "男性"
		end
		local tDialog =
		{
			npc_string(1, "位"..szTemp.." 这, 现在我已宣布联盟的工作已有弟子做了，你还找我有什么事吗?"),
			speak_string(1, "不敢啊盟主，我因为一点小事找你.在武林人士眼中，这段时间还算太平，没有什么正式的兵变。但是你的决定看上去有点不寻常，江湖又添了不安的一派"),
			npc_string(1, "你知道之前江湖十分躁动。我也因为近日十大门派的隐士出现在江湖上，因为武林的安宁才这样决定的."),
			speak_string(1, "如果是为了武林的安宁，难道盟主又不出面发言吗？"),
			npc_string(1, "发言？现在还不到时候，况且我也不想了解其中是事情，还说什么发言，这样我需要时间了解。阁下先回去，我还有事情要处理."),
			speak_string(1, "算了，如果这样我就不浪费帮主的时间了。啊，最后我想说的是，各位武林人士脑中无数，只有我因为这件事四处奔波，因此也希望盟主早日公布这件事的真相。我先告辞。"),
			self_string(1, "看来还有离开衡山派，自己去调查这件事了。这件事和独孤大侠有关，一定要到<color=white>大厅正门<color> 出现."),
		}
		describe_talk(tDialog)
		SetTask(LV120_SKILL_STATE, 2)
		SyncTaskValue(LV120_SKILL_STATE)
	end
end

function yuegedao_help()
	Talk(2, "yuegedao_fix", "独孤剑：我年轻时候行走江湖听过。你问了有什么事?",
													"玩家：今日月歌令又出现在江湖上，弟子得到后不知该怎么处置才好?")
end

function yuegedao_fix()
	local TSK_LV150_SKILL = 2885
	local FINAL_150SKILL_TASKSTATE = 14
	local tbname_150skill_list = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071, 1110},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
	}
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	local nLevel = GetLevel()
	if nLevel < 150 then
		Talk(1, "", "你不够150级，没有资格领月歌令!")
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
		Talk(1, "", "你还没有加入门派，没有资格领月歌令!")
		return 1
	end
	local tbSkill = tbname_150skill_list[nFact]
	local nGetAllSkill = 1
	for i = 1, getn(tbSkill) do
		local nSkillId = tbSkill[i]
		if HaveMagic(nSkillId) == -1 then
			nGetAllSkill = 0
			break
		end
	end
	local nYueGedaoStep = mod(floor(GetTask(TSK_LV150_SKILL)/100), 100)
	if nGetAllSkill == 1 or nYueGedaoStep >= FINAL_150SKILL_TASKSTATE then
		Talk(1, "", "看来你在月歌岛上已经领会了很多，你不再需要令牌了，远走江湖，你去吧.")
		return
	end
	local nTaskStep = mod(GetTask(TSK_LV150_SKILL), 100)
	if nTaskStep < tbFactStepList[nFact] then
		Talk(1, "", "之前你对师门交给的任务完成的都很好.")
		return
	end
	if CalcItemCount(-1, 6, 1, 2908, -1) > 0 then
		Talk(1, "", "明显的是你有月歌令了.")
		return
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "背包最少要有1个空格")
		return
	end
	Talk(1, "", "我还有1个月歌令，你就拿去吧，很有益的.")
	local tbAward = {
		{szName = "月歌令", tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "到独孤剑- 衡山派得到月歌令")	
end
