--description: 唐门普通弟子 竹海第三关
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(10) == 1 then
		allbrother_0801_FindNpcTaskDialog(10)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then					--入门任务
		if (HaveItem(33) == 0) then
			Talk(1,"","拿到青色竹杖后来找我!")
		elseif (HaveItem(34) == 0) then
			Talk(1,"","拿到白色竹杖后来找我!")
		else
			Talk(1,"enroll_V3_Q1","答对我的三卦，就可以得到<color=Red>紫色竹杖<color>，听清楚了:")
		end
	elseif (Uworld37 == 80) then						--已经过了三关
		if (HaveItem(35) == 1) then
			Talk(1,"","要想顺利过关，你必须拿齐三柄竹杖，然后交给出口的人.")
		else
			AddEventItem(35)
			Talk(1,"","为什么把竹杖乱扔在树林里，我帮你捡回来，不要再乱扔了! ")
		end
	elseif (GetFaction() == "tangmen") then
		Talk(1,"","大家都是同门兄弟，你不用冲进竹海三关! ")
	else
		Talk(1,"","不要乱跑，小心被猴子咬!")
	end
end;

function enroll_V3_Q1()
	Say("第一卦是“正南与正东:", 3, "烈火轰雷 /enroll_V3_Q2", "水火不容 /False1", "煽风点火/False1")
end;

function False1()
	Talk(1,"","第一卦就答错了，也许那些猴子们会告诉你.")
end;

function enroll_V3_Q2()
	Say("对了，听好，第二卦是“东南与正北':", 3, "山高水长 /False2", "风生水起 /enroll_V3_Q3", "雷厉风行 /False2")
end;

function False2()
	Talk(1,"","不对，为什么不去问问那些猴子呢?")
end;

function enroll_V3_Q3()
	Say("不错，最后一卦是“西北与西南”：", 3, "风行水上 /False3", "天崩地裂 /enroll_V3_prise", "山清水秀 /False3")
end;	

function False3()
	Talk(1,"","错了，别以为人一定比猴子聪明，说不定它们比你知道得还多呢! ")
end;

function enroll_V3_prise()
	Talk(1,"","三卦你全都答对了，这是你要的紫色竹杖。如果你三柄竹杖都已拿齐，就可以去交给出口的人，顺利过关了.")
	AddEventItem(35)
	Msg2Player("在第三关回答唐门壮丁8卦问题，获得紫竹杖. ")
	Uworld37 = SetByte(GetTask(37),1,80)
	SetTask(37,Uworld37)
	AddNote("在第三关回答唐门壮丁8卦问题，获得紫竹杖. ")
end;	
