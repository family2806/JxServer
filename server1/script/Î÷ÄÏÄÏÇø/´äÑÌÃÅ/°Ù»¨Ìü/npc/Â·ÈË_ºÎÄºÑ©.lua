-- ������ ��ĺѩ 30������
-- by��Dan_Deng(2003-07-26)
-- update: Dan_Deng(2003-08-07)
-- update by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(5) == 1 then
		allbrother_0801_FindNpcTaskDialog(5)
		return 0;
	end
	UTask_cy = GetTask(6)
   Uworld121 = GetTask(121)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then
		if (UTask_cy == 30*256+40) and (HaveItem(2) == 1) and (HaveItem(3) == 1) and (HaveItem(4) == 1) then
			L30_prise()
		elseif ((UTask_cy == 30*256) and (GetLevel() >= 30)) then		--30����������
			Talk(1,"L30_get","����ǰ�һ�Ե�ɺϣ��õ���һ�ֽ������������ѡ��Ĳ軨�����ӣ����ֲ軨Ʒ��ʮ����ϡ����������Ҳʮ�����ѡ����û�������ؾ����Ǻ��ѳɹ��ģ����������ڷ�����! ")
		elseif (UTask_cy > 30*256) and (UTask_cy < 40*256) then
			Talk(1,"","��ô����үү�Ѿ���������'��������'�ķ�����?")
		elseif (UTask_cy >= 40*256) then
			Talk(1,"","�������ѻ����ܿ죬���Ǻ�һ�𿴲軨")
		else
			Talk(1,"","үү��Ҳϲ�����軨��?")
		end
	elseif(Uworld121 == 10) and (HaveItem(373) == 1) then		--�ж������Ƿ������Լ�������ʱ������СȪ����
		Talk(8,"Uworld121_lose","�����ӣ�������һ����СȪ����","лл��","���������ܿ������ӵ���ò���ҵ�����.","(�㻹Ҫ����˵������ĺѩ���������������һ�����˼���)","�ι������ʲô��","�Һ����ֲ���ʶ������ôԶ�������ͼ����������Բ��ԣ�","����˭?","�����ܰ�ĺѩһ��æ��?")
	elseif(Uworld121 == 10 ) then										--�������������û��������߼���
		Talk(1,"","��Ѽ���������������СȪʦ�����ģ��㿴���ܲ����ҵ�����ס��?.")
	elseif (Uworld121 == 20) and (HaveItem(10) == 0) then		-- ͷ������
		AddEventItem(10)
		Msg2Player("���ҵ�һ��ͷ��")
		Talk(1,"","����ͷ����.")
	elseif (Uworld121 >= 20) and (Uworld121 < 30) then			--��������Ի�ǰ
		Talk(1,"","���㴫����ĺѩ����л")
	elseif(Uworld121 == 30) then
		Talk(8,"Uworld121_Step4","�ι����Ҫ��˵�ˣ���֪����.","�ι���������ˣ�������ͼ�����������Ҫ������������������ϴ��̼���.","����Ĵ�Ӧ�ҵ�Ҫ������?",".....�������������˵��.","����������ĺѩ����ĺѩ������ô��ô���氡?","�ι���.....","�������ǻ�û�����أ����������Ѿ�����!.....")
	elseif(Uworld121 == 40) and (HaveItem(376) == 0) then
		Talk(1,"","û��������Ӣһ�����������.")
		AddEventItem(376)
		Msg2Player("�������. ")
	else
		Talk(1,"","��������������ֳ����������Ĳ軨")
	end
end;

function L30_get()
	Say("��˵�������һ���նεĻ�ũ�����ֲ軨�����֣�����������Ź֣��ܶ�����������޹�����",2,"��������취����/L30_get_yes","ÿ���˶��������谭��������Ҳû�������취. /L30_get_no")
end;

function L30_get_yes()
	Talk(1,"","���л��!")
	SetTask(6,30*256+10)
	AddNote("�ڴ��������ũ�����ֲ�������ѵķ���. ")
	Msg2Player("�ڴ��������ũ�����ֲ�������ѵķ���. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","ԭ�������������ؾ�������лл���ˡ�������ΪһƷ��ʹ��")
	SetTask(6,40*256)
	SetRank(34)
	DelItem(2)
	DelItem(3)
	DelItem(4)
--	AddMagic(105)
--	AddMagic(113)
	add_cy(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㣡����ΪһƷ��ʹ��ѧ���书����滨������ɢѩ. ")
	AddNote("������������ѵ��ؾ���������񣬱���Ϊ��һƷ��ʹ")
end;

function Uworld121_lose()
	Talk(5,"","����ֱ˵.","���������ͷ���������������ʹ��������������7��֮ǰ�����������ҵĻ��ӽ������Һ�����û�л����ټ���.","��Ȼ�����������ʹ�Ĳ����ֻ��һʱ��ѡ������������ι�����Ϣһ��","��Ҳ������㣬��....","�ðɣ�����.")
	DelItem(373)
	AddEventItem(10)
	Msg2Player("���ĺѩ������������õ���ĺѩ��һƥ˿��. ")
	AddNote("���ĺѩ���������")
	SetTask(121,20) --�����������Ϊ20
end

function Uworld121_Step4()
	Talk(4,"Uworld121_sijin",".....?","��Ȼ�㲻�ʵ�����Ҳ���ܲ��塣������һ���������ȥ�����ص���Ӣ.�ҾͰ������һ�Ρ�","��ȥ.....ϣ���ɹ������.","���˵��!")
end

function Uworld121_sijin()
	AddEventItem(376)
	Msg2Player("�������. ")
	AddNote("�õ���ĺѩ��������ȥ�����ص���Ӣ. ")
	SetTask(121,40) --�����������Ϊ40
end
