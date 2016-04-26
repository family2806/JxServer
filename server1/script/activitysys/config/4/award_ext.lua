_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>��ϲ<color=yellow>%s<color=green> �� �յ���Ʒ<color=yellow>%s<color=green>", GetName(), strItemName)
	AddGlobalNews(strMessage)
	--local handle = OB_Create();
	--ObjBuffer:PushObject(handle, strMessage)
	--RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	--OB_Release(handle)
end	
Award_A = 
{
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
	{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.4},
	{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
	{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
	{szName = "���ڷ���- ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "������- ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "����Ь - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "��������- ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}, nRate =0.004, CallBack = _Message},
	{szName = "���ڻ��� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "�������� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "�������� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "�����Ͻ�ָ- ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "�����½�ָ- ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "������е - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, nRate = 0.001, CallBack = _Message},
	{szName="�ƽ�ӡ",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="�ƽ�ӡ",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="�ƽ�ӡ",tbProp={0,3210},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="�ƽ�ӡ",tbProp={0,3220},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="����Կ��",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	{szName="�����ɱ��",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
	{szName="���- Ӣ��ս��",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.2,nExpiredTime=10080,nUsageTime=60},
	{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="Ԫ˧���",tbProp={0,11,447,1,0,0},nCount=1,nRate=1,nExpiredTime=10080,nUsageTime=60},
	{szName="��Ӱ���",tbProp={0,11,455,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="��Կ��",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="���鵤",tbProp={6,1,3022,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="Ǭ��˫��",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
	{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
	{szName="��������",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="������Ѫ��",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="���ٻ����",tbProp={6,1,2520,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="�������",tbProp={6,1,2402,1,0,0},nCount=1,nRate=4,nExpiredTime=10080},
	{szName="ˮ������",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="�챦����",tbProp={6,1,2813,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="����������",tbProp={6,1,3005,1,0,0},nCount=1,nRate=0.2},
	{szName="�ν��б����",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName = "�i����ֵ", nExp=5000000,nRate=46.417},
	{szName = "�i����ֵ", nExp=10000000,nRate=6},
	{szName = "�i����ֵ", nExp=15000000,nRate=2.5},
	{szName = "�i����ֵ", nExp=20000000,nRate=0.5},
	{szName = "�i����ֵ", nExp=50000000,nRate=0.05},
}

