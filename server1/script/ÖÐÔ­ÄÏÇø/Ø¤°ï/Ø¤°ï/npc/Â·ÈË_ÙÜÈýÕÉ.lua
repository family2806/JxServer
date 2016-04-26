-- 丐帮 掌砵长老佘三丈 入门任务、出师任务
-- by：Dan_Deng(2003-07-28)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(209) == 1 then
		allbrother_0801_FindNpcTaskDialog(209)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 60*256+10) then		-- 出师任务中
			if (HaveItem(211)==1) and (HaveItem(201)==1) and (HaveItem(208)==1) and (HaveItem(209)==1) and (HaveItem(210)==1) and (HaveItem(206)==1) and (HaveItem(207)==1) and (HaveItem(200)==1) and (HaveItem(205)==1) then
				L60_prise()
			else
				Talk(1,"","只需要拿到9个袋子，就可以顺利出师，加油! ")
			end
		elseif (UTask_gb == 60*256) and (GetLevel() >= 50) then		--出师任务启动
			Say("本帮弟子，凡是想出师者，必须进入本帮祥云洞，找齐九个布袋，你有胆量去闯密洞吗? ",2,"当然有. /L60_get_yes","我还不想出师/no")
		else
			Talk(1,"","本帮谁都苦，哈哈。大家团结起来可以把本帮发扬光大.")
		end
	elseif (Uworld30 == 10) then		--入门任务进行中
		if (HaveItem(72) == 1) and (HaveItem(73) == 1) and (HaveItem(74) == 1) and (HaveItem(75) ==1) then
			Talk(1,"enroll_prise","佘长老，弟子已经找到4件")
		else
			Talk(1,""," 我要的四件还没有，你真是差劲")
		end
	elseif (Uworld30 == 0) and (GetLevel() >=10) and (GetFaction() ~= "gaibang") then		--入门任务启动
		Say("不要小看叫花子，虽然乞讨，但是也有见识，想试试吗?",2,"好，我试试. /enroll_get_yes","不，我只是参观. /enroll_get_no")
	else
		Talk(1,"","帮中兄弟平日虽然有点苦，但是，很团结。有饭一起吃，有酒一起喝。外人不会懂得我们的快乐的!")
	end
end;

function enroll_get_yes()
	Talk(1, "", "好了，我让你试试，你快去扬州帮我找四件物品")
	Uworld30 = SetByte(GetTask(30),2,10)
	SetTask(30,Uworld30)
	AddNote("接任务：去扬州找4件物品 ")
	Msg2Player("接任务：去扬州找4件物品")
end;

function enroll_prise()
	Talk(1,"","哈哈哈，你真是有乞讨的天分，好，我收你为记名弟子! ")
	DelItem(72)
	DelItem(73)
	DelItem(74)
	DelItem(75)
	i = ReturnRepute(15,29,2)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld30 = SetByte(GetTask(30),2,127)
	SetTask(30,Uworld30)
	AddNote("完成任务，成为丐帮正式弟子 <color=Red> <color>. ")
	Msg2Player("完成任务，成为丐帮正式弟子 ")
end;

function L60_get_yes()
	SetTask(8,60*256+10)
	AddNote("接出师任务：进入秘洞，找9个袋子 ")
	Msg2Player("接出师任务：进入秘洞，找9个袋子 ")
end;

function L60_prise()
	DelItem(211)
	DelItem(201)
	DelItem(208)
	DelItem(209)
	DelItem(210)
	DelItem(206)
	DelItem(207)
	DelItem(200)
	DelItem(205)
	SetRank(68)
	SetTask(8, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("带5个袋子返回丐帮，完成出师任务，被封为逍遥神丐. ")
	Msg2Player("恭喜你顺利出师，被封为逍遥神丐 ")
end;

function no()
end;
