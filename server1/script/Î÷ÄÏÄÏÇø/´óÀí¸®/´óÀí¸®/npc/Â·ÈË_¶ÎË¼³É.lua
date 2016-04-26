-- ����·�ˡ���˼��
-- by��Dan_Deng(2003-09-16)
-- update by xiaoyang(2004\4\22) ����90������

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(14) == 1 then
		allbrother_0801_FindNpcTaskDialog(14)
		return 0;
	end
	Uworld126 = GetTask(126)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld126 < 10) and (GetLevel() >= 90) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="cuiyan") then
		Talk(6,"Uworld126_get","��....","����Ϊ��̾Ϣ?","������Ҫ�д�־��.","�ѵ����µ������˲�����.","�����ڣ����ǣ����Ѿ�����.","ֻҪ����ĳ��⣬ʲô�¶��ܳɡ�������ʲô���ѣ�����˵��.")
	elseif (Uworld126 == 10) and (HaveItem(391) == 0) then
		AddEventItem(391)
		Msg2Player("�ӵ���˼�ɵ��� ")
		if (GetSex() == 0) then
			Talk(1,"","�������Ҳ��Ҫ��ô����?�Ż�û�á�")
		else
			Talk(1,"","�������Ǵ�����")
		end
	elseif (Uworld126 == 40) then
		SetTask(126,45)
		Talk(8,"Uworld126_jump","��Ҫ˵��!","�ι��ӣ������Ѿ�����ٳ��ˮ�������ٻ�����������Ů���������10����100�����ο�Ϊ�����Լ���.","������˵Ҳû�ã�����¿���뿪����.","�o��˼�ɣ��㾴�Ʋ��ԳԷ��ƣ����ܲ����ˣ�����㻹���ش𣬾͸���.","�� ","����С��! ","��.....","�o�ι���")
	elseif (Uworld126 == 45) then			-- û�����
		Talk(1,"Uworld126_jump","���ѵó����е��֣�Ҳ�Ӳ������������!")
	elseif (Uworld126 == 50) then
		Talk(8,"Uworld126_set","�ι��Ӳ������Ķ���!","�ҿ������ļ�ʱ�����»��ܳŵ�ס.","�Է���������?","�����ף�Ҳ������ˮ�ĵ���",".....���ˣ��ҽ���ٳ����˵�ѣ�˵��������.","������Ǻܺ�.","һ�����Ҹ����ѵ����Ѳ��ܹ�ȥ��","�o��˼�ɣ��ã���������ô�����У���ĳ���ӡ�")
	elseif (Uworld126 == 70) then
		Talk(3,"U126_70","��ô����ٳ������������?","����������˵���ܿ��ģ�����Һܶ��ˣ���л!","������ģ�ֻҪ2���Ҹ���С����ʲô?")
	elseif (Uworld126 > 10) and (Uworld126 < 50)then
		Talk(1,"","֮ǰ���Ҵ��ˣ��治����ô��л!...")
	else
		Talk(2,"","���Ǵ�����ι���ÿ�궼������쳯��˿����ƨ������.","��Ƚ�����ô̰�������ǹ��׶��ٶ�������")
   end
end;

function Uworld126_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		if (GetSex() == 0) then
			Talk(1,"","��̨�ĺ��⣬˼������ ")
		else
			Talk(1,"","��̨�ĺ��⣬˼������")
		end
	else
		Say("ʵ����������ǰ�����и����������ڻں���������һ���ţ�ϣ�����¿������ֽ���������ٳ��ˮ",2,"���к���/Uworld126_yes","���»����£����������˰�! /Uworld126_no")
	end
end

function Uworld126_yes()
	AddEventItem(391)
	SetTask(126,10)
	Msg2Player("�յ���˼�ɵ��ţ��������ż�ٳ��ˮ ")
	AddNote("�յ���˼�ɵ��ţ��������ż�ٳ��ˮ")
end

function Uworld126_no()
end

function Uworld126_jump()
	SetFightState(1)
	NewWorld(230,1613,3175)
end

function Uworld126_set()
	SetTask(126,60)
	Msg2Player("ƭ��ˮȥ���˶�˼��")
	AddNote("ƭ��ˮȥ���˶�˼��")
end

function U126_70()
	Talk(1,"","���ˣ���ˮ˵����������㣬������ʲô��?")
	SetTask(126,80)
	Msg2Player("�����κ�ٳ˵�����ܿ��ġ����ȥ��������������ʲô��")
end
