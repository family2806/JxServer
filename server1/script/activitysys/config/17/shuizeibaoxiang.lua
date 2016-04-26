Include("\\script\\activitysys\\config\\17\\head.lua")
-- Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

pActivity.tbAward = {}
pActivity.tbAward["shuizeibaoxiang"] = 
{	
	{szName="������ͼ��",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="������ͼ��",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="��������ͼ��",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="��������ͼ��",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="��������ͼ��",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.03},
	{szName="������ͼ��",tbProp={6,1,2720,1,0,0},nCount=1,nRate=1.8},
	{szName="����Ьͼ��",tbProp={6,1,2716,1,0,0},nCount=1,nRate=1.8},
	{szName="�����Ͻ�ͼ��",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.03},
	{szName="�����½�ͼ��",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.03},
	{szName="������еͼ��",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.03},
	{szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.3},
	{szName="��Գ��",tbProp={6,1,2351,1,0,0},nCount=1,nRate=1},
	{szName="Ԫ˧���",tbProp={0,11,447,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="������¶",tbProp={6,1,2266,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="������¶",tbProp={6,1,2268,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="ǧ����¶",tbProp={6,1,2267,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="���з�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	
	{szName="����ֵ1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(3000000, "ˮ������")
				end,
				nRate = 25,
	},
	{szName="�i����ֵ2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "ˮ������")
				end,
				nRate = 17.78,
	},
	{szName="�i����ֵ3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(8000000, "ˮ������")
				end,
				nRate = 7,
	},
	{szName="�i����ֵ4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(12000000, "ˮ������")
				end,
				nRate = 4,
	},
	{szName="�i����ֵ5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "ˮ������")
				end,
				nRate = 2,
	},
	{szName="�i����ֵ6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "ˮ������")
				end,
				nRate = 1,
	},
	
	{szName="�����ɲ�¶",tbProp={6,1,1181,1,0,0},nCount=1,nRate=4},
	{ szName = "�ƽ�ӡ(ǿ��)", tbProp = {0,3205}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(ǿ��)", tbProp = {0,3206}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(ǿ��)", tbProp = {0,3207}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(ǿ��)", tbProp = {0,3208}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(ǿ��)", tbProp = {0,3209}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(����)", tbProp = {0,3215}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(����)", tbProp = {0,3216}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(����)", tbProp = {0,3217}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(����)", tbProp = {0,3218}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "�ƽ�ӡ(����)", tbProp = {0,3219}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
}
