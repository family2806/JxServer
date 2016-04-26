-------------------------------------------------------------------------
-- FileName		:	messenger_temnpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:29:14
-- Desc			:   ɽ����ؿ��ĳ��ڴ��Ի�npc���������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --����ͬ�����������ɵĿ����ж�
Include("\\script\\activitysys\\g_activity.lua")			--��༭��
Include("\\script\\activitysys\\playerfunlib.lua")		--��༭��

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("�Բ���! "..name.."! �����ʹ����ʱ�������꣬����ʧ��!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_NaLanQingCheng..":"..name..", �ǲ���ͨ����ɽ����Ŀ��飬���뿪��?",3,"�ԣ������뿪/messenger_comeback","��Ϊ������񣬵��ǲ��������/messenger_icantdo","���ǣ��һ����������/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_NaLanQingCheng..": ��ʹ�� - ľ"..name..", �ǲ���ͨ����ɽ����Ŀ��飬���뿪��?",3,"�ԣ������뿪/messenger_comeback","��Ϊ������񣬵��ǲ��������/messenger_icantdo","���ǣ��һ����������/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_NaLanQingCheng..": ��ʹ�� - ͭ"..name.."�ǲ���ͨ����ɽ����Ŀ��飬���뿪��?",3,"�ԣ������뿪/messenger_comeback","��Ϊ������񣬵��ǲ��������/messenger_icantdo","���ǣ��һ����������/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_NaLanQingCheng..": ��ʹ�� - ��"..name.."̫���������ǲ����Ѿ�ͨ��ɽ����Ŀ��飬���뿪��?",3,"�ԣ������뿪/messenger_comeback","��Ϊ������񣬵��ǲ��������/messenger_icantdo","���ǣ��һ����������/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_NaLanQingCheng..": ��ʹ�� - ��"..name.."���Զ�������������ǲ����Ѿ�ͨ��ɽ����Ŀ��飬���뿪��?",3,"�ԣ������뿪/messenger_comeback","��Ϊ������񣬵��ǲ��������/messenger_icantdo","���ǣ��һ����������/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_NaLanQingCheng..": ���ͽ��� - ��"..name.."֮ǰ��δ�������ͽ��ƣ����������Ǵ��۽��ˣ�����������. �ǲ���ͨ����ɽ����Ŀ��飬���뿪��?",3,"�ԣ������뿪/messenger_comeback","��Ϊ������񣬵��ǲ��������/messenger_icantdo","���ǣ��һ����������/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 2 ) then
		nt_setTask(1202,30)  --ɽ��������������������Ϊ�������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_07:doTaskEntity()
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 2, n_level);
		
		SetPos(1337,3154);
	else
		Describe(DescLink_NaLanQingCheng..": �Բ����㻹δ���ǰ���Ĺؿ�������ɽ�����ͼ������Ҫ��<color=red>2������<color> �������.",1,"�����Ի�/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_NaLanQingCheng..": �ǲ��������뿪�����δ���������뿪����Ҳ���Ե�������ｻ�����콱�����ǣ���������ٺܶ�.",2,"�ԣ������뿪/s_fallmessengertask","��������/no")

end

function s_fallmessengertask()
		nt_setTask(1202,25)  --ɽ��������������������Ϊ�����״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1337,3154);
end

function no()
end
