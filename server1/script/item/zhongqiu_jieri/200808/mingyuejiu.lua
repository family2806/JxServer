--zhongchaolong
--���¾�
--��ɫʹ�����¾ƺ��������չͨ��2���±��� �����±� ���͡� �����±� ���ľ������� ����15�ڵ�30�ھ��顣
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("����Ʒ�ѹ�ʹ����.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Ҫ��50���������ѳ�ֵ", 0)
		return 1
	end
	if GetTask(zhongqiu0808_TSK_mingyuejiu) == 1 then
		Say("����ʹ�øõ�����.")
		return 1
	end
	
	SetTask(zhongqiu0808_TSK_mingyuejiu, 1)
	Msg2Player("ʹ�����¾ƺ󣬽��������±������������±��ľ������޽�����30��.")
end