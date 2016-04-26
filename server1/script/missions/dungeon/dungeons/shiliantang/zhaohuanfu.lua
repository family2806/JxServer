Include("\\script\\missions\\dungeon\\dungeons\\shiliantang\\shiliantang.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local _CallTower = function()
	tbDungeonManager:DoTempletFun("试炼堂", "CallTower")
end

local _CallBackTower = function()
	tbDungeonManager:DoTempletFun("试炼堂", "CallBackTower")
end

function main()
	local szTitle = "<color=yellow>召唤符 <color> 在指定地点，可以召唤<color=red>弓箭手 <color>, 也可以召唤<color=red> 其他位置的弓箭手 <color> ."
	
	if tbDungeonManager:DoTempletFun("试炼堂", "CheckOwnerInDungeon") then
		local tbOpt = 
		{
			{"在此召唤弓箭手", %_CallTower},
			{"在这里召唤弓箭手", %_CallBackTower},
			{"取消 "}
		}
		CreateNewSayEx(szTitle, tbOpt)
	end

	return 1
end