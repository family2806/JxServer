--���ϱ��� �ɶ��� ��ҩ��Ů�Ի������ɼ�ҩ�ġ�����
-- Update: Xiao_Yang(2004-04-26)�����ӡ��ɼ�ҩ�����񡱣�

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld132 = GetTask(132)
	Uworld133 = GetByte(GetTask(133),1)
	if (Uworld132 == 10) and (HaveItem(112) == 1) and (HaveItem(113) ==1) and (HaveItem(114) ==1) and (HaveItem(115) ==1) and (HaveItem(116) ==1) then
		Talk(2,"Uworld132_finish","С����! ��Ҫ�Ķ�������������","�����̫��л����!")
	elseif (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) and ((Uworld132 < 10) or ((GetGameTime() > Uworld132) and (Uworld132 > 255))) then		-- ���ɼ�ҩ�ġ�������������
		if (Uworld133 >= 5) then
			SetTask(133,0)
		end
		Talk(5,"Uworld132_get","...","С������ʲô����?","�ҵ�ҩ�����ȱ��һ����Ҫҩ�ģ����ݵ�ҩ�������ϰ�������.","���������Ҳ��������ǣ���������ĵ�����ҩ����ʲô�����㾡��˵��˵�������ܰ���.","�������֪����������ҵ�5��ҩ������ޣ���ؽ��ݡ���ݡ������ݺ���֥��?","������̫�����ˣ���Щҩ����ҩ���ȿ�����")
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","��ҩ��Ů�����ǳɶ�����ɽ�ɶ��ˣ������ж�üɽ�����ɽ����Զ�����Ĺ���ɽ������ɽ���ɽ��ɽ�࣬��ҩ��Ȼ�Ͷ࣬����ʢ�����������㡢���顢��ݡ�")
		elseif (i == 1) then
			Talk(1,"","��ҩ��Ů���Ҳ����Ĳ�ҩ����Щ�Լ���������Щ����ҩ�̣�������Ǯ�����Һ����̡�")
		else
			Talk(1,"","��ҩ��Ů���ҵ�������ȥ���ˣ�ֻʣ���Һ���������Ϊ������������Ψһ�����ˡ�")
		end
	end
end;

function Uworld132_get()
	Say("������԰���ժһ���������?",2,"����С�£������һ��. /Uworld132_yes"," ����ܶ����������ղ�����������ȶ�����һ��. /Uworld132_no")
end

function Uworld132_yes()
	SetTask(132,10)
	Msg2Player("��˵��ҩ���ȿ�����������ҩ�ģ���ŵ�������ժ. ")
end

function Uworld132_no()
end

function Uworld132_finish()
	
	local nResult = 0;
	
	-- �����Ʒ�ǻ����ڣ������ 1 ��ֱ�� return
	for i=112, 116 do
		nResult = HaveItem(i);
		if nResult~=1 then
			return
		end;
		DelItem(i);
	end;
	
	SetTask(132,GetGameTime()+3600)
	
	Uworld133 = GetByte(GetTask(133),1)
	Uworld133_2 = GetByte(GetTask(133),2)
	Cur_date = tonumber(date("%d"))
	if (Uworld133_2 == Cur_date) then
		Uworld133 = Uworld133 + 1
	else
		Uworld133 = 1
	end
	AddRepute(Uworld133)
	Msg2Player("��ﵽ"..Uworld133.."����ֵ")
	if (Uworld133 >= 5)then
		SetTask(133,0)
		AddRepute(10)
		Msg2Player("��γ��ְ���������10�㽱��! ")
	else
		Uworld133 = SetByte(Uworld133,2,Cur_date)
		SetTask(133,Uworld133)
	end
end
