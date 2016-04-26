Include("\\script\\missions\\bw\\bwhead.lua");

function main()
	Say("你想要离开比赛擂台是吧?",3,"是的，我离开一下!/yes","我是队长, 想要知道第几个上场比赛./OnShowKey","不需要/no")
end;

function yes()
	LeaveGame();
	NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
end

function no()
end
