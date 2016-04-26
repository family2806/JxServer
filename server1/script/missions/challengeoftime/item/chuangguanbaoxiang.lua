-- ���ر�����Ʒ��������һ����Ʒ��
-- By: Wangjingjun(2011-03-02)

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>ף�ظ���<color=yellow>%s<color=green> ����ȡ<color=yellow><%s><color=green>��<color=yellow><���ر���><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbCOT_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbCOT_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="�i���� 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "���ر���")
					end,
					nRate = 52,
		},
		{szName="�i���� 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "���ر���")
					end,
					nRate = 30,
		},
		{szName="�i���� 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "���ر���")
					end,
					nRate = 10,
		},
		{szName="�i���� 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "���ر���")
					end,
					nRate = 5,
		},
		{szName="�i���� 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "���ر���")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="����ʯ",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=2},
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},		
		{szName="С�����",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="С�����",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="С�����",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="С�����",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="������",tbProp={6,1,2801,1,0,0},nCount=1, nRate=0.04},		
		{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},
		{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.05},
		{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=2},
		{szName="�ر��ɲ�¶",tbProp={6,1,1181,1,0,0},nCount=1,nRate=15,nExpiredTime=43200},
		{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.08},
		{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.08},
		{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.01},
		{szName="�i���� 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "���ر���")
					end,
					nRate = 35,
		},
		{szName="�i���� 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "���ر���")
					end,
					nRate = 25,
		},
		{szName="�i���� 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "���ر���")
					end,
					nRate = 10,
		},
		{szName="�i���� 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "���ر���")
					end,
					nRate = 5,
		},
		{szName="�i���� 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "���ر���")
					end,
					nRate = 3,
		},
		{szName="�i���� 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "���ر���")
					end,
					nRate = 2,
		},
		{szName="�i���� 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "���ر���")
					end,
					nRate = 1,
		},		
		{szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="������",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},		
		{szName="�ƽ�ӡ(ǿ��)",tbProp={0,3211},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
		{szName="�ƽ�ӡ(����)",tbProp={0,3221},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbCOT_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbCOT_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("Ҫ�н�Կ�׻�������Կ�ײſ��Դ򿪴��ر���", 1, "��/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ���������ĲƲ���ȫ��������%d %dx%d�ռ�", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("ʹ������Կ��/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("ʹ�ý�Կ��/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "��/Oncancel")
		Say("��Կ�׿�����:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnCOTBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbCOT_Key_Require[strKeyType]
	local tbAward = tbCOT_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("Ҫ�н�Կ�׻�������Կ�ײſ��Դ򿪴��ر���", 1, "�ر�/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2742, -1) ~= 1 then
		Say("û���ҵ����ر���", 1, "�ر�/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"chuangguan", "use chuangguanbaoxiang"})
	AddStatData("baoxiangxiaohao_kaichuangguanbaoxiang", 1)	--��������һ��
end