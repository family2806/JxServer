--  skills_table.lua
--     By: Dan_Deng(2004-05-16)
--  主维护表，各门派、各等级技能总表
-- Update: Dan_Deng(2004-07-05) 增加投点方式的90级技能特别处理：如果玩家拥有此技能，则保存技能ID后删除。在加技能时再单独处理

function check_update()
	-- 公共服模式不清除状态
	if (GetTask(137) >= 20 or GetTripMode() == 2) then
		return 0
	else
		SetTask(57,GetGameTime())		-- 记住技能更新后第一次上线时间，必须在线72小时以后才允许上洗髓岛
		rollback_prop()				-- 重置潜能点（2004-07-13）
		skills_update()
		UpdateSkill()
		return 1
	end
end

function skills_update()
	SetTaskTemp(20,0)				-- 使用前复位，保证不受干扰
	SetTaskTemp(21,0)
	Player_Faction = check_faction()
	if (Player_Faction == 3) then				-- 天王帮
		update_tw()
	elseif (Player_Faction == 7) then		-- 少林派
		update_sl()
	elseif (Player_Faction == 2) then		-- 唐门
		update_tm()
	elseif (Player_Faction == 10) then		-- 五毒
		update_wu()
	elseif (Player_Faction == 1) then		-- 峨嵋
		update_em()
	elseif (Player_Faction == 6) then		-- 翠烟
		update_cy()
	elseif (Player_Faction == 4) then		-- 天忍
		update_tr()
	elseif (Player_Faction == 8) then		-- 丐帮
		update_gb()
	elseif (Player_Faction == 5) then		-- 武当
		update_wd()
	elseif (Player_Faction == 9) then		-- 昆仑
		update_kl()
	else									-- 白名
		SetTask(137,20)
		return 1
	end
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数	- 回体术（雨露重生）等级 - 扣点洗点影响
--	Say("技能更新已经完成，请注意重新为各个技能分配技能点。",0)
	Msg2Player("技能更新已经完成，请注意重新为各个技能分配技能点。")
	xMagic = 0
	if HaveMagic(397) >= 0 then			-- 计算雨露重生技能，扣除相应点数（要防止返回-1）
		xMagic = HaveMagic(397)
	end
--	if (GetTask(13) >= 1) and (GetTask(13) < 256) then		-- 计算是否扣点洗点。
--		xMagic = xMagic + 3
--		Msg2Player("你曾经过释明僧的易筋洗髓，经脉中有一定损伤。你可以利用三颗水晶请释明帮你修复受损的经脉。")
--	end
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) + GetTask(700) - GetMagicPoint() - xMagic - 1
	Ttask21 = GetTaskTemp(21)
	if (Ttask21 ~= MagicPoint_total + GetMagicPoint()) then		-- 不一致的要写log
		WriteLog(date("%H时%M分%S秒").."： 帐号“"..GetAccount().."”的角色“"..GetName().."”技能更新异常记录：等级"..GetLevel().."，原有技能点"..Ttask21.."，修正为"..MagicPoint_total+GetMagicPoint().."点（包括任务加"..GetByte(GetTask(86),2).."点，道具加"..GetTask(80).."点）。")
	end
	AddMagicPoint(MagicPoint_total)
	SetTaskTemp(20,0)				-- 洗点完成，重新复位
	SetTaskTemp(21,0)
end

function check_faction()
	if (GetTask(7) >= 10*256) and (GetTask(7) ~= 75*256) then		-- 少林或此门派出师
		SetTask(137,7)
		SetLastFactionNumber(0)
		return 7
	elseif (GetTask(3) >= 10*256) and (GetTask(3) ~= 75*256) then			-- 天王或此门派出师
		SetTask(137,3)
		SetLastFactionNumber(1)
		return 3
	elseif (GetTask(10) >= 10*256) and (GetTask(10) ~= 75*256) then	-- 五毒或此门派出师
		SetTask(137,10)
		SetLastFactionNumber(3)
		return 10
	elseif (GetTask(2) >= 10*256) and (GetTask(2) ~= 75*256) then		-- 唐门或此门派出师
		SetTask(137,2)
		SetLastFactionNumber(2)
		return 2
	elseif (GetTask(6) >= 10*256) and (GetTask(6) ~= 75*256) then		-- 翠烟或此门派出师
		SetTask(137,6)
		SetLastFactionNumber(5)
		return 6
	elseif (GetTask(1) >= 10*256) and (GetTask(1) ~= 75*256) then		-- 峨嵋或此门派出师
		SetTask(137,1)
		SetLastFactionNumber(4)
		return 1
	elseif (GetTask(8) >= 10*256) and (GetTask(8) ~= 75*256) then		-- 丐帮或此门派出师
		SetTask(137,8)
		SetLastFactionNumber(6)
		return 8
	elseif (GetTask(4) >= 10*256) and (GetTask(4) ~= 75*256) then		-- 天忍或此门派出师
		SetTask(137,4)
		SetLastFactionNumber(7)
		return 4
	elseif (GetTask(9) >= 10*256) and (GetTask(9) ~= 75*256) then		-- 昆仑或此门派出师
		SetTask(137,9)
		SetLastFactionNumber(9)
		return 9
	elseif (GetTask(5) >= 10*256) and (GetTask(5) ~= 75*256) then		-- 武当或此门派出师
		SetTask(137,5)
		SetLastFactionNumber(8)
		return 5
	else																					-- 白名的，不需要更新
		SetLastFactionNumber(-1)
		return 20
	end
end;

function add_misc(lvl)		-- 加公共技能（按两进制位逐个加）
	if (GetBit(lvl,1) == 1) and (HaveMagic(210) == -1) then			-- 第1字位：轻功
		AddMagic(210,1)
	end
	if (GetBit(lvl,2) == 1) and (HaveMagic(400) == -1) then			-- 第2字位：劫富济贫
		AddMagic(400,1)
	end
	if (GetBit(lvl,3) == 1) and (HaveMagic(397) == -1) then			-- 第3字位：雨露重生
		AddMagic(397)
	end
end

function update_tw()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(3)
	if (GetTask(121) == 255) then		-- 学会了90级技能
		the_lvl = 90
-- 天王的回师技能需要再多作判断，因为原60级技能被改为50级：　　有金钟罩、过了60级，并且已出师（不是判师）
	elseif (HaveMagic(42) >= 0) and (GetTask(3) >= 70*256) and (GetTask(3) ~= 75*256) and (GetLevel() >= 60) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_tw(the_lvl)			-- 加回应学会的技能
	SetTask(137,23)
end

function update_gb()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(8)
	if (GetTask(128) == 255) then		-- 学会了90级技能
		the_lvl = 90
-- 丐帮的回师技能需要再多作判断，因为原60级技能被改为50级：　　有亢龙有悔、过了60级，并且已出师（不是判师）
	elseif (HaveMagic(128) >= 0) and (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) and (GetLevel() >= 60) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_gb(the_lvl)			-- 加回应学会的技能
	SetTask(137,28)
end

function update_wd()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(5)
	if (GetTask(129) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(166) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_wd(the_lvl)			-- 加回应学会的技能
	SetTask(137,25)
end

function update_em()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(1)
	if (GetTask(125) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(252) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_em(the_lvl)			-- 加回应学会的技能
	SetTask(137,21)
end

function update_sl()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(7)
	if (GetTask(122) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(21) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_sl(the_lvl)			-- 加回应学会的技能
	SetTask(137,27)
end

function update_wu()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(10)
	if (GetTask(124) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(75) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_wu(the_lvl)			-- 加回应学会的技能
	SetTask(137,30)
end

function update_cy()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(6)
	if (GetTask(126) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(111) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_cy(the_lvl)			-- 加回应学会的技能
	SetTask(137,26)
end

function update_tm()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(2)
	if (GetTask(123) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(249) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_tm(the_lvl)			-- 加回应学会的技能
	SetTask(137,22)
end

function update_tr()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(4)
	if (GetTask(127) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(150) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_tr(the_lvl)			-- 加回应学会的技能
	SetTask(137,24)
end

function update_kl()			-- 刷新技能
	UTask = GetTask(9)
	if (GetTask(130) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(182) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	del_all_skill()
	add_kl(the_lvl)			-- 加回应学会的技能
	SetTask(137,29)
end

function add_tw(lvl)			-- 根据任务等级加相应的天王技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(34) == -1) then		-- 必须没有技能的才给技能
			AddMagic(34)		--惊雷斩[34]  （入门）
		end
		if (HaveMagic(30) == -1) then		-- 必须没有技能的才给技能
			AddMagic(30)		--回风落雁[30]（入门）
		end
		if (HaveMagic(29) == -1) then		-- 必须没有技能的才给技能
			AddMagic(29)		--斩龙诀[29]  （入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(26) == -1) then		-- 必须没有技能的才给技能
			AddMagic(26)		--天王锤法[26]（10级）
		end
		if (HaveMagic(23) == -1) then		-- 必须没有技能的才给技能
			AddMagic(23)		--天王枪法[23]（10级）
		end
		if (HaveMagic(24) == -1) then		-- 必须没有技能的才给技能
			AddMagic(24)		--天王刀法[24]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(33) == -1) then		-- 必须没有技能的才给技能
			AddMagic(33)		--静心诀[33]  （20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(37) == -1) then		-- 必须没有技能的才给技能
			AddMagic(37)		--泼风斩  [37]（30级）
		end
		if (HaveMagic(35) == -1) then		-- 必须没有技能的才给技能
			AddMagic(35)		--阳关三叠[35]（30级）
		end
		if (HaveMagic(31) == -1) then		-- 必须没有技能的才给技能
			AddMagic(31)		--行云诀  [31]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(40) == -1) then		-- 必须没有技能的才给技能
			AddMagic(40)		--断魂刺  [40]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(42) == -1) then		-- 必须没有技能的才给技能
			AddMagic(42)		--金钟罩  [42]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(32) == -1) then		-- 必须没有技能的才给技能
			AddMagic(32)		--无心斩  [32] （60级）
		end
		if (HaveMagic(36) == -1) then		-- 必须没有技能的才给技能
			AddMagic(36)		--天王战意[36]（镇派）
		end
		if (HaveMagic(41) == -1) then		-- 必须没有技能的才给技能
			AddMagic(41)		--血战八方[41] （60级）
		end
		if (HaveMagic(324) == -1) then		-- 必须没有技能的才给技能
			AddMagic(324)		--乘龙诀  [324]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(322) <= 0) then AddMagic(322,20) end		--破天斩  [322]（90级）
		if (HaveMagic(323) <= 0) then AddMagic(323,20) end		--追星逐月[323]（90级）
		if (HaveMagic(325) <= 0) then AddMagic(325,20) end		--追风诀  [325]（90级）
		if (HaveMagic(708) <= 0) then AddMagic(708,20) end		--门派120技能
		if (HaveMagic(1058) <= 0) then AddMagic(1058,20) end		--门派150技能
		if (HaveMagic(1059) <= 0) then AddMagic(1059,20) end		--门派150技能
		if (HaveMagic(1060) <= 0) then AddMagic(1060,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_sl(lvl)			-- 根据任务等级加相应的少林技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(14) == -1) then		-- 必须没有技能的才给技能
			AddMagic(14)		-- 行龙不雨[14]
		end
		if (HaveMagic(10) == -1) then		-- 必须没有技能的才给技能
			AddMagic(10)			--金刚伏魔[10]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(8) == -1) then		-- 必须没有技能的才给技能
			AddMagic(8)			-- 少林拳法[8]
		end
		if (HaveMagic(4) == -1) then		-- 必须没有技能的才给技能
			AddMagic(4)			--少林棍法[4]（10级
		end
		if (HaveMagic(6) == -1) then		-- 必须没有技能的才给技能
			AddMagic(6)			--少林刀法[6]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(15) == -1) then		-- 必须没有技能的才给技能
			AddMagic(15)		--不动明王[15]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(16) == -1) then		-- 必须没有技能的才给技能
			AddMagic(16)		--罗汉阵[16]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(20) == -1) then		-- 必须没有技能的才给技能
			AddMagic(20)		--狮子吼 [20]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(271) == -1) then		-- 必须没有技能的才给技能
			AddMagic(271)		-- 龙爪虎抓[271]
		end
		if (HaveMagic(11) == -1) then		-- 必须没有技能的才给技能
			AddMagic(11)		--横扫六合 [11]（50级）
		end
		if (HaveMagic(19) == -1) then		-- 必须没有技能的才给技能
			AddMagic(19)		--摩诃无量 [19]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(273) == -1) then		-- 必须没有技能的才给技能
			AddMagic(273)		--如来千叶[273]
		end
		if (HaveMagic(21) == -1) then		-- 必须没有技能的才给技能
			AddMagic(21)		--易筋经[21]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(318) <= 0) then AddMagic(318,20) end		--达摩渡江[318]
		if (HaveMagic(319) <= 0) then AddMagic(319,20) end		--横扫千军[319]（90级）
		if (HaveMagic(321) <= 0) then AddMagic(321,20) end		--无相斩  [321]（90级）
		if (HaveMagic(709) <= 0) then AddMagic(709,20) end		--门派120技能
		if (HaveMagic(1055) <= 0) then AddMagic(1055,20) end		--门派150技能
		if (HaveMagic(1056) <= 0) then AddMagic(1056,20) end		--门派150技能
		if (HaveMagic(1057) <= 0) then AddMagic(1057,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_tm(lvl)			-- 根据任务等级加相应的唐门技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(45) == -1) then		-- 必须没有技能的才给技能
			AddMagic(45)		--霹雳弹[45 ]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(43) == -1) then		-- 必须没有技能的才给技能
			AddMagic(43)		--唐门暗器[43 ]（10级）
		end
		if (HaveMagic(347) == -1) then		-- 必须没有技能的才给技能
			AddMagic(347)		--地焰火[347]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(303) == -1) then		-- 必须没有技能的才给技能
			AddMagic(303)		--毒刺骨  [303]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(50) == -1) then		-- 必须没有技能的才给技能
			AddMagic(50)		--追心箭  [50 ]（30级）
		end
		if (HaveMagic(54) == -1) then		-- 必须没有技能的才给技能
			AddMagic(54)		--漫天花雨[54 ]（30级）
		end
		if (HaveMagic(47) == -1) then		-- 必须没有技能的才给技能
			AddMagic(47)		--夺魂镖  [47 ]（30级）
		end
		if (HaveMagic(343) == -1) then		-- 必须没有技能的才给技能
			AddMagic(343)		--穿心刺  [343]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(345) == -1) then		-- 必须没有技能的才给技能
			AddMagic(345)		--寒冰刺  [345]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(349) == -1) then		-- 必须没有技能的才给技能
			AddMagic(349)		--雷击术[349]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(249) == -1) then		-- 必须没有技能的才给技能
			AddMagic(249)		--小李飞刀[249]（60级）
		end
		if (HaveMagic(48) == -1) then		-- 必须没有技能的才给技能
			AddMagic(48)		--心眼  [48 ]（镇派）
		end
		if (HaveMagic(58) == -1) then		-- 必须没有技能的才给技能
			AddMagic(58)		--天罗地网[58 ]（60级）
		end
		if (HaveMagic(341) == -1) then		-- 必须没有技能的才给技能
			AddMagic(341)		--散花镖  [341]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(339) <= 0) then AddMagic(339,20) end		--摄魂月影[339]（90级）
		if (HaveMagic(302) <= 0) then AddMagic(302,20) end		--暴雨梨花[302]（90级）
		if (HaveMagic(342) <= 0) then AddMagic(342,20) end		--九宫飞星[342]（90级）
---		if (GetTaskTemp(20) == 351) then					-- 如果发现有该技能则加回，其它90技能未删
---			if (HaveMagic(351) == -1) then		-- 必须没有技能的才给技能
---				AddMagic(351)		--乱环击  [351]（90级）
---			end
---		end
		if (HaveMagic(351) <= 0) then AddMagic(351) end		--90诅咒辅助技能
		if (HaveMagic(710) <= 0) then AddMagic(710,20) end		--门派120技能
		if (HaveMagic(1069) <= 0) then AddMagic(1069,20) end		--门派150技能
		if (HaveMagic(1070) <= 0) then AddMagic(1070,20) end		--门派150技能
		if (HaveMagic(1071) <= 0) then AddMagic(1071,20) end		--门派150技能
		if (HaveMagic(1110) <= 0) then AddMagic(1110) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_wu(lvl)			-- 根据任务等级加相应的五毒技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(63) == -1) then		-- 必须没有技能的才给技能
			AddMagic(63)		--毒砂掌  [63]（入门）
		end
		if (HaveMagic(65) == -1) then		-- 必须没有技能的才给技能
			AddMagic(65)		--血刀毒杀[65]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(62) == -1) then		-- 必须没有技能的才给技能
			AddMagic(62)		--五毒掌法[62]（10级）
		end
		if (HaveMagic(60) == -1) then		-- 必须没有技能的才给技能
			AddMagic(60)		--五毒刀法[60]（10级）
		end
		if (HaveMagic(67) == -1) then		-- 必须没有技能的才给技能
			AddMagic(67)		--九天狂雷[67]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(70) == -1) then		-- 必须没有技能的才给技能
			AddMagic(70)		--赤焰蚀天[70]（20级）
		end
		if (HaveMagic(66) == -1) then		-- 必须没有技能的才给技能
			AddMagic(66)		--杂难药经[66]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(68) == -1) then		-- 必须没有技能的才给技能
			AddMagic(68)		--幽冥骷髅[68 ]（30级）
		end
		if (HaveMagic(384) == -1) then		-- 必须没有技能的才给技能
			AddMagic(384)		--百毒穿心[384]（30级）
		end
		if (HaveMagic(64) == -1) then		-- 必须没有技能的才给技能
			AddMagic(64)		--冰蓝玄晶[64 ]（30级）
		end
		if (HaveMagic(69) == -1) then		-- 必须没有技能的才给技能
			AddMagic(69)		--无形蛊  [69]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(356) == -1) then		-- 必须没有技能的才给技能
			AddMagic(356)		--穿衣破甲  [356]（40级）
		end
		if (HaveMagic(73) == -1) then		-- 必须没有技能的才给技能
			AddMagic(73)		--万蛊蚀心[73 ]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(72) == -1) then		-- 必须没有技能的才给技能
			AddMagic(72)		--穿心毒刺[72]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(71) == -1) then		-- 必须没有技能的才给技能
			AddMagic(71)		--天罡地煞手[71 ]（60级）
		end
		if (HaveMagic(75) == -1) then		-- 必须没有技能的才给技能
			AddMagic(75)		--五毒奇经[75]（镇派）
		end
		if (HaveMagic(74) == -1) then		-- 必须没有技能的才给技能
			AddMagic(74)		--朱蛤青冥  [74 ]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(353) <= 0) then AddMagic(353,20) end		--阴风蚀骨[353]（90级）
		if (HaveMagic(355) <= 0) then AddMagic(355,20) end		--玄阴斩  [355]（90级）
---		if (GetTaskTemp(20) == 390) then					-- 如果发现有该技能则加回，其它90技能未删
---			if (HaveMagic(390) == -1) then		-- 必须没有技能的才给技能
---				AddMagic(390)		-- [390]（90级）
---			end
---		end
		if (HaveMagic(390) <= 0) then AddMagic(390) end		--90诅咒辅助技能
		if (HaveMagic(711) <= 0) then AddMagic(711,20) end		--门派120技能
		if (HaveMagic(1066) <= 0) then AddMagic(1066,20) end		--门派150技能
		if (HaveMagic(1067) <= 0) then AddMagic(1067,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_em(lvl)			-- 根据任务等级加相应的峨嵋技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(85) == -1) then		-- 必须没有技能的才给技能
			AddMagic(85)		--一叶知秋[85]（入门）
		end
		if (HaveMagic(80) == -1) then		-- 必须没有技能的才给技能
			AddMagic(80)		--飘雪穿云[80]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(77) == -1) then		-- 必须没有技能的才给技能
			AddMagic(77)		--峨嵋剑法[77]（10级）
		end
		if (HaveMagic(79) == -1) then		-- 必须没有技能的才给技能
			AddMagic(79)		--峨嵋掌法[79]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(93) == -1) then		-- 必须没有技能的才给技能
			AddMagic(93)		--慈航普渡[93]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(385) == -1) then		-- 必须没有技能的才给技能
			AddMagic(385)		--推窗望月[385]（30级）
		end
		if (HaveMagic(82) == -1) then		-- 必须没有技能的才给技能
			AddMagic(82)		--四象同归[82]（30级）
		end
		if (HaveMagic(89) == -1) then		-- 必须没有技能的才给技能
			AddMagic(89)		--梦蝶    [89]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(86) == -1) then		-- 必须没有技能的才给技能
			AddMagic(86)		--流水    [86 ]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(92) == -1) then		-- 必须没有技能的才给技能
			AddMagic(92)		--佛心慈佑[92]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(88) == -1) then		-- 必须没有技能的才给技能
			AddMagic(88)		--不灭不绝[88]（60级）
		end
		if (HaveMagic(252) == -1) then		-- 必须没有技能的才给技能
			AddMagic(252)		--佛法无边[252]（镇派）
		end
		if (HaveMagic(91) == -1) then		-- 必须没有技能的才给技能
			AddMagic(91)		--佛光普照[91]（60级）
		end
		if (HaveMagic(282) == -1) then		-- 必须没有技能的才给技能
			AddMagic(282)		--清音梵唱[282]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(328) <= 0) then AddMagic(328,20) end		--三峨霁雪[328]（90级）
		if (HaveMagic(380) <= 0) then AddMagic(380,20) end		--风霜碎影[380]（90级）
---		if (GetTaskTemp(20) == 332) then					-- 如果发现有该技能则加回，其它90技能未删
---			if (HaveMagic(332) == -1) then		-- 必须没有技能的才给技能
---				AddMagic(332)		--普渡众生[332]（90级）
---			end
---		end
		if (HaveMagic(332) <= 0) then AddMagic(332) end		--90诅咒辅助技能
		if (HaveMagic(712) <= 0) then AddMagic(712,20) end		--门派120技能
		if (HaveMagic(1061) <= 0) then AddMagic(1061,20) end		--门派150技能
		if (HaveMagic(1062) <= 0) then AddMagic(1062,20) end		--门派150技能
		if (HaveMagic(1114) <= 0) then AddMagic(1114,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_cy(lvl)			-- 根据任务等级加相应的翠烟技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(99) == -1) then		-- 必须没有技能的才给技能
			AddMagic(99)		--风花雪月[99 ]（入门）
		end
		if (HaveMagic(102) == -1) then		-- 必须没有技能的才给技能
			AddMagic(102)		--风卷残雪[102]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(95) == -1) then		-- 必须没有技能的才给技能
			AddMagic(95)		----翠烟刀法[95 ]（10级）
		end
		if (HaveMagic(97) == -1) then		-- 必须没有技能的才给技能
			AddMagic(97)		--翠烟双刀[97 ]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(269) == -1) then		-- 必须没有技能的才给技能
			AddMagic(269)		--冰心倩影[269]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(105) == -1) then		-- 必须没有技能的才给技能
			AddMagic(105)		--雨打梨花[105]（30级）
		end
		if (HaveMagic(113) == -1) then		-- 必须没有技能的才给技能
			AddMagic(113)		--浮云散雪[113]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(100) == -1) then		-- 必须没有技能的才给技能
			AddMagic(100)		--护体寒冰[100]（30级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(109) == -1) then		-- 必须没有技能的才给技能
			AddMagic(109)		--雪影    [109]（40级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(108) == -1) then		-- 必须没有技能的才给技能
			AddMagic(108)		--牧野流星[108]（60级）
		end
		if (HaveMagic(114) == -1) then		-- 必须没有技能的才给技能
			AddMagic(114)		--冰骨雪心[114]（镇派）
		end
		if (HaveMagic(111) == -1) then		-- 必须没有技能的才给技能
			AddMagic(111)		--碧海潮生[111]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(336) <= 0) then AddMagic(336,20) end		--冰踪无影[336]（90级）
		if (HaveMagic(337) <= 0) then AddMagic(337,20) end		--冰心仙子[337]（90级）
		if (HaveMagic(713) <= 0) then AddMagic(713,20) end		--门派120技能
		if (HaveMagic(1063) <= 0) then AddMagic(1063,20) end		--门派150技能
		if (HaveMagic(1065) <= 0) then AddMagic(1065,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_tr(lvl)			-- 根据任务等级加相应的天忍技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(135) == -1) then		-- 必须没有技能的才给技能
			AddMagic(135)		--残阳如血[135]（入门）
		end
		if (HaveMagic(145) == -1) then		-- 必须没有技能的才给技能
			AddMagic(145)		--弹指烈焰[145]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(132) == -1) then		-- 必须没有技能的才给技能
			AddMagic(132)		--天忍矛法[132]（10级）
		end
		if (HaveMagic(131) == -1) then		-- 必须没有技能的才给技能
			AddMagic(131)		--天忍刀法[131]（10级）
		end
		if (HaveMagic(136) == -1) then		-- 必须没有技能的才给技能
			AddMagic(136)		--火焚莲华[136]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(137) == -1) then		-- 必须没有技能的才给技能
			AddMagic(137)		--幻影飞狐[137]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(141) == -1) then		-- 必须没有技能的才给技能
			AddMagic(141)		--烈火情天[141]（30级）
		end
		if (HaveMagic(138) == -1) then		-- 必须没有技能的才给技能
			AddMagic(138)		--推山填海[138]（30级）
		end
		if (HaveMagic(140) == -1) then		-- 必须没有技能的才给技能
			AddMagic(140)		--飞鸿无迹[140]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(364) == -1) then		-- 必须没有技能的才给技能
			AddMagic(364)		--悲酥清风[364]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(143) == -1) then		-- 必须没有技能的才给技能
			AddMagic(143)		--厉魔夺魂[143]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(142) == -1) then		-- 必须没有技能的才给技能
			AddMagic(142)		--偷天换日[142]（60级）
		end
		if (HaveMagic(150) == -1) then		-- 必须没有技能的才给技能
			AddMagic(150)		--天魔解体[150]（镇派）
		end
		if (HaveMagic(148) == -1) then		-- 必须没有技能的才给技能
			AddMagic(148)		--魔焰七杀[148]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(361) <= 0) then AddMagic(361,20) end		--云龙击  [361]（90级）
		if (HaveMagic(362) <= 0) then AddMagic(362,20) end		--天外流星[362]（90级）
---		if (GetTaskTemp(20) == 391) then					-- 如果发现有该技能则加回，其它90技能未删
---			if (HaveMagic(391) == -1) then		-- 必须没有技能的才给技能
---				AddMagic(391)		-- [391]（90级）
---			end
---		end
		if (HaveMagic(391) <= 0) then AddMagic(391) end		--90诅咒辅助技能
		if (HaveMagic(715) <= 0) then AddMagic(715,20) end		--门派120技能
		if (HaveMagic(1075) <= 0) then AddMagic(1075,20) end		--门派150技能
		if (HaveMagic(1076) <= 0) then AddMagic(1076,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_gb(lvl)			-- 根据任务等级加相应的丐帮技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(122) == -1) then		-- 必须没有技能的才给技能
			AddMagic(122)		--见人伸手[122]（入门）
		end
		if (HaveMagic(119) == -1) then		-- 必须没有技能的才给技能
			AddMagic(119)		--沿门托钵[119]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(116) == -1) then		-- 必须没有技能的才给技能
			AddMagic(116)		--丐帮掌法[116]（10级）
		end
		if (HaveMagic(115) == -1) then		-- 必须没有技能的才给技能
			AddMagic(115)		--丐帮棒法[115]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(129) == -1) then		-- 必须没有技能的才给技能
			AddMagic(129)		--化险为夷[129]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(274) == -1) then		-- 必须没有技能的才给技能
			AddMagic(274)		--降龙掌[274]（30级）
		end
		if (HaveMagic(124) == -1) then		-- 必须没有技能的才给技能
			AddMagic(124)		--打狗阵[124]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(277) == -1) then		-- 必须没有技能的才给技能
			AddMagic(277)		--滑不留手[277]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(128) == -1) then		-- 必须没有技能的才给技能
			AddMagic(128)		--亢龙有悔[128]（50级）
		end
		if (HaveMagic(125) == -1) then		-- 必须没有技能的才给技能
			AddMagic(125)		--棒打恶狗[125]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(130) == -1) then		-- 必须没有技能的才给技能
			AddMagic(130)		--醉蝶狂舞[130]（镇派）
		end
		if (HaveMagic(360) == -1) then		-- 必须没有技能的才给技能
			AddMagic(360)		--逍遥功[360]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(357) <= 0) then AddMagic(357,20) end		--飞龙在天[357]（90级）
		if (HaveMagic(359) <= 0) then AddMagic(359,20) end		--天下无狗[359]（90级）
		if (HaveMagic(714) <= 0) then AddMagic(714,20) end		--门派120技能
		if (HaveMagic(1073) <= 0) then AddMagic(1073,20) end		--门派150技能
		if (HaveMagic(1074) <= 0) then AddMagic(1074,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_wd(lvl)			-- 根据任务等级加相应的武当技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(153) == -1) then		-- 必须没有技能的才给技能
			AddMagic(153)		--怒雷指  [153]（入门）
		end
		if (HaveMagic(155) == -1) then		-- 必须没有技能的才给技能
			AddMagic(155)		--沧海明月[155]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(152) == -1) then		-- 必须没有技能的才给技能
			AddMagic(152)		--武当拳法[152]（10级）
		end
		if (HaveMagic(151) == -1) then		-- 必须没有技能的才给技能
			AddMagic(151)		--武当剑法[151]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(159) == -1) then		-- 必须没有技能的才给技能
			AddMagic(159)		--七星阵  [159]（30级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(164) == -1) then		-- 必须没有技能的才给技能
			AddMagic(164)		--剥及而复[164]（30级）
		end
		if (HaveMagic(158) == -1) then		-- 必须没有技能的才给技能
			AddMagic(158)		--剑飞惊天[158]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(160) == -1) then		-- 必须没有技能的才给技能
			AddMagic(160)		--梯云纵  [160]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(157) == -1) then		-- 必须没有技能的才给技能
			AddMagic(157)		--坐望无我[157]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(165) == -1) then		-- 必须没有技能的才给技能
			AddMagic(165)		--无我无剑[165]（60级）
		end
		if (HaveMagic(166) == -1) then		-- 必须没有技能的才给技能
			AddMagic(166)		--太极神功[166]（镇派）
		end
		if (HaveMagic(267) == -1) then		-- 必须没有技能的才给技能
			AddMagic(267)		--三环套月[267]（60级）
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(365) <= 0) then AddMagic(365,20) end		--天地无极[365]（90级）
		if (HaveMagic(368) <= 0) then AddMagic(368,20) end		--人剑合一[368]（90级）
		if (HaveMagic(716) <= 0) then AddMagic(716,20) end		--门派120技能
		if (HaveMagic(1078) <= 0) then AddMagic(1078,20) end		--门派150技能
		if (HaveMagic(1079) <= 0) then AddMagic(1079,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function add_kl(lvl)			-- 根据任务等级加相应的昆仑技能
	if (lvl >= 10) then			-- 已经入门（加入门技能）
		if (HaveMagic(169) == -1) then		-- 必须没有技能的才给技能
			AddMagic(169)		--呼风法  [169]（入门）
		end
		if (HaveMagic(179) == -1) then		-- 必须没有技能的才给技能
			AddMagic(179)		--狂雷震地[179]（入门）
		end
	end
	if (lvl >= 20) then		-- 10级任务（加10级技能）
		if (HaveMagic(167) == -1) then		-- 必须没有技能的才给技能
			AddMagic(167)		--昆仑刀法[167]（10级）
		end
		if (HaveMagic(168) == -1) then		-- 必须没有技能的才给技能
			AddMagic(168)		--昆仑剑法[168]（10级）
		end
		if (HaveMagic(392) == -1) then		-- 必须没有技能的才给技能
			AddMagic(392)		--缠字诀[392]（10级）
		end
		if (HaveMagic(171) == -1) then		-- 必须没有技能的才给技能
			AddMagic(171)		--清风符  [171]（10级）
		end
	end
	if (lvl >= 30) then		-- 20级任务（加20级技能）
		if (HaveMagic(174) == -1) then		-- 必须没有技能的才给技能
			AddMagic(174)		--羁绊符  [174]（20级）
		end
	end
	if (lvl >= 40) then		-- 30级任务（加30级技能）
		if (HaveMagic(178) == -1) then		-- 必须没有技能的才给技能
			AddMagic(178)		--一气三清[178]（30级）
		end
		if (HaveMagic(172) == -1) then		-- 必须没有技能的才给技能
			AddMagic(172)		--迅雷咒  [172]（30级）
		end
		if (HaveMagic(393) == -1) then		-- 必须没有技能的才给技能
			AddMagic(393)	-- 缺少ID（30级）
		end
		if (HaveMagic(173) == -1) then		-- 必须没有技能的才给技能
			AddMagic(173)		--天清地浊[173]（30级）
		end
	end
	if (lvl >= 50) then		-- 40级任务（加40级技能）
		if (HaveMagic(175) == -1) then		-- 必须没有技能的才给技能
			AddMagic(175)		--欺寒傲雪[175]（40级）
		end
		if (HaveMagic(181) == -1) then		-- 必须没有技能的才给技能
			AddMagic(181)		--弃心符  [181]（40级）
		end
	end
	if (lvl >= 60) then		-- 50级任务（加50级技能）
		if (HaveMagic(176) == -1) then		-- 必须没有技能的才给技能
			AddMagic(176)		--狂风骤电[176]（50级）
		end
		if (HaveMagic(90) == -1) then		-- 必须没有技能的才给技能
			AddMagic(90)		--迷踪幻影[90 ]（50级）
		end
	end
	if (lvl >= 70) then		-- 回师任务（加镇派绝学）
		if (HaveMagic(275) == -1) then		-- 必须没有技能的才给技能
			AddMagic(275)		--霜傲昆仑[275]（镇派）
		end
		if (HaveMagic(182) == -1) then		-- 必须没有技能的才给技能
			AddMagic(182)		--五雷正法[182]（60级）
		end
		if (HaveMagic(630) == -1) then
			AddMagic(630);		--第三资料片，增加昆仑新技能"玄天无极"
		end
	end
	if (lvl >= 90) then		-- 90级任务（加90级技能）
		if (HaveMagic(372) <= 0) then AddMagic(372,20) end		--傲雪啸风[372]（90级）
		if (HaveMagic(375) <= 0) then AddMagic(375,20) end		--雷动九天[375]（90级）
---		if (GetTaskTemp(20) == 394) then
---			if (HaveMagic(394) == -1) then		-- 必须没有技能的才给技能
---				AddMagic(394)		-- [394]（90级）
---			end
---		end
		if (HaveMagic(394) <= 0) then AddMagic(394) end		--90诅咒辅助技能
		if (HaveMagic(717) <= 0) then AddMagic(717,20) end		--门派120技能
		if (HaveMagic(1080) <= 0) then AddMagic(1080,20) end		--门派150技能
		if (HaveMagic(1081) <= 0) then AddMagic(1081,20) end		--门派150技能
		AddItem(6,1,2841,1,0,0)
	end
end

function del_all_skill()
	i = HaveMagic(210)		-- 轻功另外操作
	j = HaveMagic(400)		-- “劫富济贫”另外操作
	n = RollbackSkill()		-- 清除技能并返回所有技能点（包括轻功等特殊技能）
	x = 0
	if (i ~= -1) then x = x + i end		-- 这两句判断是排除从未学过轻功的人返回-1从而导致点数计算错误情况
	if (j ~= -1) then x = x + j end
	SetTaskTemp(21,n + GetMagicPoint() - x)			-- 把技能点当做空闲点数返还，但先扣除轻功等

---------------- 公共技能 ------------------------
	if (i ~= -1) then AddMagic(210,i) end			-- 如果学过轻功则加回原有等级
	if (j ~= -1) then AddMagic(400,j) end			-- 如果学过“劫富济贫”同样处理
--	DelMagic(396)
--	DelMagic(397)

------------------ 白名 --------------------------
--	DelMagic(395)

------------------ 各门派 ------------------------
	DelMagic(29)			-- 天王
	DelMagic(23)
	DelMagic(24)
	DelMagic(26)
	DelMagic(30)
	DelMagic(31)
	DelMagic(32)
	DelMagic(33)
	DelMagic(34)
	DelMagic(35)
	DelMagic(36)
	DelMagic(37)
	DelMagic(38)
	DelMagic(40)
	DelMagic(41)
	DelMagic(42)
	DelMagic(324)
--	DelMagic(322)
--	DelMagic(323)
--	DelMagic(325)
	
	DelMagic(10)			-- 少林
	DelMagic(3)
	DelMagic(4)
	DelMagic(5)
	DelMagic(6)
	DelMagic(7)
	DelMagic(8)
	DelMagic(9)
	DelMagic(12)
	DelMagic(14)
	DelMagic(13)
	DelMagic(15)
	DelMagic(271)
	DelMagic(16)
	DelMagic(18)
	DelMagic(20)
	DelMagic(11)
	DelMagic(19)
	DelMagic(21)
	DelMagic(273)
--	DelMagic(318)
--	DelMagic(319)
--	DelMagic(321)

	DelMagic(45)			-- 唐门
	DelMagic(43)
	DelMagic(347)
	DelMagic(303)
	DelMagic(44)
	DelMagic(47)
	DelMagic(48)
	DelMagic(50)
	DelMagic(51)
	DelMagic(54)
	DelMagic(343)
	DelMagic(345)
	DelMagic(349)
	DelMagic(55)
	DelMagic(57)
	DelMagic(58)
	DelMagic(249)
	DelMagic(253)
	DelMagic(341)
--	DelMagic(339)
--	DelMagic(302)
--	DelMagic(342)
	if (HaveMagic(351) ~= -1) then
		SetTaskTemp(20,351)
		DelMagic(351)
	end

	DelMagic(63)			-- 五毒
	DelMagic(60)
	DelMagic(61)
	DelMagic(62)
	DelMagic(64)
	DelMagic(65)
	DelMagic(66)
	DelMagic(67)
	DelMagic(68)
	DelMagic(384)
	DelMagic(69)
	DelMagic(356)
	DelMagic(70)
	DelMagic(72)
	DelMagic(73)
	DelMagic(74)
	DelMagic(76)
	DelMagic(71)
	DelMagic(75)
--	DelMagic(353)
--	DelMagic(355)
	if (HaveMagic(390) ~= -1) then
		SetTaskTemp(20,390)
		DelMagic(390)
	end

	DelMagic(80)			-- 峨嵋
	DelMagic(101)
	DelMagic(77)
	DelMagic(79)
	DelMagic(385)
	DelMagic(81)
	DelMagic(82)
	DelMagic(83)
	DelMagic(84)
	DelMagic(85)
	DelMagic(86)
	DelMagic(87)
	DelMagic(88)
	DelMagic(89)
	DelMagic(91)
	DelMagic(93)
	DelMagic(252)
	DelMagic(92)
	DelMagic(282)
--	DelMagic(328)
--	DelMagic(330)
	if (HaveMagic(332) ~= -1) then
		SetTaskTemp(20,332)
		DelMagic(332)
	end

	DelMagic(99)			-- 翠烟
	DelMagic(95)
	DelMagic(96)
	DelMagic(97)
	DelMagic(100)
	DelMagic(102)
	DelMagic(103)
	DelMagic(269)
	DelMagic(105)
	DelMagic(109)
	DelMagic(270)
	DelMagic(108)
	DelMagic(113)
	DelMagic(111)
	DelMagic(114)
--	DelMagic(336)
--	DelMagic(337)

	DelMagic(117)			-- 丐帮
	DelMagic(115)
	DelMagic(116)
	DelMagic(118)
	DelMagic(119)
	DelMagic(120)
	DelMagic(121)
	DelMagic(122)
	DelMagic(123)
	DelMagic(124)
	DelMagic(126)
	DelMagic(127)
	DelMagic(277)
	DelMagic(274)
	DelMagic(125)
	DelMagic(129)
	DelMagic(130)
	DelMagic(128)
	DelMagic(360)
--	DelMagic(357)
--	DelMagic(359)

	DelMagic(135)			-- 天忍
	DelMagic(131)
	DelMagic(132)
	DelMagic(134)
	DelMagic(136)
	DelMagic(137)
	DelMagic(138)
	DelMagic(139)
	DelMagic(140)
	DelMagic(364)
	DelMagic(141)
	DelMagic(142)
	DelMagic(143)
	DelMagic(145)
	DelMagic(146)
	DelMagic(147)
	DelMagic(148)
	DelMagic(149)
	DelMagic(150)
	DelMagic(254)
--	DelMagic(361)
--	DelMagic(362)
	if (HaveMagic(391) ~= -1) then
		SetTaskTemp(20,391)
		DelMagic(391)
	end

	DelMagic(153)			-- 武当
	DelMagic(151)
	DelMagic(152)
	DelMagic(155)
	DelMagic(156)
	DelMagic(157)
	DelMagic(158)
	DelMagic(159)
	DelMagic(160)
	DelMagic(161)
	DelMagic(162)
	DelMagic(164)
	DelMagic(165)
	DelMagic(166)
	DelMagic(267)
--	DelMagic(365)
--	DelMagic(368)

	DelMagic(169)			-- 昆仑
	DelMagic(167)
	DelMagic(168)
	DelMagic(392)
	DelMagic(170)
	DelMagic(171)
	DelMagic(393)
	DelMagic(174)
	DelMagic(175)
	DelMagic(177)
	DelMagic(178)
	DelMagic(179)
	DelMagic(180)
	DelMagic(173)
	DelMagic(90)
	DelMagic(181)
	DelMagic(183)
	DelMagic(184)
	DelMagic(172)
	DelMagic(176)
	DelMagic(182)
	DelMagic(275)
--	DelMagic(372)
--	DelMagic(374)
	if (HaveMagic(394) ~= -1) then
		SetTaskTemp(20,394)
		DelMagic(394)
	end
end

----------------- 重置潜能点，同时进行检查修复 ------------------------------
function rollback_prop()			-- 由于道具加潜能点存在不确定性，暂时取消修复功能（只写日志备查）
	if (GetTask(137) >= 20) then			-- 更新过技能的也不再更新潜能
		return 1
	else
		base_str = {35,20,25,30,20}			-- 五行人物的天生属性值
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1
--		AddProp(100)			-- 为避免没有未分配潜能点可供修复的极端情况，暂时“借”给他100点
		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- 将已分配潜能重置（task(88)是任务中直接奖励的力量、身法等）
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
--		AddProp(-100)			-- 还债
--		if (GetTask(81) == 0) then		-- 如果用过洗髓经，潜能点没有固定标准，则无法检验修复（因此只有未用过书的才检验修复）
			player_prop = GetProp()										-- 检查玩家潜能总数是否正确。包含任务与道具加的潜能点，不包含临时点数
			std_prop = (GetLevel()-1)*5 + GetByte(GetTask(86),1)
			if (player_prop ~= std_prop) then						-- 如果不一致则修正（取消修正，只写日志）
--				AddProp(std_prop - player_prop)
				x = GetByte(Utask88,1)+GetByte(Utask88,2)+GetByte(Utask88,3)+GetByte(Utask88,4)
				WriteLog(date("%H时%M分%S秒").."： 帐号“"..GetAccount().."”的角色“"..GetName().."”潜能更新异常记录：等级"..GetLevel().."，现有潜能点"..player_prop.."，应有潜能点"..std_prop.."点（任务加"..GetByte(GetTask(86),1).."点(道具加"..GetTask(81).."点，任务直接加属性共"..x.."点未包含在内)）。")
			end
--		end
		Msg2Player("您的潜能点已经重置，请注意重新投点。")
	end
end
