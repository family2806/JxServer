Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
local  _Message =  function (nItemIndex, strBoxName)
	local handle = OB_Create()
	local msg = format("<color=green>ף�ظ���<color=yellow>%s<color=green> �Ѿ���� <color=yellow><%s><color=green> ��<color=yellow><%s><color>" ,GetName(),GetItemName(nItemIndex), strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
local  BingoBoxAddExp =  function (nAmount, strBoxName)
	AddOwnExp(nAmount)
	Msg2Player("�ﵽ���鲻�ܺϲ� "..nAmount)
	tbLog:PlayerAwardLog("BachBaoRuong", "SuDungTinhMyBaoRuong", "����ֵ", "", nAmount)
	local handle = OB_Create()
	local msg = format("<color=green>ף�ظ���<color=yellow>%s<color=green> �Ѿ����<color=yellow><%s><color=green> ��<color=yellow><%s><color>" ,GetName(),nAmount.." ����ֵ", strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
tbBingoBoxAward = {
	[3053] = {		--���ر���	
		{szName = "���ڷ��� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "���ڽ��� (Max Option - ��ѡ��ϵ)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "����Ь (Max Option) - ��ѡ��ϵ)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�������� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "���ڻ���(Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "��������(Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "��������(Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�����Ͻ�ָ(Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�����½�ָ(Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�������� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},	
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 12, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "����ֵ", nRate=10, pFun = function() %BingoBoxAddExp(200e6, "���ر���") end},
		{szName = "����ֵ", nRate=6, pFun = function() %BingoBoxAddExp(500e6, "���ر���") end},
		{szName="����",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="����",tbProp={0,3500},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="����",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�������",tbProp={0,3502},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="��ѩ��˪",tbProp={0,3504},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="���޷�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="����ʯ",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�ƽ�ӡ (ǿ��)",tbProp={0,3211},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�ƽ�ӡ (����)",tbProp={0,3221},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
	},
	[3054] = {--��������
		{szName="���ڿ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����±���",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����Ь����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="���ڻ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����屦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����Ͻ䱦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����½䱦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "��������") end},	
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 15, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.5, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����",tbProp={0,3500},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�������",tbProp={0,3502},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="��ѩ��˪",tbProp={0,3504},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="���޷�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����ʯ",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����",tbProp={0,10,7,1,0,0},nCount=1,nRate=4,nExpiredTime=259200, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName = "����ֵ", nRate=15, pFun = function() %BingoBoxAddExp(100e6, "��������") end},
		{szName = "����ֵ", nRate=9, pFun = function() %BingoBoxAddExp(200e6, "��������") end},
		{szName = "����ֵ", nRate=2, pFun = function() %BingoBoxAddExp(500e6, "��������") end},		
	},
}
tbBingoBoxAward_2 = {
	[3053] = {		--���ر���	
		{szName = "���ڷ��� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "���ڽ��� (Max Option - ��ѡ��ϵ)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "����Ь (Max Option) - ��ѡ��ϵ)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "��������  (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "���ڻ��� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�������� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�������� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�����Ͻ�ָ(Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�����½�ָ(Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "�������� (Max Option) - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "���ر���") end},	
		{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3182,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName = "����ֵ", nRate=16, pFun = function() %BingoBoxAddExp(200e6, "���ر���") end},
		{szName = "����ֵ", nRate=8, pFun = function() %BingoBoxAddExp(500e6, "���ر���") end},
		{szName="����",tbProp={0,3499},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},		
		{szName="����",tbProp={0,3501},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="�������",tbProp={0,3502},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="��ѩ��˪",tbProp={0,3504},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="���޷�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
		{szName="����ʯ",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8.4,CallBack = function(nParam) %_Message(nParam, "���ر���") end},
	},
	[3054] = {--��������
		{szName="���ڿ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����±���",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����Ь����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="���ڻ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����屦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����Ͻ䱦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�����½䱦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "��������") end},			
		{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻�����ͼ��",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.8, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.8, CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����",tbProp={0,3499},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},		
		{szName="����",tbProp={0,3501},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="�������",tbProp={0,3502},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="��ѩ��˪",tbProp={0,3504},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="���޷�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "��������") end},
		{szName="����ʯ",tbProp={6,1,30224,1,0,0},nCount=1,nRate=9,CallBack = function(nParam) %_Message(nParam, "��������") end},		
		{szName = "����ֵ", nRate=16.6, pFun = function() %BingoBoxAddExp(100e6, "��������") end},
		{szName = "����ֵ", nRate=12, pFun = function() %BingoBoxAddExp(200e6, "��������") end},
		{szName = "����ֵ", nRate=5, pFun = function() %BingoBoxAddExp(500e6, "��������") end},		
	},
}
local tbBingoBoxLog = {
	[3053] = "SuDungQuyTrongBaoRuong",
	[3054] = "SuDungTinhMyBaoRuong",--��������
}
local tbBingoBoxTSKDailyLimit = {
	[3053] = 3078,
	[3054] = 3077,--��������
}
local tbBingoBoxFreeBag = {
	[3053] = {nW = 1, nH = 1},
	[3054] = {nW = 2, nH = 3},--��������
}
function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	if nP ~= 3053 and nP ~= 3054 then
		return 1
	end
	local nTSKID = %tbBingoBoxTSKDailyLimit[nP]
	if PlayerFunLib:CheckTaskDaily(nTSKID, 10, format("ʹ����Ʒ %s �Ѵ�����, ������ʹ��.", GetItemName(nItemIndex)), "<") ~= 1 then
		return 1
	end
	local tbFreeBag = %tbBingoBoxFreeBag[nP]
	if PlayerFunLib:CheckFreeBagCellWH(tbFreeBag.nW, tbFreeBag.nH, 1, "default") ~= 1 then
		return 1
	end
	PlayerFunLib:AddTaskDaily(nTSKID, 1)	
	if mod(PlayerFunLib:GetTaskDailyCount(nTSKID), 4) == 0 then	
		tbAwardTemplet:Give(tbBingoBoxAward_2[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP].."2"})
	else
		tbAwardTemplet:Give(tbBingoBoxAward[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP]})
	end
	return 0
end