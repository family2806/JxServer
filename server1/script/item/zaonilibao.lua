--����������
--��������
--ʹ�ú���8Сʱ��־���˫�����������ɲ�¶����
--�� 80�������� �� ��ֵ���ʹ��

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>ʳ���������ң��ɻ��<color=red>8<color>Сʱ����˫�������ǲ������ɲ�¶���ӡ�",
		"<#>ʳ����������/#_UseZaoNiShoutao("..nItemIndex..")",
		"<#>���ٿ��ǿ���/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseZaoNiShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if RemoveItemByIndex(nItemIndex) == 1 then
		AddSkillState(440, 1, 1, 64800 * 8);
		Msg2Player("��ʳ����һ���������ң����8Сʱ��־���˫��Ч����")
	end;
end;

function OnCancel()
end;