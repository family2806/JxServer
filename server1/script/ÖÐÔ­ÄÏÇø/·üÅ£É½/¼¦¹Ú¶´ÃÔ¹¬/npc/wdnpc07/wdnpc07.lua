--description: 武当派润娘　武当40级任务
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(13) == 1 then
		allbrother_0801_FindNpcTaskDialog(13)
		return 0;
	end
	UTask_wd = GetTask(5);
	if (UTask_wd == 40*256+40) and (HaveItem(163) == 1) then		-- 已经打败老虎
		Talk(2, "L40_step", "武当派的武功果然不凡，我的高手弟子都被他打败了，道一老儿?", " 道一真人是我的宗师，他让我带信给你!")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,"","看到那5只白虎了吗？有本事先打败它们，再来找我! ")
		AddNote("在伏牛山鸡冠洞，找润娘，需要打败五只白玉虎 ")
		Msg2Player("在伏牛山鸡冠洞，找润娘，需要打败五只白玉虎")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 0) then						--已经打败五虎，尚未拿到回信
		Talk(1,"","我的回信放在洞里，你有本事就进去拿吧!")
	elseif (UTask_wd >= 40*256+60) then						--拿到回信后
		Talk(1,"","原料他也知道错了，早点不是更好!")
	else
		Talk(1,"","你是谁？敢进洞，真是不想活了?")
	end
end;

function L40_step()
	Talk(1,"","道一真人懂教弟子，信呢，我看看。原来是他想我道歉，早知如此，何必当初。你是他的弟子，我就不为难你。我也有一封信让你带给他。信")
	DelItem(163)
	SetTask(5, 40*256+60)
	AddNote("打败五只白虎后，才知道信被润娘藏于洞内")
	Msg2Player("信被润娘藏于洞内，找到它交给掌门")
end;
