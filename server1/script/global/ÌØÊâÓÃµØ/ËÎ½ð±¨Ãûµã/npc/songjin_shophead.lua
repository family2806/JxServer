IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\lib\\awardtemplet.lua")

function cutdowntimefix(nWeekDay, nDay, nMonth, nYear, nMonthDay)
	if nDay > nMonthDay then
		nDay = nDay - nMonthDay
		nMonth = nMonth + 1
		if nMonth > 12 then
			nMonth = 1
			nYear = nYear + 1
		end
	end
	return nDay, nMonth, nYear
end

function getcutdowntime(nWeekDay, nCurTime)
	--									1,	2,	3,	4,	5,	6,	7,	8,	9,	10,	11,	12
	local tbMonthDay = {31, 28, 31, 30, 31, 30, 31, 31, 30,	31, 30, 31}
	local nTmp = nCurTime
	local nYear = floor(nTmp/100000000)
	nTmp = mod(nTmp, 100000000)
	local nMonth = floor(nTmp/1000000)
	nTmp = mod(nTmp, 1000000)
	local nDay = floor(nTmp/10000)
	nTmp = mod(nTmp, 10000)
	local nHour = floor(nTmp/100)
	nTmp = mod(nTmp, 100)
	local nMinute = nTmp;
	if ((0 == mod(nYear, 4)) and (0 ~= mod(nYear, 100))) or (0 == mod(nYear, 400)) then
		tbMonthDay[2] = tbMonthDay[2] + 1
	end
	if nWeekDay > 0 then
		nDay = nDay + 7 - nWeekDay
		nDay, nMonth, nYear = cutdowntimefix(nWeekDay, nDay, nMonth, nYear, tbMonthDay[nMonth])
	else
		if nHour < 23 then
		else
			nDay = nDay + 7
			nDay, nMonth, nYear = cutdowntimefix(nWeekDay, nDay, nMonth, nYear, tbMonthDay[nMonth])
		end
	end 
	local nResult = 0
	nResult = nMonth * 1000000 + nDay * 10000 + 2300
	return nResult
end


function wushuangmengjiang()
	Say("为了表扬在战场的功劳，如果本周表现好，将有重赏", 4, "了解规则细节/getrule", "看战场排名统计/getranklist", "看目前的战场排名/getcurranklist", "我想领奖/guanghuan_sure", "只是来玩而已./no")
end

function getrule()
	Say("一周内获得前十名的将获得1到10点，在一周内如果达到的点数最高将获得朝廷敕封的无双猛将和重赏", "我想了解其他事情/wushuangmengjiang", "结束对话/no");
end

function getranklist()
	local tbNum = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
	local szranklist = ""
	for i = 1, 10 do
		local szname, nrank, nsect, ngender= Ladder_GetLadderInfo(10251, i);
		if szname ~= nil and nrank ~= 0 then
			szranklist = format("%s 排名%s: <%s> %d\n", szranklist, tbNum[i], szname, nrank);
		else
			szranklist = format("%s 排名%s: <%s> %d\n", szranklist, tbNum[i], "Kh玭g", 0);
		end
	end
	local tbOpt = {}
	tinsert(tbOpt, {"我想了解其他事情", wushuangmengjiang})
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx(szranklist, tbOpt)
end

function guanghuan_sure()
	--[dinhhq][20101230]:thay doi phan thuong TKTT
--		local nWeekDay = tonumber(GetLocalDate("%w"));
--		local nCurTime = tonumber(GetLocalDate("%Y%m%d%H%M"));
--		local nCutDownTime = getcutdowntime(nWeekDay, nCurTime)
--		get_wushuangguanghuan(nCutDownTime)
	local szPlayerName = GetName()
	for i = 1, 3 do	
		local szname, nrank, nsect, ngender = Ladder_GetLadderInfo(10251, i);	
		if(szPlayerName == szname and 0 ~= nrank) then		
			local nWeek = tonumber(GetLocalDate("%W"));
			if (GetBitTask(2762, 12, 18) ~= nWeek) then
				SetBitTask(2762, 12, 18, nWeek)
				get_TTTCAward(i)				
			else
				Talk(1, "", "大侠不是已经领奖了吗?")				
			end
			return		
		end	
	end
	Say("只有在本周内达到最高点的猛将才能获得奖励!想获取奖励就要努力杀敌", 2, "我想了解其他事情/wushuangmengjiang", "结束对话/no")
end

function get_wushuangguanghuan(nCutDownTime)
do
	 return
end
	AddSkillState(966, 1,2, nCutDownTime, 1)
	AddSkillState(979, 1,2, nCutDownTime, 1)
end

--Change Song Jin Box bind state - Modified By DinhHQ - 20120319
local tbProduct = {szName="宋金秘宝",tbProp={6, 1, 2741, 1, 0, 0},nBindState=-2}	

function tetan2mibao()
	local G = 6
	local D = 1
	local P = 2740	-- 特探宝箱的p
	if GetTask(751) < 2000 then 
		Say("您的积分不够.", 1, "关闭/no")
		return 
	end
	-- 判定是否存在特探宝箱
	local nCount = CalcItemCount(3, G, D, P, -1) 
	
	if nCount == 0 then
		Say("没有特探宝箱不能换.", 1, "关闭/no")
		return
	end
	-- 减去宝箱
	ConsumeItem(3, 1, G, D, P, -1)	-- 特探宝箱的p
	tbAwardTemplet:GiveAwardByList(%tbProduct, "tetanbaoxiang2songjingmibao", 1)
end

function jifen2mibao()
	local nEnergyMark = 100
	local nJifenMark = 500
	local nEnergy = GetEnergy()
	if nEnergy < nEnergyMark then
		Say("您的精炼石不够，下次再来吧", 1, "关闭/no")
		return
	end
	
	local nJifen = nt_getTask(747)
	if nJifen < nJifenMark then
		Say("您的积分不够.", 1, "关闭/no")
		return
	end
	
	ReduceEnergy(nEnergyMark)	-- 扣掉精炼石
	nt_setTask(747, floor(nt_getTask(747) - nJifenMark)) -- 扣掉积分
	tbAwardTemplet:GiveAwardByList(%tbProduct, "jifenjingli2songjingmibao", 1)
	Jilu_jinglixiaohao(nEnergyMark)	-- 数据埋点第一期
end

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 0.02

function duihuangmibao()
	local szMsg = format("选择换取形式 :")
	local tbOpt = {}
	
	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为了保护您的物品安全，请确保装备还剩1 %dx%d", nWidth, nHeight))
		return 
	end
	
	tinsert(tbOpt, {"特探宝箱", tetan2mibao})
	tinsert(tbOpt, {"积分和精炼石", jifen2mibao})
	CreateNewSayEx(szMsg, tbOpt)	
end

function Jilu_jinglixiaohao(nCount)
	AddStatData("jlxiaohao_duihuansongjinmibao", nCount)
end

function getcurranklist()
	local tbNum = {"1", "2 ", "3", "4", "5", "6", "7", "8", "9", "10"}
	local szranklist = ""
	for i = 1, 10 do
		local szname, nrank, nsect, ngender= Ladder_GetLadderInfo(10250, i);
		if szname ~= nil and nrank ~= 0 then
			szranklist = format("%s 排名 %s: <%s> %d\n", szranklist, tbNum[i], szname, nrank);
		else
			szranklist = format("%s 排名%s: <%s> %d\n", szranklist, tbNum[i], "不", 0);
		end
	end
	local tbOpt = {}
	tinsert(tbOpt, {"我想了解其他", wushuangmengjiang})
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx(szranklist, tbOpt)
end

function get_TTTCAward(nRank)
	local tbExp =
		 {
			{nExp =400e6},
			{nExp =300e6},
			{nExp =200e6}								
		};
	local szLog = format("宋金天子参战奖励 %d", nRank)
	tbAwardTemplet:GiveAwardByList(tbExp[nRank], szLog)
end
