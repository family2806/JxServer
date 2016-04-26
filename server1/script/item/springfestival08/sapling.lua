-- �ļ�������sapling.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-16 10:54:26
--�� 2008��02��02�� �C 2008��03��02�� 24��00
--����:
--- �ɽ���, ��̯, ����, �� shop = 0 ��.
--- �����Ե���

--����: 
--- ʹ�õ���ʱ�����ƽ�ɫ�ȼ�.
--- ÿ��ɫÿ��ֻ����8��.
--ʹ�÷���: �ҽ����


--Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\event\\springfestival08\\luckplanting\\treehead.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
IncludeLib("ITEM")
--Event tr�ng c�y may m�n - Modified by DinhHQ - 20110518

nTSK_USE_COUNT_LIMIT = 2728
nUSE_COUNT_LIMIT = 500

function main(nItemIndex)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		Msg2Player("��Ʒ�ѹ��ڣ�����ʹ����.")
		return 1;
	end
	
	if (GetTask(nTSK_USE_COUNT_LIMIT) >= nUSE_COUNT_LIMIT) then
		Talk(1, "", "�����ﵽ���ޣ�����������!")
		return 1
	end
	
	if not sapling_checkmap() then
		Msg2Player("ֻ�������ִ�ͳ���ʹ��")
		return 1
	end
	
	if offlineCheckPermitRegion() == 0 then
		Msg2Player("��ò�Ҫ���˶�ĵط���.")
		return 1;
	end
	
	SetTask(nTSK_USE_COUNT_LIMIT, GetTask(nTSK_USE_COUNT_LIMIT) + 1)
	local _, nX, nY = GetWorldPos();
	if (plantTree_0801(1, SubWorld, nX*32, nY*32, format("�� %s",GetName()), FileName2Id(GetName()), GetRoleCreateTimeData() ) == 0) then
		return 1;
	end;
	return 0
end

function bak_main(nItemIndex)
do return end
	local nData_E			= GetItemParam(nItemIndex, 1);
	local nUseCountLimit	= 8
	local nDate				= tonumber(GetLocalDate("%y%m%d"))
	local nDateYmd			= tonumber(GetLocalDate("%Y%m%d"))
	local nTSKV				= GetTask(TSK_sapling_UseCountLimit)
	
	if nData_E <= nDateYmd then
		Msg2Player("����Ʒ�ѹ��ڣ�����ʹ��.", 0)
		return 0;
	end
	if not sapling_checkmap() then
		Msg2Player("ֻ�����ڸ�����ķ�ս������ʹ��.")
		return 1
	end
	
	if offlineCheckPermitRegion() == 0 then
		Msg2Player("��ò�Ҫ���˶�ĵط���.")
		return 1;
	end
	
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --���㲢����ʱ��
	end
	if mod(nTSKV,256) >= nUseCountLimit then --����
		Say(format("����������<color=yellow>%d<color> ����, ���������Ŷ", nUseCountLimit), 0)
		return 1;
	end
	
	--����
	local _, nX, nY = GetWorldPos();
	--local nNpcIdx = AddNpc(711, 1, SubWorld, (nX-1)*32, (nY-1)*32, 1, format("%s����",GetName()));
	if (plantTree_0801(1, SubWorld, (nX+random(-2,2))*32, (nY+random(-2,2))*32, format("��%s",GetName()), FileName2Id(GetName()), GetRoleCreateTimeData() ) == 0) then
		return 1;
	end;
	
	SetTask(TSK_sapling_UseCountLimit, nTSKV+1);
end

function sapling_checkmap()
	local tbCityMap = 
	{
		[174]	= 1,--��Ȫ
		[121]	= 1, --����
		[153]	= 1, --ʯ��
		[101]	= 1,--�����
		[99]	= 1, --����
		[100]	= 1,--������
		[20]	= 1, --����
		[53]	= 1, --����
		[11]	= 1,
		[1]		= 1,
		[37]	= 1,
		[176]	= 1,
		[162]	= 1,
		[78]	= 1,
		[80]	= 1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)] and (GetFightState() == 0)
end