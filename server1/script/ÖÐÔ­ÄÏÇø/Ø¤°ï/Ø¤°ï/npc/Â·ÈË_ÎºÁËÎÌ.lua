-- ؤ�� ��������κ���� 40������
-- by��Dan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	UTask_gb = GetTask(8)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 40*256+30) then		--40���������
			Talk(2,"L40_prise","���Ѿ������Ŵ��ˣ������ܺ����ֽ�������.","���Ҿͷ����ˣ���Ҳ�����ˣ������һ��������������Ϊ����ʮ�������.")
		elseif (UTask_gb == 40*256+10) then		--40��������
			if (HaveItem(236) == 1) then
				Talk(4,"","κ���ϣ����Ѿ���������Щ���ɱ�֣����Ǵ����������ѳ�һ���ܺ�.","���ҿ��� .....","? �ܺ�����һ�ݰ��й������ĳ�͢�����ɵ�����������ű������Ͻ����ſ����ˣ�����С�������.","��Ͻ�ȥ����һ�ˣ��Ŵ��˾�ס�ڻ��ѿ�ջ����Ҫ�������Խ��������ϡ��м��м�!")
				SetTask(8,40*256+20)
				AddNote("���ܺ�ȥ���ſ�")
				Msg2Player("���ܺ�ȥ���ſ�")
			else
				Talk(1,"","ʱ���������Ҫ���Ͽ������Ŵ�����ǰ���ϰ�! ")
			end
		elseif ((UTask_gb == 40*256) and (GetLevel() >= 40)) then		--40����������
			Say("�ٰ������ĵ��������̽����������й��ᳯ͢��������ɣ���ı������ʹ�ſ��Ͼ����ε�;�а������������ӿ���Ļ",2,"�뽻������ /L40_get_yes","���ӹ������������²��ܵ�������/L40_get_no")
		elseif (UTask_gb == 40*256+20) and (HaveItem(236) == 0) then		-- ��������Ʒ��ʧ����
			AddEventItem(236)
			Talk(1,"","���¾��Բ�����ʧ��������м�Ҫ��������!")
		else
			Skill150Dialog("������ĵ��£���ؤ��Ҳ�ѵֿ���ֻ�����������һ���Ϲ����ᣬ������ϧ")
		end
	else
		Skill150Dialog("������Ľ�������������������ʱ�̶��ҳ�!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("C�i Bang", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L40_get_yes()
	Talk(1,"","��ҪС��! ")
	SetTask(8,40*256+10)
	AddNote("������ɱ����ɱ�֣������ſ���ȫ")
	Msg2Player("������ɱ����ɱ�֣������ſ���ȫ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(3,"","�a��лκ����! ")
	SetTask(8,50*256)
	SetRank(41)
--	AddMagic(277)
	add_gb(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ������Ϊؤ����ͷ���ӣ�ѧ�������")
	AddNote("�����ſ��İ�ȫ�����40��������Ϊ��ͷ����")
end;
