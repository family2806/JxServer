--description: 唐门普通弟子 竹海三关入口
--author: yuanlan	
--date: 2003/3/7
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(8) == 1 then
		allbrother_0801_FindNpcTaskDialog(8)
		return 0;
	end
	UTask_tm = GetTask(2)
	UTask_wu = GetTask(10)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 0) and (GetLevel() >=10) and (GetFaction() ~= "tangmen") then		--入门任务启动
		Say("要想加入本门，必须闯过<color=Red>竹海三关<color>，你要闯关吗?", 2, "闯关/enroll_get_yes", "不闯 /no")
	elseif (Uworld37 > 0) and (Uworld37 < 20) then			--任务中
		Talk(1,"","想拿到<color=Red>青色竹杖<color> 需要打败<color=Red>第一关里的大马猴<color> .")
--，想得到<color=Red>白色竹杖<color>你必须去第二关找一个<color=Red>庄丁<color>，最后一柄<color=Red>紫色竹杖<color>在第三关的<color=Red>庄丁<color>手上。得到三柄竹杖后交给<color=Red>出口的庄丁<color>，才能算是过关。
--	elseif (GetFaction() == "tangmen") then			--已经入门，尚未出师
--		Talk(1,"","唐门庄丁：大家都是同门兄弟，你不必再闯这里面的竹海三关了！")
	elseif (UTask_tm >= 70*256) then						--已经出师
		Talk(1,"","本门以暗器和陷阱独步天下，江湖人谁也不敢小觑了咱们！日后行走江湖，可不要堕了本门的威风! ")
	else
		Talk(1,"","本门不欢迎陌生人随意进出.")
	end
end;

function enroll_get_yes()
	Talk(2, "", "拿到 <color=Red>青白紫三柄竹杖<color> 在 <color=Red><color> 竹海三关，然后交给出口的人，才能算是过关.", "想拿到<color=Red>青色竹杖<color> 需要打败<color=Red>第一关里的大马猴<color> , <color=Red>白色竹杖<color> 必须去第二关找一个<color=Red>庄丁<color>, <color=Red>紫色竹杖<color>在第三关的<color=Red>庄丁<color>手上.")
	Uworld37 = SetByte(GetTask(37),1,20)
	SetTask(37,Uworld37)
	AddNote("到竹海三关见唐门壮丁，接任务<color=red>记名弟子<color>, 过竹海三关拿到青白紫三柄竹杖. ")
--	AddNote("到唐门记名弟子任务：闯过竹海三关并得到青、白、紫三柄竹杖。")
end;

function no()
end;
