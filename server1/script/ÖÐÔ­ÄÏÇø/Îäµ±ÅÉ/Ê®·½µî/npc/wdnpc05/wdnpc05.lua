--description: �䵱����������䵱30������
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\timerhead.lua")
Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	Uworld50 = GetTask(50)
--	Uworld31 = GetByte(GetTask(31),1)
	if (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 30*256) and (GetLevel() >= 30) then
			for i = 1,GetItemCount(133) do DelItem(133) end
			Talk(2, "L30_get", "�����䵱ѧ��Ҳ��Щʱ���ˣ����뿼������书�������Ƿ���������.", "���巽����Ҫ���ڹ涨��ʱ�������ţɽ�ϲ�5�껭ü�ݣ���������涨ʱ�������Ŀ����������ʧ��.")
--		Ϊ��ʱ������򲹶�������ֵΪ35��ѧ���˴����ķ�(156)���䵱����(151)��Ҳ���Խ�30��������ȡ����
--		elseif  (UTask_wd == 35) and (HaveMagic(156) >= 0) and (HaveMagic(151) >= 0) and (GetLevel() >= 30) then
--			for i = 1,GetItemCount(133) do DelItem(133) end
--			Talk(2, "L30_get", "������������ٶȳ��Ի�ü�ݵĿ��飬�ܺá�", "�ڹ涨ʱ�������ţɽ�ϲɻ����껭ü�ݣ���������涨ʱ����߲ɵ���Ŀ����������ʧ�ܡ�")
		elseif (UTask_wd == 30*256+20) then
			Say("���õ�5�Ż�ü������?",2,"�Ѳɹ���/L30_finish_yes","��û����/L30_finish_no")
		elseif (UTask_wd == 30*256+50) then 						--��ʱ�ѵ�
			L30_fail()
		elseif (UTask_wd > 30*256) and (UTask_wd < 40*256) then					--�Ѿ��ӵ�30��������δ���
			L30_finish_no()
--			Talk(1,"","���������Ҫ��<color=Red>��ʮ�ĸ�ʱ��<color>��ȥ<color=Red>��ţɽ<color>�ɻ�<color=Red>���껭ü��<color>���Ѿ�ֻʣ"..GetRestCTime(2).."�ˣ���Ҫץ������")
		else					--�Ѿ����30��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","�����书��ע�������ڹ����ƶ������ǣ������ʹ����ڹ���Ҳ�����Ų�������.")
		end
--	elseif (Uworld50 < 10) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 4) then		-- ��������ԭ��������
		--		Talk(3,"Uworld50_get","���������ԭ������Ϊ�������ɼ����ǰ�ӨӨ������Ы�����ն�����������ż��","����ԭ��������û�к�ӨӨ�����棬��ƾ�������Ծ��������˼Ҹ������ˣ���ʵӨӨ������ǳ��������Ⱦ�ĺù���������ǿ�����˵��������","��ң���ǰ�������ұ��ļ���������������ȰȰ�ɡ�")
	elseif (Uworld50 == 30) then
		Talk(2,"","��Ů��ӨӨ������������ƭ��!"," ������Ҳ�ǰ��Ű��ɣ�����ȫ�������������˵������ģ����Ǹ���һ������")
	elseif (Uworld50 == 50) then		-- ����2���������
		Talk(1,"U50_Prise2","�����˵�ˣ������Ů���ٺ��ˣ���Ȼ��ˡ�������ô��л�㡣�У��ҽ������о���")
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","�������ĥ�³���÷�����Կຮ�������Ϊ���֣���Ҫ�����ȱ��˸���ĺ�ˮ.")
	else
		Talk(1,"","��ѧ�䣬���ʺã����ǣ����ڷ���ϰҲ���ܳ�Ϊ����")
	end
end;

function L30_get()
	Say("�������Ľ����������?", 2, "��������!/L30_get_yes", "�����������ޣ����º����������/L30_get_no")
end;

function L30_get_yes()
	i = GetTimerId()
	if (i > 0) and (i ~= 2) then		-- ���м�ʱ���������У����Ҳ��Ǵ�����
		Talk(1,"","������ô��Ҫ��������ô������?")
		return
	end
		Talk(1,"","�ܺá����ڿ�ʼ��ʱ����<color=Red>72Сʱ��<color> �� <color=Red>��ţɽ�n<color> ��ժ <color=Red>5 �껭ü��<color>, ȥ��!")
	StopTimer()
	SetTimer(72 * CTime * FramePerSec, 2)										--������ʱ��:72��ʱ�� * ʱ���� * ֡��
	SetTask(5, 30*256+20)
	AddNote("�����������������72Сʱ֮�ڣ�ȥ��ţɽ����ժ5�껭ü��.")
	Msg2Player("�����������������72Сʱ֮�ڣ�ȥ��ţɽ����ժ5�껭ü��.")
end;

function L30_get_no()
	Talk(1,"","�һ�Ŭ����!")
end;

function L30_finish_yes()
	if (GetItemCount(133) >= 5) then 
		L30_prise() 
	else
		Talk(1,"L30_finish_no","�㻹δ��ժ��5�� !")
	end
end;

function L30_finish_no()
	if (GetRestSec(2) > 0) then
		Talk(1,"","���ʱ�޻���"..GetRestCTime(2).."���ѣ���ץ��ʱ���!")
	else
		i = GetTimerId()
		if (i == 2) or (i == 0) then
			StopTimer()
		end
		L30_fail()
	end
end;

function L30_prise()
	for i = 1,GetItemCount(133) do DelItem(133) end
	if (GetTimerId() == 2) then			-- ���������ʱ��
		StopTimer()					--������ʱ
	end
	Talk(1,"","����������书��Ȼ�����ܴ�! ")
	SetRank(10)
	SetTask(5, 40*256)
--	AddMagic(164)
--	AddMagic(158)
	add_wd(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㱻��ΪѲɽ���ˡ�ѧ���䵱���书���ɾ���.")
	AddNote("�ڹ涨��ʱ���ڷ���ʮ�����5�껭ü�ݸ����������ɻ�ü��������ΪѲɽ����.")
end;

function L30_fail()
	for i = 1,GetItemCount(133) do DelItem(133) end
	SetTask(5, 30*256)
	AddNote("�����涨ʱ�䣬��ü������ʧ��.")
	Msg2Player("�����涨ʱ�䣬��ü������ʧ��.")
	Talk(1,"","ʱ�������ꡣ��̫����ʧ���ˡ�ƽ���ǲ������͵����һ��Ҫ�ڷ���ϰ���С�ʲôʱ��׼�����ˣ��������Ұ�.")
end;

function Uworld50_get()
	SetTask(50,10)
	Msg2Player("������������ԭ���ѣ����ܱ���Ů��ӨӨ�Ի�.")
	AddNote("������������ԭ���ѣ����ܱ���Ů��ӨӨ�Ի�.")
end

function U50_Prise2()
	SetTask(50,255)
	AddProp(1)
	AddEng(1)
	Task88_4 = GetByte(GetTask(88),4) + 1
	if (Task88_4 > 255) then Task88_4 = 255 end
	Task88 = SetByte(GetTask(88),4,Task88_4)
	SetTask(88,Task88)			-- ��¼������ڹ�������

	Msg2Player("��������İ����£�����ڹ�����1�㡣������ԭ�����������.")
	AddNote("���������ԭ��������")
end

function no()
end
