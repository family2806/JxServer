--�Ը�Ե������Ʒ��NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include([[\script\event\mid_autumn06\head.lua]]);
Include("\\script\\vng_feature\\thuongnhanthanbi\\moruongfour\\openchestfour.lua")

function main()
	local tab_Content = {
		"����/OnBuy", 
		"�����Ի�/OnCancel", 
		"ǰ������ɽ��/GotoHuanZhuan",
		"���ڸ�Ե/OnAbout"
	};
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "����/au06_lpaw_entrance");
	end;
	--tinsert(tab_Content, "���� 4/#tbChectfour:main()");
	Say ( "�͹�����ʲô�����겻ȱ��Ŷ!", getn(tab_Content), tab_Content);
end

function OnBuy()
	Sale( 93, 2 );
end

function OnAbout()
	Talk( 3, "", "��Ե������ͨ���ۻ�����ʱ�����һ���һ��������������������������������������Ҷһ�����������Ʒ��", "��Ե�һ����ۻ���Сʱ��������ʱ���ȥ��������������˴��˼��ɶһ���һ����������γɹ��һ���Ե���ж��⽱�����ۻ�����ʱ��4Сʱ���ڣ�ÿСʱ�һ�1�㸣Ե��4Сʱ���ϣ�ǰ4СʱÿСʱ�һ�1�㣬֮��ÿ��Сʱ�һ�1�㡣���ʱ������������һ����Ա���԰�ȫ�Ӷ�Ա��ȡ��Ե��", "���������������ڼ䲻���ӿɻ�ȡ��Ե������ʱ�䡣" );
end

function au06_lpaw_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("ֻ�г�ֵ��Ҳ��ܲμ�����", 0);
		return
	end;
	Say("�������<color=yellow> 10 �̼�����<color> �һ���㻻һ��<color=yellow>���¹���<color> �ͼ���ֵ����1 <color=yellow>����ܽ��<color>��Ǳ��ֵ.", 3, "1���̼����ƻ�ȡ����/#shangjialingpai(1)", "10���̼����ƻ�ȡ����/#shangjialingpai(2)", "�����Ի�/oncancel");
end;

function shangjialingpai(nIndex)
	if (CalcEquiproomItemCount(6, 1, 1252, -1) < 10) then
		Say("��Ҫ10���̼����Ʋ��ܻ�ȡ������", 0);
		return
	end;
	
	--�۳���Ʒ
	if (ConsumeEquiproomItem(10, 6, 1, 1252, -1) ~= 1) then
		return
	end
	
	--���轱��
	local str = "<color=yellow>���¹���<color>";
	if (nIndex == 1) then -- ����һ�����ܵ�
		AddItem(6, 1, 127, 1, 0, 0, 0);
	else -- ����5��Ǳ�ܵ�
		AddItem(6, 1, 128, 1, 0, 0, 0);
		str = "<color=yellow>����ܽ��<color>";
	end;
	
	--������ʾ
	Say("�ð��������һ������!", 0);
	Msg2Player("��ﵽ"..str);
end;

function OnCancel()
end
function GotoHuanZhuan()
	NewWorld(934, 49632 / 32, 105696 /32)
end
