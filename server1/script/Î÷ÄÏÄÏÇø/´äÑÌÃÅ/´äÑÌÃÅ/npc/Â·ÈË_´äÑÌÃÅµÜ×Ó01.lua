-- 翠烟门 翠烟门弟子1 入门任务
-- by：Dan_Deng(2003-07-25)

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--入门任务进行中
		Talk(1,"U36_enter","进入战场后，获得情花，到<color=Red>花魁出口<color>交给师姐就行.")
	elseif (Uworld36 == 0) and (GetLevel() >=10) and (GetFaction() ~= "cuiyan") then		--入门任务
		Say("根据门规，想成为记名弟子，需要过<color=Red>花魁阵<color>, 凭借勇敢和智慧获得<color=Green>情花<color>, 你想试试吗?",2,"可以，让我试试/enroll_yes","不，我只是来参观. /no")
	elseif (GetFaction() == "cuiyan") then			-- 同门
		Say("师妹想到花魁阵练功啊?",2,"对，请师姐让妹妹进去/U36_enter","我只是来看望师姐/no")
	elseif (UTask_cy == 70*256) then
		Talk(1,"","师姐此次回来是看望各位师妹，有什么变化吗?")
	else
		Talk(1,"","欢迎尊客驾临，请从花魁阵旁边的路进去.")
	end
end;

function enroll_yes()
	Talk(1, "U36_enter", "这里是 <color=Red>入口<color>. 进入阵拿到情花交给师姐就行.")
	Uworld36 = SetByte(GetTask(36),2,10)
	SetTask(36,Uworld36)
	AddNote("接花魁任务，获得情花，带回去给在出口的翠烟门弟子")
	Msg2Player("接花魁任务，获得情花，带回去给在出口的翠烟门弟子")
end;

function U36_enter()
--	SetPos(207,1693)
	SetPos(210,1622)
end

function no()
end;
