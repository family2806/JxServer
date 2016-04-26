-- �嶾 ·��NPC ����կ���Ʋ�а 40������
-- by��Dan_Deng(2003-08-05)
-- update by: xiaoyang(2004\4\13) ����90����������

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


Include("\\script\\global\\skills_table.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>�����嶾���������ֶ�ҩ����һЩ��ҩ���ü����ֶ��������ˣ����������Ķ�ֻҪ����һ���ͻ᲻©�ۼ�����ȥ"
	G_TASK:OnMessage("�嶾", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("���������б������", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld124 = GetTask(124)
	if(GetSeries() == 1) and (GetFaction() == "wudu") then
		if((UTask_wu == 40*256+10) and (HaveItem(143) == 1)) then		-- ���������
			L40_prise()
		elseif((UTask_wu == 40*256) and (GetLevel() >= 40)) then		--40������
			Say("�㵽����Ѫ̶ȥ����׽һ���۾�������������Ҫ������Ѫ����ǿ���� ",2,"Tu�n l�nh!/L40_get_yes","���»���һ��. /L40_get_no")
		else							-- ����Ի�
			Skill150Dialog("����һ��ǿ����������磬Ҫ�������͸Ͽ�����ȥ!")
		end
	elseif (Uworld124 == 10) then
		Talk(9,"Uworld_envelop","�Ʋ�а","˭!���Ǹ�˧��! ��С����ʲô����?","�������Ц�Ľ�ҩ�ó���!","ԭ��������Ӣ�۵��˰�!�ð�! ֻҪ���������Ҿ�ʲô������"," �ޣ����Ǹ����ն�����˸c, Ҫ�ǲ��ѽ�ҩ�ó���,�Ǳ��˾������ʬ�嶼�ϲ�������!","�ߣ������ǲ�֪�ô������ˣ�������һ���ţ�����Ҵ������Ž�����������Ұ��֮����ͻ�õ�����Ҫ��. ","��ƾʲô����?","�����ڽ�����Ҳ���г����ġ������ȥ���ʿ����һ���֪��������ôд��","��ʱ������")
	elseif (Uworld124 == 20 ) and (HaveItem(385) == 0) then
      Talk(1,"","����!��! �ҵ��Ż�û�д�,����ʲôȥ����Ұ")
      AddEventItem(385)
      Msg2Player("�ӹ��Ʋ�а����")
	elseif (Uworld124 == 30) and (HaveItem(386) == 1) then
		DelItem(386)
		SetTask(124,35)
      Talk(5,"Uworld124_jump","ʲô?","���������������ж�!","����ô���ܣ����¶�ʮ��С�ģ�����ô�ᷢ����!","��!...��������ϻ�����һ���涾!","�Ʋ�а���������б���ʱ������������!")        
	elseif (Uworld124 == 35) then
		Talk(1,"Uworld124_jump","����!����С��һ����!")
	elseif (Uworld124 == 40) and (HaveItem(387) == 0) then
		SetTask(124,35)
		Talk(2,"Uworld124_jump","������!�����һ�ֽ�ҩ�ó���!","�ޣ���һʱ�����������ļƣ���Ҫ���룡����! ")
	elseif (Uworld124 >= 40) then			-- �������
		Talk(1,"","�����Ǻݶ�! ")
	else
		Skill150Dialog("�����嶾���������ֶ�ҩ����һЩ��ҩ���ü����ֶ��������ˣ����������Ķ�ֻҪ����һ���ͻ᲻©�ۼ�����ȥ")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("�Ʋ�а", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function L40_get_yes()
	Talk(1,"","�ܺã��ǵ�����һ�����㣬��Ȼ���Ʋ�ס��")
	SetTask(10,40*256+10)
	AddNote("�������Ѫ̶���Ʋ�а׽�۾�������")
	Msg2Player("�������Ѫ̶���Ʋ�а׽�۾�������")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","��������������������Ѫ̶���ܻ��ų������ˣ��������е㱾��")
	SetTask(10,50*256)
	DelItem(143)
	SetRank(53)
--	AddMagic(356)
--	AddMagic(73)
	add_wu(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ��!: ����Ϊ: ������ɲ! ѧ���书�����ɷ�֡����Ķ��̡����ʴ�� ")
	AddNote("�������Ѫ̶׽�۾������ߣ����Խ���Ϊ������ɲ")
end;

function Uworld_envelop()
	AddEventItem(385)
	SetTask(124,20)
	Msg2Player("�����Ʋ�а������")
	AddNote("�����Ʋ�а�����ţ�ȥ����Ұ")
end

function Uworld124_jump()
	SetFightState(1)
	NewWorld(234,1616,3195)
end
