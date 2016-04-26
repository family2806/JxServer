--========文件定义==================================--
--文件名：/script/event/playerlvlup/event.lua
--作者：yfeng
--创建日期：2005-3-31
--最后修改日期：
--功能叙述：
--	全区全服闪电冲级行动
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--
if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_PLAYERLEVELUP = 1081	--任务变量编号，记录冲级活动的各种状态
TKVAL_PLAYERLEVELUP_OPEN = 1 --参加冲级活动

SKILLS = {
	{	{318,1},{319,1},{321,1}}, --少林
	{	{322,1},{323,1},{325,1}}, --天王
	{	{339,1},{302,1},{342,1},{351,0}}, --唐门
	{	{353,1},{355,1},{390,0}}, --五毒
	{	{328,1},{380,1},{332,0}}, --峨嵋
	{	{336,1},{337,1}}, --翠烟
	{	{357,1},{359,1}}, --丐帮
	{	{361,1},{362,1},{391,0}}, --天忍
	{	{365,1},{368,1}}, --武当
	{	{372,1},{375,1},{394,0}}, --昆仑
}

--========类定义====================================--
--类名：EPlayerLevelUp
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	全区全服玩家闪电冲级活动的具体功能
--成员变量：
--成员函数：
--.GiveTask()
--.PlayerLevelUp()
--==================================================--
EPlayerLevelUp = {
--========函数定义==================================--
--函数原形：.GiveTask()
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	给玩家发闪电冲级任务
--==================================================--
	GiveTask = function()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			Talk(1,"","不好意思！活动时间已结束!")
			return
		end
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if (flag == TKVAL_PLAYERLEVELUP_OPEN) then
			Talk(1,"","是不是已经报名参加'练级活动'了吗?怎么又来了？")
			return
		end
		local level = GetLevel()
		if(	level > 49 and level < 71 ) then
			SetTask(TKID_PLAYERLEVELUP,TKVAL_PLAYERLEVELUP_OPEN)
			Talk(1,"","你已经报名参加'练级活动'了.加油练到80级!")
			Msg2Player("你已接受练级任务，赶快去练功!")
			return
		end
		Talk(1,"","不好意思，你的等级不符合参加‘练级活动’的要求!")
		return
	end,
--========函数定义==================================--
--函数原形：EPlayerLevelUp.OnLevelUp()
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	参加活动的玩家，每升一级，得到2小时经验翻倍
--==================================================--
	OnLevelUp = function ()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			return
		end
		local level = GetLevel()
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if(flag == TKVAL_PLAYERLEVELUP_OPEN) then
			if(level < 80 and level > 49 ) then
				EPlayerLevelUp.payDoubleExp()
				return	
			elseif(level == 80) then
				EPlayerLevelUp.payAdvSkills()
			end
		end
	end,
	
	payDoubleExp = function()
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461,1, 1,2*60*60*18)
		Msg2Player("恭喜你在‘练级活动’中升级了，系统送给你了2小时的双倍经验.")
	end,
	
	payAdvSkills = function()
		local faction = GetLastFactionNumber()
		if(faction ~= -1) then
			for i=1,getn(SKILLS[faction+1]) do
				AddMagic(SKILLS[faction+1][i][1],SKILLS[faction+1][i][2])
			end
			Msg2Player("恭喜你在此次‘练级活动’中成功完成任务，同时学会90级技能")
			AddGlobalNews("大家一同祝贺"..GetName().."在‘练级活动’中成功完成任务，同时学会90级技能")
			return
		end
		Msg2Player("恭喜你在‘练级活动’中成功完成任务")
	end,
}

--========函数定义==================================--
--函数原形：PlayerLevelUp
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	礼官开启活动的对话
--参数：
--返回值：
--用例：
--==================================================--
function BTNPlayerLevelUp()
	local msg = "欢迎参加‘练级活动’. 50到70级玩家都可以报名参加，只需在活动期间升到80级就可以立即学习90级技能"
	local btns = {
		"我想报名参加/JoinPlayerLevelUp",
		"我想了解更多一点/AboutPlayerLevelUp"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

--========函数定义==================================--
--函数原形：JoinPlayerLevelUp
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	报名参加活动
--==================================================--
function JoinPlayerLevelUp()
	EPlayerLevelUp.GiveTask()
end

--========函数定义==================================--
--函数原形：AboutPlayerLevelUp()
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	关于冲击活动的介绍
--==================================================--
function AboutPlayerLevelUp()
	local msg = ": 50到70级(包括50级和70级) 可以到礼官处报名参加‘练级活动’。礼官会指引你80级任务的目标。在报名参加等级以后玩家每次升级，就可以得到2小时双倍经验值(死后将失去双倍效果)，到了80级，达到练级目标之后，你将学习90级技能（扣除白名)."
	local btns ={
		"参加活动/BTNPlayerLevelUp",
		"退出/Quit",
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

