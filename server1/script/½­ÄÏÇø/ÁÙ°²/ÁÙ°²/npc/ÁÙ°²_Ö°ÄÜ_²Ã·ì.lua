-- �ٰ��Ĳ÷죬��������񼪷�
-- By: Dan_Deng(2003-12-29)
-- GetTask(67): ��24��λΪ����ǣ���1��λΪ�Ƿ����򼪷�

function main(sel)
	Uworld67 = GetTask(67)
	if (GetBit(Uworld67,24) == 1) then			-- �ѻ�
		if (GetBit(Uworld67,1) == 0) then		-- ��δ���������������
			if (GetSex() == 0) then					-- �жԻ�������װ
				Talk(1,"buy_sale","�ϰ�!����˵�������񼪷��������£���������? ")
			else
				Talk(1,"buy_sale","�ϰ�! ��Ļ��񼪷�̫�ÿ��ˣ����ڻ��л���? ")
			end
		else
			Talk(1,"","֮ǰ�ڱ��������·��������?�ǵú���������������!")
		end
	else
		Talk(1,"","�÷죺�����ҿ�ڣ��Ҽҵĸ��ּ��������������õģ���ʲô��Ҫʱһ����ס��˰���")
	end
end

function buy_sale()
	Say("������ר�ŷ��ƽ���������Ȼ��ô��ʽ���У�ֻ�����ڼ�ǮҪ��һ�㣬Ҫ88888��. ",2,"�ҵ�Ȼ����Ҫ��һ��. /buy_yes","������, �һ������ /no")
end

function buy_yes()
	if (GetCash() >= 88888) then
		Pay(88888)
		if (GetSex() == 0) then
			AddItem(0,2,28,1,random(0,4),0,0)
		else
			AddItem(0,2,28,4,random(0,4),0,0)
		end
		Uworld67 = GetTask(67)
		Uworld67 = SetBit(Uworld67,1,1)
		SetTask(67,Uworld67)
		Talk(1,"","��������, ����Ϊ�͹ٴ��, ף�͹ٰ���ú�!")
	else
		Talk(1,"","û��Ǯ�Ͳ�Ҫ����Ҫ����ô�ࡣ��ʲô��׬����Ǯ������!")
	end
end

function no()
end
