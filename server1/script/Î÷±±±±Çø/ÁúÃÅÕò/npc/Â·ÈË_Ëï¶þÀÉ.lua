-- ������·�ˡ������(��С������)
-- by��Dan_Deng(2003-09-16)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(199) == 1 then
		allbrother_0801_FindNpcTaskDialog(199)
		return 0;
	end
	Uworld41 = GetByte(GetTask(41),1)
	if (GetLevel() >= 40) and (GetReputeLevel(GetRepute()) >= 5) then		-- ������������
		if (Uworld41 == 0) then					-- ������ֱ�Ӵ�����ɴ�����
			if (random(0,1) == 0) then
				Talk(1,"","ι!...")
			else
				Talk(1,"","�����:............ ")
			end
		elseif (Uworld41 == 5) then			-- ������ʽ����
			Talk(1,"U41_get","ʲô����������ô���գ��Ա���λ��ɩ��ô�޵���ô���İ�?")
		elseif (Uworld41 == 100) then			-- �������
			Talk(2,"U41_prise","��лӢ�ۣ�Ӣ�۵Ĵ�����û�ݲ�������������ǰһλ����ɮ�����ҵ���ҩ��˵��ǿ���壬��������Ǳ�ܡ���Ӣ�������ƴ�!","��Ȼ�������Ҳ��ƴǾ���!")
		elseif (Uworld41 == 255) then			-- ������ɺ�
			Talk(1,"","�ҾͲ�����С����ţ�����Ҳ���ǳ���֮�ƣ�ֻ�ܼ޸�����.")
		else											-- ���������
			Talk(1,"","����С�걻�������Ĵ�����ȥ�ˣ�Ҫ������ѹկ���ˡ�����˵ʲô������.! ")
		end
	else							-- ����תȱʡ�Ի�
		Talk(1,"","����˵����������ȫ��ǿ��������ʲô����֪�����Ҹ�˵��Ҫ2��3��������ͻ���ָ��������ص�����")
	end
end;

function U41_get()
	Say("�������Ǽ�С��ǰ���챻����կ�Ĵ���������˵Ҫ����ʲôѹկ���ˣ�����������������������",2,"����ȥ����/U41_get_yes","��ο����/U41_get_no")
end

function U41_get_yes()
	Talk(2,"","ʲô���������컯��֮�¾���ǿ����Ů����ȥ�����Ȼ���","�Ϳ������ˣ�����կ���ڹ�������!")
	Uworld41 = random(1,15)*256*256 + 10			-- �����ֽ�Ϊ�������Ƶ�0001 - 1111������һ�ֽ�Ϊ10
	SetTask(41,Uworld41)
	Msg2Player("�����񣬰�С��ӹ���կ������. ")
	AddNote("�����񣬰�С��ӹ���կ������. ")
end

function U41_prise()
	AddProp(1)											-- ����1��Ǳ��
	add_repute = ReturnRepute(30,50,3)			-- �������������30�㣬��50����ÿ���ݼ�3%
	AddRepute(add_repute)
	Uworld41 = SetByte(GetTask(41),1,255)
	SetTask(41,Uworld41)
	Ubonus86 = GetTask(86) + 1					-- ��¼��������1��Ǳ��(��һ�ֽ�+1)
	if (GetByte(Ubonus86,1) >= 250) then		-- �ݴ�����Ϊ250��
		Ubonus86 = 250
	end
	SetTask(86,Ubonus86)
	AddNote("��С��ͻ������������. ")
	Msg2Player("<#> ������ɣ������������ "..add_repute.."<#> ��.")
	Talk(1,"KickOutSelf","������ҩ���˹�����о�Ǳ������һ��.")
end

function U41_get_no()
	Talk(2,"","���д�������û������?","���ڻ���˭˵������?")
end

function no()
end
