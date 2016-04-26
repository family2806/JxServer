-------------------------------------------------------------------------
-- FileName		:	messenger_flyrukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ��֮�����
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua"); 	--��������������ݱ�����
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- Խ������Ƭ���ջ
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"��ʼ����/fly_starttask",
	  	"�뿪����/fly_movecity",
	  	"�Ժ����/no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, " �ڷ����ͼ�ϵ����� birthday0905_fly");
	end
	 Describe(DescLink_YiGuan..": �ѿ�ʼ���㴳��ʱ�䣬����Ŷ������������ʲô?",getn(tbDialog), unpack(tbDialog))
end

function fly_starttask()
	if ( nt_getTask(1201) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
		nt_setTask(1201,20)
		DisabledUseTownP(1)			--���ûسǷ�				--1������	--0������
		SetFightState(1);			--��ս��״̬				--1����	--0���ر�
		SetLogoutRV(1);				--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
		SetPunish(0);				--�ر������ͷ�					--1���������ͷ�		--0��û�������ͷ�
		SetCreateTeam(1);			--�������					--1���������		--0�����������
		ForbidChangePK(1);   		--���ܸ���pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
		SetPKFlag(0);               --����Ϊ����ģʽ            
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1559,3113);
		Msg2Player("�ѿ�ʼ����������ʱ�� ")
	elseif ( nt_getTask(1201) == 20 ) then
		Describe(DescLink_YiGuan.."����������񣬲���Ҫ��������!",1,"��������/no")
	elseif ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		Describe(DescLink_YiGuan..": �������������ô������������񣿿���뿪���!",1,"��������/no")
	elseif ( nt_getTask(1201) == 0 ) then
		Describe(DescLink_YiGuan..": ���������ʹ�����ˣ������뿪��!",1,"��������/no")
	end
end

function fly_movecity()
	local name = GetName()
	if ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("������վ����"..name.."���˵�"..citygo[i][4].."��վ!")
			end
		end	
	elseif ( nt_getTask(1201) == 10 ) or ( nt_getTask(1201) == 0 ) then
		SetLogoutRV(0);
		NewWorld(37,1601,3001)
	end
end

function birthday0905_fly()
	tbBirthday0905.tbTask:reset_task();
	Say("���: ��19/06/2009 �� 19/07/2009 24ʱ,��������ܴ����������е�һ����ս�����������4�������е�һ�����ǰ���ǹ��������μ���ս��?", 8, 
		"������500���������� /#birthday0905_settask_message(1)",
		"������6������������ /#birthday0905_settask_message(2)",
		"���ܽӴ�100�����������./#birthday0905_settask_message(3)",
		"�����������500���������� /#birthday0905_gettask_message(1)",
		"�����������6������������ /#birthday0905_gettask_message(2)",
		"������ɽӴ�100�����������./#birthday0905_gettask_message(3)",
		"�������Ŀǰ����/birthday0905_cancel_message",
		"���м��£��Ժ����./no");
end

function no()
	
end
