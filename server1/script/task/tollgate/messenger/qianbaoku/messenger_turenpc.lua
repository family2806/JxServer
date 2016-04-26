-------------------------------------------------------------------------
-- FileName		:	messenger_turenpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:46:14
-- Desc			:   ǧ����ؿ��ĳ��ڴ��Ի�npc������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --����ͬ�����������ɵĿ����ж�
Include("\\script\\activitysys\\g_activity.lua")			--��༭��
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")		--��༭��

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>��λӢ�ۣ�������ʲô����?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)

	tbDailog:AddOptEntry("�����ȥ",messenger_main);
	
	--�����Ի���
	tbDailog:Show()
end

function messenger_main()
--	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("�Բ���! "..name.."! �����ʹ�����ʱ�������꣬����ʧ��!.")
		losemessengertask()
	else
		Describe(DescLink_XiaoZhen..":"..name..",�ǲ������Ѿ�ͨ����ǧ����Ŀ����ˣ���Ҫ�뿪�ؿ���?"
			,3
			,"�ԣ������뿪/messenger_comeback"
			,"�һ�δ��ɿ��飬�����ȥһ��/messenger_icantdo"
			,"���ǣ��һ����������/no")	
		
--		if ( Uworld1206 == 0 ) then
--			Describe(DescLink_XiaoZhen.."��"..name.."�����ǲ����Ѿ�ͨ����ǧ����Ŀ��飬��Ҫ���أ�",3,"�ǵģ���Ҫ����/messenger_comeback","��û��ɿ��飬�����Ҳ����������/messenger_icantdo","���ǣ��һ�Ҫ�ٴ���/no")	
--		elseif ( Uworld1206 == 1 ) then
--			Describe(DescLink_XiaoZhen.."��ľ����ʹ"..name.."�����ǲ����Ѿ�ͨ����ǧ����Ŀ��飬��Ҫ���أ�",3,"�ǵģ���Ҫ����/messenger_comeback","��û��ɿ��飬�����Ҳ����������/messenger_icantdo","���ǣ��һ�Ҫ�ٴ���/no")
--		elseif ( Uworld1206 == 2 ) then
--			Describe(DescLink_XiaoZhen.."��ͭ����ʹ"..name.."���ˣ����ǲ����Ѿ�ͨ����ǧ����Ŀ��飬��Ҫ���أ�",3,"�ǵģ���Ҫ����/messenger_comeback","��û��ɿ��飬�����Ҳ����������/messenger_icantdo","���ǣ��һ�Ҫ�ٴ���/no")
--		elseif ( Uworld1206 == 3 ) then
--			Describe(DescLink_XiaoZhen.."��������ʹ"..name.."���ˣ��������������ǲ����Ѿ�ͨ����ǧ����Ŀ��飬��Ҫ���أ�",3,"�ǵģ���Ҫ����/messenger_comeback","��û��ɿ��飬�����Ҳ����������/messenger_icantdo","���ǣ��һ�Ҫ�ٴ���/no")
--		elseif ( Uworld1206 == 4 ) then
--			Describe(DescLink_XiaoZhen.."��������ʹ"..name.."���ˣ���ô����Զ�ĸϹ����������������ˣ��������ǲ����Ѿ�ͨ����ǧ����Ŀ��飬��Ҫ���أ�",3,"�ǵģ���Ҫ����/messenger_comeback","��û��ɿ��飬�����Ҳ����������/messenger_icantdo","���ǣ��һ�Ҫ�ٴ���/no")
--		elseif ( Uworld1206 == 5 ) then
--			Describe(DescLink_XiaoZhen.."�����ͽ�����ʹ"..name.."���ˣ��һ�����û���������ͽ����أ������㿪�����ˣ��������������ǲ����Ѿ�ͨ����ǧ����Ŀ��飬��Ҫ���أ�",3,"�ǵģ���Ҫ����/messenger_comeback","��û��ɿ��飬�����Ҳ����������/messenger_icantdo","���ǣ��һ�Ҫ�ٴ���/no")
--		end
	end
end

function messenger_comeback()
	if check_task_state()==30 then
--		nt_setTask(1203,30)  --ǧ��������������������Ϊ�������״̬
--		nt_setTask(1213,0)  --˫������ʱ��
--		nt_setTask(1215,0)  --bossˢ�ֿ���
--		local nRealjifen = 0;
--		if ( Uworld1214 ~= 0 ) then
--			--���ݾȳ������������Ӧ����
--			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
--				AddOwnExp(50000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*16;
--				nt_setTask(1205,Uworld1214*16+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
--				AddOwnExp(100000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*18;
--				nt_setTask(1205,Uworld1214*18+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
--				AddOwnExp(150000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*24;
--				nt_setTask(1205,Uworld1214*24+Uworld1205)		
--			end				 
--			nt_setTask(1214,0)
--		end
--		local nBeishu = greatnight_huang_event(2);--by Сɽ
--		if (nBeishu > 0) then--by Сɽ
--			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Сɽ
--		end;
--		tongaward_message(nRealjifen);	--by Сɽ
		
		nt_setTask(1203,30)

		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
--		taskProcess_002_08:doTaskEntity()
		SetDeathScript("");
		
--		local n_level = GetLevel();
--		G_ACTIVITY:OnMessage("FinishMail", 3, n_level);
		
		SetPos(1414,3197);
	else
		Describe(DescLink_XiaoZhen..": �Բ���Ŀǰ�㻹δ��ɴ���Ŀ�꣬��ǧ����ĵ�ͼ�ϣ�����Ҫ�������������5������������ǹ�����.",1,"�����Ի�/no")
	end
end

function messenger_icantdo()
	if nt_getTask(1203) ==25 then
		Talk(1, "", "�����������ɣ�Ҫ����ֱ��������ذ�")
		messenger_comeback()
	else
		Describe(DescLink_XiaoZhen..": �������ȥ������δ�����Ȼ���Ի������κ�ʱ����!",2,"�ԣ������뿪/q_fallmessengertask","��������/no")
	end
end

function q_fallmessengertask()
--	local Uworld1207 = nt_getTask(1207)  --��ʹ����ǰɱ�ּ�����
--	local Uworld1204 = nt_getTask(1204)  --�������������ص��������
--	local Uworld1214 = nt_getTask(1214)  --�����Ů����
--	local name = GetName()
--	
--		nt_setTask(1203,25)  --ǧ��������������������Ϊ���������״̬
--		nt_setTask(1213,0)  --˫������ʱ��
--		nt_setTask(1215,0)  --bossˢ�ֿ���
--		local nRealjifen = 0;
--		if ( Uworld1214 ~= 0 ) then
--			--���ݾȳ������������Ӧ����
--			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
--				AddOwnExp(50000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*16;
--				nt_setTask(1205,Uworld1214*16+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
--				AddOwnExp(100000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*18;
--				nt_setTask(1205,Uworld1214*18+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
--				AddOwnExp(150000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*24;
--				nt_setTask(1205,Uworld1214*24+Uworld1205)		
--			end				 
--			nt_setTask(1214,0)
--		end
--		local nBeishu = greatnight_huang_event(2);--by Сɽ
--		if (nBeishu > 0) then--by Сɽ
--			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Сɽ
--		end;
--		tongaward_message(nRealjifen);	--by Сɽ

--		nt_setTask(1203,25)  --ǧ��������������������Ϊ���������״̬

		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1203,21)--��ʱ�ж�����
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1414,3197);
end

function no()
end
