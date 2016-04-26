Include("\\script\\missions\\dungeon\\dungeons\\shiliantang\\shiliantang.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local _CallTower = function()
	tbDungeonManager:DoTempletFun("������", "CallTower")
end

local _CallBackTower = function()
	tbDungeonManager:DoTempletFun("������", "CallBackTower")
end

function main()
	local szTitle = "<color=yellow>�ٻ��� <color> ��ָ���ص㣬�����ٻ�<color=red>������ <color>, Ҳ�����ٻ�<color=red> ����λ�õĹ����� <color> ."
	
	if tbDungeonManager:DoTempletFun("������", "CheckOwnerInDungeon") then
		local tbOpt = 
		{
			{"�ڴ��ٻ�������", %_CallTower},
			{"�������ٻ�������", %_CallBackTower},
			{"ȡ�� "}
		}
		CreateNewSayEx(szTitle, tbOpt)
	end

	return 1
end