-- ���� ·��NPC �޺����������� ���ֳ�ʦ����
-- by��Dan_Deng(2003-08-04)
-- update by xiaoyang(2004\4\15) ����90������

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	if allbrother_0801_CheckIsDialog(206) == 1 then
		allbrother_0801_FindNpcTaskDialog(206)
		return 0;
	end
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
--	if (UTask_sl == 70*256) and (Uworld122 == 245) then		-- ��������90����������������ɵģ�ֱ�Ӹ�����
--		Talk(1,"","���ѣ������ӷ�ʩ����ȻӢ�۳��ڣ����������־���һ���������ڼ���ϰ������Ҫ��Ϊ���£���Ҫ��Ϊ��ԭ���ֵĶ�����")
--		AddMagic("����̽צ")
--		AddMagic("��ɨǧ��")
--		AddMagic("����ն")
--		Msg2Player("ѧ�����ּ��ܽ���̽צ����ɨǧ��������ն")
--		SetTask(122,255)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if((UTask_sl == 60*256+10) and (HaveItem(217) == 1) and (HaveItem(215) == 1) and (HaveItem(216) == 1) and (HaveItem(214) == 1)) then		-- �������
			L60_prise()
		elseif((UTask_sl == 60*256) and (GetLevel() >= 50)) then		--��ʦ��������
			Say("���ձ��Ź涨�����Ǳ������ʦ�ĵ��Ӷ�Ҫ����108�޺���Ŀ��飬��������?",2,"ͬ��/L60_get_yes","���� /L60_get_no")
		else							-- ����Ի�
			Talk(1,"","�������ڽ���������ϳ�������ʦ����������Ҳ��!")
		end
	elseif (Uworld122 == 20) then
		Talk(4,"Uworld122_censure","�����ʦ�����ֵ������ڻ�ɽ����̨�����ԣ�������������.","�ĸ�С�����⣿���ֵ��²�������֣��߰�!","����·����ɽ������������ֵ���Ӱ�����¹��ɱ������.","���ֳ��ҵ��ӱ鲼����������ʲô�������ѵ����ܲ�֪���𣿲�Ҫ��˵�������ȥ�Ҳ�������!")
   elseif (Uworld122 >= 30) and (Uworld122 < 60) then
   	Talk(1,"","��վ���ﰡ�����ҳ�����?") 
   elseif (Uworld122 == 70) then
   	Talk(7,"U122_prise","��ʦ","��ʦ","���ˣ����Ҵ��ˣ����ѴӲ���˭��ͷ��������С�ֵ��ϴ�!","��ѽ����ʦ���Ҳ��Ұ�!","Ϊʲô����������ˮ������оȸ����ӣ�����������֮��.","��ʦ�����ҵ���С�Ӱݷ�.")
	else
		Talk(1,"","�㶮ʲô����Ȩ��һ������ָ��ѧ���ֲ������������!")
	end
end;

function L60_get_yes()
	Talk(1,"","������������޺����ȥ�ã����飬���ȣ�ľ�㣬����4�����Ȼ���ԭ·���أ��Լ����Ű��")
	SetTask(7,60*256+10)
	AddNote("�������ֳ�ʦ���񣺽����޺����ҵ�4��������飬���ȣ�ľ�㣬����. ")
	Msg2Player("�������ֳ�ʦ���񣺽����޺����ҵ�4��������飬���ȣ�ľ�㣬����. ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(2,"","��ϲ���ѳ��108�޺�������Գ�ʦ���Ժ����߽������ȼ����ˣ��������壬���ܽ�������ס��!","���Ӽ�ס��")
	DelItem(217)
	DelItem(215)
	DelItem(216)
	DelItem(214)
	SetRank(62)
	SetTask(7,70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("���޺����ҵ�4�����ｻ�����ѣ���ɳ�ʦ����������������˳����ʦ")
	Msg2Player("��ϲ���ʦ���㱻��Ϊ��������")
end;

function Uworld122_censure()
	SetTask(122,30)  --�����������Ϊ30
	Msg2Player("����û��ע�⵽�㣬��ֻ��ȥ������. ")
	AddNote("����û��ע�⵽�㣬��ֻ��ȥ������. ")
end

function U122_prise()
   if(GetTask(7) >= 70*256) and (GetTask(7) ~= 75*256) then			-- ���������ӻ��ʦ����
		Talk(2,"���ѣ����������������������ԭ����һ�����춯�أ�������ɮ��һ�������־��������͸�С�ѣ�ϣ�����ڷ���������ֻ�ǳ�Ϊ���µ��ӣ�����","��ʦ�ķԸ���С����ô�������!")
		if (HaveMagic(318) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(318,1)
		end
		if (HaveMagic(319) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(319,1)
		end
		if (HaveMagic(321) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(321,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("ѧ�����ּ��ܣ���Ħ�ɽ�����ɨǧ��������ն. ")
		SetTask(122,255)
	else
	   SetTask(122,245)  --������������ñ���245
	end
   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
   AddRepute(add_repute)
   Msg2Player("")
   Msg2Player("�ȳ���������ˣ�����ɮ�ͽ⣬�������������������. "..add_repute.."��.")
   AddNote("�ȳ���������ˣ�����ɮ�ͽ⣬����������� . ")
end
