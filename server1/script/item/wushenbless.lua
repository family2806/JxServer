--����͸�
--wushenbless.lua
--ʹ�ú�ɻ��2Сʱ(ϵͳʱ��)���ν���ʹ�����ء�������Ұ�š��Ի�֮ҹ�й��׶�˫��״̬
--Task2509

function main(nItemIdx)
	local nItemTime = GetItemParam(nItemIdx,1);
	local nCurTime = GetCurServerTime();	--��
	if (nItemTime < nCurTime) then
		Msg2Player("�����Ʒ�ѹ�����Ч�ڣ�������ʹ���ˡ�");
		return 0;
	end;
	local nEndTime = nCurTime + 2*60*60;
	SetTask(2509, nEndTime);
	Msg2Player("�����2��Сʱ���ν��ս����ʹ����ʱ�����ս������������Ұ�����񡢻Ի�֮ҹ�������׶ȷ�����״̬��")
end;

function GetDesc(nItemIdx)

	local nYear = GetItemParam(nItemIdx, 2) + 2000;
	local nMonth = GetItemParam(nItemIdx, 3);
	local nDate = GetItemParam(nItemIdx, 4);

	return "ʹ�����ޣ�<color=blue>"..nYear.."��"..nMonth.."��"..nDate.."��"
end

