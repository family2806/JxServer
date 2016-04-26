-- ؤ�� �ư������޿��� 30������
-- by��Dan_Deng(2003-07-28)
-- by: xiaoyang(2004\4\22)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_gb = GetTask(8)
	Uworld128 = GetTask(128)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 30*256) and (GetLevel() >= 30) then		--30������
			Say("�Ҹ�����ؤ����ֶ���ճ�����ÿ���¸��ֶ�Ķ������Ͻ�һ�����飬��������µ����ֶ���Զ����ٳ�δ�Ͻ����飬��Ը�����ȥ��һ����?",2,"ͬ��/L30_get_yes","���ź��������������� /L30_get_no")
		elseif (UTask_gb == 30*256+40) and (HaveItem(81) == 1) then		--30���������
			L30_prise()
		elseif (UTask_gb >= 30*256+10) and (UTask_gb < 400*256) then		--30�����������
			Talk(1,"","·��������û�У�Ϊʲô�Զ�����û��������?")
		else
			Talk(1,"","���Խ��Խ�б�������Ҫ�ж�����!")
		end
	elseif (Uworld128 == 20) and (HaveItem(390) == 1) then
		Talk(9,"Uworld128_danger","�޳��ϣ������н���а����",".....���ʸ��´������õ���?","�������а��ʶ���ڳ���Դͷ�������ҵ�.","��Ӧ��û������˵���ֵ�����Σ�˵�����뺦����.","��ô?","���·ǳ���Ҫ�����Բ���������֪��","��������","�Ҳ������ͷ¶�棬��ҵ�����������/","����ȥ!")
	elseif (Uworld128 == 50) then
		Talk(5,"Uworld128_finish","�޳��ϣ������Ѿ�����.","��л���ѣ������һ�����һ����","��˵!","����а��ؤ���ϣ�����Է�������Ź��ġ�ϣ����Ŭ����������.","�޳�������� ! ")
	elseif (Uworld128 == 20) then
		Talk(1,"","�޳��ϣ�������а���Ҵ��Ÿ��㣬���������Ǵ���.")
	elseif (Uworld128 > 20) and (Uworld128 < 50)then
		Talk(1,"","С����ؤ���ϣ�������Ը����������! ")
	else
		Talk(1,"","���Խ��Խ������������Ҫ����ж�����.")
	end
end;

function L30_get_yes()
	Talk(1,"","�����ֶ������ݣ��㵽���ｫ������Զ���")
	SetTask(8,30*256+10)
	Msg2Player("�ӵ����񣺵������������Զ���Ϊʲô�ٳٲ������� ")
	AddNote("�ӵ����񣺵������������Զ���Ϊʲô�ٳٲ�������")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(2,"","���ϣ��Ҵ����������!","������������ж��ˣ�������Ҫ����С�Ĳ��С�����������ˣ��ҷ���Ϊ30������")
	DelItem(81)
	SetTask(8,40*256)
	SetRank(40)
--	AddMagic(274)
--	AddMagic(124)
	add_gb(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ���Ѿ���Ϊؤ��ִ�����ӣ�����ѧ�����ƣ�����. ")
	AddNote("������ɽ�����飬�ȳ�ؤ����ӣ���Ϊִ������")
end;

function Uworld128_danger()
	DelItem(390)
	SetTask(128,30)
	Msg2Player("�޳�������ȥ�Ƚ���а ")
	AddNote("�޳�������ȥ�Ƚ���а")
end

function Uworld128_finish()
	if (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) then
		Talk(1,"","��ؤ���в��ؾ���������!")
		if (HaveMagic(357) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(357,1)
		end
		if (HaveMagic(359) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(359,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("��ѧ��ؤ��������������죬�����޹�")
		SetTask(128,255)
	else
	   SetTask(128,245)  --������������ñ���245
	end
   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
   AddRepute(add_repute)
   Msg2Player("�ȳ�����а��������������������"..add_repute.."��.")
   AddNote("�ȳ�����а��������� ")
end
