-- �ļ�������zhizuochuangongwan.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-02-22 17:16:36
--����������Ľű�
IncludeLib("SETTING");
Include("\\script\\event\\BeiDouChuanGong\\lib\\compose.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function BeiDouChuanGong_main(nStep)
	local tbSay 
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>��������Ҫ�������ɵ���?",
			"�������ɵ�/#BeiDouChuanGong_main(2)",
			"�ͱ���������/#BeiDouChuanGong_main(3)",
			"ʹ��ʱ����Ϣ/#BeiDouChuanGong_main(4)",
			"�����Ի�/OnCancel",
		}
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>��Ҫ�������ɵ�",
			"���浤/#BeiDouChuanGong_zuodan([[bai]])",
			"Ѫ�浤/#BeiDouChuanGong_zuodan([[xue]])",
			"���浤/#BeiDouChuanGong_zuodan([[xuan]])",
			"�Ͻ��浤/#BeiDouChuanGong_zuodan([[zijin]])",
			"�����Ի�/OnCancel",
		}
	elseif nStep == 3 then
		tbSay = 
		{
			format("<dec><npc>�ɵ�����: �������������ɵ�ʱҪ��100����ֵ. �ɵ�������ԭ������.<enter>���浤: 1����������, 1�����ǲ�<enter>Ѫ�浤: 1����������, 1�������ǲ� <enter>���浤: 1����������, 1ǧ�����ǲ�<enter>�Ͻ��浤: 1����������, 1��������ʻ�<enter>���浤:  ����<enter>3���ɵ�, ֻ��ﵽ50�����ҳ�ֵ�˾Ϳ���ʹ�ò���ȡ30���ܾ���, �ﵽ��߾����Ҫ�� %d ��ſ�����ʹ��. ֻ�����ת���ſ���ʹ�����浤. �Ͻ��浤�ͻƽ��浤��ȡ�ľ���ֵ���Թ��ò�����ʹ����֮��Ҫ60��ſ��Լ���ʹ��",floor( TSKV_BeiDouChuanGong_UseLimit/(60*60*24) ) ),
			"�����Ի�/OnCancel",
		}
	elseif nStep == 4 then
		
		local nCurTime			= GetCurServerTime()
		local nTSKVExp			= GetBeiDouChuanGongExp();
		local nTSKVTime			= GetTask(TSK_BeiDouChuanGong_NIANYUE);
		local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);
		local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
		
		local szMsg_Common = "�����ڵĹ���, �����ʹ����ͨ�����ɵ�.";
		local szMsg_ZiJin  = "�����ڵĹ���, �����ʹ���Ͻ��浤.";
		local szMsg_Huang  = "�����ڵĹ���, �����ʹ�û��浤.";
		
		-- ��ͨ�浤
		if nTSKVExp >= 30e8 and nTSKVTime + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Common = format("������Ҫ�ٵ� <color=yellow>%d �� %d Сʱ %d ���� %d ��<color> �ſ���ʹ����ͨ�����ɵ�.",nDay,nHour,nMin,nSec);
		end
		
		-- �Ͻ��浤
		if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_ZiJin = format("������Ҫ�ٵ� <color=yellow>%d �� %d Сʱ %d ���� %d ��<color> �ſ���ʹ���Ͻ��浤.",nDay,nHour,nMin,nSec);
		end
		
		-- ���浤
		if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Huang = format("������Ҫ�ٵ� <color=yellow>%d �� %d Сʱ %d ���� %d ��<color> �ſ���ʹ�û��浤.",nDay,nHour,nMin,nSec);
		end		
		
		tbSay = 
		{
			format("<dec><npc>%s<enter>%s<enter>%s", szMsg_Common, szMsg_ZiJin, szMsg_Huang),
			"�����Ի�/OnCancel",
		}
	end
	CreateTaskSay(tbSay)
end

BeiDouChuanGong_tbItem = 
{
	[1] = {szName="����������", tbProp={6, 1, 1672}, nCount = 1},      
	[2] = {szName="���ǲ�", tbProp={6, 1, 1673}, nCount = 1},          
	[3] = {szName="�������ǲ�", tbProp={6, 1, 1674}, nCount = 1},      
	[4] = {szName="ǧ�����ǲ�", tbProp={6, 1, 1675}, nCount = 1},      
	[5] = {szName="���浤", tbProp={6, 1, 1676, 1, 0, 0}, nCount = 1},          
	[6] = {szName="Ѫ�浤", tbProp={6, 1, 1677, 1, 0, 0}, nCount = 1},          
	[7] = {szName="���浤", tbProp={6, 1, 1678, 1, 0, 0}, nCount = 1},
	[8] = {szName="������ʻ�", tbProp={6, 1, 2265, 1, 0, 0}, nCount = 1},
	[9] = {szName="�Ͻ��浤", tbProp={6, 1, 2263, 1, 0, 0}, nCount = 1},
}
BeiDouChuanGong_tbRecipe = 
{
	bai		= {tbItemList = {1,2}, nExp = 5e8, tbAwardItem = 5},
	xue		= {tbItemList = {1,3}, nExp = 10e8, tbAwardItem = 6},
	xuan	= {tbItemList = {1,4}, nExp = 15e8, tbAwardItem = 7},
	zijin	= {tbItemList = {1,8}, nExp = 20e8,tbAwardItem = 9},
}
function BeiDouChuanGong_zuodan(szDanType,nStep)
	local tbRecipe = BeiDouChuanGong_tbRecipe[szDanType]
	local tbAwardItem = BeiDouChuanGong_tbItem[tbRecipe.tbAwardItem]
	if nStep ~= 1 then
		local szTitle = format("��λͬ����<color=yellow>%s<color> ��? ���������ȡ����ֵ���������.", tbAwardItem.szName)
		local tbOpt = {}
		tbOpt[1] = format("��ng ?!/#BeiDouChuanGong_zuodan([[%s]],1)", szDanType)
		tbOpt[2] = "ȡ��/OnCancel"
		return Say(szTitle,getn(tbOpt),tbOpt);
	end
	
	if GetExp() < 1000000 then
		return Say("��Ǹ, ���ھ��鲻��1����, ��������.", 0)
	end
	
	local tbMaterial = {};
	for i=1, getn(tbRecipe.tbItemList) do
		tinsert(tbMaterial, i, BeiDouChuanGong_tbItem[tbRecipe.tbItemList[i]]);
	end
	BeiDouChuanGong_ComposeClass:Compose(tbMaterial,0,BeiDouChuanGong_zuodan_complished, tbRecipe.nExp, tbAwardItem)
	
end

function BeiDouChuanGong_zuodan_complished(nMaxExp, tbAwardItem)
	local nPlayerCurExp = GetExp();
	local nExp = nMaxExp;
	if nPlayerCurExp < nMaxExp then
		nExp = nPlayerCurExp
	end
	ReduceOwnExp(nExp);
	local nItemIndex = BeiDouChuanGong_lib_AddAward(tbAwardItem, "��������")
	SetSpecItemParam(nItemIndex, 1, mod(nExp, 1e8));	--������Ʒ�ܵõ��ľ���
	SetSpecItemParam(nItemIndex, 2, nExp / 1e8);		--������Ʒ�ܵõ��ľ���
	SyncItem(nItemIndex);
end
