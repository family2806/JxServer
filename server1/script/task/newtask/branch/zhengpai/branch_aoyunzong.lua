-- ������ϵͳ����֧�߹���npc
-- BY��XIAOYANG��2004-11-30��

 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")

function task_aoyunzong()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001) --��������
	Uworld183 = nt_getTask(183)
	Uworld1050 = nt_getTask(1050) --����20-30֧��
	Uworld1051 = nt_getTask(1051) --����30-40֧��
	Uworld1052 = nt_getTask(1052) --����40-50֧��
	Uworld1053 = nt_getTask(1053) --����50-60֧��
	Uworld1011 = nt_getTask(1011) --����֧�ߵ�ɱ���������
	Uworld196 = nt_getTask(196) --����ȫ����
	local name = GetName()  
---------------------------------------------------------------��������------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 0 ) then 
			nt_setTask(1000,310) --����16start
			Talk(3,"Uworld1000_zfz1",name.."������ү���������ģ�������ү������š�","�����ڣ������������ģ��ǿ϶����ˡ�����·Զ���������Ǻ��������������Ƚ��ݺȺ��Ⱦƣ���ֻ��С���ȣ��������顣","�����ڣ���������ڳ����Ĵ���䣬��Tab���㿪��ͼ�ۿ�һ�³���Ĳ��֣���Ϥ��Ϥ�������ҡ�")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 0 ) then
			nt_setTask(1000,330) --����17start
			Talk(2,"Uworld1000_zfz2",name.."�����Ѿ����ò���ˡ�","�����ڣ��Ǻã���ȥ�������˴��˰ɡ�")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 0 ) and ( Uworld1001 < 10 ) then
			nt_setTask(1000,430) --����22start
			Talk(5,"Uworld1000_zfz3","�����ڣ��Ǻǣ������ˡ���粻�ῴ���˵ģ��������������İ������������㲻�û�ȥ�����ˣ���ȥ�����ϴ����ɡ�����������輰�翴�����ɵ����мǣ��мǡ�",name.."�����������лл��ү��","�����ڣ������Ȼ�����ÿ���һ���������񶼻���������������ЩС���񽻸��㣬����˻������벻���Ķ����͸��㡣Ҳ������������㡣",name.."���ã��Ҽ�ס�ˡ�","�����ڣ�������Ӫ�������㲻�ǲ����������ܵõ����ٵľ��飬ֻ�����Ƕ������Ż�֮����һЩ���Ķ����Ͳ��������ˡ������ȥ�Ҹ���������������������")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 0 ) and ( Uworld1001 > 10 ) then
			Talk(1,"Uworld1000_finishzhengpai","�����ڣ����Ȼ�Ѿ���ʼ�Ӹ���Ӫ�������ˣ���������Ҳ����ס�㣬���ѧ�Ķ�����ˣ��Լ�ȥ�ɡ�")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 0 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1001 < 10) then 
			Say("��ô�ֻ����ˣ��ǲ��ǰ��������������ˡ�",2,"��/Uworld1000_zfz4","���ǣ�ֻ�ǻ���������/Uworld1000_no1")
		else
			Talk(1,"","�����ڣ����ҺȾƣ��а���������գ����¾������ʥ��ֻ��һ���������������óԣ��ٺ١��в����ĵط��ʹ�<color=red>F12<color>�鿴������һ�䣬�������<color=red>��������<color>�ڣ���û�а취�����������ȼ�����ģ����������������лл��")
		end
	else
---------------------------------------------------------------����֧������-----------------------------------------------------------------------	
		if (( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1)) or (( Uworld1051 == 1000 ) and ( GetBit(GetTask(196),2) ~= 1)) or (( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1)) or  (( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1)) then
			Describe(DescLink_AoYunZong.."<#>��Ϊ�˶���������������ֱ�ʾ�ν����Ҿ�������Щ���ı��",1,"��ȡ����/allprize_zhengpai")
		elseif ( Uworld1053 == 70 ) or ( Uworld1053 == 80 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1053,80)
				Describe(DescLink_AoYunZong.."<#>��ʲô����Ԫ˧������Ԩ�µ��˴�ɱ�ģ��ǻ���˭�أ��ѵ��ⱳ���и����ص������ڲ���һ������Խ��Խ�����ָо��ˡ�<enter>",1,"�����Ի�/Uworld1053_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1052 == 110 ) or ( Uworld1052 == 120 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,120)
				Describe(DescLink_AoYunZong.."<#>���ɵ�Ư�����Ҿ�֪���㲻�Ṽ�����ҵ�ϣ����",
				1,"�����Ի�/Uworld1052_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end		
		elseif ( Uworld1052 == 80 ) or ( Uworld1052 == 90 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,90)
				Describe(DescLink_AoYunZong.."<#>��������������������ʱ�򣬾����������硣<enter>"
				..name.."<#>�����ڣ���֪������������ס������<enter>�����ڣ������Ӧ���ڳɶ����⣬���������Ǹ����ˣ��㻹������һ�������ɡ�<enter>",
				1,"�����Ի�/Uworld1052_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end			
		elseif (( Uworld1052 == 20 ) or ( Uworld1052 == 30 )) and ( Uworld1011 == 20 ) then --�������ж��Ƿ����ν�pk��һ���ı���Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,30)
				Describe(DescLink_AoYunZong.."<#>���������𣬽������������ˣ��������졣�������ֵ�һ��֮ս����ʤ�����ĸߵ�������䵱�ɸ��ֶ��׷���ܣ���ν���գ�����ֹ����<enter>"
				..name.."<#>�� �ǵ����õ�һ�˳ƺŵ���˭��<enter>�����ڣ�һλ�嶾�̵ĸ��ˡ�<enter>"
				..name.."<#>�� �嶾�̣�<enter>�����ڣ��ǵģ���ϧ���˶�óƺź󲻾ã�����ʧ�ˡ���˵����ʤ��̫�����ţ���ȻԼս���½�����һս���춯�أ����ȴ�Ǹ��ա�<enter>"
				..name.."<#>�� ��СС�ı��䳡���������Ŷ������ܰ���<enter>�����ڣ��������������쳣��ޣ�Ҳ�������ú��������嶾�̸���ͬ�����³���<enter>"
				..name.."<#>�� ˵�ɣ��Ҳ���е����¡�<enter>�����ڣ���Ҫ��������������ص�ɱ����֯����Ԩ�¡���˵������Ԫ˧��������������Ī���ϵ��һ���Ҷ���������ã���ֻ��ȥ�����ұ��䳡��Ļ�졣<enter>"
				..name.."<#>�� �ҵ���������ô��������<enter>�����ڣ��㱨���Լ����־ͺá�ʣ�µģ�ֻ�ܿ����Լ��ˡ��������Ҫ������ϵ������ĺ���Ϣ��<enter>",
				1,"�����Ի�/Uworld1052_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end			
		elseif (( Uworld1051 == 170 ) or ( Uworld1051 == 180 )) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,180)
				Describe(name.."<#>����ʯ�����û����ˡ�<enter>"
				..DescLink_AoYunZong.."<#>���ҿ����������Ȼ�����Կ�ʯ��̫���ˡ������ҿ�Ľ�ݲ���벻���ڶ��ѡ���ֻ��Ҫһ�žͺã�ʣ�µľ�������ɡ��㽫���׵����ף����ʱ�ʯ�����Կ�ʯ�õ������������Ҳ����Ժϳɳ�һ�׺ö�����<enter>",
				1,"�����Ի�/Uworld1051_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end		
		elseif ( Uworld1051 == 80 ) or ( Uworld1051 == 90 ) and ( Uworld1011 == 20 ) then --�������ж��������ѹ��ı���Uworld1011
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,90)
				Describe(DescLink_AoYunZong.."<#>����ɱ���ˣ��ã������ǹ�ȥ�����ҹ���ţ�����Ƿ�ţɽһ���������ĺ����֣����ǹ����Ƶ�ҩ�ƿ��Ի�Ѫ���϶����ƺ�����̫̫�Ĳ���<enter>",1,"�����Ի�/Uworld1051_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1051 == 60 ) or ( Uworld1051 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1051,70)
				Describe(DescLink_AoYunZong.."<#>��������ô�ͻ����ˡ�<enter>"
				..name.."<#>������ȥ���˺���֥��������ȥ������̫̫��ʯͷ�������������ˡ��ɵ��ҹ�ȥ��ʱ������̫̫ȴ�޷�����˵���������ӣ��һ����ǻ��˹ֲ���<enter>�����ڣ��ֲ���������ô�ɵ��£�ǡ����ȥ��ʯͷ�����ʱ�򣬾͵��˹ֲ���<enter>"
				..name.."<#>���ѵ������棬����ʲô���顣<enter>�����ڣ�����Ҳ���������ˡ�Ľ�ݲ���������������һ�ѷ�����ƥ��ذ�ף�����һֱ��������¡��һ���ذ�����䵽�˴��������Ϊ��ɱ���ɽ�����������<enter>"
				..name.."<#>��ʲô��<enter>�����ڣ��������Ǳ������ҵ����Ա�ʯ��Ȼ���ܲ�����Ľ�ݲ�����Կ���˵�����࣬�������յ������������Ҳȷʵ�޷����������ˡ���������̫̫�Ĳ�����̫���ˣ��ɵ�����ȥ�²⣬�ⱳ��᲻����ֻ�����ڸ���һ�С�<enter>"
				..name.."<#>�����Ҹ���ô�죿<enter>�����ڣ������ҵ���ҩ�������һ��������б䡣ȥ��ţɽ��ɱ��ʮͷ���ǣ�ȡ���ǹ����������а취��<enter>",
				1,"�����Ի�/Uworld1051_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1050 == 130 ) or ( Uworld1050 == 140 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,140)
				Describe(name.."<#>���ҽ�����ɱ�ֽ���ˣ���������ǰȴ˵�Լ������д���Ԫ˧�Ĵ�ͷ�ˡ�<enter>"
				..DescLink_AoYunZong.."<#>����������Զ����������ĸ��ӡ�<enter>",
				1,"�����Ի�/Uworld1050_zfz4")	
			else
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end							
		elseif ( Uworld1050 == 60 ) or ( Uworld1050 == 70 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,70)
				Describe(name.."<#>��������ȥ��ʱ���ɮ�Ѿ�������������ɽ����ȥ�ˡ�<enter>"
				..DescLink_AoYunZong.."<#>�����������Ļ������ò�ȥ�����ˡ�<enter>"
				..name.."<#>��˭��<enter>�����ڣ�һ������������ˣ���ԭ�������������<enter>"
				..name.."<#>����˭��<enter>�����ڣ���ͷ���ҵ�һ�������ѡ���ȥ��ɽ�������ɣ�����������������ʮ���˰ɣ������ƺ��������ᵽ�����������<enter>",
				1,"�����Ի�/Uworld1050_zfz3")	
			else
				Talk(1,"Uworld1000_zfz6","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( GetLevel() >= 20)  then
			Say("����Ϊ���ֳ�һ���������������൱��İ׵�������Խӡ�",3,"��������һЩ���ߵ�����/Uworld1000_zfz5","������һЩ֧������/Uworld1000_zfz6","�ҳԶ���?û������/Uworld1000_no1")
		else
			Talk(1,"","�����ڣ����ҺȾƣ��а���������գ����¾������ʥ��ֻ��һ���������������óԣ��ٺ١��в����ĵط��ʹ�<color=red>F12<color>�鿴��")
		end
	end
end

function Uworld1000_zfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --����16end
	Msg2Player("�������������ڳ�����Ϣ��Ϣ����Ϥ�˳������������������")	
end

function Uworld1000_zfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --����17end 
	Msg2Player("������������ȥ�������˴��ˡ�")	
	seteducationnpcpos()
end

function Uworld1000_zfz3()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(183,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --����22end
	Msg2Player("����һ�����������������㾡��򿪰��������������ȥ����Ӧ���ˡ�")	
end

function Uworld1000_zfz4()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(183,10)
	Msg2Player("����һ�����������������㾡��򿪰��������������ȥ����Ӧ���ˡ�")	
end

function Uworld1000_zfz5() --���ɷ�֧������ѡ��ű�
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","�����ڣ�����ȥ�����ִ��Ҹ�������ĺ��ӡ�����ͷ�㣬�������ź���Ҫ���˿�����Ȼ�������ҵ���Щ���������ļһ����Ҳ����������ֵġ�")
		Msg2Player("����������ȥ���ִ��ҽ�������ˣ�������������һЩ����")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","�����ڣ��㻹�������������أ�����֮������ү��Ȼ�ᰲ�Ÿ����������񣬲�Ҫ�ļ���")
	elseif ( Uworld1001 ~= 0 ) then
		Talk(1,"","�����ڣ����ѣ��㲻�������������������𣬲�����ϷŪ�Ұɣ�������ʵ�ˣ���ƭ�Ұ������ǡ�")
	else
		Talk(1,"","����������ǵ����ض��ȼ���Ϳ��Խӵ��������κεȼ�����20�����˶�������ɣ����������Ļ�......���������벻���ķ�����ɡ�")
	end
end

function Uworld1000_zfz6()
	Uworld1050 = nt_getTask(1050)
	Uworld1051 = nt_getTask(1051)
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Describe(DescLink_AoYunZong.."<#>:�����������Ʈҡ���׵�����������С�����������ս���΢������������۶����ʱ���ˡ�",6,
	"�������˽���֧�����������/Uworld1000_zfz7" ,
	"��������ʮ����ʮ�ż�֮�������/Uworld1050_zfz1",
	"��������ʮ����ʮ�ż�֮�������/Uworld1051_zfz1",
	"��������ʮ����ʮ�ż�֮�������/Uworld1052_zfz1",
	"��������ʮ����ʮ�ż�֮�������/Uworld1053_zfz1",
	"�����Ժ��������ɣ�������Լ����˲�����/no")
end

function Uworld1000_zfz7()
	Describe(DescLink_AoYunZong.."<#>:֧������������������Ļ����ϣ�ֻ�����ض��ĵȼ���Χ�ڣ��ſ��Խӵ������ұ����ڸ÷�Χ����ɵ������統���ĵȼ�Ϊ��ʮ����ʱ�����ĵȼ�����ʮ����ʮ��֮�䡣�����ȱ���ӵ���ʮ������������Ȼ��ſ��Ե����������ʮ����ʮ����֧�����񡣶��������������ĵȼ�������ʮ��֮ǰ�����������������Զ�ȡ�������޷��ټ�������ȥ�����Ӱɣ��������Ѱɣ�������Ϊ��������񡣵ȼ�������ʮ����������ʱû�к��ʵ�֧��������Ϊ���������е�ͷ�������ƺ��ڲ߻�һ�������������飬�ܿ������ܵõ���Ϣ�ˡ�",1,"�����Ի�/no")
end

function Uworld1050_zfz1()
	Uworld1050 = nt_getTask(1050) --����20-30��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1050 == 0 ) or ( Uworld1050 == 10 )) then
		nt_setTask(1050,10)
		Describe(DescLink_AoYunZong.."<#>:���������һֱ�ڴ�˵����������������ԣ�ֻ֪������һ�ױ��ף��ɾ���ұ������˵����������׵��ˣ���ӵ��������������Ϊ���ϲ�����ս�����˳��˺ܴ�ļ�Ǯ������̽�����������ȷ��������<enter>"
		..name.."<#>���ܴ��Ǯ��<enter>�����ڣ���һ�������󲻵�����ۡ�<enter>"
		..name.."<#>����Ϊ�˴�̽һ�׿��׵�������<enter>�����ڣ����˻�������һ������Ϣ�����������Ǽٵģ���Ҫ̽����������Ϣ����Դ���������ģ��ҳ�ȷ��֤�ݡ�˵ʵ������Ҳ����֪�����������ƾʲô���˲��ϲ�����<enter>"
		..name.."<#>������ʲô�������ṩ���ҡ�<enter>�����ڣ�ȥ������������һ���г�ɮ���ˡ�����Ϣ���п����Ǵ�����һ��������������ɮ��һ�����ˣ�֪����಻��֪���Ķ��������ǳ���Ȥ�����ҵ���Ӧ�����ʳ�Щ������<enter>"
		..name.."<#>�������ˡ�<enter>",1,"�����Ի�/Uworld1050_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��20�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1001 < 20 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ��������������񣬿�����ȥ<color=red>����<color>��Ī��������ʡ�")
	else
		Talk(1,"","ɱ�˵�ʱ�򣬲�ȥ������˸ò���ɱ�ģ���ʵ�������ɱ�֡����κ�����ǰ��Ҫ�����ܵ���������Ϊ��㣬�Ҳ���������ɫ���м��˰ɣ���Ҷ�Ը�����ҵ�������")
	end
end

function Uworld1051_zfz1()
	Uworld1051 = nt_getTask(1051) --����30-40��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1051 == 0 ) or ( Uworld1051 == 10 )) then
		nt_setTask(1051,10)
		Describe(DescLink_AoYunZong.."<#>�����β�����������Ľ�ݲ�������ٰ�Ϊ������������һ�ױ��ף�����Ҫ��ϵ�İ����Կ�ʯһ�ţ���ȥ������һ�°ɡ�<enter>"
		..name.."<#>�����������<enter>�����ڣ�ȥ�ɶ��ҽк���֥��Ů�ӣ�������Ľ�ݲ�Ĺ��ŵ��ӣ�������Ϊ�˸������������Ŵ��౦ʯ��<enter>",
		1,"�����Ի�/Uworld1051_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��30�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1001 < 70 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ��������������񣬿�����ȥ<color=red>����<color>��Ī��������ʡ�")
	else
		Talk(1,"","ɱ�˵�ʱ�򣬲�ȥ������˸ò���ɱ�ģ���ʵ�������ɱ�֡����κ�����ǰ��Ҫ�����ܵ���������Ϊ��㣬�Ҳ���������ɫ���м��˰ɣ���Ҷ�Ը�����ҵ�������")
	end
end

function Uworld1052_zfz1()
	Uworld1052 = nt_getTask(1052) --����40-50��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 140 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1052 == 0 ) or ( Uworld1052 == 10 )) then
		nt_setTask(1052,10)
		Describe(DescLink_AoYunZong.."<#>������ô����Ľ������ģ��о仰���͸��㡣<enter>"
		..name.."<#>����ʲô��<enter>�����ڣ�<color=red>�ý����ۣ�ɱ��ɱ�졣<color><enter>"
		..name.."<#>����ʲô��˼��<enter>�����ڣ��Ե�֮ʱ���۲���������Ҫ�ġ�ֻ�й۲죬���ܷ��ָ��ֵ������������ҳ��������ķ���������ý����ۡ�һ�����֣��ٶȾ�Ҫ�죬������ڸ����ȱ�㣬���Դ�͸���˵ķ�����һ����ɱ�����������κη��˵Ļ��ᣬ��Ϊ�����ߵķ����������Ƿǳ��ֲ��ġ����ɱ��ɱ�졣<enter>"
		..name.."<#>����Щ�������̫�����ˡ�<enter>�����ڣ��������޷���Ϊ���ֵģ���ȥ���䳡��һ��pk��ʵ�ʸ��ܸ��ܰɡ�<enter>",
		1,"�����Ի�/Uworld1052_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��40�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1001 < 140 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ��������������񣬿�����ȥ<color=red>����<color>��Ī��������ʡ�")
	else
		Talk(1,"","ɱ�˵�ʱ�򣬲�ȥ������˸ò���ɱ�ģ���ʵ�������ɱ�֡����κ�����ǰ��Ҫ�����ܵ���������Ϊ��㣬�Ҳ���������ɫ���м��˰ɣ���Ҷ�Ը�����ҵ�������")
	end
end

function Uworld1053_zfz1()
	Uworld1053 = nt_getTask(1053) --����50-60��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 210 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ( Uworld1053 == 0 )  then
		if ( Uworld1052 == 1000 ) then
			Describe(DescLink_AoYunZong.."<#>��ȥ�һ��ɣ�û��ǧ����������ҡ���Ԩ�µ�����̫�࣬�ܲ�������е�ÿ�����䡣",1,"�����Ի�/no")
		else
			Describe(DescLink_AoYunZong.."<#>��ȥ���ݱ��䳡�ҳ���Ļ�죬�����������ô���ġ�<enter>",1,"�����Ի�/no")
		end
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��50�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1001 < 210 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ��������������񣬿�����ȥ<color=red>����<color>��Ī��������ʡ�")
	else
		Talk(1,"","ɱ�˵�ʱ�򣬲�ȥ������˸ò���ɱ�ģ���ʵ�������ɱ�֡����κ�����ǰ��Ҫ�����ܵ���������Ϊ��㣬�Ҳ���������ɫ���м��˰ɣ���Ҷ�Ը�����ҵ�������")
	end
end

function Uworld1050_zfz2()
	AddOwnExp(5000)
	nt_setTask(1050,20)
	Msg2Player("����������ȥ������������һ���г�ɮ���˴��������")
end

function Uworld1050_zfz3()
	AddOwnExp(5000)
	nt_setTask(1050,80)
	Msg2Player("����������ȥ��ɽ����һ���м�ͷ���˴��������")
end

function Uworld1050_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level20();
end

function Uworld1051_zfz2()
	AddOwnExp(15000)
	nt_setTask(1051,20)
	Msg2Player("��Ľ�ݲ����Ҫ��ϵ�İ����Ա�ʯһ�ţ�����������ȥ�ɶ��Һ���֥��")
end

function Uworld1051_zfz3()
	Uworld1011 = nt_getTask(1011) --����֧��ɱ�ֱ���
	AddOwnExp(15000)
	nt_setTask(1051,80)
	nt_setTask(1011,10) --10Ϊ������������������ʵ���ж�ɱ�����������
	AddPlayerEvent(1)
	Msg2Player("�����ڸ�������һ�����ܣ�����������̫̫�Ǳ��˹����¶���������ȥ��ţɽɱ��ʮ�����ǣ�ȡ�������ҩ��")
end

function Uworld1051_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1051_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()	
	ex_add_zp_level30();
end

function Uworld1052_zfz2()
	Uworld1011 = nt_getTask(1011) --����֧��ɱ�ֱ���������Ϊ10���������������жϣ����䳡pk���ж�
	AddOwnExp(30000)
	nt_setTask(1011,10)
	nt_setTask(1052,20)
	Msg2Player("����������ȥ���䳡��һ��������ʵ�ʸ������������ա�")
end

function Uworld1052_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1052_zfz4()
	AddOwnExp(30000)
	nt_setTask(1052,100)
	Msg2Player("�����ڸ����㣬�������п��������ڳɶ���")
end

function Uworld1052_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level40();
end

function Uworld1053_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level50();
end

function allprize_zhengpai()
	Uworld196 = nt_getTask(196) --����ȫ����
	local i=random(1,1200)
	if ( i >= 1 ) and ( i <= 99) then
		AddEventItem(490)
	elseif ( i >= 100 ) and ( i <= 199) then
		AddEventItem(491)
	elseif ( i >= 200 ) and ( i <= 299) then
		AddEventItem(492)
	elseif ( i >= 300 ) and ( i <= 399) then
		AddEventItem(493)
	elseif ( i >= 400 ) and ( i <= 499) then
		AddEventItem(494)
	elseif ( i >= 500 ) and ( i <= 599) then
		AddEventItem(495)
	elseif ( i >= 600 ) and ( i <= 699) then
		AddEventItem(496)
	elseif ( i >= 700 ) and ( i <= 799) then
		AddEventItem(497)
	elseif ( i >= 800 ) and ( i <= 899) then
		AddEventItem(498)
	elseif ( i >= 900 ) and ( i <= 999) then
		AddEventItem(499)
	elseif ( i >= 1000 ) and ( i <= 1099) then
		AddEventItem(500)
	elseif ( i >= 1100 ) and ( i <= 1200) then
		AddEventItem(501)
	end
	Msg2Player("��ϲ�������һ�����Ĳر�ͼ��Ƭ��")
	if ( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(196,SetBit(GetTask(196),1,1))
	Msg2Player("��ϲ�������һ�����Ľ��֮�֮���⡣")
	elseif ( Uworld1051 == 1000 )  and ( GetBit(GetTask(196),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(196,SetBit(GetTask(196),2,1))
	Msg2Player("��ϲ�������һö���Ľ��֮������̾��")
	elseif ( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(196,SetBit(GetTask(196),3,1))
	Msg2Player("��ϲ�������һ�����Ľ��֮��ͤ��")
	elseif ( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(196,SetBit(GetTask(196),4,1))
		Msg2Player("��ϲ�������һö���Ľ��֮ͭȸ���")
	end	
	Msg2Player("���Ѿ�����˸ý׶�����")
end

function Uworld1000_finishzhengpai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("����˳������˽�������")
end

function no()

end

function Uworld1000_no1()
	Talk(1,"","�����ڣ������ϲ�����ƽ�˾������Լ��������⣬һ��Ҫ�������ۡ��Ժ󳣻���תת������Щ������㡣")
end