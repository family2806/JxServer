-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ�һ 2009������-����Ի�

-- Edited by �ӷ��~
-- 2009/01/07 16:50
-- 
-- ======================================================


Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua");

tbChunjie_Jieri_2009 = {};
tbChunjie_Jieri_2009.szClassName = "tbChunjie_Jieri_2009";

TB_CHUNJIE0901_FINDNPC = {
	tbFuLuShouNpc	= {
			{	nNpcId = 455, nLevel = 1, nMapId = 1, szName = "����", 
				tbPos = {{197,192}, {204,195}, {196,203}, {187,198}, {204,205}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_fushen.lua"},
				
			{	nNpcId = 455, nLevel = 1, nMapId = 176, szName = "»��", 
				tbPos = {{179,211}, {174,201}, {184,192}, {207,189}, {203,202}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_lushen.lua"},
				
			{	nNpcId = 455, nLevel = 1, nMapId = 37, szName = "����", 
				tbPos = {{210,196}, {222,191}, {228,193}, {208,188}, {220,187}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_shoushen.lua"},
		},
	tbLine			= {	
					[1] = {{1,2},{2,3},{3,1}},	-- ��»��
					[2] = {{1,3},{3,2},{2,1}},	-- ����»
	},
	tbArry			= {
		-- ����1
		-- 	��һ�У���»��
		-- 	�ڶ��У�»�ٸ�
		-- 	�����У��ٸ�»
		-- ����2��
		-- 	��һ�У�����»
		-- 	�ڶ��У���»��
		-- 	�����У�»����
		-- 1:������2:���룻3:����
		{1, 2, 3},
		{1, 3, 2},
		{2, 1, 3},
		{2, 3, 1},
		{3, 1, 2},
		{3, 2, 1},
	},
	
	nNpcParam_selfid	= 1,
	nNpcParam_nextid	= 2,
	nNpcParam_ntimed	= 3,
	nNpcParam_ladder	= 4,
	nNpcParam_ntype		= 5,
	
	TSK_CHUNJIE2009_VERSION = 1937,
	TSK_CHUNJIE2009_FLS_NTIMEID = 1938,
	TSK_CHUNJIE2009_FLS_STAGE = 1939,
	TSK_CHUNJIE2009_FLS_MAXEXP = 1940,
	
	nDate_Start = 09011612,
	nDate_Close = 09021520,
	
	nMaxExp = 360000000,
}


function reset_task_version()
	if (GetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_VERSION) ~= TB_CHUNJIE0901_FINDNPC.nDate_Start) then
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_VERSION, TB_CHUNJIE0901_FINDNPC.nDate_Start);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP, 0);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, 0);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 0);
	end
end


function OnCancel()
end


function tbChunjie_Jieri_2009:fulushounpc_settask(ntaskid, nvalue, nbyte)
	local nTskValue = GetTask(ntaskid);
	
	if (nbyte) then
		nTskValue = SetByte(nTskValue, nbyte, nvalue);
		SetTask(ntaskid, nTskValue);
	else
		SetTask(ntaskid, nvalue);
	end
end


function tbChunjie_Jieri_2009:fulushounpc_gettask(ntaskid, nbyte)
	local nTskValue = GetTask(ntaskid);
	if (nbyte) then
		return GetByte(nTskValue, nbyte);
	else
		return nTskValue;
	end
end




function tbChunjie_Jieri_2009:fulushounpc_main()
	
	reset_task_version();
	
	local nSvrTimeId = tonumber(GetLocalDate("%y%m%d%H"));
	
	if (nSvrTimeId < 09011612 or nSvrTimeId > 09021520) then
		CreateTaskSay({"<dec><npc>".."�����Ǻ�.", "�����Ի�/OnCancel"});
		return 0;
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local nTimeid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntimed);
	--Msg2Player(nTimeid, nSvrTimeId)
	if (nTimeid ~= nSvrTimeId) then
		CreateTaskSay({"<dec><npc>".."��ѽ���.", "�����Ի�/OnCancel"});
		return 0;
	end
	
	local nnpc_selfid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_selfid);
	local nnpc_nextid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_nextid);
	
	local nmy_nextid = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 1);
	
	local nMyTimeId = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID);
	local nMyStage = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 2);
	
	--print(nMyTimeId, nMyStage, nnpc_nextid, nnpc_selfid)
	
	if (nMyTimeId ~= nTimeid) then
		CreateTaskSay({"<dec><npc>".."��Ҫ����λ����, ����һ������ͥȥ�ݼ����.", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "��ҪѰ�ҵ�һλ", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 1, nNpcIndex),
				"<#> ��һ��ͻ���!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_selfid and nMyStage == 1) then
		CreateTaskSay({"<dec><npc>".."��л�����Ĵ���, �����̾�ȥ!", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "��Ҫ����Ѱ�ҵڶ�λ", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 2, nNpcIndex),
				"<#>��һ��ͻ���!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_selfid and nMyStage == 2) then
		CreateTaskSay({"<dec><npc>".."��л�����Ĵ���! ������һ���´�С����!", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "�õ�����", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 3, nNpcIndex),
				"<#> ��һ��ͻ���!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_nextid and nMyStage == 3) then
		CreateTaskSay({"<dec><npc>".."��л�����Ĵ���, �����̾�ȥ!", 
				"�����Ի�/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."�����Ǻ�.", "�����Ի�/OnCancel"});
	end
end

function tbChunjie_Jieri_2009:fulushounpc_start(ntimeid, nnpc_selfid, nnpc_nextid, nstage, nNpcIndex)
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nnpc_nextid, 1);
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nstage, 2);
	
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, ntimeid);
	
	-- �ҵ����һ�����򷢽�
	if (nstage == 3) then
		local ntype = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntype);
		local nladder = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder) + 1;
		SetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder, nladder);
		--Msg2Player("���ǵ�"..nladder)
		
		local nladder = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder);
		local coef = 100;
		if (nladder >= 1 and nladder <= 3) then
			coef = 300;
		elseif (nladder >= 4 and nladder <= 10) then
			coef = 200;
		end
		
		-- local nrand = random();		-- �����þͷ���
		if (nladder <= 10 and ntype == 1) then
			coef = coef * 2;
			--Msg2Player("�����÷���")
		elseif (ntype == 2) then						-- ���þͼ����
			coef = coef * 0.5;
			--Msg2Player("�������ü���")
		else
			--Msg2Player("������");
		end
		
		-- �ȿ��ǲ��ǵ�һ�������߽���
		if (nladder == 1) then
			tbItem = {
				{szName="����֮�׽������", nQuality=1, tbProp={0, 143},nRate = 0.5},
				{szName="����֮����Ǭ����", nQuality=1, tbProp={0, 144},nRate = 0.5},
				{szName="����֮�׽�����", nQuality=1, tbProp={0, 145},nRate = 0.5},
				{szName="����֮�������Ȧ", nQuality=1, tbProp={0, 146},nRate = 0.5},
				{szName="���ؿ�ʯ", tbProp={6,1,398,1,1,0},nRate = 0.5},
				{szName="�����ؼ�", tbProp={6,1,26,1,1,0},nRate = 1},
				{szName="ϴ�辭", tbProp={6,1,22,1,1,0},nRate = 1},
--				{szName="����֮�׽������", nQuality=1, tbProp={0, 143},nRate = 20},
--				{szName="����֮����Ǭ����", nQuality=1, tbProp={0, 144},nRate = 20},
--				{szName="����֮�׽�����", nQuality=1, tbProp={0, 145},nRate = 20},
--				{szName="����֮�������Ȧ", nQuality=1, tbProp={0, 146},nRate = 10},
--				{szName="���ؿ�ʯ", tbProp={6,1,398,1,1,0},nRate = 10},
--				{szName="�����ؼ�", tbProp={6,1,26,1,1,0},nRate = 10},
--				{szName="ϴ�辭", tbProp={6,1,22,1,1,0},nRate = 10},
			};
			tbAwardTemplet:GiveAwardByRate(tbItem, "chunjie_jieri2009_fulushou")
			
		end
				
		local nLevel = GetLevel();
		local naddexp = nLevel * nLevel * coef;
		local nmycurexp = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP);
		if (nmycurexp >= TB_CHUNJIE0901_FINDNPC.nMaxExp) then
			Msg2Player("�Ѿ���ȡ��߾���.");
			return 0;
		elseif (nmycurexp + naddexp >= TB_CHUNJIE0901_FINDNPC.nMaxExp) then
			naddexp = TB_CHUNJIE0901_FINDNPC.nMaxExp - nmycurexp;
		end
		
		self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP, nmycurexp + naddexp);
		AddOwnExp(naddexp);
		Msg2Player(format("�õ� %d����.", naddexp));
		
		self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nstage, 0);
		
		-- self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, ntimeid);
	else
		Msg2Player("��ȡ����Ѱ����������.");
	end
end

