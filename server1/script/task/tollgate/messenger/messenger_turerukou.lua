-------------------------------------------------------------------------
-- FileName		:	messenger_turerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ǧ�������
-------------------------------------------------------------------------

Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���

Include("\\script\\lib\\common.lua");

Include("\\script\\activitysys\\functionlib.lua")--����lib:DoFunByPlayer

function main()
	local tbDialog =
	{
		--"��������/ture_gettask",
		"��ʼ���� /ture_try_starttask",
		"������/ture_continuetask",
	  	"�뿪����/ture_movecity",
	  	"�Ժ���� /no",
	}
--	if (tbBirthday0905:IsActDate() == 1) then
--		tinsert(tbDialog, 3, "��ǧ�����ͼ������/birthday0905_ture");
--	end
	 Describe(DescLink_YiGuan..":�����⿪ʼ����ҷֹ��������񣬼���Ŷ���ɶӳ���ʼ�������ӽ������������������������ʲô��",getn(tbDialog), unpack(tbDialog))
end

--function ture_gettask()
--	local Uworld1204 = nt_getTask(1204)  --��¼��ҵ����������ÿ���������ʱ���
--	local Uworld1028 = nt_getTask(1028)  --�������������
--
--	if ( GetLevel() < 120 ) then
--		Describe(DescLink_YiGuan.."���Բ�������ǰ�ȼ�û�дﵽ��С��120��Ҫ����ﵽ�ȼ��������Ұɡ�",1,"�����Ի�/no")	
--	elseif ( Uworld1204 ~= 0 )  then
--		Describe(DescLink_YiGuan.."���Բ�������ǰ����ʹ����δ��ɣ����ܽ�ͬ��������������ɸ�����лл��",1,"�����Ի�/no")
--	elseif (  messenger_givetime() == 10 ) then  --�鿴�����Ƿ��йؿ�ʱ��
--		Describe(DescLink_YiGuan.."���Բ�������������ʹ�����е�ʱ���Ѻľ�������������,лл��",1,"�����Ի�/no")
--	else
--		nt_setTask( 1204,1 )
--		nt_setTask( 1203,10) --������ʹ����Ĳ���
--	end
--end

--function ture_starttask()
--	if ( nt_getTask(1203) == 10 ) then
--		nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
--		nt_setTask(1203,20)
--		DisabledUseTownP(1)			--���ûسǷ�				--1������	--0������
--		SetFightState(1);			--��ս��״̬				--1����	--0���ر�
--		SetLogoutRV(1);				--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
--		SetPunish(0);				--�ر������ͷ�					--1���������ͷ�		--0��û�������ͷ�
--		SetCreateTeam(1);			--�������					--1���������		--0�����������
--		ForbidChangePK(1);   		--���ܸ���pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
--		SetPKFlag(0);               --����Ϊ����ģʽ            
--		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
--		SetPos(1414,3191);
--		Msg2Player("����ʼ��ʱ��")
--	elseif ( nt_getTask(1203) == 20 ) then
--		Describe(DescLink_YiGuan.."�����Ѿ���ʼ�����������ٿ�ʼ�ա�",1,"�����Ի�/no")
--	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
--		Describe(DescLink_YiGuan.."�����Ѿ������������ô��Ҫ��ʼ�����أ������뿪�ɡ�",1,"�����Ի�/no")
--	elseif ( nt_getTask(1203) == 0 ) then
--		Describe(DescLink_YiGuan.."�������ʹ�����Ѿ�ʧ�ܣ��������뿪��",1,"�����Ի�/no")
--	end
--end

function ture_try_starttask()
	if ( nt_getTask(1203) == 10 ) then
		--�Լ���ʼ����
		local nTeamSize = GetTeamSize();
		if nTeamSize > 1 and IsCaptain() ~= 1 then
			Describe(DescLink_YiGuan..": �㲻�Ƕӳ������ܿ�ʼ���� ",1,"�����Ի�/no")
			return
		end
		
		local nTaskCode,_ = %get_task_order()
		ture_real_starttask_one(nTaskCode);
		
    	if (nTeamSize > 1) then
    		--���ж�Ա��ʼ����
    		for i=1,nTeamSize do
    			local nMemberIndex = GetTeamMember(i)
    			print(format("nMemberIndex:%d", nMemberIndex))
    			if nMemberIndex >= 0 then
    			
--    			if(CallPlayerFunction(nMemberIndex, IsCaptain)~=1)then
--    				CallPlayerFunction(nMemberIndex, ture_real_starttask_member, nTaskCode)
--    			end
        			if(lib:DoFunByPlayer(nMemberIndex, IsCaptain)~=1)then
    					lib:DoFunByPlayer(nMemberIndex, ture_real_starttask_member, nTaskCode);
    				end
    			else
    				print(format("nMemberIndex:%d error", nMemberIndex))
				end
    		end
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] ��ʼ��ʹ�����������Ϊ [%d]",
			GetAccount(),
			GetName(),
			nTeamSize
			)
		);
	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
		Describe(DescLink_YiGuan..": ���ѿ�ʼ���񣬲���Ҫ�ٿ�ʼ��.",1,"�����Ի�/no")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": ��������ɣ���ô����Ҫ��ʼ�أ�����뿪�����.",1,"�����Ի�/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": ���������ʹ�����ˣ�����뿪�����!",1,"�����Ի�/no")
	end
end

function ture_real_starttask_one(nTaskCode)
	nt_setTask(1202,0)--��յ�ǰ�������
	ture_real_starttask(nTaskCode)
	
	local szMsg,nCount = get_task_string(nTaskCode)
	szMsg = format("�㿪ʼ�챣���������񣬿�ץסʱ����5���������������ע�ⰴ�����<color=yellow>%s<color>", szMsg)
	Msg2Player(szMsg)
end

function ture_real_starttask_member(nTaskCode)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId == 395 then
    	if ( nt_getTask(1203) == 10 ) then
    		nt_setTask(1202,0)--��յ�ǰ�������
    		ture_real_starttask(nTaskCode)
    		
    		local szMsg,nCount = get_task_string(nTaskCode)
    		szMsg = format("��Ķӳ��ѿ�ʼ�챣������������, ��ץסʱ������ͼ�� <color=yellow> �챣�� <color> ��5���������������ע�ⰴ�����<color=yellow>%s<color>", szMsg)
    		Msg2Player(szMsg)
    		return
    	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
    		Msg2Player("��Ķӳ��ѿ�ʼ�챣������������, ������������Ĳ�ͬ��Ҫ�Լ����Ŷ��" )
    	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
    		Msg2Player("��Ķӳ��ѿ�ʼ�챣������������, �����������ɣ������Ĳ�ͬ�����뿪����ȥ������")
    	elseif ( nt_getTask(1203) == 0 ) then
    		Msg2Player("��Ķӳ��ѿ�ʼ�챣������������, �㻹δ�Ӹ��������뿪�����")
    	end
    else
    	Msg2Player("��Ķӳ��ѿ�ʼ�챣������������, �㲻�ڵ�ͼ��<color=yellow>�챣��<color>, ���Լ����")
	end
	
	Msg2Team(format("<color=yellow>%s<color>�����������鲻ͬ", GetName()))
end

function ture_real_starttask(nTaskCode)
	nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
	nt_setTask(1203,20)
	nt_setTask(1201,nTaskCode)
	DisabledUseTownP(1)			--���ûسǷ�				--1������	--0������
	SetFightState(1);			--��ս��״̬				--1����	--0���ر�
	SetLogoutRV(1);				--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
	SetPunish(1);				--�������ͷ�					--1���������ͷ�		--0��û�������ͷ�
	--SetCreateTeam(1);			--�������					--1���������		--0�����������
	ForbidChangePK(0);   		--�������pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
	SetPKFlag(0);               --����Ϊ����ģʽ            
	SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
	SetPos(1414,3191);
	--Cho b�t t?3 gi�y, tr�h b?�� s�t - Modifiec by DinhHQ - 20110502
	SetProtectTime(3*18)
	AddSkillState(963, 1, 0, 18*3) 	
end

function ture_movecity()
--���������ʹ����ʱ����������NPC�ƶ���Fix bug ��Ȼ�����ڳ���PK- Modified by DinhHQ - 20110518
	DisabledUseTownP(0)
	SetFightState(0)	
	SetPunish(1)
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	local name = GetName()
	if ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("�챣����վ"..name.."���˵�"..citygo[i][4].."��վ!")
			end
		end	
	elseif ( nt_getTask(1203) == 10 ) or ( nt_getTask(1203) == 0 ) or ( nt_getTask(1203) == 20) or ( nt_getTask(1203) == 21 ) then
		SetLogoutRV(0);
		NewWorld(11,3021,5090)
	end
end

function birthday0905_ture()
	tbBirthday0905.tbTask:reset_task();
	Say("���: ��19/06/2009 �� 19/07/2009 24ʱ,��������ܴ����������е�һ����ս�����������4�������е�һ��������е���������μ���ս��?", 8, 
		"�������100������./#birthday0905_settask_message(4)",
		"����������һ������./#birthday0905_settask_message(5)",
		"������Ѱ��һ��ʧ����Ů./#birthday0905_settask_message(6)",
		"������������100������./#birthday0905_gettask_message(4)",
		"���������������һ������./#birthday0905_gettask_message(5)",
		"�����������Ѱ��һ��ʧ����Ů./#birthday0905_gettask_message(6)",
		"�������Ŀǰ����/birthday0905_cancel_message",
		"���м��£��Ժ����./no");
end

function no()
end

function ture_continuetask()
	if ( nt_getTask(1203) == 10 ) then
		Describe(DescLink_YiGuan..": �������δ��ʼ�����ܼ�������",1,"�����Ի�/no")
	elseif ( nt_getTask(1203) == 20 ) then
		Describe(DescLink_YiGuan..": ��������Ѿ���ʼ�����ȥ��5�������.",1,"�����Ի�/no")
	elseif ( nt_getTask(1203) == 21 ) then
		ture_real_starttask(nt_getTask(1201))
		Msg2Player("���������Լ���")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": �����������ɣ�����Ҫ������.",1,"�����Ի�/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": ���������ʧ�ܣ�����뿪�����.",1,"�����Ի�/no")
	end
end

