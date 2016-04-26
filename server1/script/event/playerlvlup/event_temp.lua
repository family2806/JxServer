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

SKILLS_TEMP_90 = {
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
function OnLevelUp_Temp()
	--“全区闪电冲级行动”活动，凡有任务都可以自习到90级技能，但不能获得经验翻倍
	local flag = GetTask(TKID_PLAYERLEVELUP)
	if(flag ~= TKVAL_PLAYERLEVELUP_OPEN ) then
		return
	end
	
	local faction = GetLastFactionNumber()
	if(faction == -1) then
		return
	end
	
	local level = GetLevel()
	if ( level < 80) then
		return
	end
	
	local mark = 0
	for i=1,getn(SKILLS_TEMP_90[faction+1]) do
		if ( HaveMagic(SKILLS_TEMP_90[faction+1][i][1]) < SKILLS_TEMP_90[faction+1][i][2] ) then
			AddMagic(SKILLS_TEMP_90[faction+1][i][1],SKILLS_TEMP_90[faction+1][i][2])
			mark = mark + 1
		end
	end
	if (mark == 0) then
		return
	end
	Msg2Player("祝贺你在这次‘练级活动’中成功完成任务，同时学会90级技能")
	return
end