--description: 唐门普通弟子 竹海第二关
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(9) == 1 then
		allbrother_0801_FindNpcTaskDialog(9)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 20) then					--入门任务
		if (HaveItem(33) == 1) then
			Talk(1,"enroll_V2_Q1","这个竹杖对了，现在回答一个问题!")
		else
			Talk(1,"","获得<color=Red>青色竹杖<color> 后再来找我!")
		end
	elseif (Uworld37 >= 60) and (Uworld37 < 127) then						--已经过了这一关
		if (HaveItem(34) == 1) then
			Talk(1,"","要想顺利过关，你必须拿齐三柄竹杖，然后交给出口的人.")
		else
			AddEventItem(34)
			Talk(1,"","为什么你把竹杖扔在树林里？我会帮你捡回来，不要再乱扔了! ")
		end
	else
		Talk(1,"","在这里长时间才知道，原来大马猴也懂人性.")
	end
end;

function enroll_V2_Q1()
	Say("九宫阵有九个格子，倘若每个格子填上适当的数字，就能够使填充后不论纵横斜角，每三个数字相加都是十五，你知道怎么填吗？第一行", 3, "4, 9, 2 /False1", "2, 4, 9 /False1", "2, 9, 4 /enroll_V2_Q2")
end;

function False1()
	Talk(1,"","不对，这四周的<color=Red>大马猴、大野猴<color>可比你聪明啊，它们都知道呢!")
end;

function enroll_V2_Q2()
	Say("答对了，那第二行呢?", 3, "7, 5, 3 /enroll_V2_Q3", "5, 3, 7 /False2", "5, 7, 3 /False2")
end;

function False2()
	Talk(1,"","不对，还是去问问这四周的<color=Red>大马猴、大野猴<color>吧! ")
end;

function enroll_V2_Q3()
	Say("不错，那最后一行该怎么填:", 3, "6, 8, 1 /False3", "8, 1, 6 /False3", "6, 1, 8 /enroll_V2_prise")
end;

function False3()
	Talk(1,"","不对，为什么不去问问这四周的<color=Red>大马猴、大野猴<color>呢")
end;

function enroll_V2_prise()
	Talk(1,"","很好，你全都答对了。白色竹杖给你，可别弄丢了！去第三关找另一个庄丁拿<color=Red>紫色竹杖<color>吧!")
	AddEventItem(34)
	Msg2Player("在第二关回答唐门壮丁九宫阵问题，获得白色竹杖. ")
	Uworld37 = SetByte(GetTask(37),1,60)
	SetTask(37,Uworld37)
	AddNote("在第二关回答唐门壮丁九宫阵问题，获得白色竹杖. ")
end;
