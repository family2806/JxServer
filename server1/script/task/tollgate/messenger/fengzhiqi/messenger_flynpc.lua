-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   ��֮��ؿ��ĳ��ڴ��Ի�npc����֮�ｫ����
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
	
	if ( messenger_middletime() == 10  ) then
		Msg2Player("�Բ���! "..name.."! ����ûʱ��ִ����ʹ��������ʧ��!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_BaiYi..":"..name..", �㲻���Ѿ�����������ս��������ذ�?",3,"�ԡ������뿪/messenger_comeback","��δ��ɿ��飬���ǲ����������/messenger_icantdo","���ǣ��һ������/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_BaiYi..": ��ʹ�� - ľ"..name..", �㲻���Ѿ�����������ս��������ذ�?",3,"�ԡ������뿪/messenger_comeback","��δ��ɿ��飬���ǲ����������/messenger_icantdo","���ǣ��һ������/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_BaiYi..": ��ʹ�� - ͭ"..name.."���ˣ��ǲ������ѹ��˷������ս�ˣ���������� ?",3,"�ԡ������뿪/messenger_comeback","��δ��ɿ��飬���ǲ����������/messenger_icantdo","���ǣ��һ������/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_BaiYi..": ��ʹ�� - ��"..name.."���ˣ��ǲ������ѹ��˷������ս�ˣ���������� ?",3,"�ԡ������뿪/messenger_comeback","��δ��ɿ��飬���ǲ����������/messenger_icantdo","���ǣ��һ������/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_BaiYi..": ��ʹ�� - ��"..name.."���ˣ��ǲ������ѹ��˷������ս�ˣ���������� ?",3,"�ԡ������뿪/messenger_comeback","��δ��ɿ��飬���ǲ����������/messenger_icantdo","���ǣ��һ������/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_BaiYi..": ���ͽ���- ��"..name.."���ˣ���δ�������ͽ��ƣ��������Ǵ��۽��ˡ����������������ѹ��˷������ս����������� ?",3,"�ԡ������뿪/messenger_comeback","��δ��ɿ��飬���ǲ����������/messenger_icantdo","���ǣ��һ������/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --��֮������������������Ϊ�������״̬
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
		taskProcess_002_06:doTaskEntity()  --ͬ���������
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..":�Բ�����δ���أ��ڷ����ͼ��������Ҫȷ��<color=red>5�������<color> ���ܹ���.",1,"�����Ի�/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_BaiYi..": �����뿪�������δ���������뿪����Ҳ���Ե�������ｻ������콱�����ǣ��������ٺܶࡣ",2,"�ԡ������뿪/f_fallmessengertask","��������/no")

end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --��֮������������������Ϊ���������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
