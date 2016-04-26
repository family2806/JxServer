--==============一般比赛相关数据===============
/*
if (not WLLS_HEAD) then
	return
end
*/
-- 奖励规则，奖品表
function tmp_help_award(tbData, nLevel)
	local tbAward	= tbData.award_rank[nLevel]
	local str = "    1. 累计奖励: 胜方获得"..(5*nLevel).."点, 和"..(2*nLevel).." 点, 负方: 0 点. 每场比赛将增加<color=red>点经验奖<color>. 胜负都有相应奖励\n"
		.."    2. 排名奖励: 比赛结束后，按照战队成绩，排行<color=red> 从1到"..tbAward[getn(tbAward)][1].."<color>, 成员可以获得排名奖励(荣誉值 .\n"
		.."    <t>排名奖励: \n"
		.."   排名    奖励"
	if (tbData.max_member ~= 1) then
		str	= str.."(战队成员)"
	end

	local nLastRank	= 1
	for nAward = 1, getn(tbAward) do
		local nRank	= tbAward[nAward][1]
		local szRank
		if (nLastRank == nRank) then
			szRank	= nRank
		else
			szRank	= nLastRank.."-"..nRank
		end
		str = str.."\n"..strfill_left(format("    次 %s ", szRank), 16)..tbAward[nAward][2].."荣誉值"
		nLastRank	= nRank + 1
	end

	return str
end

-- 帮助文字
-- 格式1：
--	{"项目名称", "帮助内容", 1/2(限定，可选)},
--	限定：1、只针对单人类型；2、只针对多人；nil、全部（下同）
-- 格式2：
--	{"项目名称", function(返回帮助内容的函数), 1/2(限定，可选)},
-- 格式3：
--	{
--		"项目名称",
--		{
--			"新秀赛帮助内容",
--			"高级赛帮助内容",
--		},
--		1/2(限定，可选)
--	},
tmp_help = {
	{
		"<t>介绍",
		{
			"    此次新秀联赛为 <color=red><s><color>, 参加人的等级需要从 <color=red>80-119<color>. 玩家去见<color=red>新秀使者<color>报名成立战队，然后进入新秀联赛会场进行比赛",
			"    此次武林联赛为 <color=red><s><color>, 参加人的等级需要从 <color=red>120<color>. 去见<color=red>联赛使者<color>, 报名成立战队，然后进入武林联赛会场进行比赛",
		}
	},
	{"报名参加比赛程序", "    在比赛阶段，玩家可以报名参加任何形式的比赛", 1},
	{"报名参加比赛程序", "报名参加 <s>, 需要成立战队。玩家可以选择自己的战队，也可以加入其他战队。队长与他人组队后，将与官员对话 <t>, 选择 <color=red>战队 <t> 立即形成战队。成员数量最多为 <color=red><d> 人<color><e>.", 2},
	{"离开比赛队 ", "    在 <color=red>离休息阶段大约<color>, 玩家可以自行脱离战队. 在比赛阶段，如果你的战队<color=red>未到比赛时候<color>, 玩家可以自行离开战队, 如果已经比赛了就不能离开. <color=yellow>离开战队后，就不能领排名奖励<color>. <color=yellow>离开战队后，将不能返回比赛<color>.", 1},
	{"离开比赛队 ", "    在<color=red>离休息阶段大约<color>, 玩家可以自行脱离战队. 在比赛阶段，如果你的战队<color=red>未到比赛时候<color>, 玩家可以自行离开战队, 如果已经比赛了就不能离开. <color=yellow>离开战队后，就不能领排名奖励<color>. 如果队长离开战队，则队长权利将转交给其他人. <color=yellow>如果战队没人了，将自动解散<color>.每次联赛结束，哪个战队不符合下次比赛就自动被解散", 2},
	{"比赛场次", "每周从周一到周四，从 <color=red>18: 00- 19: 00<color> 开业比赛<color=yellow>4 场<color>. 余下3天从 <color=red>18: 00-19: 00<color> 和 <color=red>21: 00-22: 00<color> 可以比赛 <color=yellow>8 场<color>. 整个比赛阶段<color=red>(每月从8-28)<color> 所有比赛<color=yellow>108 场<color>. 参加战队最多参加<color=red>48 场<color> "},
	{"比赛流程", "  战队队员去和<t> 对话进入会场 <t>, 然后继续和会场官员对话，就会被带入装备区域。到比赛时间，参加队员将自动被送人赛场. <color=red>可以自由选择武器和装备<color>."},
	{"比赛规则",	-- 单人
[[    1. 在比赛时间, 打败对手立即获胜
    2. 在比赛时间 <color=red>如果一边不剩一个成员了就是负方<color> 立即被处理
    3. 如果结束比赛，2边成员都是一样的，系统将会判断那边被打中的次数最少为获胜方，如果还是一样的，就是和。
    4. 如果哪队不及时进入赛场就是负方, <color=red>剩下方为胜利方<color>
    5. 计分: 胜方<pw> 点; 和<pt> 点; 负方 0 点
    6. 比赛队员只能使用在药店买的药品
    7. <color=red>进场10秒后开始比赛<color>; 比赛时间为14分50秒 
    8. 2场比赛休息间隔 <color=red>10 分钟<color>. <color=red>准备时间<color> 5 分钟
]], 1},
	{"比赛规则",	-- 多人
[[    1. 在比赛时间 <color=red>哪边全部死亡color> 就为负方, 比赛结束
    2. 在比赛时间 <color=red>如果一边不剩一个成员了就是负方<color> 立即被处理
    3. 比赛时间结束 <color=red>哪边剩余的成员最多为胜方<color>. 如果 <color=red>2方人数一样<color> 则被打中最少的一方取胜。否则为和。
    4. 如果哪队不及时进入赛场就是负方, <color=red>剩下方为胜利方<color>
    5. 计分: 胜方<pw> 点; 和<pt> 点; 负方 0 点
    6. 比赛队员只能使用在药店买的药品
    7. <color=red>进场10秒后开始比赛<color>; 比赛时间为14分50秒
    8. 每场比赛准备时间为 <color=red>5 分钟<color>
]], 2},
	{"击中次数",
[[击中次数：就是被对方用锤子，毒，或者被打中受伤次数

计算被打中次数规则
    1. 每场被对方打中，血量减少
    2. 被对方的锤子打中，血量减少
    3. 被对方反击打中，血量减少
    4. 被对方毒中，血量减少
    5. 如果因为使用技能导致血量减少就不被计入被打中次数内
]]
	},
	{"报名规则", "     <color=red>比赛积分 <t><color>用于作为排行依据 <t>. 结束比赛<color=red><pw><color>点, 和<color=red><pt><color> 点; 负方 <color=red>0<color> 点. 每次<t>结束，根据<color=red>战队总积分<color>排名. 如果积分一样，将根据<color=yellow>胜利比例<color> 排行。如果胜利比例一样，将根据<color=green> 每个战队比赛总时间<color> 排行。比赛阶段<t> 后，积分将重新计算"},
	{"了解更多详情", tmp_help_award},
}

tmp_main = {	--officer主对话
	"江湖风波乱起，但是，否极泰来。当一个新秀英雄出现的时候，也是一个新的历史被载入史册。谁会是同一天下的新英雄呢?",
	"为了避免英雄豪杰再一次纷争，独孤盟主举行了比赛来找出人才，服务国家",
}

tmp_creat = "    建立战队参加后<s>, 你可以 <color=red>自己做队长<color><enter>"
	.."   建立战队后，无论何时，你都可以请他人参加或者加入其他队。每个战队最多只能<d> 人 (包括队长). <color=red>如果未到比赛时候<color> 也 <color=red>未赛过任何场次<color>, 你可以随意离开战队。你确定建立自己的战队吗？"

--====Functions====
--返回当前角色可以参加的比赛类型，nil为不能参赛
function tmp_player_type()
	local nLevel = wlls_player_level()
	return iif(nLevel > 0, nLevel, nil)
end

--检查当前角色是否可以加入指定的战队
function tmp_check_addmem(n_capidx, n_lid, n_mtype)
	if (n_mtype ~= wlls_player_type()) then
	 	return "对不起，队中队员:"..GetName().." 和 <color=red>比赛类型<color> 不符合，所以，不能进入你的战队!"
	end
end

function tmp_str(str, tbData)
	str	= gsub(str, "<s>", tbData.name)
	str	= gsub(str, "<d>", tbData.max_member)
	str	= gsub(str, "<e>", tbData.addmem_ex)
	return str
end

function tmp_process_data(tbData)
	-- 默认值
	if (not tbData.addmem_ex) then
		tbData.addmem_ex	= ""
	end
	if (not tbData.text_creat) then
		tbData.text_creat	= tmp_str(tmp_creat, tbData)
	end
	if (not tbData.player_type) then
		tbData.player_type	= tmp_player_type
	end
	if (not tbData.check_addmem) then
		tbData.check_addmem	= tmp_check_addmem
	end

	--建立地图索引（快速找到某一地图对应的比赛类型、场地组编号、场地类型）
	local tbMapIdx = {}
	for nMType, tbMType in tbData.match_type do
		for nGroup, tbGroup in tbMType.map do
			for i = 1, 3 do
				tbMapIdx[tbGroup[i]] = {nMType, nGroup, i}
			end
		end
	end
	tbData.map_index = tbMapIdx

	-- 处理帮助文字
	local nCount = 0
	local nMultiple = iif(tbData.max_member == 1, 1, 2)
	local tbSpecialHelp	= tbData.help_msg	-- 特定帮助信息
	if (not tbSpecialHelp) then
		tbSpecialHelp	= {}
	end
	tbData.help_msg	= {}
	for _, tbTopic in tmp_help do
		local szTitle	= tmp_str(tbTopic[1], tbData)
		local varText, nLimit
		if (tbSpecialHelp[tbTopic[1]]) then	-- 有自定义帮助信息
			varText	= tbSpecialHelp[tbTopic[1]]
			nLimit	= nil
		else
			varText	= tbTopic[2]
			nLimit	= tbTopic[3]
		end
		if (not nLimit or nLimit == nMultiple) then
			nCount	= nCount + 1
			local szType	= type(varText)
			local tbText	= {"", ""}
			if (szType == "function") then
				tbText[1]	= varText(tbData, 1)
				tbText[2]	= varText(tbData, 2)
			elseif (szType == "table") then
				tbText[1]	= varText[1]
				tbText[2]	= varText[2]
			else
				tbText[1]	= tostring(varText)
				tbText[2]	= tbText[1]
			end

			tbData.help_msg[nCount]	= {}
			for nLevel = 1, 2 do
				tbText[nLevel]	= tmp_str(tbText[nLevel], tbData)
				tbText[nLevel]	= gsub(tbText[nLevel], "<t>", WLLS_LEVEL_DESC[nLevel])
				tbText[nLevel]	= gsub(tbText[nLevel], "<pw>", 5*nLevel)
				tbText[nLevel]	= gsub(tbText[nLevel], "<pt>", 2*nLevel)
				tbData.help_msg[nCount][nLevel]	= {
					gsub(szTitle, "<t>", WLLS_LEVEL_DESC[nLevel]),
					tbText[nLevel],
				}
			end
		end
	end

	-- 处理Officer主对话文字
	tbData.text_main[1]	= tmp_main[1]..tbData.text_main[1]
	tbData.text_main[2]	= tmp_main[2]..tbData.text_main[2]
end
