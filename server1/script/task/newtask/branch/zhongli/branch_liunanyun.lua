-- ������ϵͳ����֧�߹���npc
-- BY��XIAOYANG��2004-11-30��

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_liunanyun()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002) --��������
	Uworld186 = nt_getTask(186)
	Uworld1054 = nt_getTask(1054) --����20-30֧��
	Uworld1055 = nt_getTask(1055) --����30-40֧��
	Uworld1056 = nt_getTask(1056) --����40-50֧��
	Uworld1057 = nt_getTask(1057) --����50-60֧��
	Uworld1012 = nt_getTask(1012) --����֧�ߵ�ɱ���������
	Uworld197 = nt_getTask(197) --����ȫ����
	local name = GetName()
----------------------------------------------------��������-----------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 1 ) then 
			nt_setTask(1000,310) --����16start
			Talk(3,"Uworld1000_zhfz1",name..": ��ү�������ģ�������ү����!","���������š��������Ѿ����ҵ����ѣ��Ժ������⣬�һ��չ��㣬������","����Խ����棬��Tab���򿪵�ͼ�����ڲ��֣�Ȼ��������.")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 1 )  then
			nt_setTask(1000,330) --����17start
			Talk(2,"Uworld1000_zhfz2",name..": �ҿ�����..","����ȥ�����ִ��˰�.")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 1 ) and ( Uworld1002 < 10 ) then
			nt_setTask(1000,430) --����22start
			Talk(5,"Uworld1000_zhfz3","���鶼�����ˡ�����������Ĵ��ӣ��������㲻��ȥ�����ˣ��Լ�Ư�������ɣ����е���Ҫ��㿴!",name..":......���Ҹ�л��ү.","�Ժ����һ�����������������ҡ�����һЩС���񽻸��㣬�������˽����н��������㣬������������������..",name..": �õġ��Ҽ�ס�ˡ�","����������Ҳ�����������Ի�ò��Ǿ���ֵ��ֻ�����ǻ�����гɼ������ԣ��м������ﲻ�ܸ��㡣����Խ��������������ʡ�")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 1 ) and ( Uworld1002 > 10 ) then
			Talk(1,"Uworld1000_finishzhongli","���ѽ��˸���������Ҫ˵����Ҳ˵�ˣ���ȥ��.")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 1 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1002 < 10 ) then 
			Say("Ϊʲô�ֻ����ˣ��ǲ����������Ŵ���.",2,"����Uworld1000_zhfz4","����! ֻ�ǻ������������!/Uworld1000_no2")
		else
			Talk(1,"","�����߽�����·�ϣ��в����ľͰ�<color=red>F12<color> �����ҡ���������ڽ�<color=red>����<color>, �Ͳ��ܽ�����������..")
		end
-----------------------------------------------------------------����֧��-----------------------------------------------------------------------------
	else
		if (( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1)) or (( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1)) or (( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1)) or  (( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1)) then
			Describe(DescLink_LiuNanYun.."<#>:  �Ҷ���ı��ֺ����⣬����һ�����",1,"��ȡ����/allprize_zhongli")
		elseif ( Uworld1057 == 90 ) or ( Uworld1057 == 100 ) then
			nt_setTask(1057,100)
			Describe(DescLink_LiuNanYun.."<#>: лл.......�ҽ�����������.",1,"�����Ի�/Uworld1057_zfz5")
		elseif ( Uworld1057 == 60 ) or ( Uworld1057 == 70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,70)
				Describe(DescLink_LiuNanYun.."<#>:  ����Ŭ�����ҽ����������Һܸм�.<enter>"
				..name.."<#>:  ����ү! ������е��쳣<enter> �쳣���������ܿ��ܡ�Ҳ������Ϊ��αװ�Ѿ�.<enter>"
				..name.."<#>:  ����ү! �������°���<enter>ûʲô���Ҹ�����һ��û����֪��������.<enter>"
				..name.."<#>:  Ҫ����˵�ˣ��Ҳ���֪��������£�֪������Ҫ�е��ܶ�����.<enter>�����ź�������������ϣ�ֻ�����ܰ���.<enter>"
				..name.."<#>:...... ��Ȼ��ˣ���˵��.<enter> ����һ����������.<enter>"
				..name.."<#>:  ʲô�� <enter>��Ҳ��һ����ͨ��������ʿ�������Լ�������ǣ��������������һ���ھ�¥����ʧ��ɱ��һ��մ���ǲݵĹ��ӡ�˭֪�����ǵ���Ψһ�Ķ��ӡ�"
				..name.."<#>:  ���Ǹ�����!<enter> ��׷�辫ͨ�������������ָߣ��ݺ�����20���꣬û���˴�ù�����<enter>"
				..name.."<#>:  ����ģ��ҽ�Ϊ������.<enter> Ҳֻ������ʤ���ˣ���������װ�ɸ�Ů���������֪����ֻ����ô����.<enter>",
				1,"�����Ի�/Uworld1057_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end
		elseif ( Uworld1057 == 40 ) or ( Uworld1057 == 50 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,50)
				Describe(DescLink_LiuNanYun.."<#>:  ���Żش��ν�����.",1,"�����Ի�/branch_songjinproblem")				
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> �� ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end
		elseif (( Uworld1057 == 20 ) or ( Uworld1057 == 30 )) and ( Uworld1012 == 20 ) then --�������ж��Ƿ����ν�pk��һ���ı���Uworld1011
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,30)
				Describe(DescLink_LiuNanYun.."<#>:  ���ĺܺ�.",1,"�����Ի�/Uworld1057_zfz4")				
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> �� ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end
		elseif ( Uworld1056 == 70 ) or ( Uworld1056 == 80 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,80)
				Describe(DescLink_LiuNanYun.."<#>:  ���ĺܺã���֯����������.",
				1,"�����Ի�/Uworld1056_zfz5")
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> �� ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end
		elseif (( Uworld1056 == 40 ) or ( Uworld1056 == 50 )) and ( Uworld1012 == 20 ) then --�������ж��Ƿ����ν�pk��һ���ı���Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,50)
				Describe(DescLink_LiuNanYun.."<#>:  ������������ڱ��䳡ʤ�˰��ೡ��û���˸�ȥ��ս�������ԣ����ó�һ�ʴ�Ǯ��������������ġ������ܲ��ǻ��ˣ����ǣ���������ǰ������ô���ء���˵����?<enter>"
				..name.."<#>:  �Ե�.<enter>"
				..name.."<#>: �Ҳ���ɱ��.<enter> �������˳������������ɱ�������ǵ�������û���ˣ�û�������������ˡ������̱ܿ�������Ȩѡ��.<enter>",
				1,"�����Ի�/Uworld1056_zfz4")
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> �� ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end
		elseif ( Uworld1056 == 27 ) or ( Uworld1056 == 30 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,30)
				Describe(DescLink_LiuNanYun.."<#>:  ���ͻȻ�ӵ��ǳ�Σ�յ����񣬹�ϵ�����ݱ��䳡����ȥ�����ٱ�һ�Σ���Ҫʤһ�����ܻ������ҡ�<enter>",
				1,"�����Ի�/Uworld1056_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> �� ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end
		elseif (( Uworld1056 == 20 ) or ( Uworld1056 == 25 )) and ( Uworld1012 == 20 ) then --�������ж��Ƿ���pk��һ���ı���Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,25)
				Describe(DescLink_LiuNanYun.."<#>:  ��ô����֪���������죬���������˰�.<enter>",1,"�����Ի�/Uworld1056_zfz6")
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> �� ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end																			
		elseif ( Uworld1055 == 130 ) or ( Uworld1055 == 140 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1055,140)
				Describe(name.."<#>:  ���ƣ������ڳ������Ѿ��������.<enter>"
				..DescLink_LiuNanYun.."<#>:  ��˭����?<enter>"
				..name.."<#>:  һ��Ů�����Գ��Ǻɻ���.<enter> �����ǣ�����˵�����ڹ����ĸж���������һ�����ܿ�ʯ�����һЩ��ʯ������װ��ȥ�����������ϳ�һ��װ����<enter>",
				1,"�����Ի�/Uworld1055_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","������ʱ������ʲô���⣬���԰�<color=red>F12<color> �� ���ճ�. ����ֻ��������ִ�й��Ĳ���!")
			end
		elseif ( GetLevel() >= 20)  then
			Say(" ˭������Ҫ��ֻ��Ҫ�б������!",3,"������һЩ��������./Uworld1000_zhfz6","������һЩ֧������/Uworld1000_zhfz7","�����������سɷ��Ҳ���ɱ�ˡ�/Uworld1000_no2")
		else
			Talk(1,"","�Ժ����߽������в����ľͰ�<color=red>F12<color> ������")
		end
	end
end

function Uworld1000_zhfz6()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002)
	local name = GetName()
	if ( Uworld1002 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","���ȥ���ִ������壬�ǵô��������š�������������ţ�û����������!")
		Msg2Player("�����ƽ���ȥ���ִ������壬�����µ�����!")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","������ : �㻹��������ɺ����彫��������������.")
	elseif ( Uworld1002 ~= 0 ) then
		Talk(1,"","����̤��ɱ��֮·�����ܻ�ͷ���㲻���Ѿ�����������?.")
	else
		Talk(1,"","��������������ﵽһ���������ܽӵģ�ֻ������ȼ�20���ϾͿ��Խ��ˡ�������......���н���������.")
	end
end

function Uworld1000_zhfz7()
	Uworld1054 = nt_getTask(1054) --����20-30֧��
	Uworld1055 = nt_getTask(1055) --����30-40֧��
	Uworld1056 = nt_getTask(1056) --����40-50֧��
	Uworld1057 = nt_getTask(1057) --����50-60֧��
	local name = GetName()
	Describe(DescLink_LiuNanYun.."<#>:  ���ʱ��ֻ����ǿ�ߡ���ֻ��һ��Ψһ�Ĵ��ڷ�ʽ�����ǣ�ս��!",6,
	"�����콱��֧������ķ���/Uworld1000_zhfz8" ,
	"�����������20�� �� 29��/Uworld1054_zfz1",
	"�����������30���� 39��/Uworld1055_zfz1",
	"�����������40�� �� 49��/Uworld1056_zfz1",
	"�����������50�� �� 59��/Uworld1057_zfz1",
	"Ҫ���Ժ���!/no")
end

function Uworld1000_zhfz8()
	Describe(DescLink_LiuNanYun.."<#>:  ֧������ĸ������������񣬵��ﵽһ���ȼ�����ܽӡ����磬����ĵȼ�Ϊ32,����Ҫ��30������ǰ������Ȼ����ܽ�֧������֮ǰ",1,"�����Ի�/no")
end

function Uworld1054_zfz1()
	Uworld1054 = nt_getTask(1054) --����20-30��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1054 == 0 ) or ( Uworld1054 == 10 )) then
		nt_setTask(1054,10)
		Describe(DescLink_LiuNanYun.."<#>:  ���ڽ�����ʹ�ý��ĸ��֣����������䵱�Ͷ�ü.<enter>"
		..name.."<#>:  ����û���˲�.<enter>����ˣ�����Ϊû�к��ʵı������ý������������ʹ�õĽ�.<enter>"
		..name.."<#>:  ��ǿ������������.<enter>������: ������������˵���˼Ҳ�һ��������<enter>"
		..name.."<#>:  ��˵��Ҳ����<enter>����Żɱ�֣���������Ҫ����˵����������һ�����������ҹ�����ں��׳���������ľ�����Ҫ���顣<enter>"
		..name.."<#>:  �õ�.<enter> ���������ս�һ������ȥ������æ����������ܾ���<enter>"
		..name.."<#>:  ����̫���ˡ���һ��ƽ��ϲ��ʲô�������׼���õ������.<enter>����Ҫ������������ְ��������������ƻ�������ȥ�����50����⬡�<enter>"
		..name.."<#>:  С��һ׮��<enter>",
		1,"�����Ի�/Uworld1054_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","�Բ���! ��ĵȼ�δ������Ҫ�󣬵ȵ�20�����ڽ���Ӧ�������������������.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","�Բ���! ��ĵȼ�����������Ҫ�󣬲��ܽ�����")
	elseif ( Uworld1002 < 20 ) then
		Talk(1,"","�Բ���! ��δ����Ӧ�ȼ����������������뵽<color=red>�꾩<color>�Ҹ��ϱ�.")
	else
		Talk(1,"","�����кܶ������ζ��벻���������!")
	end
end

function Uworld1054_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,10)
	nt_setTask(1054,20)
	AddPlayerEvent(2) 
	Msg2Player("�����ƽ���ȥ�����ҽ�һ����ѯ�������������Ϣ���������50�����.")
end

function Uworld1055_zfz1()
	Uworld1055 = nt_getTask(1055) --����30-40��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1055 == 0 ) or ( Uworld1055 == 10 )) then
		nt_setTask(1055,10)
		Describe(DescLink_LiuNanYun.."<#>:  �д�������.<enter>"
		..name.."<#>:  ���⣿<enter> �����ھֵ��ڳ��������٣�������ʦÿ�������ѣ�36�ھ��ó�һ�ʴ�Ǯ�����ǵ����׷�.<enter>"
		..name.."<#>:  ������ԭ���ͺܺ�ս! <enter>����Ե�������˫ӥ�ھֵ����ˣ���������˵�����.<enter>",
		1,"�����Ի�/Uworld1055_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","�Բ���! ��ĵȼ�δ������Ҫ�󣬵ȵ�30��������Ӧ������������������Ұ�.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","�Բ���! ��ĵȼ���������Ҫ�󣬲��ܼ���������")
	elseif ( Uworld1002 < 70 ) then
		Talk(1,"","�Բ���!��δ����Ӧ�ȼ����������������뵽<color=red>�꾩<color>�Ҹ�����.")
	else
		Talk(1,"","�����кܶ������ζ��벻���������!")
	end
end

function Uworld1055_zfz2()
	AddOwnExp(15000)
	nt_setTask(1055,20)
	Msg2Player("������������󰸣������ƽ��㵽������˫ӥ�ھ������ʸ����ס�")
end

function Uworld1055_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level30();
end

function Uworld1056_zfz1()
	Uworld1056 = nt_getTask(1056) --����40-50��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 120 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1056 == 0 ) or ( Uworld1056 == 10 )) then
		nt_setTask(1056,10)
		Describe(DescLink_LiuNanYun.."<#>:  ��о�������������?.<enter>"
		..name.."<#>:  �Ҳ�֪����ֻ�о�����.<enter> ���ܣ�������Ϊ��û��������������!��ȥ���ݱ���һ���ɡ� <enter>",
		1,"�����Ի�/Uworld1056_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","�Բ���! �Բ�����ĵȼ�δ������Ҫ�󣬵ȵ�40��, ������Ӧ�������������������.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","�Բ���! ��ĵȼ���������Ҫ�󣬲��ܼ���������?")
	elseif ( Uworld1002 < 120 ) then
		Talk(1,"","�Բ���!��δ����Ӧ�ȼ����������������뵽<color=red>�꾩<color>�Ҹ�����.")
	else
		Talk(1,"","�����кܶ������ζ��벻���������!")
	end
end

function Uworld1056_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,20) 
	Msg2Player("�����ƽ���ȥ���䳡��һ����֤����ı��졣")	
end

function Uworld1056_zfz3()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,40)
end

function Uworld1056_zfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level40();
end

function Uworld1057_zfz1()
	Uworld1057 = nt_getTask(1057) --����50-60��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 190 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ((  Uworld1057 == 0 ) or ( Uworld1057 == 10 ))  then
			nt_setTask(1057,10)
			Describe(DescLink_LiuNanYun.."<#>:...�Һ���һ������Ӿ�Ҫ������.<enter>"
			..name.."<#>:  ΪʲôͻȻ����˵?<enter> ��ɱ�ֲ�����һ��������մ�кܶ�Ѫ��Ҳ���Ǻ���.<enter>"
			..name.."<#>:  ����ϴ�ֲ�����?<enter>�ԣ�����׼����һЩǮ��Ϊ����������.<enter>"
			..name.."<#>:......Ҳ��.<enter>  ��ȥ֮ǰ���������ٰ������һ��.<enter>"
			..name.."<#>:  ����������˵��<enter>�㵽�ν�ս������200����֡���Ҫ����ԭ��.<enter>",
			1,"�����Ի�/Uworld1057_zfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","�Բ���! �Բ�����ĵȼ�δ������Ҫ�󣬵ȵ�50, ������Ӧ�������������������.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","�Բ���! ��ĵȼ���������Ҫ�󣬲��ܼ���������?")
	elseif ( Uworld1002 < 190 ) then
		Talk(1,"","�Բ���!��δ����Ӧ�ȼ����������������뵽<color=red>�꾩<color>�Ҹ�����.")
	else
		Talk(1,"","�����кܶ������ζ��벻���������!")
	end
end

function Uworld1057_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(60000)
	nt_setTask(1012,10)
	nt_setTask(1057,20) 
	Msg2Player("�����ƽ���μ��ν��ս����200����ֽ�����ȥ������������Ҫ�����������.")	
end

function Uworld1057_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level50();
end

function Uworld1000_zhfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --����16end 
	Msg2Player("�����ƽ���س���Ϣ����������.")	
end

function Uworld1000_zhfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --����17end 
	Msg2Player("�����ƽ����������ִ���.")	
	seteducationnpcpos()
end

function Uworld1000_zhfz3()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	AddOwnExp(20000)
	nt_setTask(186,10)
	nt_setTask(1000,440) --����22end
	Msg2Player("����һ���Ŵ��������ƽ�������Ŵ���������ȥ��Ҫ�ҵ���.")	
end

function Uworld1000_zhfz4()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(186,10)
	Msg2Player("����һ���Ŵ��������ƽ�������Ŵ���������ȥ��Ҫ�ҵ���.")	
end

function Uworld1000_zhfz5()
	Talk(1,"","��ȥ�����ִ������壬�ǵ��ú������š�����Ŷ��ˣ���û����������!")
	Msg2Player("�����ƽ���ȥ���ִ������壬����������!")		
end

function Uworld1000_no2()
	Talk(1,"","�����ϣ�û�з�ƽ�˾���ʱ����Ҫ���ء�Ȼ���������������񽻸���.")
end

function allprize_zhongli()
	Uworld197 = nt_getTask(197) --����ȫ����
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
	Msg2Player("��ϲ����1���ر�ͼ��Ƭ��.")
	if ( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(197,SetBit(GetTask(197),1,1))
	Msg2Player("��ϲ����1 ����������")
	elseif ( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(197,SetBit(GetTask(197),2,1))
	Msg2Player("��ϲ����1  ��㹫���̾.")
	elseif ( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(197,SetBit(GetTask(197),3,1))
	Msg2Player("��ϲ����1 �����ͤ��")
	elseif ( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(197,SetBit(GetTask(197),4,1))
	Msg2Player("��ϲ����1���ͭȸ����.")
	end	
	Msg2Player("������ɸõȼ�����.")
end

function Uworld1000_finishzhongli()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("������ɳ�������.")
end

function no()
end
