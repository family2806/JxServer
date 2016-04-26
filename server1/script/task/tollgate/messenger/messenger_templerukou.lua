-------------------------------------------------------------------------
-- FileName		:	messenger_templerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ɽ�������
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"��ʼ���� /temple_starttask",
	  	"�뿪����/temple_movecity",
	  	"�Ժ���� /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, "��ɽ�����ͼ�ϵ����� /birthday0905_temple");
	end
	 Describe(DescLink_YiGuan..": �ѿ�ʼ���㴳��ʱ�䣬����Ŷ������������ʲô?",getn(tbDialog), unpack(tbDialog))
end

function temple_starttask()
	if ( nt_getTask(1202) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
		nt_setTask(1202,20)
		DisabledUseTownP(1)--���ûسǷ�				--1������	--0������
		SetFightState(1);--��ս��״̬				--1����	--0���ر�
		SetLogoutRV(1);--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
		SetPunish(0);--�ر������ͷ�					--1���������ͷ�		--0��û�������ͷ�
		SetCreateTeam(1);--�������				--1���������		--0�����������
		ForbidChangePK(1);   --���ܸ���pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
		SetPKFlag(0);        --����Ϊ����ģʽ        
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1340,3148);
		Msg2Player("�ѿ�ʼ����������ʱ�� ")
	elseif ( nt_getTask(1202) == 20 ) then
		Describe(DescLink_YiGuan.."����������񣬲���Ҫ��������!",1,"�����Ի�/no")
	elseif ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		Describe(DescLink_YiGuan..": �������������ô������������񣿿���뿪���!",1,"�����Ի�/no")
	elseif ( nt_getTask(1202) == 0 ) then
		Describe(DescLink_YiGuan..": ���������ʹ�����ˣ������뿪��!",1,"�����Ի�/no")
	end
end

function temple_movecity()
	local name = GetName()
	if ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("ɽ������վ����"..name.."���˵�"..citygo[i][4].."��վ!")
			end
		end	
	elseif ( nt_getTask(1202) == 10 ) or ( nt_getTask(1202) == 0 ) then
		SetLogoutRV(0);
		NewWorld(1,1561,3114)
	end	  	
end

function birthday0905_temple()
	tbBirthday0905.tbTask:reset_task();
	Say("���: ��19/06/2009 �� 19/07/2009 24ʱ, ͨ�������������Ի�����չ���������μ���?", 6, 
		"������2����������./#birthday0905_settask_message(7)",
		"������100��ɽ����������./#birthday0905_settask_message(8)",
		"�����������2����������./#birthday0905_gettask_message(7)",
		"�����������100��ɽ����������./#birthday0905_gettask_message(8)",
		"����������ڵ�����/birthday0905_cancel_message",
		"���м��£��Ժ����./no");
end

function no()
end
