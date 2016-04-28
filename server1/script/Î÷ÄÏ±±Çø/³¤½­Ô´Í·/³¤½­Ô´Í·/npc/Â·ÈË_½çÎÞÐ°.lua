-- ����Դͷ ·��_����а.lua��ؤ��90����������
-- By��XiaoYang(2004-04-29)
-- Update��dan_deng(2004-05-20)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(2) == 1 then
		allbrother_0801_FindNpcTaskDialog(2)
		return 0;
	end
	
	Uworld128 = GetTask(128)
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld128 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="gaibang") and (Uworld30 ==127) then
		Talk(8,"Uworld128_get","����Դͷ���㿴��һ���������ڴ��ڣ������ܱ��ˡ�","���µ�������ô��ô������������ʲô���£�","�������ѣ�ƥ�������ֵܼ�԰���ڱ������ɱ��������ô�ܸ�����?","��ɽ��������ж��ٳ�ޣ�ֻ�����˴�������ڻ�����ȡ����","�����ǽ���а���������Ӣ�ۣ��þƳ�������!","����Ӣ���м���","�ɱ� ","�ɱ�")
   elseif (Uworld128 == 10) and (HaveItem(76) == 1) then
   	Talk(11,"Uworld128_envelop","��̨���ǽ�����","֪�����ǧ���٣�����һ��Ҫ�ȸ�ʹ��","����Ӣ���м���?","���²�֪��ʱ����Ӣ��!","Ϊʲô��ô˵?","������Ȼ���Ų��ã����ǣ��Ѿ������ܶ༤ս���ܶ��˲�����Ҳ���ˣ�������Ȼ���ţ����Ƕ��и�ĸ���޶����ѵ�������ֻ�ǣ�ʱ����ˣ����ܲ�������","�ź�����������������!","Ҳ�аɣ������ˣ���˵�����ĵ����ˣ��Ⱦưɡ�!","��ĳ�����з��ţ��鷳����Ұ�����Ŵ���ؤ���޳���!","��!")
   elseif (Uworld128 == 40) then
   	Talk(7,"Uworld128_kill","���磬��û�°�?","���ģ���û��!","����ô֪������Ҫɱ��!","�����ؤ���ڲ��йأ������û������ʵ�飬�Ҳ�����˵��","����ҪС�ģ���Ҫȥ�����޳���!","���ѣ���ĳû��ʲô�ܱ�����ģ��Ժ���ʲô�£���ĳ������!","��粻Ҫ��ô˵�������Ҹе��ܲ�����˼")
   elseif (Uworld128 == 10) then
   	Talk(1,"","������ȥ���ݵ�·��Σ�գ�һ·��ҪС��!")
   elseif (Uworld128 == 30) then
   	Talk(2,"","����ҪС�ģ�����ᱻ����","��������ʱ��һ��ȥɱ������!")
   elseif (Uworld128 == 20) and (HaveItem(390) == 0) then
   	AddEventItem(390)
   	Msg2Player("�յ�����а����")
   	Talk(1,"","������ش��鷳�㼫�ٰ�����Ŵ��������޳���")
   else
   	Talk(1,"","���Ƹ質������֪���м���?")
   end
end

function Uworld128_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","�����Һ͸���Ҫ�������ڣ�������������·!")
	else
		Say("�ź����ǣ��������²���������֪��������û���ü�׼���þ�",2,"����֪����������һ����¥����Ȫ�ƣ��ܺúȣ��������ھ�ȥ��. /Uworld128_wait","�ֵ�Ƽˮ��꣬���²���ǰ����·���/Uworld128_no")
	end
end

function Uworld128_wait()
	SetTask(128,10)
--	Uworld135 = GetGameTime()
   Msg2Player("��ͽ���аԼ��ȥ����Ʒ������")
   AddNote("��ͽ���аԼ��ȥ����Ʒ������")
end

function Uworld128_no()
end

function Uworld128_envelop()
	DelItem(76)
	AddEventItem(390)
	Msg2Player("�յ�����а���ţ���ؤ�����޳���")
	AddNote("�յ�����а���ţ���ؤ�����޳���")
	SetTask(128,20)
end

function Uworld128_kill()
	SetTask(128,50)
	Msg2Player("�ȳ�����а����ȥ�����޳���")
	AddNote("�ȳ�����а����ȥ�����޳���")
end
