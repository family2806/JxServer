-------------------------------------------------------------------------
-- FileName		:	enemy_biaozhiboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 17:30:14
-- Desc			:   风之骑关卡的标志boss脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_gogogo()
	
	
	local _, _, nMapIndex = GetPos()
------------------------------------------------------变量定义------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1201)  --风之骑任务的任务变量
	local Uworld1204 = nt_getTask(1204)  --送信任务所到地点任务变量
	local Uworld1205 = nt_getTask(1205)  --信使积分
	local Uworld1206 = nt_getTask(1206)  --信使称号
	local Uworld1207 = nt_getTask(1207)  --信使任务当前杀怪记数器
	local Uworld1208 = nt_getTask(1208)  --风之骑杀怪记数器
	local Uworld1211 = nt_getTask(1211)  --信使任务关卡开始时间
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	local Uworld1214 = nt_getTask(1214)  --定点打怪开关
	local Uworld1215 = nt_getTask(1215)  --boss刷怪开关
	local messenger_nowtime = GetGameTime()  --获得玩家当前在线时间
	local Uworld1212  =  messenger_nowtime - Uworld1211 --获得玩家当前在该关卡地图中总时间
	local Npcindex = GetLastDiagNpc()
	SetTaskTemp(180,Npcindex)    --将当前Boss索引存到一个临时变量中
	
	
------------------------------------------------------函数判断--------------------------------------------
	
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --几种任务类型都已经触发过了
		--Msg2Player("你还有任务没有完成，加油。") 不做处理了
	else
		local messenger_choice = random(1,40)
		--if ( messenger_choice == 4 ) then  --增加一个神秘大红包
		--	local lucky_hongbao = random(1,10)
		--	if ( lucky_hongbao == 5 ) then
		--		AddItem(6,1,402,0,0,0)      
		--		Msg2Player("你获得了一个神秘大红包")
		--	end
		if ( messenger_choice == 7) then  --如果没有得到这个福利，则增加积分20分钟
			if ( Uworld1213 == 0 ) then
				nt_setTask(1213,messenger_nowtime)
				Msg2Player("在20分钟杀怪时，你获得双倍经验值奖励!")
				AddSkillState( 548, 1, 1, 21600)
			else
				Msg2Player("你已接触坐标")
			end
		elseif ( messenger_choice == 11 ) then  --增加积分10 
			nt_setTask(1205,Uworld1205+20)
			tongaward_message(20);	--by 小山
			Msg2Player("你的信使任务积分增加20点!")
		elseif ( messenger_choice == 13 ) then  --减少积分10
			if ( Uworld1205 >= 10 ) then 
				nt_setTask(1205,Uworld1205-10)
				Msg2Player("你的信使任务积分减少10点!")
			end
		elseif ( messenger_choice == 16 ) then  --如果没有触发过定点打怪的事件，触发在某点打特殊怪物的事件,
			local lucky_dingdian = random(1,3)  --再次控制几率为1/3
			
			if ( Uworld1214 == 0 ) then
				if ( lucky_dingdian == 2 ) then  
					Uworld1214 = random(1,15)                                   
					nt_setTask(1214,Uworld1214)									--记录在killfly表中取得的行数
					if ( SubWorldIdx2ID( nMapIndex ) == 387 ) then
						Msg2Player("在调查留下的标记时，你找到一封信。信中告诉你去"..killfly[Uworld1214][1]..","..killfly[Uworld1214][2].."该地叫做 "..killfly[Uworld1214][3].."物品！他正拿着什么宝贝?")
					elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) then
						Msg2Player("在调查留下的标记时，你找到一封信。信中告诉你去"..killfly2[Uworld1214][1]..","..killfly2[Uworld1214][2].."该地叫做"..killfly2[Uworld1214][3].."物品！他正拿着什么宝贝?")
					elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) then
						Msg2Player("在调查留下的标记时，你找到一封信。信中告诉你去"..killfly3[Uworld1214][1]..","..killfly3[Uworld1214][2].."该地叫做"..killfly3[Uworld1214][3].."物品！他正拿着什么宝贝?")
					end
				end
			else
				Msg2Player("你已接触坐标")
			end
			
		elseif ( messenger_choice == 19 ) then 	--在该boss身边增加if ( messenger_npcindex == killflyboss[i][10]) 个npc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
	
				if ( SubWorldIdx2ID( nMapIndex ) == 387 ) and ( GetGlbValue(811) < 30 ) then --控制虎豹骑刷出数量为10队30支
					SetGlbValue(811,GetGlbValue(811)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
					Msg2Player("此山是我的，此村是我的，谁想过这里，把头留下来!（杀死他一定能获得出乎意料的奖励) ")
					for i=1,getn(killflyboss) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
						if ( messenger_npcindex == killflyboss[i][10]) then   	  --数组内寻找符合npc索引的变量数值
							Tid = SubWorldID2Idx(killflyboss[i][3]);   			  --增加npc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss[i][4] * 32
								TabValue5 = killflyboss[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss[i][1],killflyboss[i][2],Tid,TabValue4,TabValue5,killflyboss[i][6],killflyboss[i][7],killflyboss[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss[i][10]);
							end
						end
					end
					
				elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) and ( GetGlbValue(812) < 30 ) then
					SetGlbValue(812,GetGlbValue(812)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
					Msg2Player("此山是我的，此村是我的，谁想过这里，把头留下来!（杀死他一定能获得出乎意料的奖励!) ")
	
					for i=1,getn(killflyboss2) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
						if ( messenger_npcindex == killflyboss2[i][10]) then   	  --数组内寻找符合npc索引的变量数值
							Tid = SubWorldID2Idx(killflyboss2[i][3]);   			  --增加npc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss2[i][4] * 32
								TabValue5 = killflyboss2[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss2[i][1],killflyboss2[i][2],Tid,TabValue4,TabValue5,killflyboss2[i][6],killflyboss2[i][7],killflyboss2[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss2[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss2[i][10]);
							end
						end
					end
					
				elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) and ( GetGlbValue(813) < 30 ) then
					SetGlbValue(813,GetGlbValue(813)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
					Msg2Player("此山是我的，此村是我的，谁想过这里，把头留下来!（杀死他一定能获得出乎意料的奖励!) ")
	
					for i=1,getn(killflyboss3) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
						if ( messenger_npcindex == killflyboss3[i][10]) then   	  --数组内寻找符合npc索引的变量数值
							Tid = SubWorldID2Idx(killflyboss3[i][3]);   			  --增加npc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss3[i][4] * 32
								TabValue5 = killflyboss3[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss3[i][1],killflyboss3[i][2],Tid,TabValue4,TabValue5,killflyboss3[i][6],killflyboss3[i][7],killflyboss3[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss3[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss3[i][10]);
							end
						end
					end
				end
			end
		end
	end
		
--------------------------------------------------做boss死亡的基本操作-------------------------------------------------------
	if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("双倍经验值时间已结束!")
		else
			AddOwnExp(FLYBOSS_EXP)    --给予一倍的经验
		end
	end
	
	local Uworld1205 = nt_getTask(1205)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1208)
	
	messenger_killnpc_jifen(FLYBOSS_MESSENGEREXP,FLYBOSS_MAPID)
	SetMessengerPlayer(1207,1208,FLYBOSS_EXP,FLYBOSS_MAPID)   --增加风之骑杀怪数，增加当前关卡杀怪数，增加经验
	
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 3);
	HideNpc(GetTaskTemp(180),FLYBOSS_RELIVE*18)  --18祯为一秒  隐藏该对话型的npc
	Talk(1,"","你已到达坐标")
end