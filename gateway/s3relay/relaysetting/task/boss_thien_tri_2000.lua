--��������ܾ�boss�Ĳ���20h - Created by DinhHQ - 20120404

function TaskShedule()
	TaskName("Boss ���-20h")
	TaskInterval(24 * 60)
	TaskTime(20, 00)
	TaskCountLimit(0)
	OutputMsg("tianchimijing boss out")
end

function TaskContent()	
	RemoteExecute("\\script\\missions\\tianchimijing\\floor4\\bosstimer.lua",	"GameFloor4:CallBoss", 0)
	OutputMsg("tianchimijing boss out")
end
