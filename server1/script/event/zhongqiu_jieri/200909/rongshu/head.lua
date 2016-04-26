Include("\\script\\tong\\tong_header.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
IncludeLib("LEAGUE")
IncludeLib("TONG")
tbZhongQiu200909 = {}
tbZhongQiu200909.tbNpcPos = {}
local tbLadderId = 
{
	10263,10264,10265
}

local tbTongTSK_Exploit = 
{
	TONGTSK_Gongde_meici,
	TONGTSK_Gongde_meizhou,
	TONGTSK_Gongde_Total,
}

local tbTongTSK_ExploitFlag = 
{
	TONGTSK_Gongde_meici_flag,
	TONGTSK_Gongde_meizhou_flag
}

-- ��ð�Ṧ��ֵ
function tbZhongQiu200909:GetTongExploit(nId)
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end
	return TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[nId]);
end

-- ��Ṧ��+nCount
function tbZhongQiu200909:AddExploit(nCount)
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end

	local nOldCount1 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[1]);
	local nOldCount2 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[2]);
	local nOldCount3 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[3]);	

	Ladder_NewLadder(%tbLadderId[1], szTongName, nOldCount1+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[2], szTongName, nOldCount2+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[3], szTongName, nOldCount3+ nCount, 0)
	
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[1], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[2], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[3], nCount);
	Msg2Tong(nTongID, format("��� %s ��� %d, Ŀǰ���%s %d", "װ�ε�", nCount, "װ�ε�", nOldCount1+ nCount))
	
	
	
	--local szParam = format("%u,%s,%d", nTongID, szTongName, nCount)
	--LG_ApplyDoScript(1, "", "", "\\script\\event\\zhongqiu_jieri\\head.lua", "tbZhongQiu200909_AddExploit", szParam , "", "")
end

-- ��Ṧ��ֵ���� ,��������
function tbZhongQiu200909:UpdateExploit(nTongID, nId)
	local nFlag = self:GetCurFlag(nId);
	
	if (TONG_GetTaskValue(nTongID, %tbTongTSK_ExploitFlag[nId]) ~= nFlag) then
		return 1
	end
end

function tbZhongQiu200909:IsTimeAct()
	
	local nTime = tonumber(GetLocalDate("%H%M"))
	local nWeek	= tonumber(GetLocalDate("%w"))	
	local nWeek	= tonumber(GetLocalDate("%w"))
	if ( nWeek == 5 or nWeek == 6 or nWeek == 0) then
		
		if (1930 <= nTime and nTime < 2000) then
			return 1	
		end
	end
	Talk(1,"", format("Ŀǰ���ܽ�%s ��� %s.", "��֦", "װ�ε�"))
end

-- ���Ŀǰ��־ֵ
function tbZhongQiu200909:GetCurFlag(nId)
	if (nId == 2) then
		return tonumber(GetLocalDate("%W%Y"));
	end
		
	if (nId == 1) then
		ndate = GetLocalDate("%y%m%d");
		return tonumber(ndate);

	end
end


function tbZhongQiu200909:GetAwardDailog()
	local tbOpt = {}
	local nWeek = tonumber(GetLocalDate("%w"))
	local nTimeHM = tonumber(GetLocalDate("%H%M"))
	if (2000 <= nTimeHM and nTimeHM <  2400 and ( nWeek == 5 or nWeek == 6 or nWeek == 0)) then
		tinsert(tbOpt, {"��ȡÿ�ν���", self.GetAward1, {self}})
	end
	
	if nWeek == 0 and (2000 <= nTimeHM and nTimeHM <  2400) then
		tinsert(tbOpt, {"��ȡ�ܽ���", self.GetAward2, {self}})
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate == 20100124 and (2000 <= nTimeHM and nTimeHM <  2400) then
		tinsert(tbOpt, {"��ȡ���ս���", self.GetAward3, {self}})
	end
	if getn(tbOpt) == 0 then
		Talk(1, "", "Ŀǰ�����콱ʱ��")
		return 
	end
	tinsert(tbOpt, {"�����Ի�"})
	
	CreateNewSayEx("������Ҫ��ȡ���ֽ���", tbOpt)
end

function tbZhongQiu200909:TongInfo()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local szMsg = format("ÿ�ν���: %d<enter>ÿ�ܽ���: %d<enter> ���ս���%d",tbZhongQiu200909:GetTongExploit(1),tbZhongQiu200909:GetTongExploit(2),tbZhongQiu200909:GetTongExploit(3))
	Say(szMsg, 0)
end

function tbZhongQiu200909:GetRank(nId)
	local szTongName, nTongID = GetTongName();
	for i = 1, 5 do
		local szName, nValue = Ladder_GetLadderInfo(%tbLadderId[nId], i);
		if (szName ~= nil and nValue ~= "" and szName == szTongName) then
			return i
		end
	end
	return nil
end



function tbZhongQiu200909:GetAward1()
	
	
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 1
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "���ֻ���22000000000��3�ֻ��ÿ�Σ�ÿ�ܣ�����", "<") then
	
		return
	end	
	
	local nFlag = self:GetCurFlag(nId)
	local nGongdeCount = self:GetTongExploit(nId);
	

	if not PlayerFunLib:CheckTask(2648, nFlag, "��������ý���.", "~=") then
		return
	end	
	
	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 12*60 then
		Talk(1, "", format("��Ҫ������%d ���ܻ�ý���.", 12))
		return 
	end
	local tbAward = 
	{
		{nExp = 6e7},
		{nExp = 4e7},
		{nExp = 3e7},
		{nExp = 2e7},
		{nExp = 1e7},
	}
	if nRank and nGongdeCount > 0 then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "meici gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2648, nFlag)
	elseif not nRank and nId == 1 and nGongdeCount >= 2 then
		PlayerFunLib:AddExp(5e6, bFlag, "meici gong de paiming not rank")
		PlayerFunLib:AddTask(2646, 5)
			
		PlayerFunLib:SetActivityTask(2648, nFlag)
	else
		Talk(1, "", " �����ϴ˴��콱����.")
		return
	end	
end


function tbZhongQiu200909:GetAward2()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 2
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "���ֻ���22000000000��3�ֻ��ÿ�Σ�ÿ�ܣ����", "<") then
		return
	end	

	if not PlayerFunLib:CheckTask(2649, tonumber(GetLocalDate("%W%Y")), "��������ý���.", "~=") then
		return
	end	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 48*60 then
		Talk(1, "", format("��Ҫ������ %d ������ȡ�ý�.", 48))
		return 
	end
	local tbAward = 
	{
		{nExp = 15e7},
		{nExp = 1e8},
		{nExp = 8e7},
		{nExp = 6e7},
		{nExp = 4e7},
	}
	if nRank then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "meizhou gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2649, tonumber(GetLocalDate("%W%Y")))
	else
		Talk(1, "", " �����ϸô��콱����.")
		return
	end	
end


function tbZhongQiu200909:GetAward3()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 3
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "���ֻ���22000000000 ��3�ֻ��ÿ�Σ�ÿ�ܣ����", "<") then
		return
	end	

	if not PlayerFunLib:CheckTask(2650, 0, "��������ý���.", "==") then
		return
	end	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 24*60*7 then
		Talk(1, "", format("��Ҫ������ %d ������ȡ�ý�.", 24*7))
		return 
	end
	local tbAward = 
	{
		{nExp = 2e8},
		{nExp = 15e7},
		{nExp = 10e7},
		{nExp = 8e7},
		{nExp = 6e7},
	}
	if nRank then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "tatol gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2650, 1)
	else
		Talk(1, "", " �����ϸô��콱����.")
		return
	end	
end



function tbZhongQiu200909:FlyToTree()
	local tbPos = 
	{
		{121,226,275, "������"},
		{100,183,203, "������"},
		{101,171,198, "�����"},
		{174,218,192, "��Ȫ��"},
		{53, 220,200, "������"},
		{20, 432,359, "���´�"},
		{153,232,180, "ʯ����"},
		{99, 189,223, "������"},
	}
	local tbOpt = {}
	for i=1, getn(tbPos) do 
		local tb = tbPos[i]
		tinsert(tbOpt, format("%s(%d,%d)/#tbZhongQiu200909:Fly(%d,%d,%d)", tb[4],tb[2],tb[3], tb[1],tb[2] * 8 ,tb[3] * 16))
		
	end
	tinsert(tbOpt, "����/OnCancel")
	Say("Xa phu: ������ȥ���", getn(tbOpt), tbOpt)
end
function tbZhongQiu200909:Fly(n,x,y)
	NewWorld(n,x,y)
	SetFightState(1)
end


function OnCancel()
	
	
end
