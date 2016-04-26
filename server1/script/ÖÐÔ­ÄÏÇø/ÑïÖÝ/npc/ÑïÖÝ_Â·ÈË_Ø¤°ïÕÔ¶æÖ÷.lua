-- 扬州 路人NPC 丐帮赵舵主（丐帮30级任务）
-- by：Dan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(193) == 1 then
		allbrother_0801_FindNpcTaskDialog(193)
		return 0;
	end
	UTask_gb = GetTask(8)
	if (UTask_gb == 30*256+10) then		--30级任务开始
		Talk(3,"","赵舵主，罗长老派我来了解一下这个月的文书为什么迟迟没有上交!","你有所不知，最近出了一件怪事，本舵弟子经常会去城西北的蜀冈山打点鸟兽，但是这几日有好几批去打猎的弟子都失踪了，前往寻找的弟子也一去不回","有这事？弟子将去一趟蜀岗山!")
		SetTask(8,30*256+20)
		AddNote("赵舵主告诉你在蜀岗山有弟子失踪，你决定去调查")
		Msg2Player("赵舵主告诉你在蜀岗山有弟子失踪，你决定去调查")
	elseif (UTask_gb == 30*256+30) then		--30级任务结束
		Talk(3,"","赵舵主，其实蜀冈山里根本没有什么鬼怪，那些失踪的兄弟只不过是被金兵抓起来了，我已经救出了所有的同门","原来如此，你年纪轻轻，倒是有勇有谋，前途不可限量啊，佩服!","这封文书麻烦你替我交给孟长老，我已经在其中写明了事情的前因后果，他一看自会明了!")
		SetTask(8,30*256+40)
		AddEventItem(81)
		AddNote("救得被抓弟子，告诉赵舵主实情，获得文书 ")
		Msg2Player("救得被抓弟子，告诉赵舵主实情，获得文书")
	elseif ((UTask_gb == 30*256+40) and (HaveItem(81) == 0)) then		-- 任务中，道具丢了
		Talk(1,"","丢了啊？苦了我，又要写一遍!")
		AddEventItem(81)
	else
		Talk(1,"","金兵胡作非为，看来扬州不安宁了!")
	end
end;
