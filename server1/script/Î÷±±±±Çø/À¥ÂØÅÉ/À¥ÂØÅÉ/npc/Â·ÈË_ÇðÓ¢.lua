-- ��������\������\npc\·��_��Ӣ.lua
-- by xiaoyang (2004\4\20)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(6) == 1 then
		allbrother_0801_FindNpcTaskDialog(6)
		return 0;
	end
Uworld121 = GetTask(121)
	if (Uworld121 == 40 ) and (HaveItem(376) == 1 ) then
		Talk(7,"Uworld121_qiuying","��������Ӣ��?","˭��ô�󵨸�ֱ����������?","�ҷ�ι���֮������","ĺѩ����������������ȵ��Ե����. ","�����ˣ�������һ�ｻ����","������ĺѩ��������ߵ��־�����ˣ���л","�ι���˵�㿴������־�ͻ�������")
	elseif (Uworld121 == 40 ) and (HaveItem(376) == 0 ) then
		Talk(1,"","��û���ҿ���Ц�ɣ�������?")
	elseif (Uworld121 >= 50) then
		Talk(1,"","ĺѩ����˵��ʲôû�У��Ҵ��ʲôʱ����Լ�����?")
	else
		Talk(1,"","ûʲô�¾Ͳ�Ҫ��������!")
	end
end

function Uworld121_qiuying()
	Talk(3,"","��...! ����Ǹ��ϼһ�����ĺѩ����������. ����ĺѩҲ���Ҵ����־�Ҫ�Ұ�������һ������ԭ���!","���ˣ������������ţ��ҽ���������صļƻ�������","֪���ˣ����")
	DelItem(376)
	Msg2Player("֪�����صļƻ���ȥ��������")
	AddNote("֪�����صļƻ���ȥ��������")
	SetTask(121,50) --�����������Ϊ50
end
