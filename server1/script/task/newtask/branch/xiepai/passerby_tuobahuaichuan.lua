-- ������ϵͳа��֧�߹���npc
-- BY��XIAOYANG��2005-1-17��
 
 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_tuobahuaichuan()
--------------------------------------------------------------------��ѧ����------------------------------------------------------------------
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)   --��ѧ�������
	Uworld1003 = nt_getTask(1003)	 --а�������������
	Uworld189 = nt_getTask(189)
	Uworld1058 = nt_getTask(1058) --а��20-30֧��
	Uworld1059 = nt_getTask(1059) --а��30-40֧��
	Uworld1060 = nt_getTask(1060) --а��40-50֧��
	Uworld1061 = nt_getTask(1061) --а��50-60֧��
	Uworld1013 = nt_getTask(1013) --а��֧�ߵ�ɱ���������
	Uworld198 = nt_getTask(198) --а��ȫ����
	local name = GetName()  
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 2 ) then 
			nt_setTask(1000,310) --����16start
			Talk(3,"Uworld1000_xfz1",name.."������ү���������ģ�������ү������š�","�ذϻ�����������ˣ��ߣ������ǵ����ذϻ�������","�ذϻ�������������ڳ����Ĵ���䣬��Tab���㿪��ͼ�ۿ�һ�³���Ĳ��֡���Ϥ��Ϥ�������ҡ�")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 2 ) then
			nt_setTask(1000,330) --����17start
			Talk(2,"Uworld1000_xfz2",name.."�����Ѿ����ò���ˡ�","�ذϻ������Ǻã���ȥ�������˴��˰ɡ�")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 2 ) and ( Uworld1003 < 10 ) then
			nt_setTask(1000,430) --����22start
			Talk(5,"Uworld1000_xfz3","�ذϻ����������ˣ����������Ǽһ�������İ������������㲻�û�ȥ�����ˣ���ȥ�����ϴ����ɡ�����������輰�翴�����ɵ����мǣ��мǡ�",name.."�����������лл��ү��","�ذϻ�����Ҫл�Լ�ȥл�����ÿ���һ���������񶼻���������������ЩС���񽻸��㣬����˻������벻���Ķ����͸��㡣�ҿɲ��������ϼһ�ר����",name.."���ã��Ҽ�ס�ˡ�","�����ƣ�������Ӫ�������㲻�ǲ����������ܵõ����ٵľ��飬ֻ�����Ƕ������Ż�֮����һЩ���Ķ����Ͳ��������ˡ������ȥ�Ҹ���������������������")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 2 ) and ( Uworld1003 > 10 ) then
			Talk(1,"Uworld1000_finishxiepai","�ذϻ��������Ȼ�Ѿ���ʼ�Ӹ���Ӫ�������ˣ���������Ҳ����ס�㣬���ѧ�Ķ�����ˣ��Լ�ȥ�ɡ�")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 2 ) and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1003 < 10 ) then 
			Say("��ô�ֻ����ˣ��ǲ��ǰ��������������ˡ�",2,"��/Uworld1000_xfz4","���ǣ�ֻ�ǻ���������/Uworld1000_no3")
		else 
			Talk(1,"","�ذϻ�����ȭ����ɽ���Ƶ�����������Ҫ����������һ�䣬�������<color=red>��������<color>�ڣ���û�а취�����������ȼ�����ģ����������������лл��")
		end
----------------------------------------------------------------------а��֧��---------------------------------------------------------------	
	else
		if (( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1)) or (( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1)) or (( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1)) or  (( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1)) then
			Describe(DescLink_TuoBaHuaiChuan.."<#>��Ϊ�˶���������������ֱ�ʾ�ν����Ҿ�������Щ���ı��",1,"��ȡ����/allprize_xiepai")
		elseif ( Uworld1061 == 110 ) or ( Uworld1061 == 120 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>���ã�ʢ��һ�����Ҵ�����޺��֮�ǣ����ĺá����ʱ������Գ�ȥ��ɽ��ˮ���ܱܷ�ͷ��<enter>",
				1,"�����Ի�/Uworld1061_xfz6")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1061 == 80 ) or ( Uworld1061 == 90 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>��������<enter>"
				..name.."<#>������Ϊ����������Ʋ��֣�<enter>�ذϻ������Ҵ�������վã�ս��ȴһֱ��չ�����������Ǹ߱ں񣬱������ͣ��ر�ʹʢ����������˫ȫ��ս���ϵ�Խ�ã��Ҿ�����Խ���ѣ�����붬��������ͽ�Ͷ����Ŀ��ܡ�<enter>"
				..name.."<#>����������˼�ǣ�<enter>�ذϻ�����ɱ��ʢ������������ս������<enter>",
				1,"�����Ի�/Uworld1061_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1061 == 60 ) or ( Uworld1061 ==70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,70)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>����ش�ķǳ�������",1,"�����Ի�/Uworld1061_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1061 == 40 ) or ( Uworld1061 == 50 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,50)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>�����Ƿ���׼���ûش��ҵ����⣿",2,"�ǵģ�����׼������/branch_songjinproblem","���������������/no")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif (( Uworld1061 == 20 ) or ( Uworld1061 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,30)
				Describe(
				name.."<#>�������������Ҷ������ˡ�<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>���Ǻǣ���Ȼ�������٣����¿������������ǹ�Ӣ�������������Ԩͣ���ţ���������������֮�磬���ջ���Ҫ�����м��㣬��Ȼ�ʵ��ν�ս����һЩս�������ȿ����㡣<enter>",
				1,"�����Ի�/Uworld1061_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1060 == 110 ) or ( Uworld1060 == 120 )then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>:�����Ͽ������û���¿�����ס���ˡ�",
				1,"�����Ի�/Uworld1060_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif (( Uworld1060 == 80 ) or ( Uworld1060 == 90 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>�������������ģ�ֻҪ���������������ʧ�ܣ��ҹ�Ȼû���Ŵ��ˡ�<enter>"
				..name.."<#>��������һ��ʤ������ֵһ�ᡣ<enter>�ذϻ���������֪���ڴ��γ������˶������<enter>"
				..name.."<#>����֪����<enter>�ذϻ�����ɽ�����������Ļ̡̻�����Ҳ�����Ƶ���һ������˼⣬����Щ���ⲻȥ��<enter>"
				..name.."<#>�������Լ�Ը��ġ�<enter>�ذϻ�������ô�ðɣ����Ѿ���ĺ���������γ�͢�������ƹ���̨���Ĺ�Ա���������������Զ�����˱��������µ��׼ҵ��ӣ�Ҳ�����������ˣ��Ż���������ǿ��֮����Ŀǰ��������Ұ��ﱸ��̨�����˵�ʱ�����Ǹ���ɱ���ĺû��ᣬ����ɹ��������Ľ����ι�����Ķ�־����˼����ȥ��ֻ�����ܵ������Ρ�<enter>",
				1,"�����Ի�/Uworld1060_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1060 == 60 ) or ( Uworld1060 == 70 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,70)
				Describe(name.."<#>�����������������������γ�����̨������ȷʵ������֣��Ǻ����߲���ʤ��<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>���������Ҵ����������µ����ŷ��������ȥ�����Ҵ�ʤһ��������ʤ���ô�Ҷ����ƣ���������˭�����£�<enter>",
				1,"�����Ի�/Uworld1060_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1059 == 110 ) or ( Uworld1059 == 120 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>����ץ�����ˣ��ã��������˴�һ��������һ�������صķ��͡�<enter>",
				1,"�����Ի�/Uworld1059_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1059 == 60 ) or ( Uworld1059 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,70)
				Describe(
				name.."<#>���ذϽ��������������ϣ�ʩ���������δ���͸¶�Ҿ�������Ϣ���Ļ��ϲ⡣<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>��������֣�<enter>"
				..name.."<#>������Ϣŭ��<enter>�ذϻ������������ˣ���ȥһ���ٰ�����������Ū����������һ���ɷ�й�أ���������ʹ�������ζ���ʧ�٣��ҿ�������ν�����ֻҪһ�Ų��������аѱ������������<enter>"
				..name.."<#>���С�<enter>�ذϻ������ٰ��ر�ɭ�ϣ�����������ȥ���ĵط�������ȣ�����ж��������Ѳ�С��<enter>"
				..name.."<#>������һ���������ɹ�������ʡ�<enter>�ذϻ���������ʿ��Բ��ɣ����ǲ��ɵĺá������ٰ�Ҳ������ϸ���������ȥ�ٰ��ƹݱ��Ҹ�������������ȵô�����û�����뵽������Ȼ�����ǵ��ˡ�<enter>",
				1,"�����Ի�/Uworld1059_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif (( Uworld1059 == 20 ) or ( Uworld1059 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,30)
				Describe(name.."<#>����Ҫ��ģ��������ˣ����ɻ�ģ�������𸴡�<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>�������������ܵ�һǿԮ�������Ӵ����ʵ������ʵ������˴�����������������������ƽ�Ͼ����Ӫǧ����<enter>"
				..name.."<#>������Ȼ��λ������<enter>�ذϻ�������ʵ�ҽ���õ���һ�У�������˵���緭�ƣ�ֻҪ�ܰ���ҽ��������飬�Ҷ�Ȼ�������볯Ϊ�١�<enter>"
				..name.."<#>���������ƺ�����<enter>�ذϻ��������������и��൱�ش��������Ҫ�����㣬��������֪������µ��˲����������<enter>"
				..name.."<#>��������ʲô�£�<enter>�ذϻ�������ϸ���ر������մ���������ε�ʹ��ʩ�����ж����أ����������춯�������˽��ҹ�̫�����Ļ������ȥ����Ѱ���Ҵ�������ε�ϸ���������̹ţ��˽����顣<enter>"
				..name.."<#>���Ǻã������ҾͶ���<enter>�ذϻ������������̾��ߣ�����ʮ��𼱣�һ�а������ˡ�<enter>",
				1,"�����Ի�/Uworld1059_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end
		elseif ( Uworld1058 == 90 ) or ( Uworld1058 == 100 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,100)
				Describe(DescLink_TuoBaHuaiChuan.."<#>����类�˼ٰ磿����Ҫȥ��飬��ʱ�����������ˡ�<enter>",1,"�����Ի�/Uworld1058_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�")
			end																																			
		elseif (( Uworld1058 == 20 ) or ( Uworld1058 == 30 ))  and ( Uworld1013 == 20 ) then 
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,30)
				Describe(DescLink_TuoBaHuaiChuan.."<#>��ɱ�����𣿹�Ȼ�Ǵ��������ˣ�<enter>�ذϻ�������Ȼ�������ܸɣ��Ҿ��и�һ���ش��������㡣<enter>"
				..name.."<#>��������˵��<enter>�ذϻ��������Ȼȥ�����񣬶Գɶ��ò�İ�������̳��ҵ�����Ǳ��ɶ�����һ�����޳��õ��ˣ������Ҵ������õ�ϸ�����ҵ�������һЩ�������������ǣ����˿��¾��������ˡ�<enter>",
				1,"�����Ի�/Uworld1058_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","�������ʱ������ʲô���⣬���԰�<color=red>F12<color>���ۿ������������ѡ��鿴�Լ���ǰ��������������������е�Ŀǰ�ⲽʱ��������ǰ�����ĵȼ������ѳ��������ķ�Χ���޷��ټ�������ˡ�");
			end
		elseif ( GetLevel() >= 20) then
			Say("��ô�������ϴ����ˣ����ҵ�̼��Ĺ�����û���⡣",3,"��������Ща����Ӫ����������/Uworld1000_xfz8","�����а����Ӫ��֧������/Uworld1000_xfz88","�������࣬���˵ö���֮��˭ϡ�����������/Uworld1000_no3")
		else
			Talk(1,"","�ذϻ�����������أ����߿��ߣ�����û������㣬��æ�úܡ��в����ĵط��ʹ�<color=red>F12<color>�鿴��")
		end
	end
end



function Uworld1000_xfz8()
	Uworld1000 = nt_getTask(1000)
	Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","�ذϻ���������ȥ�����ִ��Ҹ�������ĺ��ӡ�����ͷ�㣬�������ź���Ҫ���˿�����Ȼ�������ҵ���Щ���������ļһ����Ҳ����������ֵġ�")
		Msg2Player("����������ȥ���ִ��ҽ�������ˣ�������������һЩ����")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","�ذϻ������㻹�������������أ�����֮��������Ȼ�ᰲ�Ÿ����������񣬲�Ҫ�ļ���")
	elseif ( Uworld1003 ~= 0 ) then
		Talk(1,"","�ذϻ��������ѣ��㲻������а�����������𣬲�����ϷŪ�Ұɣ�������ʵ�ˣ���ƭ�Ұ������ǡ�")
	else
		Talk(1,"","����������ǵ����ض��ȼ���Ϳ��Խӵ��������κεȼ�����20�����˶�������ɣ����������Ļ�......���������벻���ķ�����ɡ�")
	end
end

function Uworld1000_xfz88()
	Uworld1058 = nt_getTask(1058)
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1061 = nt_getTask(1061)
	Describe(DescLink_TuoBaHuaiChuan.."<#>:�����м������ǿ����ַ��˲ƣ�Ҫ���ͷ�������Ҹɰɡ�",6,
	"�������˽���֧�����������/Uworld1000_xfz7" ,
	"��������ʮ����ʮ�ż�֮�������/Uworld1058_xfz1",
	"��������ʮ����ʮ�ż�֮�������/Uworld1059_xfz1",
	"��������ʮ����ʮ�ż�֮�������/Uworld1060_xfz1",
	"��������ʮ����ʮ�ż�֮�������/Uworld1061_xfz1",
	"�����Ժ��������ɣ�������Լ����˲�����/no")
end

function Uworld1000_xfz7()
	Describe(DescLink_TuoBaHuaiChuan.."<#>:֧������������������Ļ����ϣ�ֻ�����ض��ĵȼ���Χ�ڣ��ſ��Խӵ������ұ����ڸ÷�Χ����ɵ������統���ĵȼ�Ϊ��ʮ����ʱ�����ĵȼ�����ʮ����ʮ��֮�䡣�����ȱ���ӵ���ʮ������������Ȼ��ſ��Ե����������ʮ����ʮ����֧�����񡣶��������������ĵȼ�������ʮ��֮ǰ�����������������Զ�ȡ�������޷��ټ�������ȥ�����Ӱɣ��������Ѱɣ�������Ϊ��������񡣵ȼ�������ʮ����������ʱû�к��ʵ�֧��������Ϊ���������е�ͷ�������ƺ��ڲ߻�һ�������������飬�ܿ������ܵõ���Ϣ�ˡ�",1,"�����Ի�/no")
end

function Uworld1058_xfz1()
	Uworld1058 = nt_getTask(1058) --а��20-30��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	local name = GetName()  
	if ( Uworld1003 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1058 == 0 ) or ( Uworld1058 == 10 )) then
		nt_setTask(1058,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:��ԭ������ʿһֱ�Ϳ���������Ϊ���ǲ���������ȡʤ����ʵ�Ҵ���ǽ����Լ����������������ο�����ȣ��������ɵ�������֪���ˡ�<enter>"
		..name.."<#>��������������ڲ��ֱ�����������͸������������Ҫȡʤȷʵ���װɡ�<enter>�ذϻ������������ģ��γ����Ǻ��м����ܴ��̵Ľ�������������һ�̶�������и����������ʱ�򣬿����Ƕ�ȡ���κ�ɽ�Ժ��ˡ�<enter>"
		..name.."<#>��������׳�꣬�ذ�������ʲô�Ը����뾡��ֱ�ԡ�<enter>�ذϻ������ã����ú��𼴽�չ�����ģ��ս�£�����Ҫ���ø�ǿ����ȥ����������һ�ˣ�ɱ����ʮֻ��Ҷ��ɡ�<enter>",
		1,"�����Ի�/Uworld1058_xfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��20�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1003 < 20 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ���а���������񣬿�����ȥ<color=red>������<color>���ƶ��������ʡ�")
	else
		Talk(1,"","�ҹ������������������Լ����У�ֻҪ��Ը�⣬������䣬����ǧ��Ҳ�������С�")
	end
end

function Uworld1058_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(5000)
	nt_setTask(1058,20)
	nt_setTask(1013,10)
	AddPlayerEvent(4) 
	Msg2Player("�ذϻ�������ȥ�ɶ�������ɱ��ʮֻ��Ҷ�")
end

function Uworld1058_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1058_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level20();
end

function Uworld1059_xfz1()
	Uworld1059 = nt_getTask(1059) --а��30-40��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	local name = GetName()  
	if ( Uworld1003 >= 110 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1059 == 0 ) or ( Uworld1059 == 10 )) then
		nt_setTask(1059,10) 
		Describe(
		name.."<#>���ذ��������⾿������ô���£��Ҵ��޳�������ȡ���˼�����Ƥ���ᣬ������ȥ�����Ҹ����������ˣ����ҹ�ȥ��ʱ�򣬾�Ȼ�����ε�������ʿ���㡣<enter>"
		..DescLink_TuoBaHuaiChuan.."<#>��Ŷ����羹Ȼ���˷����ˣ�����ô������С�ġ��ðɣ�����˵��������Ҳ���ǿ��Խ���һ����������Ҫ��������ɽɱ����ʮֻ���ǣ��Ҿ� ȫ�ޱ����ĸ����㣬�����㲻ֵ�������и��κ��¡�<enter>",
		1,"�����Ի�/Uworld1059_xfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��30�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1003 < 100 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ���а���������񣬿�����ȥ<color=red>������<color>���ƶ��������ʡ�")
	else
		Talk(1,"","�ҹ������������������Լ����У�ֻҪ��Ը�⣬������䣬����ǧ��Ҳ�������С�")
	end
end

function Uworld1059_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(15000)
	nt_setTask(1059,20)
	nt_setTask(1013,10)
	AddPlayerEvent(5) 
	Msg2Player("�ذϻ�������ȥ����ɽɱ����ʮֻ���ǡ�")
end

function Uworld1059_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1059_xfz4()
	AddOwnExp(15000)
	nt_setTask(1059,80) 
	Msg2Player("�ذϻ�������ȥ�ٰ���Ǳ���Ѿõ�ϸ�������˳������������ھ�¥�ߡ�")	
end

function Uworld1059_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level30();
end

function Uworld1060_xfz1()
	Uworld1060 = nt_getTask(1060) --а��40-50��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	if ( Uworld1003 >= 210 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1060 == 0 ) or ( Uworld1060 == 10 )) then
		nt_setTask(1060,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>��������˵���ξ�����������̨���䣬��˵��������Ѿõĸ��ַ׷׸������Ҿ������б������顣��ȥ���������̹��˽�һ�������<enter>",
		1,"�����Ի�/Uworld1060_xfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��40�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1003 < 200 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ���а���������񣬿�����ȥ<color=red>������<color>���ƶ��������ʡ�")
	else
		Talk(1,"","�ҹ������������������Լ����У�ֻҪ��Ը�⣬������䣬����ǧ��Ҳ�������С�")
	end
end

function Uworld1060_xfz2()
	AddOwnExp(30000)
	nt_setTask(1060,20) 
	Msg2Player("�ذϻ�������ȥ�����̹ŵ����γ����䳡�������")	
end

function Uworld1060_xfz3()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,80) 
	Msg2Player("�ذϻ�������ȥ���䳡սʤһ����Ϊ������������")	
end

function Uworld1060_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1060_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level40();
end

function Uworld1061_xfz1()
	Uworld1061 = nt_getTask(1061) --а��50-60��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	local name = GetName()  
	if ( Uworld1003 >= 300 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and (( Uworld1061 == 0 ) or ( Uworld1061 == 10 )) then
		nt_setTask(1061,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>���Ҳ��������ʲô������ס�㡣<enter>"
		..name.."<#>��������̧̫���ˡ�<enter>�ذϻ�����������Լ����Ȼ��Ч���������������������������ߪ����Ϊƽ�Ͼ�����Уξ����Ϯ���档<enter>"
		..name.."<#>��л��¡����<enter>�ذϻ������������µĹ�����ȣ�������㲻��ʲô������������Ԥ������ϱ�����Ϊ���㶼ξ�������Ӷ�д���ˣ�ֻ����û�о�������ͬ��������˼����ˣ����Ǿ�����������������εĴ�������ν�ս����һ�����֡���ʵ����ı��£���Щ����̫����΢���ɱ���������Ҫ�ߵģ������ٸ����ְɣ���Ϊ�Ҵ���ս��<enter>",
		1,"�����Ի�/Uworld1061_xfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","�Բ�����ĵȼ�û�дﵽ������������뵽��50�������ӹ���Ӧ���������������Ұɡ�")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","�Բ�����ĵȼ��ѳ���������������޷��ӵ��ˡ�")
	elseif ( Uworld1003 < 300 ) then
		Talk(1,"","�Բ�����û������Ӧ�ȼ���а���������񣬿�����ȥ<color=red>������<color>���ƶ��������ʡ�")
	else
		Talk(1,"","�ҹ������������������Լ����У�ֻҪ��Ը�⣬������䣬����ǧ��Ҳ�������С�")
	end
end

function Uworld1061_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(60000)
	nt_setTask(1013,10)
	nt_setTask(1061,20)  
	Msg2Player("�ذϻ����ѱ�����Ϊ���㶼ξ������ȱ�پ�����������ȥ�����ν��ս����ȡ���ٸ����֡�")	
end

function Uworld1061_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz5()
	AddOwnExp(30000)
	nt_setTask(1061,100)  
	Msg2Player("���������£������������������ɱ�����ر�ʹʢ����")	
end

function Uworld1061_xfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level50();
end

function Uworld1000_xfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --����16end 
	Msg2Player("�ذϻ����������ڳ�����Ϣ��Ϣ����Ϥ�˳������������������")	
end

function Uworld1000_xfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --����17end
	Msg2Player("�ذϻ���������ȥ�������˴��ˡ�")
	seteducationnpcpos()	
end

function Uworld1000_xfz3()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(189,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --����22end
	Msg2Player("����һ���������ذϻ������㾡��򿪰��������������ȥ����Ӧ���ˡ�")	
end

function Uworld1000_xfz4()
  
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(189,10)
	Msg2Player("����һ���������ذϻ������㾡��򿪰��������������ȥ����Ӧ���ˡ�")	
end

function Uworld1000_xfz5()
	Talk(1,"","�ذϻ���������ȥ�����ִ��Ҹ�������ĺ��ӡ�����ͷ�㣬�������ź���Ҫ���˿�����Ȼ�������ҵ���Щ���������ļһ����Ҳ����������ֵġ�")
	Msg2Player("�ذϻ�������ȥ���ִ��ҽ�������ˣ�������������һЩ����")	
end

function Uworld1000_no3()
	Talk(1,"","�ذϻ���:�����ϲ�����ƽ�˾�,���Լ���������,һ����������.�Ժ󳣻���תת,����Щ�������.")
end

function allprize_xiepai()
	Uworld198 = nt_getTask(198) --����ȫ����
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
	if ( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(198,SetBit(GetTask(198),1,1))
	Msg2Player("��ϲ�������һ�����Ľ��֮�֮���⡣")
	elseif ( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(198,SetBit(GetTask(198),2,1))
	Msg2Player("��ϲ�������һö���Ľ��֮������̾��")
	elseif ( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(198,SetBit(GetTask(198),3,1))
	Msg2Player("��ϲ�������һ�����Ľ��֮��ͤ��")
	elseif ( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(198,SetBit(GetTask(198),4,1))
	Msg2Player("��ϲ�������һö���Ľ��֮ͭȸ���")
	end	
	Msg2Player("���Ѿ�����˸ý׶�����")
end

function Uworld1000_finishxiepai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("����˳������˽�������")
end

function no()
end