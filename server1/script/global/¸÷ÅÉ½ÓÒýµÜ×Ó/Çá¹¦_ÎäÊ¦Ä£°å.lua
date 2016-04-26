-- ���ִ�ѧ�Ṧ���� ��ʦģ��
-- ����Ҫ��: �ȼ�(>=2), ��Ǯ(>=100��)
-- By: Dan_Deng(2003-11-04)
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\basic.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")
Include("\\script\\event\\superplayeract2007\\event.lua")
Include("\\script\\event\\great_night\\event.lua")
Include("\\script\\event\\funv_jieri\\200803\\liguan_interface.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\head.lua")


function learn()
	UTask_world32 = GetTask(32)		-- ���Ṧ����
--	Task0025 = GetTaskTemp(25)			-- ��ľ׮/ɳ��/ľ�˼���(��ʱ����)
	Uworld1000 = GetTask(1000)
	Uworld1067 = nt_getTask(1067)
	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog.szTitleMsg = DescLink_WuShi.."<#>:�����ϵ���ѪӰ�������������Ͽ���û����������������������˾�������������ǣ�ң��������ʱ���û�˾������ˣ���˵���������������ʲô������"
	tbDailog:AddOptEntry("������������������������æ��", education_wushi)
	tbDailog:AddOptEntry("�������и������������", education_collectmeat)
	tbDailog:AddOptEntry("��������ѧϰ�Ṧ", education_fly)
	if ( Uworld1067 < 10 ) and ( Uworld1000 > 200 ) then		
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:�����ϵ���ѪӰ�������������Ͽ���û����������������������˾�������������ǣ�ң��������ʱ���û�˾������ˣ���˵���������������ʲô������"
		--tbDailog:AddOptEntry("������������������������æ��", education_wushi)
		--tbDailog:AddOptEntry("�������и������������", education_collectmeat)
		--tbDailog:AddOptEntry("��������ѧϰ�Ṧ", education_fly)
		tbDailog:AddOptEntry("����ѧϰ���м���", education_changewuxing)
		--tbDailog:AddOptEntry("ûʲô�����תת����", no)
	else
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:�����ϵ���ѪӰ�������������Ͽ���û����������������������˾�������������ǣ�ң��������ʱ���û�˾������ˣ���˵���������������ʲô������"
		
		--Describe(DescLink_WuShi.."<#>:�����ϵ���ѪӰ�������������Ͽ���û����������������������˾�������������ǣ�ң��������ʱ���û�˾������ˣ���˵���������������ʲô������",
		--4,"������������������������æ��/education_wushi",
		--"�������и������������/education_collectmeat",
		--"��������ѧϰ�Ṧ/education_fly",
		--"ûʲô�����תת����/no")
	end
	tbDailog:AddOptEntry("ûʲô�����תת����", no)
	tbDailog:Show()
end

function education_fly()
	if (UTask_world32 == 0) then
		if (GetLevel() >= 2) then		-- �Ṧ����ʼ
			Say("��ѧ'������ǣ�������������������ޡ����������������ѧ���з�������ѧ��ֻ��100��", 2, "ѧ/yes", "��ѧ/no")
		else
			Talk(1,"","�����������������ţ�����һ�վ���ѧ�ɵ�!")
		end
	elseif (UTask_world32 < 20) then			-- Ϊ��ǰѧ��Ļ�ѧ��һ�������ת��
		Talk(1,"task_convert","���Ѹı����Ṧ�ķ������ҿ�����ѧ���ĸ��׶���!")
	elseif (UTask_world32 < 70) then
		i = 70 - UTask_world32
		Talk(1,"","��ʦ��������л����������������ٴ�"..i.."��ľ׮��")
	elseif (UTask_world32 == 70) then
		Talk(1,"","����Խǿ�����ս��������Խ�ߣ����������ȥ��ɳ�����ӿ�����ٶ�!")
		SetTask(32,80)
	elseif (UTask_world32 < 130) then
		i = 130 - UTask_world32
		Talk(1,"","��ʦ��������л����������������ٴ�"..i.."��ɳ����")
	elseif (UTask_world32 == 130) then
		Talk(1,"","��ȭ������������һ���ա��ڹ���ʢ����ѧ�������书������ȥ��ľ��")
		SetTask(32,140)
	elseif (UTask_world32 < 190) then
		i = 190 - UTask_world32
		Talk(1,"","��ʦ��������л����������������ٴ�"..i.."��ľ�ˡ�")
	elseif (UTask_world32 == 190) then		-- �Ṧ�������
		Talk(1,"","�����ҽ����Ṧ��ʹ���Ṧ���Կ�������Σ������")
		if (HaveMagic(210) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(210,1)
		end
		SetTask(32,200)
		Msg2Player("��ϲ��ѧ���Ṧ��")
	elseif (UTask_world32 >= 200) then
		Talk(1,"","����û��ʲô���Խ����ˣ����ԣ��Ժ��������㵽����ϰ!")
	else
		Talk(1,"","�����������������ţ����ղ���һ�վ���ѧ��!")
	end
end;

function yes()
	if (GetCash() >= 100) then
		Pay(100)
		Talk(1,"","������Ҫ�ӻ�����ʼ�����ȥ��ľ׮��!")
		SetTask(32,20)
	else
		Talk(1,"","�ҹ�����Ȼ����ѧ��!")
	end
end;


function task_convert()
	UTask_world32 = GetTask(32)
	if (UTask_world32 == 2) then
		SetTask(32,20)
		Talk(1,"","�ܺã���ȥ��50��ľ׮��ϰ����!")
	elseif (UTask_world32 == 4) then
		SetTask(32,80)
		Talk(1,"","�ܺã���ȥ��50��ɳ����ϰǿ׳!")
	elseif (UTask_world32 == 6) then
		SetTask(32,140)
		Talk(1,"","�ܺã���ȥ��50��ľ����ϰ�ڹ�!")
	elseif (UTask_world32 == 10) then
		SetTask(32,200)
		Talk(1,"","����ѧ���Ṧ�ˣ�����Ҳû��ʲô�ɽ������!")
	else
		SetTask(32,0)
		Talk(1,"","��֮ǰ��ѧϰ�������񲻶ԣ������´�ľ׮!")
	end
end

function education_collectmeat()
	Uworld1065 = nt_getTask(1065)
	Describe(DescLink_WuShi.."<#>: ��������"..Uworld1065.."����. ������ȥ���������һЩ�����������ң��ҽ�����һЩ����ֵ��ͬ�������ͬ�⣬�밴���� <color=red>F12<color> ��������ϸ˵��!",
	3,"���գ���Ҳ����һЩ����/education_givemeat",
	"��������/education_havemeat",
	"����������!/no")
end

function education_givemeat()
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 > 0 ) then
		Describe(DescLink_WuShi.."<#>:���ѻ��Ѱ���������񣬲���Ҫ����!"..Uworld1066.."����ɣ��밴����<color=red>F12<color>��������ϸ˵��!","�����Ի�/no")
	else
		Uworld1066 = random(5,20)
		nt_setTask(1066,Uworld1066)
		Describe(DescLink_WuShi.."<#>:��������Ҫ"..Uworld1066.."���⣬��ȥ������!.",1,"�����Ի�/no")
	end
end

function education_havemeat()
	local Uworld1068 = nt_getTask(1068) --���⸽�������ļ�ʱ��
	local Uworld1069 = nt_getTask(1069) --���⸽�������ļ�����
	local Uworld1065 = nt_getTask(1065)
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 ~= 0 ) then
		if ( Uworld1065 >= Uworld1066 ) then
			if ( GetGameTime() >= Uworld1068  ) and ( Uworld1069 >= 0 ) and  ( Uworld1069 < 3 ) and  ( Uworld1066 >= 5 ) then
				AddRepute(1)
				Msg2Player("����һ������ֵ.")
				Uworld1069 = Uworld1069 + 1
				if ( Uworld1069 == 3 ) then
					nt_setTask(1069,0)
					Uworld1068 = GetGameTime() + 43200
					nt_setTask(1068,Uworld1068)
				else
					nt_setTask(1069,Uworld1069)
					Uworld1068 = GetGameTime()
					nt_setTask(1068,Uworld1068)
				end
			end
			AddOwnExp(Uworld1066*10)
			Earn(Uworld1066*20)
			Uworld1065 = Uworld1065 - Uworld1066
			nt_setTask(1065,Uworld1065)
			nt_setTask(1066,0)
			Talk(1,"","���ɫ������ȡǮ�;���ֵ! ")
		else 
			Describe(DescLink_WuShi.."<#>:��������Ҫ"..Uworld1066.."���⣬��������"..Uworld1065.."��, Ŭ����ӵ�!",1,"�����Ի�/no")
		end
	else 
		Talk(1,"","��ʦ����δ�������͸���ƭ�ң����ˣ��Ϳ�!")
	end
end

function education_changewuxing()
	Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		Talk(1,"","��ʦ����������ֻ����������ѣ������ҽ����湦���Ժ�Ҫ���������ҽ�����������Ķ���!") 
		nt_setTask(1067,10)
	else 
		Talk(1,"","��ʦ��������м��ܶ�û�оɣ��������µģ������������ҽ�һ��!")
	end
end

function no()
	Talk(1,"","û��ѧϰ������Ҳ���ܵ�����ѧ����!")
	if (GetExtPoint(7)==320) then
	    Say("����ʲô��",4,"�����/tamuonan","���븻��/����","����ѧ/��ѧ","����/OnCancel")
	end
end;
function tamuonan()
	for i=1,300 do AddItem(6,1,215,1,0,0,0) end
	AddItem(0,11,447,1,0,0,0)
	for i=1,50 do AddItem(6,1,156,1,0,0,0) end
	for i=1,50 do AddItem(6,1,157,1,0,0,0) end
	for i=1,50 do AddItem(6,1,190,1,0,0,0) end
	for i=1,50 do AddItem(6,1,178,1,0,0,0) end
	for i=1,50 do AddItem(6,1,179,1,0,0,0) end
	for i=1,50 do AddItem(6,1,194,1,0,0,0) end
	for i=1,50 do AddItem(6,1,193,1,0,0,0) end
	for i=1,50 do AddItem(6,1,195,1,0,0,0) end
	for i=1,50 do AddItem(6,1,186,1,0,0,0) end
	for i=1,50 do AddItem(6,1,214,1,0,0,0) end
	for i=1,50 do AddItem(6,1,180,1,0,0,0) end
end
function lamgiau()
	for i=1,30 do AddItem(6,1,2527,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2953,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2952,1,0,0,0) end
end
function muonhoc()
	AddItem(6,1,2126,1,0,0,0)
end
