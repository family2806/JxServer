-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - ս�����߶Ի�NPC
-- �ļ�������npc_zhanxin_zunzhe.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-06-01 14:27:01

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\fucmain.lua");
Include("\\script\\tagnewplayer\\head.lua");
Include("\\script\\tagnewplayer\\dispose_item.lua");
Include("\\script\\thuhoiitem\\huyenvien\\funcmain_huyenvien.lua")
 -- ��n b?PQCH -Created By - AnhHH - 20110919
Include("\\script\\vng_event\\den_bu_pqch\\den_bu_pqch.lua")
--2011��6��event��������- Modified by DinhHQ - 20110713
Include("\\script\\vng_event\\den_bu_event_thang6\\main.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--�������� - Modified by DinhHQ - 20110913
Include("\\script\\activitysys\\config\\1005\\activeingame.lua")
--����������
Include("\\script\\vng_event\\denbutrongkhaihoan\\main.lua")
Include("\\script\\vng_event\\201203_huyenvulenh\\main.lua")
-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 201204212400
Include("\\script\\vng_event\\2012_vlnb\\main.lua")

function main() 
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))          
	local nMonth =tonumber(GetLocalDate("%d"))
	local IsDailyTSK = GetTask(Task_Daily_Quest)
	if (IsDailyTSK ~= nCurDate) then
		SetTask(Task_Daily_Quest, nCurDate)
		SetTask(Task_IsQuest, 0)
		SetTask(Task_IsFinishQuest, 0)
		SetTask(Task_lag_TskID, 0)
	end                                                                                     
	local tbOpt = {};                                                                                              
	local szTitle = format("���!");   
	tinsert(tbOpt, 1, szTitle)  
	tbVngToolAward:AddDialog(tbOpt, "ս������") 
	
	tbVnHuyenVu:AddDialog(tbOpt)
	--�������� - Modified by DinhHQ - 20110913
	tbPVLBActive:AddDialog(tbOpt)
	--����������
	tbVngDenBuTKH:AddDialog(tbOpt)
	-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 201204212400
	tbVngVLNB2012:AddDialog(tbOpt)
	if (nMonth == 1) then
		tinsert(tbOpt,  "����μ�/DisposeItem")  
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "�����黹��Գװ��",             
--	                	 "����μ�/DisposeItem",
----	                	  "�����˻���Գװ��/ThuHoiHuyenVien_main",                        
--	                     	 "����/OnCancel",                                                                                   
--	                }                
--                else
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "�����黹��Գװ��",    
----	                	 "�����˻���Գװ��/ThuHoiHuyenVien_main",                                            
--	                     	 "����/OnCancel",                                                                                   
--	                }                        
	end                                                                                              
        -- ����PQCH -Created By - AnhHH - 20110919
	  if (DenBuPQCH2011:IsActive() == 1 and DenBuPQCH2011:CheckAccount() == 1) then
			tinsert(tbOpt, "��ȡ�������/#DenBuPQCH2011:GetAward()")
	  end
        
--        if tbVngEventThang6Reward:isActive() == 1 then
--        	tinsert(tbOpt, "��ȡevent������������/#tbVngEventThang6Reward:main()")
--        end       
	tinsert(tbOpt,  "����/OnCancel")
	CreateTaskSay(tbOpt);                                                                                                  
                                                                                                                               
        --if (tbBirthday0905:IsActDate() ~= 1) then                                                                            
                --Talk(1, "", "��ѽ���.");                                                                       
                --return^                                                                                                       
        --end                                                                                                                  
                                                                                                                              
        --CreateTaskSay({"<dec><npc>".."������������Ǳ�ܵ��Ǻ�����֪����ô�������Ǳ��. Ta bi
                                        --"������������޵о�/tbBirthday0905_renzhewudi",                     
                                        --"�ҿ��Լ��������Ǳ��./OnCancel"});                 
end    

function OnCancel()
end


function tbBirthday0905_renzhewudi()
	do return end
	if (GetLevel() <= 79 and tbBirthday0905:IsActDate() == 1) then
		AddSkillState(512,20,1,60*60*18)--40����
		AddSkillState(527,5,1,60*60*18)--500Ѫ
		AddSkillState(313,5,1,60*60*18)--20ȫ��
		AddSkillState(314,12,1,60*60*18)--7�ظ�Ѫ��5�ظ���
		AddSkillState(546,1,1,60*60*18)--���͹⻷
		CreateTaskSay({"<dec><npc>".."���Ѿ����������һ����Ǳ��, ���������ȥ������. ��Ҫ�Ұ�����������", "�a t?/OnCancel"})
		Msg2Player("��������޵о���״̬");
	else
		CreateTaskSay({"<dec><npc>".."���Ѿ����ǿ���˻���Ҫ�Ұ�����?", "�治����˼�������ϴ�ط���./OnCancel"});
	end
end
