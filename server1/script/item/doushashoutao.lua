--����������
--��ɳ����
--ʹ�ú���300w����
--���ɻ��1��
--�� 80�������� �� ��ֵ���ʹ��

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>ʳ��һ����ɳ���ң��ɻ��<color=red>"..tostring(JXANNIVERSARY3_ONCEEXP).."<color>�ľ��飬����ͨ��ʳ�ö�ɳ���ҵõ������������<color=red>"..tostring(JXANNIVERSARY3_MAXOWNEXP).."<color>����ʳ����Ч��",
		"<#>ʹ�ö�ɳ����/#_UseDoushaShoutao("..nItemIndex..")",
		"<#>���ٿ��ǿ���/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseDoushaShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if (GetTask(TASKID_DOUSHASHOUTAO_EXP) >= JXANNIVERSARY3_MAXOWNEXP) then 
		Msg2Player("���Ѿ�ʹ����̫��Ķ�ɳ���ң�������ͨ��ʹ�ö�ɳ�����������顣");
		return
	end 
	
	if (RemoveItemByIndex(nItemIndex) == 1 ) then
		local nAddExp = 0;
		if ( (GetTask(TASKID_DOUSHASHOUTAO_EXP) + JXANNIVERSARY3_ONCEEXP) > JXANNIVERSARY3_MAXOWNEXP) then
			nAddExp = JXANNIVERSARY3_MAXOWNEXP - GetTask(TASKID_DOUSHASHOUTAO_EXP);
		else
			nAddExp = JXANNIVERSARY3_ONCEEXP;
		end
		
		--���Ӿ���
		SetTask(TASKID_DOUSHASHOUTAO_EXP, GetTask(TASKID_DOUSHASHOUTAO_EXP) + nAddExp);
		AddOwnExp(nAddExp);
		Msg2Player("��ʳ����һ����ɳ���ң������"..JXANNIVERSARY3_ONCEEXP.."����");
	else
		Msg2Player("û�ж�ɳ���ҿ���ʹ�ã�");
	end
end

function OnCancel()
	return 0;
end

