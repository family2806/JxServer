--description: 唐门普通弟子 竹海三关出口
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(11) == 1 then
		allbrother_0801_FindNpcTaskDialog(11)
		return 0;
	end
	UTask_tm = GetTask(2);
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 80) then			--入门任务
		if (HaveItem(33) == 1) and (HaveItem(34) == 1) and (HaveItem(35) == 1) then
			Uworld37_prise()
		else
			Talk(1,"","你要得到青白紫三柄竹杖才行!")
		end
	elseif (Uworld37 < 80) then						--尚未入门
		Talk(1,"","想通过竹海三关，必须得到青白紫三柄竹杖.")
--	elseif (GetFaction() == "tangmen") then			--已经入门，尚未出师
--		Talk(1,"","唐门庄丁：大家都是同门兄弟，你不必再闯这里面的竹海三关了！")
	elseif (UTask_tm >= 70*256) and (GetFaction() ~= "tangmen") then						--已经出师
		Talk(1,"","本门以暗器和陷阱独步天下，江湖人谁也不敢小觑了咱们！日后行走江湖，可不要堕了本门的威风。")
	else
		Talk(1,"","竹海危险，要极其小心!")
	end
end;

function Uworld37_prise()
	Talk(1,"","你已顺利过关，成为本门记名弟子! ")
	DelItem(33)
	DelItem(34)
	DelItem(35)
	UTask_world37 = SetByte(GetTask(37),1,127)
	i = ReturnRepute(25,19,4)		-- 缺省声望，最大无损耗等级，每级递减率
	SetTask(37,UTask_world37)
	AddRepute(i)		-- 加声望
	Msg2Player("把三根竹杖带到竹海三关出口，交给唐门防议师，完成任务，成为唐门记名弟子，名望增加"..i.."点.")
	AddNote("在竹海三关出口，把3根竹杖交给唐门壮丁，完成记名弟子任务")
end;
