-------------------------------------------------------------------------
-- FileName		:	toll_yucixinshi.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-16 15:28:15
-- Desc			:  	��ʹ�������ͽ����Ҽ������ű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(itemindex)
	local paramvalue = GetItemParam(itemindex, 1)
	if ( paramvalue >= 5 ) then
		Msg2Player("�Բ������������ʹ�����Ѿ�ʹ�ù�5���ˣ����������١�")
	elseif ( nt_getTask(1206) < 5 ) then
		Msg2Player("�Բ����㻹û����ȡ�����ͽ�����ʹ�ĳƺţ��޷�ʹ��������ʹ���ơ�����ȥ����������ƺţ�лл��")
		return 1
	else
		if ( SetSpecItemParam(itemindex, 1, paramvalue+1) == 1 ) then
			SyncItem(itemindex)
			local Realvalue = 5 - GetItemParam(itemindex, 1)
			Msg2Player("���������ʹ����ʹ�ú�ɻ��һСʱ��30�㸺����Ŀǰ������ʹ��"..Realvalue.."�Ρ�")
		end
		
		if ( GetSeries() == 0 ) then --��ϵ���ﱻ��� ��631-635����ľˮ����
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 634, 5, 1, 64800)
		elseif ( GetSeries() == 1 ) then --ľϵ���ﱻ���
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 631, 5, 1, 64800)
		elseif ( GetSeries() == 2 ) then --ˮϵ���ﱻ����
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 635, 5, 1, 64800)
		elseif ( GetSeries() == 3 ) then --��ϵ���ﱻˮ��
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 633, 5, 1, 64800)
		elseif ( GetSeries() == 4 ) then --��ϵ���ﱻľ��
			AddSkillState( 546, 1, 1, 64800)	
			AddSkillState( 632, 5, 1, 64800)				
		end
		
		return 1
	end
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local  nPayMonth1
	local nPayMonth1 = GetItemParam( nItem, 1 )
	local Realvalue = 5 - nPayMonth1
	
	szDesc = ""
	szDesc = szDesc..format( "���������ʹ����ʹ�ú�ɻ��һСʱ��30�㸺����Ŀǰ������ʹ��"..Realvalue.."�Ρ�" );
	return szDesc;
end