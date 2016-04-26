-------------------------------------------------------------------------
-- FileName		:	enemy_tureboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 16:09:14
-- Desc			:   千宝库关卡的宝箱脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断
Include("\\script\\event\\birthday_jieri\\200905\\class.lua")
Include("\\script\\event\\jiaoshi_jieri\\200910\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

thiefdeathscript = "\\script\\task\\tollgate\\messenger\\qianbaoku\\thiefdeathscript.lua"

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--开宝箱工具函数
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务

function messenger_turego()
	
--	local _, _, nMapIndex = GetPos()
--------------------------------------------------------变量定义------------------------------------------
	local name = GetName()
--	local Uworld1201 = nt_getTask(1203)  --千宝库任务的任务变量
--	local Uworld1204 = nt_getTask(1204)  --送信任务所到地点任务变量
--	local Uworld1205 = nt_getTask(1205)  --信使积分
--	local Uworld1206 = nt_getTask(1206)  --信使称号
--	local Uworld1207 = nt_getTask(1207)  --信使任务当前杀怪记数器
--	local Uworld1208 = nt_getTask(1210)  --千宝库杀怪记数器
--	local Uworld1211 = nt_getTask(1211)  --信使任务关卡开始时间
--	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
--	local Uworld1214 = nt_getTask(1214)  --被困少女剧情开关
--	local Uworld1215 = nt_getTask(1215)  --boss刷怪开关
--	local messenger_nowtime = GetGameTime()  --获得玩家当前在线时间
--	local Uworld1212  =  messenger_nowtime - Uworld1211 --获得玩家当前在该关卡地图中总时间

	local Npcindex = GetLastDiagNpc()
	SetTaskTemp(180,Npcindex)    --将当前Boss索引存到一个临时变量中
	local nBoxIndex = GetTaskTemp(181)
	SetTaskTemp(181,0)           --防止杀死一次boss后的玩家继续利用此变量开箱子
	
	local nTask1203 = nt_getTask(1203)
	if nTask1203 == 20 then
    	local nTaskStatus = %add_task_step(nBoxIndex)--任务推进
    	
    	if nTaskStatus == 30 then
    		--任务完成
    		nt_setTask(1203,25)
    		Talk(1, "", name.."大人，你的任务已经完成，请快点离开关去找萧镇.")
    		return 1
    	elseif nTaskStatus==20 then
    		--任务可以继续
    		--do nothing
    		return 1
    	else
    		--任务失败
    		losemessengertask()
    		Talk(1, "", "对不起! "..name.."你打开箱子秩序不对，任务失败.")
    	end
    elseif nTask1203 == 25 then
    	Talk(1, "", "你的任务已经完成，请快点去找萧镇.")
    end

------------------------------------------------------函数判断--------------------------------------------
	
--	--关于玩家是否杀掉了该箱子对应守护者的判断放在调用该脚本的地方进行
--	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --几种任务类型都已经触发过了
--		--Msg2Player("你还有任务没有完成，加油。") 不做处理了
--	else
--		local messenger_choice = random(1,40)
--		
--		--if ( messenger_choice == 4 ) then  --增加一个神秘大红包
--		--	local lucky_hongbao = random(1,10)
--		--	if ( lucky_hongbao == 5 ) then
--		--		AddItem(6,1,402,0,0,0)      
--		--		Msg2Player("你获得了一个神秘大红包")
--		--	end
--		if ( messenger_choice == 7) then  --如果没有得到这个福利，则增加积分20分钟
--			if ( Uworld1213 == 0 ) then
--				nt_setTask(1213,messenger_nowtime)
--				Msg2Player("你得到了杀怪时双倍经验20分钟的奖励！")
--				AddSkillState( 548, 1, 1, 21600 )
--			else
--				Msg2Player("你成功打开了一个宝箱。")
--			end
--		elseif ( messenger_choice == 11 ) then  --增加积分10 
--			nt_setTask(1205,Uworld1205+20)
--			tongaward_message(20);	--by 小山
--			Msg2Player("你在信使任务中的累积分数增加了20分！")
--		
--		elseif ( messenger_choice == 13 ) then  --减少积分10
--			if ( Uworld1205 >= 10 ) then 
--			nt_setTask(1205,Uworld1205-10)
--			Msg2Player("你在信使任务中的累积分数减少了10分！")
--			
--			end
--		elseif ( messenger_choice == 16 )  then  --如果没有触发过定点打怪的事件，触发在某点打特殊怪物的事件
--			local lucky_dingdian = random(1,3)  --控制定点少女出现几率减低3倍
--			if ( lucky_dingdian == 2 ) then
--				local TureParam = GetNpcParam(Npcindex,NPC_PARAM_ID)
--				if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
--					for i=1,getn(turegirl) do 
--						if ( TureParam == turegirl[i][10]) then
--							Mid = SubWorldID2Idx(turegirl[i][3]);   			  --增加npc
--							if (Mid >= 0 ) then
--								TabValue4 = turegirl[i][4] * 32
--								TabValue5 = turegirl[i][5] * 32
--								newtasknpcindex = AddNpc(turegirl[i][1],turegirl[i][2],Mid,TabValue4,TabValue5,turegirl[i][6],turegirl[i][7],turegirl[i][8]);
--								SetNpcScript(newtasknpcindex, turegirl[i][9]);
--							end
--						end
--					end
--				elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
--					for i=1,getn(turegirl2) do 
--						if ( TureParam == turegirl2[i][10]) then
--							Mid = SubWorldID2Idx(turegirl2[i][3]);   			  --增加npc
--							if (Mid >= 0 ) then
--								TabValue4 = turegirl2[i][4] * 32
--								TabValue5 = turegirl2[i][5] * 32
--								newtasknpcindex = AddNpc(turegirl2[i][1],turegirl2[i][2],Mid,TabValue4,TabValue5,turegirl2[i][6],turegirl2[i][7],turegirl2[i][8]);
--								SetNpcScript(newtasknpcindex, turegirl2[i][9]);
--								
--							end
--						end
--					end
--				elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
--					for i=1,getn(turegirl3) do 
--						if ( TureParam == turegirl3[i][10]) then
--							Mid = SubWorldID2Idx(turegirl3[i][3]);   			  --增加npc
--							if (Mid >= 0 ) then
--								TabValue4 = turegirl3[i][4] * 32
--								TabValue5 = turegirl3[i][5] * 32
--								newtasknpcindex = AddNpc(turegirl3[i][1],turegirl3[i][2],Mid,TabValue4,TabValue5,turegirl3[i][6],turegirl3[i][7],turegirl3[i][8]);
--								SetNpcScript(newtasknpcindex, turegirl3[i][9]);
--							end
--						end
--					end
--				end
--			end
--			
--		elseif ( messenger_choice == 19 ) then 	--在该boss身边增加if ( messenger_npcindex == turerobber[i][10]) 个npc
--			local lucky_shuachu = random(1,3)
--			if ( lucky_shuachu == 2 ) then
--				local lucky_time = 1
--				if ( SubWorldIdx2ID( nMapIndex ) == 393 ) and ( GetGlbValue(814) < 10 ) then
--					SetGlbValue(814,GetGlbValue(814)+1)
--					nt_setTask(1215,10)
--					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
--					Msg2Player("宝库盗贼:你你你，你是怎么发现我地，哎呀呀，烦躁，偷个宝贝还有人打扰！去死吧你！")	
--				
--					for i=1,getn(turerobber) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
--						if ( messenger_npcindex == turerobber[i][10]) then   	  --数组内寻找符合npc索引的变量数值
--							Tid = SubWorldID2Idx(turerobber[i][3]);   			  --增加npc
--							if (Tid >= 0 ) then
--								TabValue4 = turerobber[i][4] * 32
--								TabValue5 = turerobber[i][5] * 32
--								newtasknpcindex = AddNpc(turerobber[i][1],turerobber[i][2],Tid,TabValue4,TabValue5,turerobber[i][6],turerobber[i][7],turerobber[i][8]);
--								SetNpcScript(newtasknpcindex, turerobber[i][9]);
--								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
--							end
--						end
--					end
--				elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) and ( GetGlbValue(815) < 10 ) then
--					SetGlbValue(815,GetGlbValue(815)+1)
--					nt_setTask(1215,10)
--					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
--					Msg2Player("宝库盗贼:你你你，你是怎么发现我地，哎呀呀，烦躁，偷个宝贝还有人打扰！去死吧你！")	
--				
--					for i=1,getn(turerobber2) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
--						if ( messenger_npcindex == turerobber2[i][10]) then   	  --数组内寻找符合npc索引的变量数值
--							Tid = SubWorldID2Idx(turerobber2[i][3]);   			  --增加npc
--							if (Tid >= 0 ) then
--								TabValue4 = turerobber2[i][4] * 32
--								TabValue5 = turerobber2[i][5] * 32
--								newtasknpcindex = AddNpc(turerobber2[i][1],turerobber2[i][2],Tid,TabValue4,TabValue5,turerobber2[i][6],turerobber2[i][7],turerobber2[i][8]);
--								SetNpcScript(newtasknpcindex, turerobber2[i][9]);
--								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
--							end
--						end
--					end
--				elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) and ( GetGlbValue(816) < 10 ) then
--					SetGlbValue(816,GetGlbValue(816)+1)
--					nt_setTask(1215,10)
--					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
--					Msg2Player("宝库盗贼:你你你，你是怎么发现我地，哎呀呀，烦躁，偷个宝贝还有人打扰！去死吧你！")	
--				
--					for i=1,getn(turerobber3) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
--						if ( messenger_npcindex == turerobber3[i][10]) then   	  --数组内寻找符合npc索引的变量数值
--							Tid = SubWorldID2Idx(turerobber3[i][3]);   			  --增加npc
--							if (Tid >= 0 ) then
--								TabValue4 = turerobber3[i][4] * 32
--								TabValue5 = turerobber3[i][5] * 32
--								newtasknpcindex = AddNpc(turerobber3[i][1],turerobber3[i][2],Tid,TabValue4,TabValue5,turerobber3[i][6],turerobber3[i][7],turerobber3[i][8]);
--								SetNpcScript(newtasknpcindex, turerobber3[i][9]);
--								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
--							end
--						end
--					end
--				end
--			end
--		end
--	end
----------------------------------------------------做boss死亡的基本操作-------------------------------------------------------
--	if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
--		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
--			nt_setTask(1213,0)
--			Msg2Player("您在本关中得到的双倍经验时间已结束！")
--		else
--			AddOwnExp(TUREBOSS_EXP)    --给予一倍的经验
--		end
--	end
--
--	if (tbJiaoShi2009:IsActive() == 1) then	-- 2009教师节掉落水墨
--		print("123");
--		tbAwardTemplet:GiveAwardByList({szName="水墨", tbProp={6,1,2175,1,0,0},nExpiredTime=20091203,}, "2009 Teacher's Day Messenger's Box give ink");
--	end
--	local Uworld1205 = nt_getTask(1205)
--	local Uworld1207 = nt_getTask(1207)
--	local Uworld1207 = nt_getTask(1210)
--	
--	messenger_killnpc_jifen(TUREBOSS_MESSENGEREXP,TUREBOSS_MAPID)
--	SetMessengerPlayer(1207,1210,TUREBOSS_EXP,TUREBOSS_MAPID)   --增加千宝库杀怪数，增加当前关卡杀怪数，增加经验
--	if ( lucky_time == 1 ) then
--		HideNpc(GetTaskTemp(180),TUREBOSS_RELIVE*60*18)  --18祯为一秒  隐藏该对话型的npc
--		lucky_time = 0
--	else
--		HideNpc(GetTaskTemp(180),TUREBOSS_RELIVE*18)  --18祯为一秒  隐藏该对话型的npc
--	end
--	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 4);
end