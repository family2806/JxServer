--description: ������ͨ���� �����س���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(11) == 1 then
		allbrother_0801_FindNpcTaskDialog(11)
		return 0;
	end
	UTask_tm = GetTask(2);
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 80) then			--��������
		if (HaveItem(33) == 1) and (HaveItem(34) == 1) and (HaveItem(35) == 1) then
			Uworld37_prise()
		else
			Talk(1,"","��Ҫ�õ�������������Ȳ���!")
		end
	elseif (Uworld37 < 80) then						--��δ����
		Talk(1,"","��ͨ�������أ�����õ��������������.")
--	elseif (GetFaction() == "tangmen") then			--�Ѿ����ţ���δ��ʦ
--		Talk(1,"","����ׯ������Ҷ���ͬ���ֵܣ��㲻���ٴ���������������ˣ�")
	elseif (UTask_tm >= 70*256) and (GetFaction() ~= "tangmen") then						--�Ѿ���ʦ
		Talk(1,"","�����԰���������������£�������˭Ҳ����С�������ǣ��պ����߽������ɲ�Ҫ���˱��ŵ����硣")
	else
		Talk(1,"","��Σ�գ�Ҫ����С��!")
	end
end;

function Uworld37_prise()
	Talk(1,"","����˳�����أ���Ϊ���ż�������! ")
	DelItem(33)
	DelItem(34)
	DelItem(35)
	UTask_world37 = SetByte(GetTask(37),1,127)
	i = ReturnRepute(25,19,4)		-- ȱʡ�������������ĵȼ���ÿ���ݼ���
	SetTask(37,UTask_world37)
	AddRepute(i)		-- ������
	Msg2Player("���������ȴ��������س��ڣ��������ŷ���ʦ��������񣬳�Ϊ���ż������ӣ���������"..i.."��.")
	AddNote("�������س��ڣ���3�����Ƚ�������׳������ɼ�����������")
end;
