-- �ļ�������npctree.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-16 14:27:13
--��������: �ҽ����������
--����: 
--- ����ֻ�����ڳ���, ����
--�ɳ�ʱ��: 120 ��
-- 1 ����40��: ������״
--41����60��: ���糤�� 
--61����90��: �����л�
--91����120��: ����ȡ��Ʒ
--��ȡ����ʱ��: 120 ��
--121����240��: �ҽ���������ɻ�ý�Ʒ
--241�뿪ʼ�����Զ���ʧ.

--�ɻ��������飬�и���
--���	����	����
--1	500,000	35%
--2	1,000,000	30%
--3	1,500,000	25%
--4	2,000,000	10%
--- �ɻ�ý�����Ʒ���и���
--���	��Ʒ	����
--1	�и�Ե¶	75%
--2	��Ե¶	20%
--3	�ɲ�¶	5%

Include("\\script\\event\\springfestival08\\luckplanting\\treehead.lua")
--Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
--Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\lib\\awardtemplet.lua")
function isTree0801Master(nNpcIdx, ntask)

	
	local nMaster = GetNpcParam(nNpcIdx, PRM_TREE_0801_PLAYID);
	local nGameTime = GetNpcParam(nNpcIdx, PRM_TREE_0801_GAMETIME);
	
	if (nMaster < 0) then
		nMaster = nMaster + 4294967296;	-- id+2^32
	end;
	if (FileName2Id(GetName()) == nMaster and GetRoleCreateTimeData() == nGameTime) then
		return 1;
	end;
	return nil
end;

function main()	--�Ի����
	local nNpcIdx = GetLastDiagNpc();
	
	if (isTree0801Master(nNpcIdx)) then
		local nEvent = GetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT);
		if nEvent == 1 then
			Msg2Player("С�����ڳ���.")
		elseif nEvent == 2 then
			Msg2Player("�����ڷ�ѿ.")
		elseif nEvent == 3 then
			Msg2Player("����ʼ������.")
		elseif nEvent == 4 then
			Msg2Player("̫���ˣ������������λ������Ҫ̫�ļ����ܿ�Ϳ����쵽������.")
		elseif nEvent == 5 then
			Msg2Player("��л���Ϥ�����������콱.")
			SetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT, 6);
			luckplanting_0801_GiveAward()
		elseif nEvent == 6 then
			Msg2Player("��������Ѿ��콱�ˣ���ѡû�������ˣ���ô��ô�����?")
		end
	else
		Msg2Player("������������ֵ�.")
	end;
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	local nPlayerId = GetNpcParam(nNpcIdx, PRM_TREE_0801_PLAYID);
	if (nPlayerId < 0) then
		nPlayerId = nPlayerId + 4294967296;	-- id+2^32
	end;
	
	local nEvent = GetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT);
	if nEvent >= 5 then		
		if nEvent == 5 then			
			local strOwnerName = gsub(GetNpcName(nNpcIdx), "����", "")
			local nOwnerIndex = SearchPlayer(strOwnerName)
			local nOldPlayer = PlayerIndex
			if nOwnerIndex > 0 then
				PlayerIndex = nOwnerIndex
			end
			local nPosX, nPosY = GetNpcPos(nNpcIdx)
			tbLog:PlayerActionLog("EventUomMamMayMan","CayBienMat", "ChuaThuHoach", SubWorld, nPosX, nPosY)
			PlayerIndex = nOldPlayer
		end
		DelNpc(nNpcIdx)
		return
	end
	
	
	local nGameTime = GetNpcParam(nNpcIdx, PRM_TREE_0801_GAMETIME);
	
	local nX, nY = GetNpcPos(nNpcIdx);	--������
	local szName = GetNpcName(nNpcIdx);
	if plantTree_0801(nEvent+1, SubWorld, nX, nY, szName, nPlayerId, nGameTime) == 0 then
		SetNpcTimer(nNpcIdx, 18);
	else
		DelNpc(nNpcIdx)
	end
end;

function luckplanting_0801_GiveAward()
	local tbAward = 
		{
			{szName="������ͼ��",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.4},
			{szName="������ͼ��",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.4},
			{szName="��������ͼ��",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.4},
			{szName="��������ͼ��",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.4},
			{szName="��������ͼ��",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.4},
			{szName="������ͼ��",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.4},
			{szName="����Ьͼ��",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.4},
			{szName="�����Ͻ�ָͼ��",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.01},
			{szName="�����½�ָͼ��",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.01},
			{szName="��������ͼ��",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.01},
			{szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.01},
			{szName="��Գ��",tbProp={6,1,2351,1,0,0},nCount=1,nRate=1},
			{szName = "�i����ֵ", nExp=6000000,nRate=31.86},
			{szName = "�i����ֵ", nExp=8000000,nRate=25},
			{szName = "�i����ֵ", nExp=10000000,nRate=10},
			{szName = "�i����ֵ", nExp=15000000,nRate=5},
			{szName = "�i����ֵ", nExp=20000000,nRate=3},
			{szName = "�i����ֵ", nExp=30000000,nRate=2},
			{szName = "�i����ֵ", nExp=50000000,nRate=1},
			{szName="�����������",tbProp={6,1,1781,1,0,0},nCount=1,nRate=15,tbParam={60}},
			{szName="�ƽ�ӡ(ǿ��)",tbProp={0,3209},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="�ƽ�ӡ(ǿ��)",tbProp={0,3210},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="�ƽ�ӡ(ǿ��)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="�ƽ�ӡ(����)",tbProp={0,3219},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="�ƽ�ӡ(����)",tbProp={0,3220},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="�ƽ�ӡ(����)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="����������",tbProp={6,1,1672,1,0,0},nCount=1,nRate=1},
		}
	tbAwardTemplet:Give(tbAward, 1, {"EventUomMamMayMan", "ThuHoach"})
end
