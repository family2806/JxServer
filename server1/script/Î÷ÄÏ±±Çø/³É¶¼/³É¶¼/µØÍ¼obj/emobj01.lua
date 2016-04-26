--description: 西南北区 成都府 峨嵋派10级任务亮银矿
--author: yuanlan	
--date: 2003/5/24

function main()
	SetPropState()
	AddEventItem(118)
	Msg2Player("捡到一块亮银矿. ")
	if (GetTask(1) > 10*256) and (GetTask(1) < 20*256) then
		AddNote("在成都西边的树林里找到一块亮银矿. ")
	end
end;
