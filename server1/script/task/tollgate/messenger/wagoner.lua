-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 16:28:14
-- Desc			:	�������񳵷�ű�
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua") --������������ű�
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��


--���������������1201��1202��1203�е�һ��Ϊ20
function messenger_wagoner()
--	Uworld1201 = nt_getTask(1201)
--	Uworld1202 = nt_getTask(1202)
	Uworld1203 = nt_getTask(1203)
	Uworld1204 = nt_getTask(1204)
--	
--	if ( messenger_gettime() == 10 ) then
--		Msg2Player("�Բ�ס������ӵ���ʹ�����Ѿ������ˣ���û�취��������")
--		return
--	end
--	
--	if ( Uworld1201 ~= 0 ) then
--		if ( Uworld1201 == 10 ) then
--			Say("�����ͼ��",2,"�ǵ�/messenger_flywagoner","����/no")
--		elseif ( Uworld1201 == 30 ) then
--			for i=1,getn(citygo) do 
--				if ( Uworld1204 == citygo[i][2]) then
--					Msg2Player("�Բ����㻹����ʹ�����Ѿ���ɵ���û���ύ������ȥ"..citygo[i][4].."��վ������")
--				end
--			end
--		end
--	elseif ( Uworld1202 ~= 0 ) then
--		if ( Uworld1202 == 10 ) then
--			Say("�����ͼ��",2,"�ǵ�/messenger_templewagoner","����/no")
--		elseif ( Uworld1202 == 30 ) then
--			for i=1,getn(citygo) do   --���Ӧ��������ͬ����
--				if ( Uworld1204 == citygo[i][2]) then   --����
--					Msg2Player("�Բ����㻹����ʹ�����Ѿ���ɵ���û���ύ������ȥ"..citygo[i][4].."��վ������") --����
--				end
--			end
--		end
	if ( Uworld1203 ~= 0 ) then
		if ( Uworld1203 == 10 or Uworld1203 == 20 or Uworld1203 == 21 ) then
			Say("������������?",2,"��/messenger_storewagoner","����/no")
		elseif ( Uworld1203 == 30 ) then
			for i=1,getn(citygo) do   --���Ӧ��������ͬ����
				if ( Uworld1204 == citygo[i][2]) then   --����
					Msg2Player("�Բ��������ʹ��������ɣ����ǻ�δ���أ����㽻������ "..citygo[i][4].."����վ������") --����
				end
			end
		end
	else
		Msg2Player("�Բ�������Ȼ��δ���������������ȥ����ٽ�����")
	end
end

--function messenger_flywagoner()
--	SetRevPos(80,40)
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(387,1582,3137)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(388,1582,3137)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(389,1582,3137)
--	end
--end
--
--function messenger_templewagoner()
--	SetRevPos(176,70)
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(390,1312,3198)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(391,1312,3198)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(392,1312,3198)
--	end
--end

function messenger_storewagoner()
	SetRevPos(11,10)
	
	NewWorld(395,1417,3207)
	
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(393,1417,3207)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(394,1417,3207)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(395,1417,3207)
--	end

end