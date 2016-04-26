-- 文件名　：tianzhibaoxiang.lua
-- 创建者　：wangjingjun
-- 内容　　：天之宝箱 
-- 创建时间：2011-10-01 01:12:36

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")

local nProtectTime = 60  -- 天之宝箱具有60秒保护时间

function main()
--	print("天之宝箱被点击")
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if check(nNpcIdx, PlayerIndex) ~= 1 then
		Msg2Player("你不能领取别人的物品")
		return
	end
	--开启进度条
	tbProgressBar:OpenByConfig(11, getbox, {nNpcIdx, dwNpcId},onbreak)

end

function check(nNpcIdx, nPlayerIndex)
	local tbCreatTime = GetNpcParam(nNpcIdx, 1)
	local nNowTime = GetLocalTime()
	if nNowTime-tbCreatTime > %nProtectTime then
		return 1
	end
	local nTeamSize = GetNpcParam(nNpcIdx, 2)
	local tbTeam = {}
	for i=1, nTeamSize do
		if nPlayerIndex == GetNpcParam(nNpcIdx, i + 2) then
			return 1
		end
	end
	return 0
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function onbreak()
	Msg2Player("收集中断")
end

function getbox(nNpcIndex, dwNpcId)
--	print("nNpcIndex = " .. nNpcIndex)
	local tbAward = { {szName="Boss宝箱",tbProp={6,1,3021,1,0,0},} }
--	print("采集成功")
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	DelNpc(nNpcIndex)
--	print("给奖励")
	tbAwardTemplet:Give(tbAward, 1, {"goldbossadjust_2011", "click_tianzhibaoxiang"} )
	return 1
end
