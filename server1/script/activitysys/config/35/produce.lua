
tbAwardList = {}
tbAwardLog = {}

--you can defind award but you need to consider Bag space
tbAwardList["TREE"] = {
	[1]={szName="â��",tbProp={6,1,3093,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[2]={szName="����֦��",tbProp={6,1,3094,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[3]={szName="����",tbProp={6,1,3095,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[4]={szName="����",tbProp={6,1,3096,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[5]={szName="����",tbProp={6,1,3097,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[6]={szName="�㽶",tbProp={6,1,3098,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[7]={szName="����",tbProp={6,1,3099,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[8]={szName="Ҭ��",tbProp={6,1,3100,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[9]={szName="ľ��",tbProp={6,1,3101,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[10]={szName="�޻���",tbProp={6,1,3102,1,0,0},nCount = 5,nExpiredTime=20120201,},
	}
	
tbAwardLog["TREE"] = {
	[1] = "�ڰٹ������ջ�5��â��",
	[2] = "�ڰٹ������ջ�5��ľ��",
	[3] = "�ڰٹ������ջ�5������",
	[4] = "�ڰٹ������ջ�5������",
	[5] = "�ڰٹ������ջ�5���޻���",
	[6] = "�ڰٹ������ջ�5���㽶",
	[7] = "�ڰٹ������ջ�5������֦",
	[8] = "�ڰٹ������ջ�5������",
	[9] = "�ڰٹ������ջ�5��Ҭ��",
	[10] = "�ڰٹ������ջ�5������",
	}	
	
tbAwardList["WUGUOBAIYINPAN"] = {
	[1]={nExp=1000000,},
	}	
tbAwardLog["WUGUOBAIYINPAN"] = "used wuguobaiyinpan"

tbAwardList["WUGUOBAIYINPAN_REDBAG"] = {
	{szName="������(С)",tbProp={6,1,3108,1,0,0},nRate = 30.0,nExpiredTime=20120201,},
	}	
tbAwardLog["WUGUOBAIYINPAN_REDBAG"] = "ʹ�����������������"

tbAwardLog["WUGUOBAIYINPAN_USED"] = {
	[500] = "ʹ���������500��",
	[1000] = "ʹ���������1000��",
	}

--�ı�ʹ������ƽ��̽���- Modified By DinhHQ - 20120103
--tbAwardList["WUGUOHUANGJINPAN"] = {
--	[1]={szName="������ʯ",tbProp={6,1,147,1,0,0}},
--	[2]={nExp=1,},
--	}
tbAwardLog["WUGUOHUANGJINPAN"] = "ʹ������ƽ�������Ʒ����"

tbAwardList["WUGUOHUANGJINPAN_REDBAG"] = {
	{szName="������(С)",tbProp={6,1,3108,1,0,0},nRate = 60.0,nExpiredTime=20120201,},
	}
tbAwardLog["WUGUOHUANGJINPAN_REDBAG"] = "ʹ������ƽ�����������"

tbAwardList["WUGUOHUANGJINPAN_USED"] = {
	[100] = {nExp=10000000,},
	[200] = {nExp=10000000,},
	[300] = {nExp=10000000,},
	[400] = {nExp=10000000,},
	[500] = {nExp=20000000,},
	[600] = {nExp=20000000,},
	[700] = {nExp=20000000,},
	[800] = {nExp=20000000,},
	[900] = {nExp=20000000,},
	[1000] = {nExp=30000000,},
	[1100] = {nExp=30000000,},
	[1200] = {nExp=30000000,},
	[1300] = {nExp=30000000,},
	[1400] = {nExp=30000000,},
	[1500] = {nExp=40000000,},
	[1600] = {nExp=40000000,},
	[1700] = {nExp=40000000,},
	[1800] = {nExp=40000000,},
	[1900] = {nExp=40000000,},
	--Change request event ����- Modified By DinhHQ - 20120103
	--[2000] = {nExp=50000000,},	
	[2000] = {szName="������",tbProp={6,1,2349,1,0,0},nCount=1,},
	}

tbAwardLog["WUGUOHUANGJINPAN_USED"] = {
	[100] = "ʹ������ƽ���100��",
	[200] = "ʹ������ƽ���200��",
	[300] = "ʹ������ƽ���300��",
	[400] = "ʹ������ƽ���400��",
	[500] = "ʹ������ƽ���500��",
	[600] = "ʹ������ƽ���600��",
	[700] = "ʹ������ƽ���700��",
	[800] = "ʹ������ƽ���800��",
	[900] = "ʹ������ƽ���900��",
	[1000] = "ʹ������ƽ���1000��",
	[1100] = "ʹ������ƽ���1100��",
	[1200] = "ʹ������ƽ���1200��",
	[1300] = "ʹ������ƽ���1300��",
	[1400] = "ʹ������ƽ���1400��",
	[1500] = "ʹ������ƽ���1500��",
	[1600] = "ʹ������ƽ���1600��",
	[1700] = "ʹ������ƽ���1700��",
	[1800] = "ʹ������ƽ���1800��",
	[1900] = "ʹ������ƽ���1900��",
	[2000] = "ʹ������ƽ���2000��",
	}
--�ı�����ƽ��̽���- Modified By DinhHQ - 20120103 - Server c?
tbAwardList["WUGUOHUANGJINPAN"] = {
	[1] ={nExp=6000000,}, 
	[2] = {
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.05},
		{szName="���ڽ���",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.2},
		{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
		{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
		{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
		{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
		{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
		{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
		{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
		{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
		{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
		{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.1},
		{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
		{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1},
		{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.05},
		{szName="�׵���",tbProp={6,1,1617,1,0,0},nCount=1,nRate=1},
		{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="����ʯ",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.5},
		{szName="��»ʯ",tbProp={6,1,2711,1,0,0},nCount=1,nRate=1},
		{szName="���ʯ",tbProp={6,1,2710,1,0,0},nCount=1,nRate=1},
		{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.1},
		{szName="�쾫�׾���",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3},
		{szName="�ν��б����",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="����",tbProp={0,3491},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="����",tbProp={0,3492},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="����",tbProp={0,3493},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="��ˮ",tbProp={0,3494},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="����",tbProp={0,3495},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="����",tbProp={0,3496},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="���",tbProp={0,3497},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="׷Ӣ",tbProp={0,3498},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="����",tbProp={0,3499},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="���",tbProp={0,3500},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="����",tbProp={0,3501},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="�������",tbProp={0,3502},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="��ӧ",tbProp={0,3503},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="��ѩ��˪",tbProp={0,3504},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="��⳾Ե",tbProp={0,3505},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="���ƾ���",tbProp={0,3506},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="7���ƽ�ӡ (ǿ��)",tbProp={0,3211},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="7���ƽ�ӡ(����)",tbProp={0,3221},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName = "�i����ֵ", nExp=5000000,nRate=40},
		{szName = "�i����ֵ", nExp=8000000,nRate=13},
		{szName = "�i����ֵ", nExp=10000000,nRate=10},
		{szName = "�i����ֵ", nExp=15000000,nRate=5},
		{szName = "�i����ֵ", nExp=20000000,nRate=1.6},
		{szName = "�i����ֵ", nExp=50000000,nRate=0.5},
		{szName = "�i����ֵ", nExp=100000000,nRate=0.05},
	},
}
