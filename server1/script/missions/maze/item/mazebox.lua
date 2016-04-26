Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbKG_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbKG_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="�i����ֵ 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "��ڣ����")
					end,
					nRate = 52,
		},
		{szName="�i����ֵ 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "��ڣ����")
					end,
					nRate = 30,
		},
		{szName="�i����ֵ 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "��ڣ����")
					end,
					nRate = 10,
		},
		{szName="�i����ֵ 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "��ڣ����")
					end,
					nRate = 5,
		},
		{szName="�i����ֵ 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "��ڣ����")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.008},
		{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.008},
		{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.005},
		{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.3},
		{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
		{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1},
		{szName="���ڿ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.003},
		{szName="�����±���",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.003},
		{szName="����Ь����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.003},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.003},
		{szName="���ڻ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.003},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.003},
		{szName="�����屦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.003},
		{szName="150�����ؼ� (19��)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.02},
		{szName="150�����ؼ� (20��)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.02},
		{szName="Ӣ��ս�����",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.1,nExpiredTime=10080,nUsageTime=60},
		{szName="������������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1.05,nExpiredTime=43200},
		{szName="����Կ��",tbProp={6,1,2744,1,0,0},nCount=1,nRate=4,nExpiredTime=20160},
		{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
		{szName="�������",tbProp={6,1,30214,1,0,0},nCount=1,nRate=0.5,nExpiredTime=1440},
		{szName="��ƽ��",tbProp={0,3881},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="�ش�",tbProp={0,3882},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="��ľ",tbProp={0,3883},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="����",tbProp={0,3884},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="��ʯ",tbProp={0,3885},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="�׻��",tbProp={0,3886},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="��������",tbProp={0,3887},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="���軨��",tbProp={0,3888},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440},
		{szName="�i����ֵ 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(6000000, "��ڣ����")
					end,
					nRate = 81.118,
		},
		{szName="�i����ֵ 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(12000000, "��ڣ����")
					end,
					nRate = 5,
		},
		{szName="�i����ֵ 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "��ڣ����")
					end,
					nRate = 3,
		},
		{szName="�i����ֵ 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "��ڣ����")
					end,
					nRate = 0.5,
		},	
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbKG_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbKG_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("��Ҫ�лƽ�Կ�׻�������Կ�ײ��ܴ򿪽�ڣ����", 1, "��ng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ���������Ʋ���������%d %dx%d װ����λ", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("ʹ������Կ�� #VnKGBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("ʹ�ûƽ�Կ��/#VnKGBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "��ng/Oncancel")
		Say("ʹ��Կ�׿���:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnKGBoxNewAward(nItemIdx, strKeyType)
	print("strKeyType: ",strKeyType)
	local tbKey = tbKG_Key_Require[strKeyType]
	local tbAward = tbKG_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("��Ҫ�лƽ�Կ�׻�������Կ�ײ��ܴ򿪽�ڣ����", 1, "��ng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 30203, -1) ~= 1 then
		Say("�Ҳ�����ڣ����", 1, "��ng/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"KiemGiaMeCung", "SuDungBaoRuongKiemGia"})	
end 
