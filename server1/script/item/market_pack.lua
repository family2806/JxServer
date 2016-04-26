-- ���������Ʒ
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
IncludeLib("ITEM")
function main(nItemIndex)

	local G,D,P,nLevel = GetItemProp(nItemIndex);
--	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex);
--	local nLeftTime = nExPiredTime - GetCurServerTime();
--	if nExPiredTime ~= 0 and nLeftTime <= 60 then
--		Msg2Player("��Ʒ�ѹ�ʹ����")
--		return 0;
--	end
--	nLeftTime = floor((nLeftTime)/60);
	
	if (G ~= 6) then
		return 1;
	end
	
	if CalcFreeItemCellCount() < 6 then
		CreateTaskSay({"�밲��һ��װ�����ǵ�����6�����Ͽ�λ",  "������./Cancel",});
		return 1;
	end
	
	-- ������
	if P == 2340 then
		local tbAwardItem = {tbProp={4,195,1,1,0,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return 0;
	end	
	
	-- Ѫս����
	if P == 2401 then
		local tbAwardItem = {tbProp={6,1,2212,1,0,0},nExpiredTime=nLeftTime,}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return 0;
	end	
	
	
	-- ɱ��� �������
	if P == 2335 or P == 2336 or P == 2337 or P == 2338 or P == 2339 then
		SelectSeries(P)
		return 1;
	end
	
	-- ����
	if P == 2333 then
		local tbAwardItem = {tbProp={0,10,6,1,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return 0;
	end

	-- ����
	if P == 2396 then
		local tbAwardItem = {tbProp={0,10,8,1,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return 0;
	end
end
	
-- ѡ������
function SelectSeries(nP)
	
	local tbTaskSay = {"<dec>��ѡ������",
						format("��/#GetSeries(%d, %d)", nP, 0),
						format("ľ/#GetSeries(%d, %d)", nP, 1),
						format("ˮ /#GetSeries(%d, %d)", nP, 2),
						format("��/#GetSeries(%d, %d)", nP, 3),
						format("��/#GetSeries(%d, %d)", nP, 4),
					  };
					  
	CreateTaskSay(tbTaskSay);
end

function GetSeries(nP, nSeries)
	
	if ConsumeItem(3, 1, 6, 1, nP, 1) ~= 1 then
		Msg2Player("�۳�����ʧ��")
		return
	end
	
	-- �����
	if nP == 2335 then
		local tbAwardItem = {tbProp={0,2,28,3,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return
	end	
	
	-- ����ȹ
	if nP == 2336 then
		local tbAwardItem = {tbProp={0,2,28,6,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return
	end	
		
	-- �����
	if nP == 2337 then
		local tbAwardItem = {tbProp={0,2,28,2,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return
	end	
		
	-- ����ȹ
	if nP == 2338 then
		local tbAwardItem = {tbProp={0,2,28,5,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return
	end	
		
	-- ɱ���
	if nP == 2339 then
		local tbAwardItem = {tbProp={6,1,400,90,nSeries,0}, nCount = 2}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������������Ʒ");
		return
	end	
end
