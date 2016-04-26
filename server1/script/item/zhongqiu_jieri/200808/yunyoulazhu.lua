--zhongchaolong
--云游蜡烛
--1个小时之内打怪会获得经验翻倍
--100%概率让4种灯笼【 蝴蝶灯笼 】，【 五角星灯笼 】，【 圆灯笼 】，【 长灯笼 】同时出现，存在时间为5分钟。
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")

local tbNpcList =
{
	{szName = "蝴蝶灯笼", nLevel = 1, nNpcId = 1215, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "星星灯笼", nLevel = 1, nNpcId = 1216,nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "圆灯笼", nLevel = 1, nNpcId = 1218, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "长管灯笼", nLevel = 1, nNpcId = 1217, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	
}

function main()
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("该物品已过期.",0)
		return 0;
	end
--	if zhongqiu0808_PlayerLimit() ~= 1 then
--		
--		Say("必须是50级以上的充值玩家。", 0)
--		return 1
--	end
	AddSkillState(892, 1, 1, 18*60*60);
	
	
	local nMapId,nPosX,nPosY = GetWorldPos()
	zhongqiu0808_CallNpc(%tbNpcList[random(1,getn(%tbNpcList))], nMapId, (nPosX + random(-5,5))*32, (nPosY + random(-5,5))*32 )
	
	
end