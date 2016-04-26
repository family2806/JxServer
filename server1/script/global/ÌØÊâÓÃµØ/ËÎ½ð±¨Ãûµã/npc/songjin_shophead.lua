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
	Say("Ϊ�˱�����ս���Ĺ��ͣ�������ܱ��ֺã���������", 4, "�˽����ϸ��/getrule", "��ս������ͳ��/getranklist", "��Ŀǰ��ս������/getcurranklist", "�����콱/guanghuan_sure", "ֻ���������./no")
end

function getrule()
	Say("һ���ڻ��ǰʮ���Ľ����1��10�㣬��һ��������ﵽ�ĵ�����߽���ó�͢뷷����˫�ͽ�������", "�����˽���������/wushuangmengjiang", "�����Ի�/no");
end

function getranklist()
	local tbNum = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
	local szranklist = ""
	for i = 1, 10 do
		local szname, nrank, nsect, ngender= Ladder_GetLadderInfo(10251, i);
		if szname ~= nil and nrank ~= 0 then
			szranklist = format("%s ����%s: <%s> %d\n", szranklist, tbNum[i], szname, nrank);
		else
			szranklist = format("%s ����%s: <%s> %d\n", szranklist, tbNum[i], "Kh�ng", 0);
		end
	end
	local tbOpt = {}
	tinsert(tbOpt, {"�����˽���������", wushuangmengjiang})
	tinsert(tbOpt, {"�����Ի�"})
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
				Talk(1, "", "���������Ѿ��콱����?")				
			end
			return		
		end	
	end
	Say("ֻ���ڱ����ڴﵽ��ߵ���ͽ����ܻ�ý���!���ȡ������ҪŬ��ɱ��", 2, "�����˽���������/wushuangmengjiang", "�����Ի�/no")
end

function get_wushuangguanghuan(nCutDownTime)
do
	 return
end
	AddSkillState(966, 1,2, nCutDownTime, 1)
	AddSkillState(979, 1,2, nCutDownTime, 1)
end

--Change Song Jin Box bind state - Modified By DinhHQ - 20120319
local tbProduct = {szName="�ν��ر�",tbProp={6, 1, 2741, 1, 0, 0},nBindState=-2}	

function tetan2mibao()
	local G = 6
	local D = 1
	local P = 2740	-- ��̽�����p
	if GetTask(751) < 2000 then 
		Say("�i���Ļ��ֲ�����.", 1, "�ر�/no")
		return 
	end
	-- �ж��Ƿ������̽����
	local nCount = CalcItemCount(3, G, D, P, -1) 
	
	if nCount == 0 then
		Say("û����̽���䲻�ܻ�.", 1, "�ر�/no")
		return
	end
	-- ��ȥ����
	ConsumeItem(3, 1, G, D, P, -1)	-- ��̽�����p
	tbAwardTemplet:GiveAwardByList(%tbProduct, "tetanbaoxiang2songjingmibao", 1)
end

function jifen2mibao()
	local nEnergyMark = 100
	local nJifenMark = 500
	local nEnergy = GetEnergy()
	if nEnergy < nEnergyMark then
		Say("���ľ���ʯ�������´�������", 1, "�ر�/no")
		return
	end
	
	local nJifen = nt_getTask(747)
	if nJifen < nJifenMark then
		Say("�i���Ļ��ֲ�����.", 1, "�ر�/no")
		return
	end
	
	ReduceEnergy(nEnergyMark)	-- �۵�����ʯ
	nt_setTask(747, floor(nt_getTask(747) - nJifenMark)) -- �۵�����
	tbAwardTemplet:GiveAwardByList(%tbProduct, "jifenjingli2songjingmibao", 1)
	Jilu_jinglixiaohao(nEnergyMark)	-- ��������һ��
end

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 0.02

function duihuangmibao()
	local szMsg = format("ѡ��ȡ��ʽ :")
	local tbOpt = {}
	
	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ�˱���������Ʒ��ȫ����ȷ��װ����ʣ1 %dx%d", nWidth, nHeight))
		return 
	end
	
	tinsert(tbOpt, {"��̽����", tetan2mibao})
	tinsert(tbOpt, {"�i���ֺ;���ʯ", jifen2mibao})
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
			szranklist = format("%s ���� %s: <%s> %d\n", szranklist, tbNum[i], szname, nrank);
		else
			szranklist = format("%s ����%s: <%s> %d\n", szranklist, tbNum[i], "��", 0);
		end
	end
	local tbOpt = {}
	tinsert(tbOpt, {"�����˽�����", wushuangmengjiang})
	tinsert(tbOpt, {"�����Ի�"})
	CreateNewSayEx(szranklist, tbOpt)
end

function get_TTTCAward(nRank)
	local tbExp =
		 {
			{nExp =400e6},
			{nExp =300e6},
			{nExp =200e6}								
		};
	local szLog = format("�ν����Ӳ�ս���� %d", nRank)
	tbAwardTemplet:GiveAwardByList(tbExp[nRank], szLog)
end
