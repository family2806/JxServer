-- 120����������120��������

Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\item\\skillbook.lua")

function main(idxItem)
	
	if GetLastFactionNumber()==-1 then	
		Msg2Player("<color=yellow>����û�н����κ����ɣ�����ѧϰ�˼��ܣ�<color>");
		return 1;
	end;
	
	if GetLevel()<120 then
		Msg2Player("<color=yellow>���ĵȼ�С�� 120������ѧϰ�˼��ܣ�<color>");
		return 1;
	end;
	
	if GetTask(LV120_SKILL_ID)>0 then
		Msg2Player("<color=yellow>���Ѿ������˱����ɵ� 120 �����ܣ������ٴӴ����в�͸ʲô��<color>");
		return 1;
	end;
	
	if (LearnSkillByBook(GetLastFactionNumber(), LV120SKILL_LIST) == 0) then
		SetTask(LV120_SKILL_ID, LV120SKILL_LIST[GetLastFactionNumber()][1])
		WriteLog("[120����ѧϰ��¼]"..date("[%y��%m��%d��%Hʱ%M��]").."[�˺ţ�"..GetAccount().."][��ɫ��"..GetName().."] ʹ���� 120 �������飬ѧ���˼��ܣ�"..GetLastFactionNumber());
		return 0
	end
	return 1
end
