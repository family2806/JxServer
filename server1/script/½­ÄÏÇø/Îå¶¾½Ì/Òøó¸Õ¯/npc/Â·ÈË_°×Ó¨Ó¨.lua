-- �嶾 ·��NPC �����Ӱ�ӨӨ 20������
-- by��Dan_Deng(2003-08-05)

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
	tbDailog.szTitleMsg = "<npc>������һЩ������֪����ѵ���������ô����Ư��Ҳ�д���?"
	G_TASK:OnMessage("�嶾", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("���������б������", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld50 = GetTask(50)
	if (Uworld50 == 20) then			-- ��������ԭ����
		Talk(6,"Uworld50_20","�׹���! �Թ���а������,�����ϣ����������뿪����ԭ","�뿪���Ļ��һ��Ż���ʲô����?Ϊ�˺����ܹ������������Ѿ����˺ܶ��ˣ�Ϊʲô���Ƕ��������أ�","����ҪΥ������ľ�����?","��ֻ�����պ���ԭ�����ף�֮����˳�����ר���չ��Ϲ����ӣ����ٹ�������֮�£�������ʲô����?","����������","�������ϣ���СŮ�а�����Ծ��������������СŮ����Թ��")
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 20*256+10) then
			i = GetItemCount(85)				-- ��ͷ
			if (i >= 7) then
				Talk(1,"L20_prise","���ӣ������Ѿ��������߹���Դ�����������")
			else
				Talk(1,"","�㲻��ȥ����ɽ����ô����������?")
			end
		elseif ((UTask_wu == 20*256) and (GetLevel() >= 20)) then		--20������
			Talk(4,"L20_get","ι�������ģ���������ذ�����ô���ˣ���ô��û�н��ϡ���ͷ״����ѽ","ʲô��ͷ״��","�����뱾��Ϊ�е��˵��Դ� ","�����޶ۣ��������Ӷ��ָ��")
		else							-- ����Ի�
			Skill150Dialog("������һЩ������֪����ѵ���������ô����Ư��Ҳ�д���?")
		end
	else
		Skill150Dialog("��Щ���˲��������������Ǻ�һ���һ���������Լ�Ϊ������.")
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
	G_TASK:OnMessage("��ӨӨ", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L20_get()
	Say("�����߹�һֱ���ѱ����ӵ���ɫ����������������⣡����һ������ɽ�������Ǹ���ɱ��",2,"�ǣ��������ȥȡ������ͷ. /L20_get_yes","�����书̫�����. /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "���Ҿ����������ĺ���Ϣ��")
	SetTask(10,20*256+10)
	AddNote("Ϊ��ӨӨ������ɽɱ�����߹�")
	Msg2Player("Ϊ��ӨӨ������ɽɱ�����߹�")
end;

function L20_get_no()
	Talk(1,"","�Ҿ�֪�����Ǹ���С����û��!")
end;

function L20_prise()
	Talk(1,"","��������������棬����б�����ã�����������������Ϊ����ʹ��")
	i = GetItemCount(85)				-- ��ͷ
	for j = 1,i do DelItem(85) end
	SetTask(10,30*256)
	SetRank(51)
--	AddMagic(70)
--	AddMagic(66)
	add_wu(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ���ô���ʹ�ߵĳƺţ�ѧ���书����ʴ�죬����ҩ��")
	AddNote("Ϊ��ӨӨȥɱ�����߹�����Ϊ������ʹ��")
end;

function Uworld50_20()
	SetTask(50,30)
	Msg2Player("���˰�ӨӨ�Ļ���ܸж�Ҳ���ģ����ǲ�֪����ô��")
end
