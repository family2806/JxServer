--������\�ٰ�\�ٰ�\npc\·��_��СȪ.lua 
--by xiaoyang (2004\4\20)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld121 = GetTask(121)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld121 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld38 == 127) and (GetFaction() ~= "tianwang") then
		Talk(3,"Uworld121_get","��λ���Ѻ�!","�������Ѿ����żҵ������������u, ����һ������Ȼ�����鴫","��֪���¿ɷ����һ����?","˵��!")
	elseif (Uworld121 == 10) and (HaveItem(373) == 0) then
		Talk(1,"","��Ҳ���������! ������û�þ���ô������! ������Ҳ������ô����!")
		AddEventItem(373)
		Msg2Player("�ӹ���СȪ�ļ��� ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","�Ҽ�3�����������ԭ������һ��Ҳ��С�������ġ��Ҹ���ϣ���Ҵ������գ�֮�󽫻��ٿ�һ�Ҽ����㣬���Ҳ�ͬ ")
		else
			Talk(1,"","��СȪ���Ҽ��������Ǵ��Ƽ����ģ����ٰ���Ҳ�е���������һֱ�������ӳи�ҵ������Ҳ��һ�������������Ҳ�Ը�⡣")
		end
	end
end

function Uworld121_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","����! �Ҹɲ��������")
	else
		Say("����һ�Ѿ����ļ�����ϣ�����¿���ת���������ŵĺ�ĺѩʹ��",2,"S��Ͷ��ź�����. �����������ĺû��ᰡ/Uworld121_getjd","�����Ҹ���Ҫȥ��ôԶ����˵�Һ����ֲ��죡������˼���ҿ��Ұﲻ����! /Uworld121_no") --��������
	end
end

function Uworld121_getjd()
	AddEventItem(373)
	Msg2Player("�õ���СȪ�ļ���")
	AddNote("�õ�������ֱ��������ŵķ�����ȥ")
	SetTask(121,10) --�����������Ϊ10
end

function Uworld121_no()
end
