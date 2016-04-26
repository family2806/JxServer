--description: 天王帮寝宫 杨瑛　天王出师任务、重返门派任务
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)为重返师门任务加入取消任务功能，以及与新门派对应

function main()
--	if (check_skill() == 0) then
--		return
--	end
	UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- 世界任务：武林向背
		Talk(1,"", 11524)
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--拿到天王遗书
			Talk(3, "L60_prise", 11525, 11526, 11527)
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", 11528, 11529, 11530)
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- 重返后的自由出入
			Say(11531 ,2,"好的，请帮主恩准. /goff_yes","不，我自认为功夫还不到家. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--已经接到出师任务，尚未完成
			Talk(1,"", 11532)
		else
			Talk(1,"", 11533)
		end
--	elseif (GetTask(7) == 5*256+10) then		-- 转派至少林派
--		Say(11534 ,2,"不错，我意已决/defection_yes","不，我还是不改投少林了/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- 重返师门任务
		Talk(1,"return_select", 11535)
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say(11536 ,2,"准备好了/return_complete","还没准备好/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--已经出师
		Talk(1,"", 11537)
	else
		Talk(1,"", 11538)
	end
end
---------------------- 技能调整相关 ------------------------
function check_skill()
	x = 0
	skillID = 38					-- 盘古九式
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
		Say(11539 ,1,"多谢师父/KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- 重返任务 ----------------------
function goff_yes()
	Talk(1,"", 11540)
	SetTask(3,70*256)
	AddNote("离开天王帮继续行走江湖")
	Msg2Player("离开天王帮继续行走江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- 刷掉技能
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 斩龙诀
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王枪法
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王刀法
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王锤法
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 回风落雁
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 行云诀
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 无心斩
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 静心诀
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 惊雷斩
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 阳关三叠
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王战意
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 泼风斩
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 盘古九式（已取消技能）
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 断魂剌
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 血战八方
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 金钟罩
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- 为原门派作个标记
	SetRank(79)						-- 头衔降为镇帮元帅
	if (GetRepute() < 200) then
		Msg2Player("由于对门派不忠，你的名望减少"..GetRepute().."点!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("由于对门派不忠，你的名望减少200点! ")
		AddRepute(-200)
	end
	AddNote("杨瑛废除了你的天王帮武功，夺回惊天元帅的职位，同时昭告天下你离开天王帮了。现在你可以加入少林了. ")
	Msg2Player("杨瑛废除了你的天王帮武功，夺回惊天元帅的职位，同时昭告天下你离开天王帮了。现在你可以加入少林了. ")
	Talk(1,"KickOutSelf", 11541)
end

function defection_no()
	SetTask(7,1*256)				-- 为企图叛师作个标记，以备将来不时之需
	AddNote("你放弃加入少林. ")
	Msg2Player("你放弃加入少林. ")
end

function return_select()
	Say(11542 ,2,"是的，我想回天王/return_yes","补，我只是随口说说罢了. /return_no")
end;

function return_yes()
	Talk(2,"", 11543, 11544)
	SetTask(3,70*256+20)
	AddNote("拿出5万两军费支持天王帮就可以回来门派. ")
	Msg2Player("拿出5万两军费支持天王帮就可以回来门派. ")
end;

function return_no()
	Talk(1,"", 11545)
end;

function return_complete()
	if(GetCash() >= 50000) then								-- 有50000两
		Talk(1,"", 11546)
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
		if (HaveMagic(36) == -1) then
			AddMagic(32)
			AddMagic(41)
			AddMagic(324)
			AddMagic(36)
			Msg2Player("你学会天王帮技能：天王战意，武功无心斩，血战八方，御龙诀. ")
		end
		AddNote("回到天王帮. ")
		Msg2Faction(GetName().."回到天王帮，被封为惊天元帅")
	else
		Talk(2,"", 11547, 11548)
	end
end;

---------------------- 出师任务 ----------------------
function L60_get()
	Say(11549 , 2, "属下定当尽心尽力/L60_get_yes", "属下恐怕不能接受这个任务/no")
end;

function L60_get_yes()
	Talk(1,"", 11550)
	SetTask(3, 60*256+20)
	AddNote("在天王帮寝宫(223, 196)见杨瑛, 接受任务去青螺岛拿回天王遗书")
	Msg2Player("在天王帮寝宫(223, 196)见杨瑛, 接受任务去青螺岛拿回天王遗书")
end;

function L60_prise()
DelItem(96)
Msg2Player("恭喜你出师成功，你被封为镇邦元帅！名望增加120点! ")
--AddGlobalCountNews(GetName().."艺成出师，告别同门师弟开始闯荡江湖。", 1)
Msg2SubWorld("天王"..GetName().."艺成出师，告别同门兄弟继续闯荡江湖")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--玩家退出天王帮
SetCurCamp(4)
AddNote("返回天王帮寝宫，把天王遗书交给帮主杨瑛，完成出师任务。升任惊天元帅.. ")
end;

function no()
end
