--Create by yfeng 2004-3-9
--Modified by fangjieying 2003-5-16
--�����ؼ�������80�����ϵ����ʹ��֮�󣬿��Լ�1�㼼�ܵ�
--������ʦ��������ת������ǰ��
--����Ʒ���ֻ��ʹ��15��
--�������80��4λ��ʾʹ�ø���Ʒ�Ĵ���
function main(sel) 
	times = mod(GetTask(80),16)
	str={
		"�����š������ؼ��������˰��죬���ʲôҲû�����򵽡�",
		"�����š������ؼ��������˰��죬����������٣�ûʲôЧ����",
		"�����š������ؼ��������˰��죬��������һЩ�����书���ĵá�",
		"���Ѿ��ѡ������ؼ�������͸����������Ҳ�ò����κ��ĵá�"
		}
	if(times >14) then                -- ʹ�ô����Ѵﵽ����
		Msg2Player(str[4])
		return 1
	elseif (GetLevel() < 80) then     -- �ȼ�С��80
		Msg2Player(str[2])
		return 1
	else                            	-- ����1�㼼�ܵ�
		AddMagicPoint(1)
		SetTask(80,times+1)
		Msg2Player(str[3])
		return 0
	end
end