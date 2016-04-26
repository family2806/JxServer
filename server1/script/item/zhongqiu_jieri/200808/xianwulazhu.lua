--zhongchaolong
--仙舞蜡烛
--8个小时之内打怪会获得经验翻倍
--100%概率让1个【走马灯】同时出现。走马灯的存在时间为5分钟.
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")

local tbNpcList =
{
	{szName = "灶君灯笼", nLevel = 1, nNpcId = 1220, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	
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
	AddSkillState(892, 1, 1, 18*60*60*8);
	local nMapId,nPosX,nPosY = GetWorldPos()
	zhongqiu0808_CallNpc(%tbNpcList[1], nMapId, (nPosX + random(-2,2))*32, (nPosY + random(-2,2))*32 )
end