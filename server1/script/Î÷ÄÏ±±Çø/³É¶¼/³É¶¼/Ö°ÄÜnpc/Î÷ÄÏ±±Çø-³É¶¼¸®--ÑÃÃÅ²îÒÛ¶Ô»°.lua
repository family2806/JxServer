--���ϱ��� �ɶ��� ���Ų��۶Ի� �������񣨳ɶ�ɱҰ��
-- Update: Dan_Deng(2004-03-19)

FESTIVAL06_NPCNAME = "<color=yellow>:<color>";

Include("\\script\\global\\repute_head.lua")

Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	Uworld11 = GetTask(11)
	if (Uworld11 == 100) then			-- �������
		W11_prise()
	elseif (Uworld11 < 255) and (Uworld11 >= 1) then		-- ������
		Talk(1,"","���콱����ȥɱʮֻҰ�������˵!")
	elseif (Uworld11 > 255) then		-- �����Ѿ����
		Talk(1,"","�ɶ������кܶ�ɽ��������Ұ����֣��˴��������ȷ��������ճ�.")
	else			-- δ������
		Talk(1,"","��ҳ������ţ����ǳ������ı��ӵ���!")
	end
end;

function W11_prise()
	Talk(1,"","��ɱ��ʮֻҰ��̫���ˣ��Ҵ���ɶ����ո�л��͸�λӢ�ۡ�����500������!")
	Earn(500)
	SetTask(11,date("%Y%m%d"))
	i = random(0,99)
	if (i < 50) then			-- 50%����
		x = 3
	elseif (i < 85) then		-- 35%����
		x = 4
	else							-- 15%����
		x = 5
	end
	AddRepute(x)
	Msg2Player("������ɣ�����50���������������"..x.."��.")
end;
