Include("\\script\\lib\\log.lua")
_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>��ϲ<color=yellow>%s<color=green> �ѻ��<color=yellow>%s<color=green>", GetName(), strItemName)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("�����"..nCount.."��ṱ�׵�")
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "ʹ����Ʒ", nCount.." ��ṱ�׵�")
	end
end

tbAward_Ext = {
	["award2000"] = {
		--{szName="������������,tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message}
		  {szName = "������е-��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message},
	},
	["awardspecial"] = { 
			{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200, CallBack = _Message},
			{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="��ç֮�� (ñ��)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={1,0,0,0,0,0}},
			{szName="��ç֮��  (����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={4,0,0,0,0,0}},
			{szName="��ç֮��  (����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={3,0,0,0,0,0}},
			{szName="��ç֮��  (����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={8,0,0,0,0,0}},
			{szName="��ç֮��  (�·�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={5,0,0,0,0,0}},
			{szName="��ç֮��  (Ь��)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={7,0,0,0,0,0}},
			{szName="��ç֮��  (����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={0,0,0,0,0,0}},
			{szName="��ç֮��  (�Ͻ�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={2,0,0,0,0,0}},
			{szName="��ç֮�� (�½�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={9,0,0,0,0,0}},
			{szName="��ç֮��  (����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={6,0,0,0,0,0}},
			{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=2},
			{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=2},
			{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},
			{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},
			{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},
			{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=2},
			{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=2},
			{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},
			{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},
			{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},
			{szName = "�i����ֵ", nExp=20000000,nRate=40.5},
			{szName = "�i����ֵ", nExp=50000000,nRate=10},
			{szName = "�i����ֵ", nExp=100000000,nRate=5},
			{szName="���ڿ�����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="�����±���",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="����Ь����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="���ڻ�����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="�����屦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="�����Ͻ䱦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="�����½䱦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=3.3},
			{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=2, CallBack = _Message},
			{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="�������",tbProp={0,11,561,1,0,0},nCount=1,nRate=1,nExpiredTime=43200, CallBack = _Message},	
		},
	["awardnomal"] ={ --Server ���Լ�����
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
		{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.3},
		{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.3},
		{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3},
		{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3},
		{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.2},
		{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.3},
		{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.3},
		{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
		{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
		{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},
		{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.5},
		{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2,CallBack = _Message},
		{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1,CallBack = _Message},
		{szName="���ڿ�����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="�����±���",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="����Ь����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="���ڻ�����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="�����屦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="�����Ͻ䱦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="�����½䱦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.001, CallBack = _Message},
		{szName="20000 �i��ṱ��ֵ",nCount=1,nRate=4.5, pFun = function() %pContributionAward(20000) end},
		{szName="50000 �i��ṱ��ֵ",nCount=1,nRate=2.5, pFun = function() %pContributionAward(50000) end},
		{szName="100000 �i��ṱ��ֵ",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
		{szName="150�����ؼ� (19��)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="150�����ؼ� (20��)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="�������",tbProp={0,11,561,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200, CallBack = _Message},
		{szName="Ӣ����",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
		{szName="�׵���",tbProp={6,1,1617,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="�ƽ�Կ��",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="����Կ��",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
		{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
		{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName="����������",tbProp={6,1,2952,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="������Ѫ��",tbProp={6,1,2953,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="������¶",tbProp={6,1,2266,1,0,0},nCount=1,nRate=0.1},
		{szName="ǧ����¶",tbProp={6,1,2267,1,0,0},nCount=1,nRate=0.1},
		{szName="������¶",tbProp={6,1,2268,1,0,0},nCount=1,nRate=0.1},
		{szName="�سǷ�(С) ",tbProp={6,1,1082,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="�سǷ�(��) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="�ν��б����",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName = "�i����ֵ", nExp=5000000,nRate=49.527},
		{szName = "�i����ֵ", nExp=10000000,nRate=6},
		{szName = "�i����ֵ", nExp=15000000,nRate=2.5},
		{szName = "�i����ֵ", nExp=20000000,nRate=0.5},
		{szName = "�i����ֵ", nExp=50000000,nRate=0.05},
	},
}	
