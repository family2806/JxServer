-------------------------------------------------------------------------
-- FileName		:	zhonglitasknpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 14:42:00
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

-----------------------------------���ϱ��Ի�--------------------------------
function funanbing()
	Uworld1002 = nt_getTask(1002)  --����
	local name = GetName()  
	if ( Uworld1002 == 10 ) or ( Uworld1002 == 20 )then 
		nt_setTask(1002,20)
		Describe(name.."<#>������"..DescLink_FuNanBin.."��<enter>���ϱ���û��<enter>"
				..name.."<#>��������ү���������ˣ������������ױ����š� <enter>���ϱ�����ɱ������? <enter>"
				..name.."<#>������û�С�<enter>���ϱ�������ƾʲô����Ԩ�¡������ſ������������������ɡ� <enter>"
				..name.."<#>��˵��������� <enter>���ϱ���ɱ�ˣ�ɱһ����ɱ���ˡ� <enter>"
				..name.."<#>��˭��<enter>���ϱ�����������<enter>"
				..name.."<#>���ĸ��������� <enter>���ϱ������δ󽫣�ͨ���ѹ����ﲻ���⡣ <enter>"
				..name.."<#>����ɱ��<enter>���ϱ���������������ɽһ�����棬���Ʋ������վ�Ҫ��Ӫ����������ȥ�о����ʣ�Ҫ������������ѡ���ȥɱ��������������ɽ�¡� <enter>"
				..name.."<#>���á�<enter>",1,"�����Ի�/middlefinish1")
	elseif ( Uworld1002 == 40 ) or ( Uworld1002 == 50 ) then
		nt_setTask(1002,50)
		Describe(name.."<#>�������ˡ� <enter>"..DescLink_FuNanBin.."<#>�������յ���Ϣ������С�����㣬"
				..name.."<#>�� <enter>"..name.."<#>������ν��<enter>���ϱ�������������һ�����ϵ�㡣û��������ʱ���㲻��ȥ�ٰ���һ���������Ƶ��ˣ��������Щ������Ȼ�����з����͵ġ� <enter>"
				..name.."<#>����֪���ˡ� <enter>",1,"�����Ի�/middlefinish2")
	elseif (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1,"middletask","�ú�Ŭ����")
	elseif ( Uworld1002 == 90 ) or ( Uworld1002 == 100 ) then
		nt_setTask(1002,100)
		Describe(name.."<#>�������ˡ� <enter>"..DescLink_FuNanBin.."<#>���㾹��İ�¬�����ɱ�ˡ� <enter>"
				..name.."<#>���������ң����������ˡ� <enter>���ϱ����ðɣ��������洫�������͸���ȥ�� <enter>"
				..name.."<#>����л��<enter>���ϱ�����л���������������ˡ�ɽ���и���ƻ�����ϣ�����ܲ�������� <enter>"
				..name.."<#>����ʲô�ƻ��� <enter>���ϱ���Ŀǰ��û�п����׵������ʵ���ʱ���һ�����㡣 <enter>"
				..name.."<#>����ֻϣ���㲻Ҫƭ�ҡ� <enter>���ϱ������ڵ�������ʲô���ӣ����ı�Ұ��ʬ���༮����ĸ���Ӷ�ʳ������Х��ɽ�֣������������Ѳ��������˵����¡�������ǵļƻ��ɹ������佫�ʹ˲�ͬ�������ڵȴ�һ��������һ�����֣��һ�����֪ͨ�㡣 <enter>"
				..name.."<#>���á�<enter>",1,"�����Ի�/middlefinish3") 
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		Talk(1,"middletask","�ú�Ŭ����")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		Talk(1,"middletask","�ú�Ŭ����")
	elseif ( Uworld1002 == 180 ) then
		Talk(1,"no","�ɵúã���ȥ���������������ɣ��Ժ��һ������㡣")
	elseif ( Uworld1002 == 220 ) or ( Uworld1002 == 230 ) then
		nt_setTask(1002,230)
		Describe(DescLink_FuNanBin.."<#>���ɹ��ˣ��Ҿ�֪�����ɹ��ġ�",1,"�����Ի�/middlefinish7")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		Talk(1,"middletask","�ú�Ŭ����")
	elseif ( Uworld1002 == 290 ) or ( Uworld1002 == 300 ) then
		nt_setTask(1002,300)
		Describe(DescLink_FuNanBin.."<#>���������������� <enter>"
			..name.."<#>������������� <enter>���ϱ���̫���ˣ��Ҿ�֪����һ���ܳɹ��� <enter>"
			..name.."<#>�����������뼯�����ܸı����²��������� <enter>���ϱ�����ô�д�һ�ʣ� <enter>"
			..name.."<#>���ҡ�����������Щ���ʡ� <enter>���ϱ���������Ҳ��֪������ֻ��˵��ʮ�����ף�����ʼ��������׵�ǣ������������� <enter>���ϱ������ˣ�һ��ʱ���ڿ��ܲ��������㡣��ɽ����Щ������Ҫ��ȥ�������ʱ����Ĺ����Ҷ��ϱ��ˣ��Ժ��ٲ��˶������أ����һ���ү����ȡ�͸�ɡ��ٻ��ˡ� <enter>",1,"�����Ի�/middlefinish9")
	else
		Describe(DescLink_FuNanBin.."<#>:�����ն񣬵���һ�������ʮ�������֣�����Ҳֻ�����ˡ�",1,"�����Ի�/no")
	end
end

------------------------------------۪��ˮ�Ի�----------------------------------
function liqiushui()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 130 ) or ( Uworld1002 == 140 ) then
		nt_setTask(1002,140)
		Describe(DescLink_LiQiuShui.."<#>�����Ǹ�ʲô�ģ����������к�Ŀ�ģ� <enter>"
			..name.."<#>������������ˡ��ϱ����������㡣 <enter>۪��ˮ���ߣ��Ҳ��Ǹ������ǣ�������Щ�������� <enter>"
			..name.."<#>��û˭Ը������㡣 <enter>۪��ˮ��Ӵ���������㻹�����Ը� <enter>"
			..name.."<#>������ϻ��Ĺ�������������ˡ� <enter>۪��ˮ���üһ������С�����Ź������׽�������������������������Ҫ�Ķ�������ȥ����ȡ���� <enter>"
			..name.."<#>����ʲô������ <enter>۪��ˮ��һ�����ס�������Ϣ�� <enter>"
			..name.."<#>��������� <enter>۪��ˮ�����ʶ��� <enter>",1,"�����Ի�/middlefinish4")
	elseif ( Uworld1002 == 160 ) or ( Uworld1002 == 170 ) then 
		nt_setTask(1002,170)
		Describe(DescLink_LiQiuShui.."<#>������Ϣ������Ǵ�˵�еı�����̫���ˡ� <enter>"
			..name.."<#>���������ѵ�������ǡ������������ <enter>۪��ˮ�����Ȼ֪����������� <enter>"
			..name.."<#>��ԭ����һ�������ᵽ���� <enter>۪��ˮ��������û�뵽����֪������µ��˻����٣��ɼ�ɽ����ɽ�����ѣ�����С�����ˡ� <enter>"
			..name.."<#>������Ϊ��Ԩ�����¶��ѡ�������������֪�����٣� <enter>۪��ˮ�������������֯������ϢϢ��أ���ֻ�ܸ�������ô���ˣ��Բ��� <enter>۪��ˮ�����Ǹ���Ķ������պá� <enter>",1,"�����Ի�/middlefinish5")
	elseif ( Uworld1002 == 180 ) and ( GetLevel() >= 50 ) then
		Talk(1,"","۪��ˮ:��ɳ������֮��,���ȥ�Ҹ��ϱ���,������Ҫ���񽻸���.")
	else 
		Describe(DescLink_LiQiuShui.."<#>���Ⱳ����ˮ�Ǵ����ŵ��ˣ��±��ӱ��������ŵĹ�ɡ�",1,"�����Ի�/no")
	end
end

------------------------------------����������-------------------------------------
function hanjiangdudiaosou()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 200 ) or ( Uworld1002 == 210 ) then
		nt_setTask(1002,210)
		Describe(DescLink_HanJiangDuDiaoSou.."<#>��һ��һ����ƽ����һ���̲�һ��� <enter>"
			..name.."<#>������ǰ�����������ˡ� <enter>���������ţ�����С������ͦ����ò���Ұ���ɶ�£� <enter>"
			..name.."<#>��������������������仰�� <enter>���������ţ�ʲô����<enter>"
			..name.."<#>��������������ʧ�ٵ����������ϡ�������֪��������Ϣ�� <enter>���������ţ�Ŷ�����������ǰ�������������ļ��Խ���Խ��Խ���Щ��������粻�ǵ����� <enter>"
			..name.."<#>����ǰ����������ʵ���Ѳ�����ֻ�ǰ������ǰ������ˣ����ó��棬��Ҫ�ٲ�˵������вֻ�ò����ˡ� <enter>���������ţ��ǣ��Ǻǣ��ǺǺǺǡ��ã���һ��xxx������������Ԩ�¶��ڴ�˵����¼�����Ȼ�Ǿ������ҡ�������֪��������ס�ģ������ϡ����ڰ���� <enter>"
			..name.."<#>���Ǿ������������ɡ� <enter>���������ţ������뵱����������ݺᶴͤ���������ͣ���������Ϊ�ܸı���п���������ɵ�ͷ����������ĸ�������������Щ�£�����������������Υ������������ܸı䡣�ı�������Σ���ĸ����� <enter>"
			..name.."<#>����ǰ�����Ժ�����Ժ���˵���������������ϣ��ҿɱ���һ�������� <enter>���������ţ�������������ͻ�ˣ������������ʲô�� <enter>"
			..name.."<#>���㣡<enter>���������ţ�Ҫ���Ͼ�ȥ��ͥ�����Թ��ɣ������ǵ��㡣 ",
			1, "�����Ի�/middlefinish6")
	elseif ( Uworld1002 >= 220 ) then
		Describe(name.."<#>������ǰ�����أ��һ�ȥһ��Ϊ��˵˵���� <enter>"..DescLink_HanJiangDuDiaoSou.."<#>���ȿȣ������ˡ�С���ѣ�����ţ������뼯֮�գ����±�Ȼ���ҡ� <enter>"
			..name.."<#>�����½��ǡ� ", 1, "�����Ի�/no")
	else
		Describe(DescLink_HanJiangDuDiaoSou.."<#>:��������������ֹˮ����һ���ӣ������׾͹��˰ɡ�",1,"�����Ի�/no")
	end
end

------------------------------------���ֿռ�--------------------------------------------
function shaolinkongji()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 260 ) or ( Uworld1002 == 270 ) then
		nt_setTask(1002,270)
		Describe(DescLink_KongJi.."<#>�������ӷ�ʩ�����ص�ɱ���� <enter>"
			..name.."<#>������֮�ˣ���Ȼ��ɱ���� <enter>�ռţ�����ɱ����ʩ���պ�����밢�ǵ������ຣ�ޱߣ���ͷ�ǰ��ɡ� <enter>"
			..name.."<#>�����Ѿ��ز���ͷ�ˡ� <enter>�ռţ�ֻҪ���£����ǻ�ͷ�� <enter>"
			..name.."<#>���ҷŵ����Լ����Ų������� <enter>�ռţ��������ĳ��������ֶΣ������ӷ� <enter>"
			..name.."<#>����ɮ������ͬ����Ϊı���뽻�������ղص����������ɡ� <enter>�ռţ������뵽���ֺ�ɽɽ�֣�ƶɮ�ֽ̼��С� <enter>",
			1, "�����Ի�/middlefinish8")
	elseif ( Uworld1002 >= 290 ) then
		Describe(name.."<#>����ɮ�������ˡ� <enter>"..DescLink_KongJi.."<#>�������ӷ��ƶ���ж��ۣ����ⲻ��Υ��ʩ��ȥ�ɣ�ǰ����������� <enter>",1,"�����Ի�/no")
	else
		Describe(DescLink_KongJi.."<#>��������������ж��ۣ���Եǰ��Ī��ĪЦ�������ӷ�",1,"�����Ի�/no")
	end
end

--------------------------------------------------------------------------------------------

function no()
end

function middlefinish1()
	DelItem(456)
	AddOwnExp(5000)
	nt_setTask(1002,30)
	Msg2Player("���ϱ�����ȥɱ��������ɽ�������������")
end

function middlefinish2()
	AddOwnExp(5000)

	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level20();
	Msg2Player("���ϱ�˵�����������.")
	Talk(1,"middletask","�ú�Ŭ����")
end

function middlefinish3()
	AddOwnExp(10000)
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level30();
	Msg2Player("���ϱ�˵��Ԩ���и���ƻ�,�Ժ���������.")
	Talk(1,"middletask","�ú�Ŭ����")
end

function middlefinish4()
	AddOwnExp(15000)
	nt_setTask(1002,150)
	Msg2Player("۪��ˮ����ȥ���ʶ�ɱ��������.")
end

function middlefinish5()
	Uworld1002 = nt_getTask(1002)
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level40();
	Msg2Player("���ϱ�Ϊ���ѹ�ϴ�裬������������·����Լ��ļ��ܵ��ˡ�����㲻����������Ӫ����ô��ò������������ᡣ����Ի�ȥ�Ҹ��ϱ��ˡ�")
end

function middlefinish6()
	AddOwnExp(30000)
	nt_setTask(1002,215)
	Msg2Player("��������������ȥ��ͥ�����Թ�����,�Ի���������.")	
end

function middlefinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level50();
	Msg2Player("���ϱ�˵�Ժ��������ġ�")
	Talk(1,"middletask","�ú�Ŭ����")
end

function middlefinish8()
	AddOwnExp(50000)
	nt_setTask(1002,280)
	Msg2Player("�ռ���ɮ����ȥ���ֺ�ɽ������")	
end

function middlefinish9()
	AddOwnExp(40000)
	nt_setTask(1002,310)
	ex_add_zl_level60();
	AddSkillState( 509, 1, 0, 180);
	Msg2Player("���ϱ�˵��Ҫȥ��ɽ��Щ�£��Ժ��л����ټ��ˡ�����Ի����崦��Щ������Ķ�����")	
end
