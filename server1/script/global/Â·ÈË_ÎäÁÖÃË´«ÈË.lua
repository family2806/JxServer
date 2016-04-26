--�ṩ��Ե��ȡ��NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\event\\storm\\award_npc.lua")	--Storm
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
Include("\\script\\event\\tongwar\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include([[\script\missions\chrismas\ch_head.lua]]);--
--	2007�괺�ڻ
Include([[\script\event\springfestival07\head.lua]]);
--������
Include( "\\script\\event\\wulinling\\wulinling.lua" )
Include( "\\script\\event\\nanfangjiefangri\\event.lua" )
Include("\\script\\event\\tongwar\\head.lua");
--dinhhq_20110124:Vip acc 2011
Include("\\script\\vng_event\\vip_account_2011\\npc\\volamtruyennhan.lua")

function main()
	
	-- �����漰����������˴��˶Ի��Բ��뵽������ -- ����˹ 2006/03/20
	local aryTalk  = {};
	local ndate = tonumber(GetLocalDate("%Y%m%d%H"));
	local Uworld1000 = nt_getTask(1000);
	
	tinsert(aryTalk, "<dec><npc>��������������ӿ����λӦ�����������壬�츣��������˷�������Ϊһ����������������������");
	--dinhhq_20110124:Vip acc 2011
	tbVNG_VipAcc2011_VLTN:addDialog(aryTalk)
	
	if ndate >= 2007042800 and ndate <= 2007051324 then
	tinsert(aryTalk,"����ջ/nanfangjiefangri_main");
	end
	if (not FALSE(tongwar_checkinphase())) then
		tinsert(aryTalk,"���ս����/tongWar_Start");
	end;
	
---	tinsert(aryTalk, "ǰ��������/honor_hall_enter");
	
---	tinsert(aryTalk, "ǰ��������/autumn_enter");
	
	tinsert(aryTalk, "��ȡ���߸�Ե/OnGain_Self");

	if( GetTeamSize() > 1 ) then
		tinsert(aryTalk, "��ȡ������߸�Ե/OnGain_Team");
	end;
	
	tinsert(aryTalk, "��ȡ���������������/W33_prise");
	
	tinsert(aryTalk, "��ѯ�㵱ǰ�ɻ�ȡ��Ե���ۻ�ʱ��/OnQueryTime");
	
	tinsert(aryTalk, "���ڸ�Ե/OnAbout");
	
	tinsert(aryTalk, "ȡ��/OnCancel");
	
	if ( Uworld1000 ==340 ) or ( Uworld1000 == 350 ) then
		education_wulinmengchuanren();
		return
	end;
	
	CreateTaskSay(aryTalk);
	
	
end

--��ȡ��ұ��˵ĸ�Ե����
function OnGain_Self()
	if( IsCharged() ~= 1 ) then
		Say( "����δ��ֵ�����ֵ���������Ұɡ�", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "���ѽ��������ģʽ,��������Ϣ��������������Ұ�!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "��ʿ�ǳ��������ɣ�������һ��С��������¡�", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nResult = FuYuan_Gain();
	if( nResult == 0 ) then
		Say( "�㴳��������ʱ�ջ�����������Щ�������Ұɡ�", 0 );
	elseif( nResult == 1 ) then
		Say( "�㴳�������Ѿã��Ϳ๦�ߣ�������Ӧ�õĽ��������պðɡ�", 0 );
	end
end

--��ȡ��Ҷ������г�Ա�ĸ�Ե����
function OnGain_Team()
	if( IsCharged() ~= 1 ) then
		Say( "����δ��ֵ�����ֵ���������Ұɡ�", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "���ѽ��������ģʽ,��������Ϣ��������������Ұ�!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "��ʿ�ǳ��������ɣ�������һ��С��������¡�", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	local bAllUnavailable = 1;
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		if( FuYuan_Gain() == 1 ) then
			bAllUnavailable = 0;
		end		
	end
	PlayerIndex = nPreservedPlayerIndex;
	if( bAllUnavailable == 0 ) then
		Say( "���Ǵ��������Ѿã��Ϳ๦�ߣ���������Ӧ�õĽ��������պð� ��", 0 );
	else
		Say( "���Ǵ���������ʱ�ջ�����������Щ�������Ұɡ�", 0 );
	end
end

--��ѯ��ǰ�ɻ�ȡ��Ե���ۻ�����ʱ��
function OnQueryTime()
	if( IsCharged() ~= 1 ) then
		Say( "����δ��ֵ�����ֵ���������Ұɡ�", 0 );
		return
	end
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "��ʿ�ǳ��������ɣ�������һ��С��������¡�", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nFYTotalTime, FYValidTime = FuYuan_GetDepositTime();
	Say( "<#>���ϴ���ȡ��Ե��ĿǰΪֹ���㹲������<color=yellow>"..timeToString( nFYTotalTime ).."<#><color>������ʱ�䡣", 0 );
end

--���ڸ�Ե
function OnAbout()
	Talk( 3, "", "��Ե������ͨ���ۻ�����ʱ�����һ���һ��������������������������������������Ҷһ�����������Ʒ��", "��Ե�һ����ۻ���Сʱ��������ʱ���ȥ��������������˴��˼��ɶһ���һ����������γɹ��һ���Ե���ж��⽱�����ۻ�����ʱ��4Сʱ���ڣ�ÿСʱ�һ�1�㸣Ե��4Сʱ���ϣ�ǰ4СʱÿСʱ�һ�1�㣬֮��ÿ��Сʱ�һ�1�㡣���ʱ������������һ����Ա���԰�ȫ�Ӷ�Ա��ȡ��Ե��", "���������������ڼ䲻���ӿɻ�ȡ��Ե������ʱ�䡣" );
end


function W33_prise()				-- ����ʱ������������

Uworld33 = GetTask(33)

if (GetGameTime() - Uworld33 >= 43200) then

	SetTask(33,GetGameTime())
	Talk(1,"","�����˴��ˣ����Ŭ���Ҷ����������Ϊ��ĳɳ���������ο�������úü��Ͱɣ�")
	i = random(0,99)
	if (i < 19) then			-- 19%
		AddRepute(1)
		Msg2Player("�������������1�㡣")
	elseif (i < 36) then		-- 17%
		AddRepute(2)
		Msg2Player("�������������2�㡣")
	elseif (i < 51) then		-- 15%
		AddRepute(3)
		Msg2Player("�������������3�㡣")
	elseif (i < 64) then		-- 13%
		AddRepute(4)
		Msg2Player("�������������4�㡣")
	elseif (i < 75) then		-- 11%
		AddRepute(5)
		Msg2Player("�������������5�㡣")
	elseif (i < 84) then		-- 9%
		AddRepute(6)
		Msg2Player("�������������6�㡣")
	elseif (i < 91) then		-- 7%
		AddRepute(7)
		Msg2Player("�������������7�㡣")
	elseif (i < 96) then		-- 5%
		AddRepute(8)
		Msg2Player("�������������8�㡣")
	elseif (i < 99) then		-- 3%
		AddRepute(9)
		Msg2Player("�������������9�㡣")
	else							-- 1% (i = 99)
		AddRepute(10)
		Msg2Player("�������������10�㡣")
	end

else

	Say("�����˴��ˣ������ڵ���������������ȡ����Ŷ��Ϊ���Լ������룬�úü��Ͱɡ�Ŭ������һƬ�Լ����������",0)

end

end



--ȡ��
function OnCancel()
end

function timeToString( time )
	local nHour = floor( time / 3600 );
	local nMinute = mod( floor( time / 60 ), 60 );
	local nSecond = mod( time, 60 );
	return nHour.."<#>Сʱ"..nMinute.."<#>��"..nSecond.."<#>��";	
end

function honor_hall_enter()
    NewWorld(897, 1553, 3329);
end