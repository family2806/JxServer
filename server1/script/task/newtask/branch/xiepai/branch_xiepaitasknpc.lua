-- ����֧������ű�
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
----------------------------------------------------------------------�޳���-----------------------------------------------------------------------
function branch_zouchangjiu()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 40) or ( Uworld1058 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,50)
			Describe(name.."<#>�����¿����޳��á�<enter>"
			..DescLink_ZouChangJiu.."<#>�����ǣ�����������ʲô����<enter>"
			..name.."<#>���㿴����ʲô��<enter>ʧȥ�ذϻ��������ơ�<enter>�޳��ã��⡭�������ذ��ϴ��������ˣ�̫���ˣ�����̫��ʱ�ˡ�<enter>"
			..name.."<#>��������ʲô���������Ҫ��<enter>�޳��ã�����㲻�ùܣ�������Щ��Ƥ�������ϳ��ǣ�����ͳ���ȥ�ˡ�����ܳɹ�����������Щ����ȥ������һ�����������ӣ���������������Ȼ�����׵ġ�<enter>",
			1,"�����Ի�/branch_zouchangjiu1")	
		else
			Talk(1,"","�Բ������ĵȼ��ѳ�������������ȼ����޷��ټ���ִ���ˣ��ǳ���Ǹ��")
		end
	else
		Describe(DescLink_ZouChangJiu.."<#>��������������⣬����������������ѡ��Ͳ�ͬ�ˡ�",1,"�����Ի�/no")
	end
end
---------------------------------------------------------------------���-----------------------------------------------------------------------
function branch_shenfeng()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 60) or ( Uworld1058 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,70)
			Describe(name.."<#>�������<enter>"
			..DescLink_ShenFeng.."<#>�����ҡ�<enter>"
			..name.."<#>����Щ�������㿴��<enter>��磺ʲô��<enter>�������չʾ����Ƥ���ᡣ<enter>"
			..name.."<#>���ɶ������˽���������ġ�<enter>��磺������үү������磬���ϵ������������𹷣����������ٻ�����<enter>",
			1,"�����Ի�/branch_shenfeng1")	
		else
			Talk(1,"","�Բ������ĵȼ��ѳ�������������ȼ����޷��ټ���ִ���ˣ��ǳ���Ǹ��")
		end
	else
		Describe(DescLink_ShenFeng.."<#>����������������硣",1,"�����Ի�/no")
	end
end

--------------------------------------------------------------------���̹�-----------------------------------------------------------------
function branch_liuyungu()
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1013 = nt_getTask(1013)
	local name = GetName()  
	if ( Uworld1060 == 20) or ( Uworld1060 == 30 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,30)
			Describe(
			name.."<#>���̹��֣���˵�γ�Ŀǰ�㿪��̨����������Ӣ��������ѣ�<enter>"
			..DescLink_LiuYunGu.."<#>���������ģ����γ�͢�ṩ��������ʿ�ı�����̨��������������ϰ��֮�磬�ɼ���͢��Ԥıǿ���߷�����ʵ�������ԶԿ��Ҵ��<enter>"
			..name.."<#>������и���һ������Ϣ��<enter>���̹ţ�û�У�ֻ�в�����̨�������ˣ����ܽ��볡�أ���Ҳ����һֱ������ͷ����ԭ������㡭��<enter>"
			..name.."<#>�������ף��һ�����ȥ���䳡�μ�һ�������ģ�ֻ�������������ռ�����һ�ֵ��鱨��<enter>",
			1,"�����Ի�/branch_liuyungu2")	
		else
			Talk(1,"","�Բ������ĵȼ��ѳ�������������ȼ����޷��ټ���ִ���ˣ��ǳ���Ǹ��")
		end
	elseif (( Uworld1060 == 40) or ( Uworld1060 == 50 )) and ( Uworld1013 == 20 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,50)
			Describe(
			DescLink_LiuYunGu.."<#>������˰ɣ��ã���������ȥ���ذϽ�������ϸ������̨����������ǵò�Ҫ��©�κ�һ��ϸ΢�ĵط���<enter>",
			1,"�����Ի�/branch_liuyungu3")	
		else
			Talk(1,"","�Բ������ĵȼ��ѳ�������������ȼ����޷��ټ���ִ���ˣ��ǳ���Ǹ��")
		end	
	elseif ( Uworld1059 == 40) or ( Uworld1059 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,50)
			Describe(
			name.."<#>�����̹���<enter>"
			..DescLink_LiuYunGu.."<#>������˭�����ҶԱ�������<enter>"
			..name.."<#>����Ҫ��װ�ˣ������ذϽ����������ˣ�Ҫ�������һЩ�¡�<enter>���̹ţ��ذϣ�ʲô�ذΣ��Ҵ���ǧԱս���У�û���������յġ�<enter>"
			..name.."<#>���ذϽ��������ڴˣ�����������������<enter>���̹�ϸϸ�������ƣ���Ȼ���˿�����<enter>���̹ţ���Ȼ���ذϽ������ˣ���Ҫ����ʲô��Ϣ��<enter>"
			..name.."<#>������������һЩ����ʹ��ʩ�����Ĵ��ţ�����������������α��<enter>���̹ţ�ʩ��������һ���������λ���൱Ƶ���������Դ��ж���͸¶���ڴ��ľ����鱨��<enter>"
			..name.."<#>�����д��£����ҵ�������ȥ�����������ʹ˱���ˡ�<enter>���̹ţ�·��С�ġ�<enter>",
			1,"�����Ի�/branch_liuyungu1")	
		else
			Talk(1,"","�Բ������ĵȼ��ѳ�������������ȼ����޷��ټ���ִ���ˣ��ǳ���Ǹ��")
		end
	
	else
		Describe(DescLink_LiuYunGu.."<#>�����𣿽����У��������ԣ�ֻҪ���ó����֣��Ҿ�������",1,"�����Ի�/no")
	end
end

---------------------------------------------------------------------��-------------------------------------------------------------------------
function branch_zuihan()
	Uworld1059 = nt_getTask(1059)
	local name = GetName()  
	
	if ( Uworld1059 == 80) or ( Uworld1059 == 90 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,90)
			Describe(
			name.."<#>���ƹ����ѡ�<enter>"
			..DescLink_JiuGui.."<#>������һ�����������Ρ�������ɡ���<enter>"
			..name.."<#>����Ҫ��Ҳ�������ڡ��ذϽ�����Ҫ�㡣<enter>�ƹ���˵ʲô�����������ذϽ���������������������ʮ���ˣ���Ǳ�������û�����ѣ�û�����ˣ���������Ϊ�ҵĹ����Ѿ�����������ԭ����Ҷ����ǵ��ҡ�����ʲô��Ҫ�Ұ�æ����<enter>"
			..name.."<#>����������Ҫ֪�����ʹ��ʩ������ϸ����Ϣ���ɣ����⣬�����ŪһЩ����ͨ����������Ժ������Ͻֵ�ƾ֤��<enter>�ƹ���Щ����׼�����ˣ������Ͽ���ȥ��ʰʩ������������������<enter>",
			1,"�����Ի�/branch_zuihan1")	
		else
			Talk(1,"","�Բ������ĵȼ��ѳ�������������ȼ����޷��ټ���ִ���ˣ��ǳ���Ǹ��")
		end
	else
		Describe(DescLink_JiuGui.."<#>�����˺ã�����ʲô���벻��Ҳ���ǵ���û�˼ǹ��Լ��ˡ� ",1,"�����Ի�/no")
	end
end

function branch_zouchangjiu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shenfeng1()
	AddOwnExp(5000)
	nt_setTask(1058,80)
	Msg2Player("�������������γ���ʿ�ٰ�ģ�")
	NewWorld(80,1795,3395)
	SetFightState(1)
end
	
function branch_liuyungu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_liuyungu2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,40)
	Msg2Player("���������ȥ���䳡�μ�һ��pk������")
end

function branch_liuyungu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_zuihan1()
	AddOwnExp(15000)
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	nt_setTask(1059,100)
	Msg2Player("��װΪ�ƹ��ϸ���ṩ������һ��ͨ�б����������˳����ȥ��ɱʩ�����ˡ�")
end

function no()
end

