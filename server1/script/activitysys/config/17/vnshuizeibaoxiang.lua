Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>��ϲ����<color=yellow>%s<color=green> �ѻ��<color=yellow><%s><color=green> t?<color=yellow><ˮ������><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbPirate_Box_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbPirateBoxNewAward = 
{	
	["chiakhoanhuy"] = 
	{
		{szName="�i����ֵ1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "ˮ������")
					end,
					nRate = 52,
		},
		{szName="�i����ֵ2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "ˮ������")
					end,
					nRate = 30,
		},
		{szName="�i����ֵ3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "ˮ������")
					end,
					nRate = 10,
		},
		{szName="�i����ֵ4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "ˮ������")
					end,
					nRate = 5,
		},
		{szName="�i����ֵ5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "ˮ������")
					end,
					nRate = 3,
		},
	},	
	["chiakhoavang"] = 
	{
		{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=1},
		{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=1},
		{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=1},
		{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=1},
		{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=1},
		{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=1},
		{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=1},
		{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.4},
		{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.4},
		{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.1},
		{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
		{szName="���ڿ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.01},
		{szName="�����Ͻ䱦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.01},
		{szName="����Ь����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01},
		{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.01},
		{szName="���ڻ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.01},
		{szName="ˮ������",tbProp={6,1,2745,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		{szName="�������",tbProp={6,1,30214,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="��»ʯ",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.6},
		{szName="�������",tbProp={6,1,30216,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.008},
		{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.008},
		{szName="�׻�����ͼ��",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.004},
		{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.005},		
		{szName="�i����ֵ1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "ˮ������")
					end,
					nRate = 42.905,
		},
		{szName="�i����ֵ2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "ˮ������")
					end,
					nRate = 25,
		},
		{szName="�i����ֵ 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "ˮ������")
					end,
					nRate = 10,
		},
		{szName="�i����ֵ4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "ˮ������")
					end,
					nRate = 5,
		},
		{szName="�i����ֵ 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "ˮ������")
					end,
					nRate = 3,
		},
		{szName="�i����ֵ 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "ˮ������")
					end,
					nRate = 2,
		},	
		{szName="�i����ֵ 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "ˮ������")
					end,
					nRate = 1,
		},
	},	
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function VnPirateBox_main(nIndexItem)
	local tbKey1 = tbPirate_Box_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbPirate_Box_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("��Ҫ�н�Կ�׻�������Կ�ײ��ܴ�ˮ������", 1, "��ng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ��ȷ�������ĲƲ���������%d %dx%dװ��", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("ʹ������Կ��/#VnPirateBoxGiveAward(%d, '%s')", nIndexItem, "����Կ��"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("ʹ�ý�Կ��/#VnPirateBoxGiveAward(%d, '%s')", nIndexItem, "��Կ��"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "��ng/Oncancel")
		Say("ʹ��Կ�׿���:", getn(tbOpt), tbOpt)
	end
	return 1	
end
function Oncancel()end

function VnPirateBoxGiveAward(nItemIdx, strKeyType)
	local tbKey = tbPirate_Box_Key_Require[strKeyType]
	local tbAward = tbPirateBoxNewAward[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("��Ҫ�н�Կ�׻�������Կ�ײ��ܴ�ˮ������", 1, "��ng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2743, -1) ~= 1 then
		Say("�Ҳ���ˮ������", 1, "��ng/no")
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"PhongLangDo", "use_shuizeibaoxiang"})		
end