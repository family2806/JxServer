--description: �������
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) then		-- �������������
		if (HaveItem(17) == 0) then		--�õ���������֮ǰ
			Talk(1,"","�㻹û���õ�<color=Red>��������<color>��!")
		else									--�õ���������֮��
			Uworld36_prise()
		end
--	elseif (UTask_em < 6) then 							--��δ���ǰ����
--		Talk(1,"","���Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬�㶼��������")
--	elseif (UTask_em == 6) then 							--��δ���ǰ����
--		Talk(1,"","�������ͨ��������Ŀ��飬��������ȥ��<color=Red>л����<color>ʦ�ðɣ������ڰ�ɽ����<color=Red>���������<color>����")
	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","ʦ��С�ģ������º�Σ��!")
	elseif (UTask_em == 70) then   						--�Ѿ���ʦ
		Talk(1,"","ʦ�ã����Ҫ��ɽ�������ǻ������!")
	else
		Talk(1,"","�����º�Σ�գ���ʧ����Ҫð��!")
	end
end;

function Uworld36_prise()
	DelItem(17)
	Uworld36 = SetByte(GetTask(36),1,127)
	i = ReturnRepute(30,19,3)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	SetTask(36,Uworld36)
	AddRepute(i)		-- ������
	AddNote("����������⣬������񣬳�Ϊ��ü�ɼ�������")
	Msg2Player("����������⣬������񣬳�Ϊ��ü�ɼ�������, ��Ľ�����������"..i.."��.")
	Talk(1,"","��ϲ���ð������⣬˳����4�أ��ӽ��������Ϊ���ɵ��ӣ��Ժ�ӭ����ü����!")
end
