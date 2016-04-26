-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 战心尊者对话NPC
-- 文件名　：npc_zhanxin_zunzhe.lua
-- 创建者　：子非魚
-- 创建时间：2009-06-01 14:27:01

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\fucmain.lua");
Include("\\script\\tagnewplayer\\head.lua");
Include("\\script\\tagnewplayer\\dispose_item.lua");
Include("\\script\\thuhoiitem\\huyenvien\\funcmain_huyenvien.lua")
 -- бn b?PQCH -Created By - AnhHH - 20110919
Include("\\script\\vng_event\\den_bu_pqch\\den_bu_pqch.lua")
--2011年6月event种树补偿- Modified by DinhHQ - 20110713
Include("\\script\\vng_event\\den_bu_event_thang6\\main.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--风云令牌 - Modified by DinhHQ - 20110913
Include("\\script\\activitysys\\config\\1005\\activeingame.lua")
--种铠环补偿
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
	local szTitle = format("你好!");   
	tinsert(tbOpt, 1, szTitle)  
	tbVngToolAward:AddDialog(tbOpt, "战心尊者") 
	
	tbVnHuyenVu:AddDialog(tbOpt)
	--风云令牌 - Modified by DinhHQ - 20110913
	tbPVLBActive:AddDialog(tbOpt)
	--种铠环补偿
	tbVngDenBuTKH:AddDialog(tbOpt)
	-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 201204212400
	tbVngVLNB2012:AddDialog(tbOpt)
	if (nMonth == 1) then
		tinsert(tbOpt,  "我想参加/DisposeItem")  
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "我来归还玄猿装备",             
--	                	 "我想参加/DisposeItem",
----	                	  "我想退回玄猿装备/ThuHoiHuyenVien_main",                        
--	                     	 "结束/OnCancel",                                                                                   
--	                }                
--                else
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "我来归还玄猿装备",    
----	                	 "我想退回玄猿装备/ThuHoiHuyenVien_main",                                            
--	                     	 "结束/OnCancel",                                                                                   
--	                }                        
	end                                                                                              
        -- 补偿PQCH -Created By - AnhHH - 20110919
	  if (DenBuPQCH2011:IsActive() == 1 and DenBuPQCH2011:CheckAccount() == 1) then
			tinsert(tbOpt, "领取富贵锦盒/#DenBuPQCH2011:GetAward()")
	  end
        
--        if tbVngEventThang6Reward:isActive() == 1 then
--        	tinsert(tbOpt, "领取event种树补偿奖励/#tbVngEventThang6Reward:main()")
--        end       
	tinsert(tbOpt,  "结束/OnCancel")
	CreateTaskSay(tbOpt);                                                                                                  
                                                                                                                               
        --if (tbBirthday0905:IsActDate() ~= 1) then                                                                            
                --Talk(1, "", "活动已结束.");                                                                       
                --return^                                                                                                       
        --end                                                                                                                  
                                                                                                                              
        --CreateTaskSay({"<dec><npc>".."这是上天赐予的潜能但是很少人知道怎么爆发这个潜力. Ta bi
                                        --"我想接受仁者无敌绝/tbBirthday0905_renzhewudi",                     
                                        --"我可以激发自身的潜力./OnCancel"});                 
end    

function OnCancel()
end


function tbBirthday0905_renzhewudi()
	do return end
	if (GetLevel() <= 79 and tbBirthday0905:IsActDate() == 1) then
		AddSkillState(512,20,1,60*60*18)--40跑速
		AddSkillState(527,5,1,60*60*18)--500血
		AddSkillState(313,5,1,60*60*18)--20全抗
		AddSkillState(314,12,1,60*60*18)--7回复血，5回复内
		AddSkillState(546,1,1,60*60*18)--御赐光环
		CreateTaskSay({"<dec><npc>".."我已经激发了你的一部分潜力, 现在你可以去行侠了. 需要我帮助就来找我", " t?/OnCancel"})
		Msg2Player("获得仁者无敌绝的状态");
	else
		CreateTaskSay({"<dec><npc>".."你已经变得强大了还需要我帮助吗?", "真不好意思！在下认错地方了./OnCancel"});
	end
end
