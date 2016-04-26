-- ����֧������ű�
-- by xiaoyang(2005\1\11)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")

----------------------------------------------------------��һ��--------------------------------------------------------------------------
function branch_jiangyixiao()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if (( Uworld1054 == 20) or ( Uworld1054 == 30 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,30)
			Describe(name.."<#>: ������, �����ƽ���������.<enter>"
			..DescLink_JiangYiXiao.."<#>:  ������������������ʲô?.<enter>"
			..name.."<#>:  �����˵���ݳ��ֱ���.<enter> ����ԭ������Ϊ����°���.<enter>"
			..name.."<#>:  ������֮ǰ,�Ѱ���ɨ�ɾ�����Щ���.<enter> ��һ��: �������������������������⡣����ʶ�����������������������ı����ҡ�ֻ����һ�γ������ϵ�ʧȥ���ֱۣ����ȥ������<enter> "
			..name.."<#>: �Ƕ�л��.<enter>��һ��:���ÿ����������ʺ�����.<enter>",
			1,"�����Ի�/branch_jiangyixiao1")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	else
		Describe(DescLink_JiangYiXiao.."<#>:  ���ݱ��������Щ�����ǣ����ϵ�������Ȼ����.",1,"�����Ի�/no")
	end
end
---------------------------------------------------------������-----------------------------------------------------------------------------
function branch_leqingqiu()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 40) or ( Uworld1054 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,50)
			Describe(name.."<#>:  ������, ��˵������������������������.<enter>"
			..DescLink_LeQingQiu.."<#>: ��������������Ҳ���ҵ���.<enter>"
			..name.."<#>:  ������ʲô���� <enter>������: ��ѽ�����Ѳз��ˣ�����ʲô��˵��......<enter>"
			..name.."<#>:  ������˵�����ʲô��˼�أ�<enter> ��Ƿ������ͽһ�ʺܴ��Ǯ���Ѿ�30���˻�δ���壬������˵ʲô������<enter>"
			..name.."<#>:  ������ף��Ұ�����.<enter>",
			1,"�����Ի�/branch_leqingqiu1")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	elseif ( Uworld1054 == 110 ) or ( Uworld1054 == 120 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,120)
			Describe(name.."<#>:  ������, ���Ķ�ͽǷ���Ѿ�������.<enter>"
			..DescLink_LeQingQiu.."<#>:  ��֪���ˣ����ǳ������ϣ������������ô��ȴ��ô�¸ҡ���ĳ���ǰ׻���.<enter>"
			..name.."<#>:  ��������Ҫ��ô˵������һ���ܼ�ǿ���ˣ����������Ͳ��������������.<enter>����......��! ��������Ҹ�������.<enter>"
			..name.."<#>:  лл!.<enter>������: ��ȥ��Ϊ��ȡ��������ı��� .<enter>",
			1,"�����Ի�/branch_leqingqiu2")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	elseif ( Uworld1054 == 140 ) or ( Uworld1054 == 150 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,150)
			Describe(name.."<#>:  ������, ����������.<enter>"
			..DescLink_LeQingQiu.."<#>:  ��ѽ�����ѽ�.<enter>"
			..name.."<#>:  ��ѽ���ô���� <enter>"
			..name.."<#>:  ���� <enter>?<enter>"
			..name.."<#>:  �ǣ���......<enter>�㲻�ÿ�ϧ��������������Ժ�һ���ܸɴ���ҵ��.<enter>"
			..name.."<#>:  ���ǿ�ϧ��һ�ѱ���.<enter>�¸�֮�Ĳ�������Ҫ������!<enter>"
			..name.."<#>:  ����ʲô�� <enter>�մ����մ�����ӵ�е�������������.<enter>"
			..name.."<#>:......лл����������.<enter>",
			1,"�����Ի�/branch_leqingqiu3")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	else
		Describe(DescLink_LeQingQiu.."<#>: �˵�һ��ֻ���Ա��˸���ʩ��!",1,"�����Ի�/no")
	end
end
-----------------------------------------------------------�Ĺ�--------------------------------------------------------------------------
function branch_dugun()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 60) or ( Uworld1054 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,70)
			Describe(name.."<#>:  �����㵽��.<enter>"
			..DescLink_DuGun.."<#>:  ˭?<enter>"
			..name.."<#>:  �����㰡.<enter> ������˰�? <enter>"
			..name.."<#>:  ��Ҫ����Ц! ������Ƿ�����Ǯ? <enter>����Ǯ�����������?<enter>"
			..name.."<#>:  С��һ׮�����˸�Ǯ������ʲô�취��<enter>�У����ǣ���������.<enter>"
			..name.."<#>:  ��ʲô��˵����Ҫ֧֧�����<enter> �У�����ȡ��·�������ͷ�����ֵľͲ��û�ծ�ˡ�<enter>"
			..name.."<#>:  ��ȥ��.<enter>",
			1,"�����Ի�/branch_dugun1")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	elseif ( Uworld1054 == 90 ) or ( Uworld1054 == 100 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,100)
			Describe(name.."<#>:  ��������<enter>"
			..DescLink_DuGun.."<#>:  ��...���ȡ��·��������� <enter>"
			..name.."<#>:  ���Ű���ȥ���ſ���<enter> ���������ֵ�ծ�Ѿ�ɾ�ˡ� <enter>",
			1,"�����Ի�/branch_dugun2")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	else
		Describe(DescLink_DuGun.."<#>:  Ƿծ��Ǯ��ɱ�˳���.",1,"�����Ի�/no")
	end
end		
---------------------------------------------------˫ӥ�ھ�����------------------------------------------------------
function branch_shuangying()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 20) or ( Uworld1055 == 30 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,30)
			Describe(name.."<#>:  ���ã�����������������!.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>: ��ʦ���������ģ���������.<enter>"
			..name.."<#>:  �������˳��������ã����ǣ�˫ӥ�ھֵĴ�����Ȼ�����ڶ��������ô��ô�ң�<enter> �������ھ���ȣ������ھ�Ҳ���ǱȽ����ˣ���ʧ�١��Է�����̫���ˣ���ʮ����δ��������ô���͵�����.<enter>"
			..name.."<#>: ��ʲô��ô��˵�ģ�<enter> ���ھ��и��������������а�ţ�����ڳ��ڣ����ȥ����.<enter>"
			..name.."<#>:  �õ�.<enter>ϣ���������ҵ������Ҵ���30���ھָ�л��.<enter>",
			1,"�����Ի�/branch_shuangying1")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  ���ڶ��꣬�������������ˣ���֪���н���.",1,"�����Ի�/no")
	end
end		
-----------------------------------------------------��ţ------------------------------------------------------------------------------
function branch_aniu()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 40) or ( Uworld1055 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,50)
			Describe(name.."<#>:  ��ţ���ھֵ����˽��������㣬ѯ�ʱ�������Ϣ.<enter>"
			..DescLink_ANiu.."<#>: ���Ǿ����ҵ������ְ�?<enter>"	
			..name.."<#>:  ��ng! <enter>����, ����ȥ�ɣ��������ҵ���3λ���֣���Щ���ڵ����ټ��Ĺ��������ص���ʧ�ˡ�<enter>"
			..name.."<#>:  ���Ѵ�Ӧ�Ͳ������.<enter>�����Ҹе���Ľ��ϣ����������<enter>"
			..name.."<#>:  �һ�֤�����㿴�ҵı���!<enter> �ܺã���Ҫ��̸Ŷ<enter>"
			..name.."<#>:  �㲻���Ҿ�����!<enter>����! ��һ�¡�������Ҫ˵.<enter>"
			..name.."<#>:  ʲô�£� <enter>��������͸��㣬ϣ������û���ϴ���!<enter>"
			..name.."<#>:  ��л<enter>",
			1,"�õ����£���Ҫ��ϸ���/branch_aniu1")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	else
		Describe(DescLink_ANiu.."<#>:  �ǰ�������������Ҫ�ǳ�С��!",1,"�����Ի�/no")
	end
end

----------------------------------------------------------��ǹ�ھ�����-------------------------------------------------------------------
function branch_lengqiang()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 60) or ( Uworld1055 == 70 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,70)
			Describe(name.."<#>:  ���ϰ�<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  ���ܸ�����˭���Ϸ���ϴ�ֽ��裬�������������ٹ��ʽ���������.<enter>"
			..name.."<#>:  ����������ֽ��ڳ��ĵ����������˺ܶ�Ѫ�����ѵ���ֻ֪������? <enter> С�ӣ��㶮ʲô?�ж������ո��������� <enter>"
			..name.."<#>:  ���ӿɺ�?<enter>�����ˣ����˵���û�����ɽ��50�����ԣ����ҽ��׷����ͺڷ���.<enter>"
			..name.."<#>:  ����!<enter>",
			1,"�����Ի�/branch_lengqiang1")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	elseif (( Uworld1055 == 80) or ( Uworld1055 == 90 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,90)
			Describe(name.."<#>:  ���ϰ壬�������Ѵ�������.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  ����, ����Ƽˮ��꣬��α���Ҫ������?<enter>"
			..name.."<#>:  �����������֮����<enter>�����ˣ�����һ���������Ѿ�Ū����ˡ������Ǻɻ��������������������ɡ����ǣ������������һ����·��������һЩ��ʯ���Ա���⡣.<enter>",
			1,"�����Ի�/branch_lengqiang2")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	elseif ( Uworld1055 == 110 ) or ( Uworld1055 == 120 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,120)
			Describe(name.."<#>:  ���ϰ壬�������壬��ɱ���ǡ����������ʣ�Ϊʲô���ַ�������?<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  ��ʵ�����Ƕ����мҽ̵ĺ�ֽ��������������ȥ���棬����ʦ�����ˡ����������ǵõ����˵İ�����ѧ���书�����ǲſ�ʼ���ڡ���ʵ�����Ǳ��Բ�����<enter>"
			..name.."<#>:  ԭ����ˣ�˭���п������ֻϣ��ͨ����Σ������ܼ�ȡ��ѵ������ᱻ����ɱ��.<enter>��ǹ�ھ����ˣ�ϣ�����. <enter>",
			1,"�����Ի�/branch_lengqiang3")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  �������˺���͸��˸����Ϊ����ǹ�����ǣ��Դ����˼��ң����Ѳ����ǰ��!",1,"�����Ի�/no")
	end
end
---------------------------------------------------��׷��-----------------------------------------------------------------------------
function branch_longzhuiwu()
	Uworld1057 = nt_getTask(1057)
	local name = GetName()
	if ( Uworld1057 == 80) then
		if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
			Describe(name.."<#>:  ��׷�裬��֪����������<enter>"
			..DescLink_LongZhuiWu.."<#>:  ��ô��֪����ʮ��ǰ�������ҽ������Ӿ���.<enter>"
			..name.."<#>: ���ծ������Ҫ����<enter> ���ڳ������.<enter>",
			1,"�����Ի�/branch_longzhuiwu1")
		else
			Talk(1,"","�Բ���! ��ĵȼ���������Ҫ��ĵȼ������ܼ����ˣ����ǲ�����˼")
		end
	elseif ( Uworld1057 >= 90 ) then
		Talk(1,"","��ֻ����׷���ͽ�ܣ��ٰ���ƭ�����.")
	else
		Talk(1,"","��Ҫ���췳��.")
	end
end


function branch_jiangyixiao1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_leqingqiu1()
	AddOwnExp(5000)
	nt_setTask(1054,60)
	Msg2Player("���ŵ��������������ծ.")
end

function branch_leqingqiu2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,0)
	nt_setTask(1054,130)
	Msg2Player("������˵�����������������ʿ���ţ�Ҫ������!")
end

function branch_leqingqiu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level20();
end

function branch_dugun1()
	AddOwnExp(5000)
	nt_setTask(1054,80)
	Msg2Player("������ͽ�����㣬ֻ��Ҫ����·��������ͻ�ɾ���������ծ.")
end

function branch_dugun2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shuangying1()
	AddOwnExp(15000)
	nt_setTask(1055,40)
	Msg2Player("˫ӥ�ھ����˸�����ȥ�Ұ�ţ����ϣ������Խ���������.")
end

function branch_aniu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang1()	
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(15000)
	nt_setTask(1012,10)
	nt_setTask(1055,80)
	AddPlayerEvent(3) 
	Msg2Player("��ǹ�ھ����˸�����ȥ���ɽɱ50ֻ���ӣ������Ի������������β�.")
end

function branch_lengqiang2()	
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang3()	
	AddOwnExp(15000)
	nt_setTask(1055,130)
	Msg2Player("��ǹ�ھ��������������˺ɻ�������ʵ����������Ի�ȥ�������Ƹ���.")
end

function branch_longzhuiwu1()
	Msg2Player("��׷�������㣬˵���ڳ������.")
end

function no()
end
