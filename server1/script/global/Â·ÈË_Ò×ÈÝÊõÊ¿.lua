-- ��ͭǮ����������Ʒ��NPC
-- Fanghao Wu
-- 2004.11.1

function main()

	Say("������ʿ����λ�͹٣���Ҫʲô�ö���ֱ��ȥ<color=yellow>�����<color>���������ˣ��Ϸ����ڿ��������������أ�ʲô��������ôȥ<color=yellow>�����<color>��ֱ�ӵ��<color=green>���½ǵ��Ǹ�Բ�ε�ͼ��<color>�����ˡ�", 0);
	return
	
	-- Say ( "������ʿ����ѧ����������ʵ�ܼ򵥣���������һ�����Ƶ���������ҾͿ��Խ��㡣��ͬ����߿������ݳɲ�ͬ�����ӣ�����Ҫ��Ҫ��һ����", 3, "����/OnBuy", "��ʱ������/OnCancel", "�����������/OnAbout" );
end

function OnBuy()
	Sale( 95, 3 );
end

function OnCancel()
end

function OnAbout()
	Say( "���������װ����װ������<color=yellow>���<color>һ������������ò�ı�Ϊ����߶�Ӧ��NPC�����������ƺ��������Ծ�<color=yellow>���ı�<color>��Ҳ<color=yellow>��Ӱ��<color>��������ʹ�ø���װ�����߼����ܡ�����ߴ�װ����ȡ�£�������ò���ԭ�������ӣ���ߵ�ʹ�ô���<color=yellow>����һ��<color>��", 0 );
end