--description: 峨嵋派高人 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	
	if allbrother_0801_CheckIsDialog(1) == 1 then
		allbrother_0801_FindNpcTaskDialog(1)
		return 0;
	end
	
	
	UTask_em = GetTask(1)
	if (UTask_em == 40*256+10) then
		Talk(1,"","有什么事，先打败我养的<color=Red>灵兽<color>再说.")
		AddNote("找到一个隐居高人，想获得他的帮助，就要打败他养的灵兽")
	elseif (UTask_em == 40*256+20) then
		Say("想要曲谱，拿徽宗名作<color=Red>《芙蓉锦鸡图》<color>来换. 此画现落在成都府太平镖局手里，有本事你就拿来")
		SetTask(1, 40*256+40)
		AddNote("打败灵兽，接任务到镖局把芙蓉锦鸡图带回去")
		Msg2Player("高人要求用芙蓉锦鸡图换百鸟朝凤曲谱")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 1)) then						--得到芙蓉锦鸡图
		Talk(6, "select", "这个真的是芙蓉锦鸡图.", "这真的是徽宗的真迹，哈哈哈，我朝思暮想，终于得到啦!", "现在你可以把《百鸟朝凤》的曲谱给我了吧?", "这...", "你是前辈高人，可不能言而无信，否则会被天下人耻笑的.", "我又没说不给，这就是曲谱，你拿去吧!")
	elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 0)) then
		AddEventItem(22)
		Talk(3,"","没看到百鸟朝凤曲谱啊？因为你不拿，不拿怪我","前辈高人还来骗晚辈，如果这个传出去，名誉就会 ","行了，我怕你了，快拿曲谱吧")
	elseif (UTask_em >= 40*256+40) and (UTask_em < 40*256+80) then
		Talk(1,"","想要曲谱啊？拿<color=Red>'芙蓉锦鸡图'<color> 来换.")
	elseif (UTask_em >= 40*256+80) then
		Talk(1,"","芙蓉锦鸡图真是妙，看一辈子也不腻.")
	else
		Talk(1,"","闲人别来打扰我!")
	end
end;

function select()
	DelItem(21)
	AddEventItem(22)
	SetTask(1, 40*256+80)
	AddNote("芙蓉锦鸡图换百鸟朝凤曲谱. ")
	Msg2Player("获得百鸟朝凤曲谱")
end; 
