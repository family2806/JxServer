-- �ļ�������xmas2007_giftbox.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2007-11-26 14:42:26

--ʱ�䣺2008 ��01 ��13 �� 24��00
--ʱ�ޣ�2008 ��01 ��31 �� 24��00
--���ԣ����ף��ӵ�����̯������ = 0 ��������50��/λ
--ʹ��: �Ҽ����ʹ�û�ø������

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
xmas2007_GiftBox_tbItemList =
{
	--����,{��ƷProp},����%,
	{"�����",{6,1,1628,1,0,0},10},
	{"ľ����",{6,1,1629,1,0,0},15},
	{"ˮ����",{6,1,1630,1,0,0},20},
	{"�����",{6,1,1631,1,0,0},25},
	{"������",{6,1,1632,1,0,0},30},
}

function main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Msg2Player("��Ʒ�ѹ�ʹ���ڣ�����ʧ.")
		return 0;
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_GiftBox_tbItemList);
end


