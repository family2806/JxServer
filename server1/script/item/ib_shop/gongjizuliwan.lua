-- �ļ�������gongjizuliwan.lua
-- �����ߡ���wangjingjun
-- ���ݡ��������������� 
-- Ч��	   : �⹦�����ٶ����� 50% �ڹ������ٶ����� 10% ���������� 100 �� �������� 500 �� ��Чʱ��15����
-- ����ʱ�䣺2011-07-15 11:53:11

function main(nItemIndex)
	print("ʹ����")
	local nTime = 15 * 60 *18
	local tbSkill = { 1120,261,258,260,}
		
	for i=1,getn(tbSkill) do
		AddSkillState(tbSkill[i], 1, 1, nTime)
	end	
	
	Msg2Player("����ʹ��" .. "����������")
	return 0
end