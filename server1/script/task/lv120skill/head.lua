Include("\\script\\global\\login_head.lua")
-- 120级技能任务头文件

LV120_SKILL_STATE = 2450	-- 存放当前任务状态的全局任务变量，初始值为1，为0表示任务已经完成
LV120_SKILL_ID = 2463		-- 纪录玩家120级技能ID
LOCK_MAP_SEQUENCE =		-- 存放解锁图顺序的全局任务变量
{
	{2451, 2452, 2453, 2454, 2455, 2456},	-- 第一重锁解锁图顺序
	{2457, 2458, 2459, 2460, 2461, 2462},	-- 第二重锁解锁图顺序
}

DGJ_WULINMIJI	= {6, 1, 1120}	-- 不太寻常的武林秘籍
COFFIN_MAP		= {6, 1, 1119}	-- 汴京东部事发点地图
COFFIN			= {6, 1, 1121}	-- 神秘棺木
LOCK_MAP1		= {6, 1, 1122}	-- 棺木解锁图 第一重锁
LOCK_MAP2		= {6, 1, 1123}	-- 棺木解锁图 第二重锁
CADAVER			= {6, 1, 1124}	-- 奇异死尸
LV120SKILLBOOK	= {6, 1, 1125}	-- 120级技能诀要

COFFIN_POSITION = {37, 1832, 3439, 6, 6}	-- 棺材所在位置{地图, X坐标, Y坐标, X误差, Y误差}

LV120SKILL_NEW_NPC =	-- 新建NPC列表
{	-- 格式 {NpcId, MapId, X, Y, Name, Script},
	{1203, 57, 1583, 3203, " ", "\\script\\task\\lv120skill\\npc\\衡山大厅_独孤剑的武林秘籍.lua"},
}

ORG_WULIMIJI	= {6, 1, 26}		-- 普通的武林秘籍
BANRUOXINJING	= {6, 1, 12}		-- 般若心经
XISUIJING		= {6, 1, 22}		-- 洗髓经
XINGHONGBAOSHI	= {4, 353, 1}		-- 猩红宝石
CRYSTAL =
{
	{4, 238, 1},		-- 蓝水晶
	{4, 239, 1},		-- 紫水晶
	{4, 240, 1},		-- 绿水晶
}
BLUE_C = 1
PURPLE_C = 2
GREEN_C = 3

LOCK_MAP1_KEY =			-- 第一重锁答案
{
	{1,  CRYSTAL[GREEN_C]},
	{3,  CRYSTAL[PURPLE_C]},
	{11, CRYSTAL[BLUE_C]},
	{14, CRYSTAL[BLUE_C]},
	{22, CRYSTAL[PURPLE_C]},
	{24, CRYSTAL[GREEN_C]},
}

LOCK_MAP2_KEY =			-- 第二重锁答案
{
	{2,  CRYSTAL[GREEN_C]},
	{6,  CRYSTAL[PURPLE_C]},
	{10, CRYSTAL[BLUE_C]},
	{15, CRYSTAL[BLUE_C]},
	{19, CRYSTAL[GREEN_C]},
	{23, CRYSTAL[PURPLE_C]},
}

FACTION_TEXT = 			-- 门派相关文本定义
{
	[0] = {"<link=image[0,14]:\\spr\\npcres\\enemy\\enemy037\\enemy037_pst.spr>", "玄仁方丈", "方丈"},	-- 少林
	[1] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy084\\enemy084_pst.spr>", "杨英", "帮主"},		-- 天王
	[2] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy077\\enemy077_pst.spr>", "唐仇", "掌门"},		-- 唐门
	[3] = {"<link=image[0,12]:\\spr\\npcres\\enemy\\enemy091\\enemy091_pst.spr>", "黑面郎君", "教主"},	-- 五毒
	[4] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy055\\enemy055_pst.spr>", "清晓师太", "掌门"},	-- 峨嵋
	[5] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy098\\enemy098_pst.spr>", "尹含安", "掌门"},		-- 翠烟
	[6] = {"<link=image[0,19]:\\spr\\npcres\\enemy\\enemy071\\enemy071_pst.spr>", "何人我", "帮主"},	-- 丐帮
	[7] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy103\\enemy103_pst.spr>", "完颜洪烈", "教主"},	-- 天忍
	[8] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy046\\enemy046_pst.spr>", "道一真人", "掌门"},	-- 武当
	[9] = {"<link=image[0,22]:\\spr\\npcres\\enemy\\enemy065\\enemy065_pst.spr>", "全机子", "掌门"},	-- 昆仑
}

FACTION_BOOK =			-- 门派技能书
{
	[0] = {{6, 1, 56}, {6, 1, 57}, {6, 1, 58}},				-- 少林
	[1] = {{6, 1, 37}, {6, 1, 38}, {6, 1, 39}},				-- 天王
	[2] = {{6, 1, 27}, {6, 1, 28}, {6, 1, 45}, {6, 1, 46}},	-- 唐门
	[3] = {{6, 1, 47}, {6, 1, 48}, {6, 1, 49}},				-- 五毒
	[4] = {{6, 1, 42}, {6, 1, 43}, {6, 1, 59}},				-- 峨嵋
	[5] = {{6, 1, 40}, {6, 1, 41}},							-- 翠烟
	[6] = {{6, 1, 54}, {6, 1, 55}},							-- 丐帮
	[7] = {{6, 1, 35}, {6, 1, 36}, {6, 1, 53}},				-- 天忍
	[8] = {{6, 1, 33}, {6, 1, 34}},							-- 武当
	[9] = {{6, 1, 50}, {6, 1, 51}, {6, 1, 52}},				-- 昆仑
}

DIALOG_UI_TEXT =			-- 对话UI显示
{
	{"<link=image[0,10]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>", "独孤剑"},			-- 1 独孤剑
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby040\\passerby040s2.spr>", "汴京车夫"},	-- 2 汴京车夫
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby072\\passerby072s1.spr>", "贾神算"},	-- 3 贾神算
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_wulin.spr>", "武林秘籍"},						-- 4 不寻常的武林秘籍
	{"<link=image:\\spr\\Ui3\\120级技能任务\\bianjing_southeast.spr>", "汴京东部事发点地图"},	-- 5 汴京东部事发点地图
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_coffin.spr>", "神秘棺木"},					-- 6 神秘棺木
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_lockinfo.spr>", "棺木解锁图"},				-- 7 棺木解锁图
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_corpse.spr>", "奇异死尸"},					-- 8 奇异死尸（运功前）
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_corpse1.spr>", "奇异死尸"},					-- 9 奇异死尸（运功后）
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_stunt.spr>", "120技能"},				-- 10 120级技能决要
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-01.spr>", "碎片1棺木解锁图"},			-- 11-16 棺木解锁图一 碎片
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-02.spr>", "碎片1棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-03.spr>", "碎片1棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-04.spr>", "碎片1棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-05.spr>", "碎片1棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-06.spr>", "碎片1棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-01.spr>", "碎片2棺木解锁图"},			-- 17-22 棺木解锁图二 碎片
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-02.spr>", "碎片2棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-03.spr>", "碎片2棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-04.spr>", "碎片2棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-05.spr>", "碎片2棺木解锁图"},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-06.spr>", "碎片2棺木解锁图"},
}

LV120SKILL_LIST =			-- 120级技能列表
{
	[0] = {709, 1, 0, 120, "120技能", "大乘如来咒"},	-- 少林
	[1] = {708, 1, 1, 120, "120技能",	"到虚天"},		-- 天王
	[2] = {710, 1, 2, 120, "120技能",	"觅影踪"},		-- 唐门
	[3] = {711, 1, 3, 120, "120技能",	"吸晶掩"},		-- 五毒
	[4] = {712, 1, 4, 120, "120技能",	"闭月佛城"},	-- 峨嵋
	[5] = {713, 1, 5, 120, "120技能",	"御诀隐"},		-- 翠烟
	[6] = {714, 1, 6, 120, "120技能",	"浑天气功"},	-- 丐帮
	[7] = {715, 1, 7, 120, "120技能",	"魔音飞魄"},	-- 天忍
	[8] = {716, 1, 8, 120, "120技能",	"出淤不染"},	-- 武当
	[9] = {717, 1, 9, 120, "120技能",	"两仪真气"},	-- 昆仑
}

g_DescTable = {}		-- 全局临时对话字符串数组

function init_lv120skill()					-- 初始化任务
	if (GetTask(LV120_SKILL_STATE) == 0) then
		SetTask(LV120_SKILL_STATE, 1)
	end
	SyncTaskValue(LV120_SKILL_STATE)
	SyncTaskValue(LV120_SKILL_ID);
	lv120skill_debug()	-- 自动处理异常
end

function describe_talk(tDialog, szCall)		-- 对话函数
	local i = 0
	if (getn(tDialog) == 0) then return end
	repeat
		i = i + 1
	until (g_DescTable[i] == nil)
	g_DescTable[i] = tDialog
	if (szCall == nil) then szCall = "" end
	describe_basic(1, i, szCall)	
end

function describe_basic(nSeq, idxTable, szCallback)		-- 对话递归函数（内部）
	local tDialog = g_DescTable[idxTable]
	if (nSeq == getn(tDialog)) then
		if (szCallback == "") then
			Describe(tDialog[nSeq], 1, "结束对话/quit")
		else
			Describe(tDialog[nSeq], 1, "继续对话 /"..szCallback)
		end
		g_DescTable[idxTable] = nil
		return
	end
	Describe(tDialog[nSeq], 1, "继续对话 /#describe_basic("..(nSeq + 1)..", "..idxTable..", [["..szCallback.."]])")
end

function npc_string(nNpc, szDisplay, bFaction)			-- 获得NPC对玩家说话的字符串
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..tab[2].."<link>:"..szDisplay
end

function speak_string(nNpc, szDisplay, bFaction)		-- 获得玩家对NPC所说话的字符串
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..GetName().."<link>:"..szDisplay
end

function self_string(nNpc, szDisplay, bFaction)			-- 获得玩家自白字符串
	if (nNpc == 0) then		-- 0表示无图示
		return "<color=orange>"..szDisplay.."<color>"
	end
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1].."<link><color=orange>"..szDisplay.."<color>"
end

function add_lv120skillnpc()			-- 添加任务NPC
	for i = 1, getn(LV120SKILL_NEW_NPC) do
		local Tab = LV120SKILL_NEW_NPC[i]
		local idxMap = SubWorldID2Idx(Tab[2]);
		if (idxMap >= 0) then
			local idxNpc = AddNpc(Tab[1], 1, idxMap, Tab[3] * 32, Tab[4] * 32, 1, Tab[5])
			SetNpcScript(idxNpc, Tab[6])
		end
	end
end

function generate_sequence(tab)			-- 生成随机序列

	local nCount = getn(tab)
	local temp, nSeq, bAct = {}, 0, 0

	for i = 1, nCount do
		tinsert(temp, i)
		if (GetTask(tab[i]) < 1) or (GetTask(tab[i]) > getn(tab)) then bAct = 1 end	-- 如果有不合法编码则全部重建
	end

	if (bAct == 1) then
		for i = 1, nCount do
			nSeq = random(1, getn(temp))
			SetTask(tab[i], temp[nSeq])
			SyncTaskValue(tab[i])
			tremove(temp, nSeq)
		end
	end

end

function add_item(tab)							-- 添加道具
	return AddItem(tab[1], tab[2], tab[3], 1, 0, 0)
end

function display_clip(nLockMap, nSeq, szCall)	-- 显示一张碎片
	local nIndex = 10 + 6 * (nLockMap - 1) + GetTask(LOCK_MAP_SEQUENCE[nLockMap][nSeq])
	Describe(DIALOG_UI_TEXT[nIndex][1]..DIALOG_UI_TEXT[nIndex][2].."<link>", 2, "确定/"..szCall, "关闭quit")
end

function lv120skill_report()					-- 向掌门报告情况
	local tDialog
	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	if (nFaction == 0) or (nFaction == 8) or (nFaction == 6) or (nFaction == 4) then	-- 正派
		tDialog =
		{
			npc_string(nFaction, "哎呀，原来你已知道了故事。最近江湖突然变动，在宋国，从头到尾都乌云密布，我也想到了这件事，但是因为"..szCall.." 不能组织调查该事。然后，一些江湖隐士重出江湖，调查该事。他们发现眉目，一天天显露出来，眉目显示，暗指阴谋为：天忍教!", 1),
			speak_string(nFaction, "看起来真相已清楚了，真是天忍阴谋。只有调查各种动物发现，在尸体上留下的印记在江湖上未出现过，此外，出现很多异常蝙蝠，这是否是新的天忍邪术?", 1),
			npc_string(nFaction, "为了保卫大宋，保卫正义，我准备了对付此事的对策。我和一些高手闭关创造了一招上乘绝学。你一个人找到很重要的眉目，真是值得表扬。我决定传与你上乘武功，希望你以后能已天下为己任.", 1),
			speak_string(nFaction, "多谢 "..szCall.."遵循"..szCall.."教训.", 1),
			npc_string(nFaction, "时间紧迫，所以该武功只能传授一部分，以后要努力修炼。该武功只传与你，其他门派弟子还不知道。为了防止生事，我已将口诀写好了，你自己研究吧。按你现在的素质，你会很容易领会的。对了，你去准备<color=white> 本门所有技能，做成一册<color>.", 1),
			speak_string(nFaction, "遵命"..szCall.." 弟子立即复命.", 1),
		}
	elseif (nFaction == 2) or (nFaction == 1) or (nFaction == 5) then					-- 中立
		tDialog =
		{
			npc_string(nFaction, "哎呀，原来你已知道了故事。最近江湖突然变动，在宋国，从头到尾都乌云密布，我也想到了这件事，但是因为"..szCall.." 不能组织调查该事。然后，一些江湖隐士重出江湖，调查该事。他们发现眉目，一天天显露出来，眉目显示，暗指阴谋为：天忍教!", 1),
			speak_string(nFaction, "看起来真相已清楚了，真是天忍阴谋。只有调查各种动物发现，在尸体上留下的印记在江湖上未出现过，此外，出现很多异常蝙蝠，这是否是新的天忍邪术?", 1),
			npc_string(nFaction, "为了防止天忍的阴谋，我已进行了积极的暗中调查。我和一些高手闭关创造了一招上乘绝学。你一个人找到很重要的眉目，真是值得表扬。我决定传与你上乘武功，希望你以后能已天下为己任.", 1),
			speak_string(nFaction, "多谢 "..szCall.."遵循"..szCall.."教训.", 1),
			npc_string(nFaction, "时间紧迫，所以该武功只能传授一部分，以后要努力修炼。该武功只传与你，其他门派弟子还不知道。为了防止生事，我已将口诀写好了，你自己研究吧。按你现在的素质，你会很容易领会的。对了，你去准备<color=white> 本门所有技能，做成一册<color>.", 1),
			speak_string(nFaction, "遵命"..szCall.." 弟子立即复命.", 1),
		}
	elseif (nFaction == 3) or (nFaction == 9) then										-- 邪派
		tDialog =
		{
			npc_string(nFaction, "哎呀，原来你已知道了故事。最近江湖突然变动，在宋国，从头到尾都乌云密布，我也想到了这件事，但是因为"..szCall.." 不能组织调查该事。然后，一些江湖隐士重出江湖，调查该事。他们发现眉目，一天天显露出来，眉目显示，暗指阴谋为：天忍教!", 1),
			speak_string(nFaction, "看起来真相已清楚了，真是天忍阴谋。只有调查各种动物发现，在尸体上留下的印记在江湖上未出现过，此外，出现很多异常蝙蝠，这是否是新的天忍邪术?", 1),
			npc_string(nFaction, "本门怎么能落后他人呢？因此，我已进行暗中调查，同时确定：不能让天忍对我们不利，里有你个时机制造天下混乱。我和一些高手闭关创造了一招上乘绝学。你一个人找到很重要的眉目，真是值得表扬。"..szCall.."那年，很多有胆识的英雄才能担任，但是，你一个人找到很重要的眉目，真是值得表扬。我决定传与你绝学，以后帮我名扬天下", 1),
			speak_string(nFaction, "多谢 "..szCall.."遵循"..szCall.."教训.", 1),
			npc_string(nFaction, "时间紧迫，所以该武功只能传授一部分，以后要努力修炼。该武功只传与你，其他门派弟子还不知道。为了防止生事，我已将口诀写好了，你自己研究吧。按你现在的素质，你会很容易领会的。对了，你去准备<color=white> 本门所有技能，做成一册<color>.", 1),
			speak_string(nFaction, "遵命"..szCall.." 弟子立即复命.", 1),
		}
	elseif (nFaction == 7) then															-- 天忍
		tDialog =
		{
			npc_string(nFaction, "真是不愧为天忍教弟子，没有什么能过得了你的眼睛。最近，江湖突然混乱，真是没有想到，这是我天忍教制造出来的事端，哈哈。你已猜到了，我也不瞒你。最近，天忍教召集了一些武林高手，炼成了一种极强的邪术。发狂的动物和躺在棺材里的尸体，都是我们的功劳，也表明，我大金国将有一次打征伐.", 1),
			speak_string(nFaction, "教主英明，我将为金国统一天下的大业赴汤蹈火", 1),
			npc_string(nFaction, "这次动乱很严密，信息也没有传遍各门派，有人刚刚透露出消息就死了。这些尸体都是宋国派的间谍，也算是给我做的试验了。我做这个，也不是要你保密，你是本门的人。但是，你是有勇有谋的人，可以担任大任，哈哈。今天我传给你绝学，不要辜负金国对你的信任。", 1),
			speak_string(nFaction, "多谢"..szCall.."遵循"..szCall.."教训.", 1),
			npc_string(nFaction, "时间紧迫，所以该武功只能传授一部分，以后要努力修炼。该武功只传与你，其他门派弟子还不知道。为了防止生事，我已将口诀写好了，你自己研究吧。按你现在的素质，你会很容易领会的。对了，你去准备<color=white> 本门所有技能，做成一册<color>.", 1),
			speak_string(nFaction, "遵命"..szCall.." 弟子立即复命.", 1),
		}
	end
	describe_talk(tDialog)
	SetTask(LV120_SKILL_STATE, 18)
	SyncTaskValue(LV120_SKILL_STATE)
end

function lv120skill_submit()				-- 提交本派全部技能书UI
	GiveItemUI("交本门全部技能书", "把本门所有技能书放进去就能获得120技能秘籍.", "submit_skillbook", "quit")
end

function submit_skillbook(nCount)			-- 提交本派全部技能书

	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	local idxBook, g, d, p = 0, 0, 0, 0
	local book, temp = {}, {}

	if (nCount == 0) then
		lv120skill_submit()
		return
	end

	for i = 1, getn(FACTION_BOOK[nFaction]) do
		tinsert(temp, FACTION_BOOK[nFaction][i])
	end

	for i = 1, nCount do
		idxBook = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxBook)
		for j = 1, getn(temp) do
			if (g == temp[j][1]) and (d == temp[j][2]) and (p == temp[j][3]) then
				tremove(temp, j)
				tinsert(book, idxBook)
				break
			end
		end
	end

	if (getn(temp) == 0) then
		local tDialog =
		{
			npc_string(nFaction, "办事伶俐又有才的人真是难求啊，我已给你秘诀了，你自己研究一下就可以领悟了", 1),
			speak_string(nFaction, "多谢"..szCall.."多谢指教，现在我去修炼了.", 1),
			self_string(10, "一会儿工夫，你就学到了武林上乘绝技"),
		}
		describe_talk(tDialog)
		for i = 1, getn(book) do
			if (RemoveItemByIndex(book[i]) ~= 1) then		-- 取走玩家身上的技能书
				WriteLog("120级技能 -交本门所有技能书-- 删除异常技能书.  Player ="..GetName().." Time = "..date("%y.%m.%d"))
				Msg2Player("系统出错，请联系发行商解决!")
				return
			end
		end
		idxBook = add_item(LV120SKILLBOOK)	-- 获得120级技能书
		Msg2Player("你获得1"..GetItemName(idxBook))
		SetTask(LV120_SKILL_STATE, 19)
		SyncTaskValue(LV120_SKILL_STATE)
	else
		Describe("需要放入一部所有技能的书，给"..szCall.." 做成120级上乘技能书 ",2, "重做/lv120skill_submit", "关闭/quit")
	end

end

function calc_item(tab)
	return	CalcItemCount(-1, tab[1], tab[2], tab[3], -1)
end

-- 解决任务异常
function lv120skill_debug()
	local state = GetTask(LV120_SKILL_STATE)
	if (state <= 1) or (state >= 19) then return end
	if (state == 5) then debug_item(DGJ_WULINMIJI) return end
	if (state == 9) then debug_item(COFFIN_MAP) return end
	if (state >= 10) and (state <= 15) then debug_item(COFFIN) return end
	if (state == 16) then debug_item(CADAVER) return end
end

function debug_item(Item)
	if (calc_item(Item) < 1) then
		if (CalcFreeItemCellCount() < 1) then
			Msg2Player("在120级发生错误，请重新整理装备，出现一个空位，同时请重新登录，系统就归还大侠失去的东西.")
			return
		end
		local idxItem = add_item(Item)
		Msg2Player("大侠获得刚刚失去的东西"..GetItemName(idxItem)..", 现在可以继续120级任务")
	end
end

function quit()
end


-- 120级技能书兑换
function lvl120skill_learn()
	Describe("有什么难解吗?",4,
		"我想换120技能书/lvl120skill_getbook",
		"怎么能学到120技能/lvl120skill_learninfo",
		"练习120技能方法/lvl120skill_skillinfo",
		"让我想想/no");
end;

function lvl120skill_skillinfo()
	local szInfo = format("%s%s%s%s%s%s%s%s%s%s",
			"<enter><color=green>1. 打怪获得 <color>",
			"<enter>练级区域的怪物：打一般的怪，绿boss，黄金boss;",
			"<enter>活动中的怪：打在第一关的怪，杀手boss;",
			"<enter>任务中的怪：打在黄金任务中的怪;",
			"<enter>宋金战场：使用积分换取经验值，但是，不能超过每人上限.", 
			"<enter><color=green>2. 委托任务<color>",
			"<enter>使用白驹丸技能，大白驹丸技能，大白驹丸特效技能.",
			"<enter>白驹丸技能：使用后将提高120技能的练习度，每五分钟练习度将增加一次.",
			"<enter>大白驹丸技能: 效果比一般白驹丸技能增倍，每五分钟练习度将增加一次",
			"<enter>大白驹丸特效: 效果比一般白驹丸技能增倍，每五分钟练习度将增加一次;"
			);
	Describe(szInfo,
		2,
		"返回/lvl120skill_learn",
		"结束对话/no")
end;

function lvl120skill_learninfo()
	Describe("达到120级的高手，可以到我门派换取120技能书，使用书后，将学到120技能，每人只能换一次<enter>换取书要遵守：一本盘若心经，一本本门90技能书，一颗猩红宝石和一颗水晶.", 
		2,
		"返回/lvl120skill_learn",
		"结束对话/no")
end;

function lvl120skill_getbook()
	-- 原任务进行到19结束，保持原值，兑换技能书成功，直接设为19
	local nstate = GetTask(LV120_SKILL_STATE);
	local nlevel = GetLevel();
	local nfact = GetLastFactionNumber();
	if (nstate == 19) then
		Describe("真是遗憾，你已使用120技能了",1 , "结束对话/no");
	elseif (nlevel < 120) then
		Describe("等级不够120，不能换书",1 , "结束对话/no");
	elseif (nfact < 0 or nfact > 9) then
		Describe("你未加入门派，不够换书条件",1 , "结束对话/no");
	else
		if (lvl120skill_delallitem() == 1) then
			SetTask(LV120_SKILL_STATE, 19);
			add_item(LV120SKILLBOOK);
			Msg2Player("换120技能书成功")
			WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tget a lvl120skillbook",
				GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount()))
		else
			Describe("真是遗憾，带的物品不合要求，请检查!", 1,"结束对话/no");
			Msg2Player("需要收集物品：一本盘若心经，一本本门90技能书，一颗猩红宝石和一颗水晶.");
		end;
	end;
end;
-- 120级技能书兑换

function lvl120skill_delallitem()
	if (lvl120skill_calccount(BANRUOXINJING) < 1) then
		return 0;
	end;
	local nfact = GetLastFactionNumber();
	for i = 1, getn(FACTION_BOOK[nfact]) do
		if (lvl120skill_calccount(FACTION_BOOK[nfact][i]) < 1) then
			return 0;
		end;
	end;

	if (lvl120skill_calccount(XINGHONGBAOSHI) < 1) then
		return 0;
	end;
	
	if (lvl120skill_calccrystal() < 1) then
		return 0;
	end;
	
	lvl120skill_delitem(BANRUOXINJING, 1);
	for i = 1, getn(FACTION_BOOK[nfact]) do
		lvl120skill_delitem(FACTION_BOOK[nfact][i], 1);
	end;
	lvl120skill_delitem(XINGHONGBAOSHI, 1);
	lvl120skill_delscrystal(1);
	return 1;
end;

function lvl120skill_calccount(tb_item)
	return CalcEquiproomItemCount(tb_item[1], tb_item[2], tb_item[3], -1);
end;
function lvl120skill_delitem(tb_item, ncount)
	if (ncount <= 0) then
		return 0;
	end;
	local np = ConsumeEquiproomItem(ncount, tb_item[1], tb_item[2], tb_item[3], -1);
	if (np == 1) then
		WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tDeleteItem Count=%d,G=%d,D=%d,P=%d,L=%d",
					GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
					ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	else
		print(format("Error!!!! DeleteItem Fail!!! Count=%d,G=%d,D=%d,P=%d,L=%d",
				ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	end;
end;
function lvl120skill_calccrystal()
	local nsum = 0;
	for i = 1, getn(CRYSTAL) do
		nsum = nsum + lvl120skill_calccount(CRYSTAL[i]);
	end;
	return nsum;
end;
function lvl120skill_delscrystal(ncount)
	for i = 1, getn(CRYSTAL) do
		local ncrst = lvl120skill_calccount(CRYSTAL[i]);
		if (ncrst > ncount) then
			ncrst = ncount;
		end;
		lvl120skill_delitem(CRYSTAL[i], ncrst);
		ncount = ncount - ncrst;
		if (ncount <= 0) then
			break
		end;
	end;
end;



-- //越南版不处理上线时任务变量初始化
if (GetProductRegion() ~= "vn") then
	login_add(init_lv120skill, 2)
end
