-- 文件名　：skillexp_150_main.lua
-- 创建者　：wangjingjun
-- 内容　　：150技能熟练度对话npc
-- 创建时间：2011-07-27 14:27:15

Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

--TSK_DAILY_CHANGE = 2902  -- 每天最多提升的次数
--TSK_CHANGE_DAY = 2903	-- 记录最后一次提升的日期
--By: Ngavn 2011/12/06
DAILY_CHANGE_MAX_VALUE = 30		-- 每天兑换上限 
MAP_ID = 967		-- 地图id
--By: Ngavn
NDEL_PLAYEXP_PER = 10000000	-- 每次兑换需要消耗的玩家经验
NADD_SKILLEXP_PER = 50		-- 每次兑换可以获得的熟练度

szScriptPath = "\\script\\event\\skillexp_150\\skillexp_150_main.lua"
szPosition_chefu = "\\settings\\maps\\skillexp_150\\wagoner.txt"
szPosition_shibei = "\\settings\\maps\\skillexp_150\\shibei.txt"

local tbChefu = {
	{nNpcId = 108, szName = "隐士", nLevel = 1, szScriptPath = "\\script\\event\\skillexp_150\\npc_trans.lua"},
		}

-- 24个相关的npc
local tbShibeiNpc = {
	{nNpcId = 1623, szName = "大力金刚掌碑", tbNpcParam = {1055},},
	{nNpcId = 1623, szName = "韦陀献杵碑", tbNpcParam = {1056},},
	{nNpcId = 1623, szName = "叁戒归禅碑", tbNpcParam = {1057},},
	{nNpcId = 1623, szName = "纵横八方碑", tbNpcParam = {1059},},
	{nNpcId = 1623, szName = "霸王錾金碑", tbNpcParam = {1060},},
	{nNpcId = 1623, szName = "豪雄斩碑", tbNpcParam = {1058},},
	{nNpcId = 1623, szName = "形销骨立碑", tbNpcParam = {1066},},
	{nNpcId = 1623, szName = "幽魂噬影碑", tbNpcParam = {1067},},
	{nNpcId = 1623, szName = "无影穿碑", tbNpcParam = {1069},},
	{nNpcId = 1623, szName = "铁莲四杀碑", tbNpcParam = {1070},},	-- 10
	{nNpcId = 1623, szName = "乾坤一掷碑", tbNpcParam = {1071},},
	{nNpcId = 1623, szName = "剑花挽晶碑", tbNpcParam = {1061},},
	{nNpcId = 1623, szName = "冰雨珞晶碑", tbNpcParam = {1062},},
	{nNpcId = 1623, szName = "玉泉心经碑", tbNpcParam = {1114},},
	{nNpcId = 1623, szName = "冰雀越枝", tbNpcParam = {1063},},
	{nNpcId = 1623, szName = "水映曼秀碑", tbNpcParam = {1065},},
	{nNpcId = 1623, szName = "江海怒澜碑", tbNpcParam = {1075},},
	{nNpcId = 1623, szName = "疾火燎原碑", tbNpcParam = {1076},},
	{nNpcId = 1623, szName = "棒迴掠地碑", tbNpcParam = {1074},},
	{nNpcId = 1623, szName = "时乘六龙碑", tbNpcParam = {1073},},	-- 20
	{nNpcId = 1623, szName = "剑垂星河碑", tbNpcParam = {1079},},
	{nNpcId = 1623, szName = "造化太清碑", tbNpcParam = {1078},},
	{nNpcId = 1623, szName = "九天罡风碑", tbNpcParam = {1080},},
	{nNpcId = 1623, szName = "天雷震岳碑", tbNpcParam = {1081},},
	}	

function addnpc(szfile, tbNpc)
	local nX = 0
	local nY = 0
	if (TabFile_Load(szfile, szfile) == 0) then
		print(format("can not open file %s", szPosition_chefu))
		return
	end
	local nCount = TabFile_GetRowCount(szfile)
	if (nCount < 2) then
		return
	end
	for i=2,nCount do
		nX = tonumber(TabFile_GetCell(szfile, i, "TRAPX"))
		nY = tonumber(TabFile_GetCell(szfile, i, "TRAPY"))
		local nNpcIndex = basemission_CallNpc(tbNpc[i-1], MAP_ID, nX, nY)
	end
end

function initialization()
	addnpc(szPosition_chefu, %tbChefu)
	
	for i=1,getn(%tbShibeiNpc) do
		%tbShibeiNpc[i].szScriptPath = szScriptPath
	end
	addnpc(szPosition_shibei, %tbShibeiNpc)
end

function checkDailyTask(nSkillId)
--	local nDay = GetTask(TSK_CHANGE_DAY)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nDay ~= nCurDate then
--		SetTask(TSK_CHANGE_DAY, nCurDate)
--		SetTask(TSK_DAILY_CHANGE, 0)
--	end
	tbTrainSkill150:ResetDailyTask()
	
	local nDayTime;

	if GetCurrentMagicLevel(nSkillId, 0) < 18 then
		 nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use)  + tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use);
	else
		nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use)
	end
	local nMaxValue =  tbTrainSkill150:GetMaxTask(nSkillId)
	if nDayTime < nMaxValue then
		return 1
	end
	return 0
end

function addDailyTask_Free(nValue)
--	local nDay = GetTask(TSK_CHANGE_DAY)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nDay ~= nCurDate then
--		SetTask(TSK_CHANGE_DAY, nCurDate)
--		SetTask(TSK_DAILY_CHANGE, 0)
--	end
	tbTrainSkill150:ResetDailyTask();
	local nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use)
	if nDayTime > 30 then
		tbTrainSkill150:addDailyTask_Fee(1)
	else
		tbVNG_BitTask_Lib:addTask(tbTrainSkill150.tbBIT_Free_Use, nValue)
	end
end

-- npc 被点击主函数
function main()
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local nSkillId = GetNpcParam(nNpcIdx, 1)
	local nPlayerLevel = GetLevel()
	if checkDailyTask(nSkillId) ~= 1 then
		Msg2Player("今天次数用完了，明天再来吧")
		return
	end
	preMsg2Player(nSkillId)
	if nPlayerLevel >= 200 then
		return
	end
	--开启进度条
	tbProgressBar:OpenByConfig(10, playerexp2skillexp, {nNpcIdx, dwNpcId, nSkillId},onbreak)
end

function playerexp2skillexp(nNpcIndex, dwNpcId, nSkillId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	local szSkillName = GetSkillName(nSkillId)
--	print("nSkillId = " .. nSkillId)
	if HaveMagic(nSkillId) == -1 then
		Msg2Player("对这种武功没有斗志，去别的地方吧")
		return
	end
	
	if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
		Msg2Player("现在技能已达最高界限，不能再加了")
		return
	end
	
	local nCurPlayerExp = GetExp()
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId)
	local nPlayerLevel = GetLevel()
	
	--为练级界限检查重生
	local nlevelskill150 = tbTrainSkill150:CheckTS();
	if (GetCurrentMagicLevel(nSkillId, 0) >= nlevelskill150 and nlevelskill150 > 0) then
		if tbTrainSkill150:Check_UseItem(nSkillId) == 0 then
			Msg2Player("现在技能已达最高界限，大侠重生来升级")
			return
		end
	end
	
	if nNeedPlayerExp > nCurPlayerExp then
		Msg2Player(format("领悟要有 %d 经验, 你现在的经验不足", nNeedPlayerExp))
		return 
	end
	
--	print("nSkillId = " .. nSkillId)
	local nNextExp = GetSkillNextExp(nSkillId)	- GetSkillExp(nSkillId)
--	print("nNextExp = " .. nNextExp)
	local nExp = NADD_SKILLEXP_PER					-- 增加熟练度	
	local nTotalExp = NADD_SKILLEXP_PER	
	if not nNextExp then
		return
	end
	ReduceOwnExp(nNeedPlayerExp)	
	if GetCurrentMagicLevel(nSkillId, 0) < 18 then
		
		if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use) < tbTrainSkill150:GetValueMaxTask(nSkillId)then
			addDailyTask_Free(1)		-- 增加兑换的计数
		else
			tbTrainSkill150:addDailyTask_Fee(1)
		end
	else
		tbTrainSkill150:addDailyTask_Fee(1)
	end
	while nExp > nNextExp do
		if nNextExp <= 0 then
--			print("150级技能熟练度，下一个等级所需要的技能为0，出错了%%%%%%%%%")
			break
		end 
		-- 达到
		local ncurlevel = GetCurrentMagicLevel(nSkillId, 0)
--		print("ncurlevel = " .. ncurlevel)
		if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
			postMsg2Player(nSkillId)
			return 
		end
		nNeedAddExp = nNextExp
		nExp = nExp - nNeedAddExp
--		print("nExp = " .. nExp)
		AddSkillExp(nSkillId, nNeedAddExp, 1)		
		nNextExp = GetSkillNextExp(nSkillId)
--		print("nNextExp = " .. nNextExp)
	end
--	print("while end")
--	print("nExp = " .. nExp)
	AddSkillExp(nSkillId, nExp, 1)
	
	postMsg2Player(nSkillId)
end

function onbreak()
	Msg2Player("你的领悟被间断.")
end

function OnTimer(nNpcIndex)
end

function getNeedPlayerExp(nSkillId, nNumber)
	local nNeedPlayerExp = NDEL_PLAYEXP_PER
	local nPlayerLevel = GetLevel()
	
	--By: NgaVN 30 lan doi dau tien thi Exp = 1000000, sau 20 lan sau Exp = 15000000
	local nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use) + tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use)
	if nDayTime > DAILY_CHANGE_MAX_VALUE then
		nNeedPlayerExp = 15000000
	end
	if(nNumber == 1 and nDayTime + 1 > DAILY_CHANGE_MAX_VALUE) then
		nNeedPlayerExp = 15000000
	end

	local _, nRet = tbTrainSkill150:GetMaxTask(nSkillId)
	if 	nRet == 1 then
		nNeedPlayerExp = 15000000
	end
	-- 200级特殊处理
	if nPlayerLevel >= 200 then		
		nNeedPlayerExp = 0
	end
	return nNeedPlayerExp
end

function preMsg2Player(nSkillId)
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId, 1)
	local nPlayerLevel = GetLevel()
	local szSkillName = GetSkillName(nSkillId)
	if nPlayerLevel >= 200 then
		Msg2Player(format("200级人物不能提高<color=yellow> %s <color> 修炼值", szSkillName))
	else
		Msg2Player(format("消耗<color=yellow> %d <color> 提高经验对于<color=yellow> %s <color> 修炼度.",nNeedPlayerExp,szSkillName))
	end
end

function postMsg2Player(nSkillId)
	local nPlayerLevel = GetLevel()
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId)
	local szSkillName = GetSkillName(nSkillId)
	local nTotalExp = NADD_SKILLEXP_PER
	
	if nPlayerLevel == 200 then
		Msg2Player(format("你的技能<color=yellow> %s <color> 修炼度可以提高 %d",szSkillName, nTotalExp))
	else
		Msg2Player(format("已消耗 <color=yellow> %d <color> 经验给技能<color=yellow> %s <color> 修炼度可以提高<color=yellow> %d <color>",nNeedPlayerExp, szSkillName,nTotalExp))
	end
end

AutoFunctions:Add(initialization)