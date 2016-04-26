-------------------------------------------------------------------------
-- FileName		:	enemy_temzhiboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 10:27:14
-- Desc			:   山神庙关卡的标志boss脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_templego(KillerNpcIndex)
	local _, _, nMapIndex = GetPos()
------------------------------------------------------变量定义------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1202)  --山神庙任务的任务变量
	local Uworld1204 = nt_getTask(1204)  --送信任务所到地点任务变量
	local Uworld1205 = nt_getTask(1205)  --信使积分
	local Uworld1206 = nt_getTask(1206)  --信使称号
	local Uworld1207 = nt_getTask(1207)  --信使任务当前杀怪记数器
	local Uworld1208 = nt_getTask(1209)  --山神庙杀怪记数器
	local Uworld1211 = nt_getTask(1211)  --信使任务关卡开始时间
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	local Uworld1214 = nt_getTask(1214)  --刀妖叛徒剧情开关
	local Uworld1215 = nt_getTask(1215)  --boss刷怪开关
	local messenger_nowtime = GetGameTime()  --获得玩家当前在线时间
	local Uworld1212  =  messenger_nowtime - Uworld1211 --获得玩家当前在该关卡地图中总时间
	local Npcindex = KillerNpcIndex	
	
------------------------------------------------------函数判断--------------------------------------------
	
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --几种任务类型都已经触发过了
		--Msg2Player("你还有任务没有完成，加油。")  不做处理了
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
				Msg2Player("你得到了杀怪时双倍经验20分钟的奖励!")
				AddSkillState( 548, 1, 1,21600)
			else
				Msg2Player("你成功下得刀妖.")
			end
		elseif ( messenger_choice == 11 ) then  --增加积分10 
			nt_setTask(1205,Uworld1205+20)
			tongaward_message(20);	--by 小山
			Msg2Player("你在信使任务中的累积分数增加了20分!")
			AddSkillState( 509, 1, 0, 180)
		elseif ( messenger_choice == 13 ) then  --减少积分10
			if ( Uworld1205 >= 10 ) then 
			nt_setTask(1205,Uworld1205-10)
			Msg2Player("你在信使任务中的累积分数减少了10分!")
			AddSkillState( 509, 1, 0, 180)
			end
		elseif ( messenger_choice == 16 ) then  --如果没有触发过定点打怪的事件，触发在某点打特殊怪物的事件
			local lucky_dingdian = random(1,3)
			if ( lucky_dingdian == 2 ) then
				if ( Uworld1214 == 0 ) then                            
					nt_setTask(1214,Uworld1214+10)									--记录在killfly表中取得的行数
					Msg2Player("在刀妖结束生命之前，他和你说由于被刀手手下陷害，所以，他才杀人无数。希望你可以帮他下得10个刀手，将有惊喜等着你!")
					AddSkillState( 509, 1, 0, 180)
				else 
					Msg2Player("你成功下得刀妖.")
					--SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 7);
				end
			end
			
		elseif ( messenger_choice == 19 ) then 	--在该boss身边增加if ( messenger_npcindex == templeboss[i][10]) 个npc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
				if ( SubWorldIdx2ID( nMapIndex ) == 390 ) and ( GetGlbValue(817) < 10 )  then
					SetGlbValue(817,GetGlbValue(817)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
			
					for i=1,getn(templeboss) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
						if ( messenger_npcindex == templeboss[i][10]) then   	  --数组内寻找符合npc索引的变量数值
							Tid = SubWorldID2Idx(templeboss[i][3]);   			  --增加npc
							if (Tid >= 0 ) then
								TabValue4 = templeboss[i][4] * 32
								TabValue5 = templeboss[i][5] * 32
								newtasknpcindex = AddNpc(templeboss[i][1],templeboss[i][2],Tid,TabValue4,TabValue5,templeboss[i][6],templeboss[i][7],templeboss[i][8]);
								SetNpcScript(newtasknpcindex, templeboss[i][9]);
								Msg2Player(templeboss[i][7]..": 你敢杀我哥哥，今天你要偿命!")
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 391 ) and ( GetGlbValue(818) < 10 ) then
					SetGlbValue(818,GetGlbValue(818)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
			
					for i=1,getn(templeboss2) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
						if ( messenger_npcindex == templeboss2[i][10]) then   	  --数组内寻找符合npc索引的变量数值
							Tid = SubWorldID2Idx(templeboss2[i][3]);   			  --增加npc
							if (Tid >= 0 ) then
								TabValue4 = templeboss2[i][4] * 32
								TabValue5 = templeboss2[i][5] * 32
								newtasknpcindex = AddNpc(templeboss2[i][1],templeboss2[i][2],Tid,TabValue4,TabValue5,templeboss2[i][6],templeboss2[i][7],templeboss2[i][8]);
								SetNpcScript(newtasknpcindex, templeboss2[i][9]);
								Msg2Player(templeboss2[i][7]..": 你敢杀我哥哥，今天你要偿命!")
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 392 ) and ( GetGlbValue(819) < 10 ) then
					SetGlbValue(819,GetGlbValue(819)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --获得当前死亡npc的储存变量值（对应变量设置值在该npc被加载处）
			
					for i=1,getn(templeboss3) do  								  --去所有boss死亡后生成的npc表格中寻找符合该boss索引的坐标
						if ( messenger_npcindex == templeboss3[i][10]) then   	  --数组内寻找符合npc索引的变量数值
							Tid = SubWorldID2Idx(templeboss3[i][3]);   			  --增加npc
							if (Tid >= 0 ) then
								TabValue4 = templeboss3[i][4] * 32
								TabValue5 = templeboss3[i][5] * 32
								newtasknpcindex = AddNpc(templeboss3[i][1],templeboss3[i][2],Tid,TabValue4,TabValue5,templeboss3[i][6],templeboss3[i][7],templeboss3[i][8]);
								SetNpcScript(newtasknpcindex, templeboss3[i][9]);
								Msg2Player(templeboss3[i][7]..": 你敢杀我哥哥，今天你要偿命!")
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
			Msg2Player("你的增加双倍经验时间已结束!")
		else
			AddOwnExp(TEMBOSS_EXP)    --给予一倍的经验
		end
	end
	
	
	local Uworld1205 = nt_getTask(1205)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1209)
	
	messenger_killnpc_jifen(TEMBOSS_MESSENGEREXP,TEMBOSS_MAPID)
	SetMessengerPlayer(1207,1209,TEMBOSS_EXP,TEMBOSS_MAPID)   --增加山神庙杀怪数，增加当前关卡杀怪数，增加经验
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 7);
end