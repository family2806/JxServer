--description: 唐门唐闲 50级任务 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 50*256) and (GetLevel() >= 50) then		--50级任务启动
			Talk(3, "L50_step0", "这可如何是好!", "唐闲师叔，发生了什么事?", "你有所不知，本堂著有<color=Red>一部 color>'《暗器谱》 ，分为上下两册，上面详细记载了本门所有暗器的制法和用法，乃是本门绝不外传的秘笈。此秘笈由我保管，为安全起见，我将上下两册分放在两个铁盒里，可是今天我却发现铁盒中的上册被人调换成一本无字天书。秘笈遗失，这可是非同小可的事啊!")
		elseif (UTask_tm == 50*256+80) then
			if ( HaveItem(48) == 1) then					--有暗器谱
				Talk(2, "L50_prise", "唐闲师叔，原来偷《暗器谱》的人是三师兄唐禾，我已经把秘笈夺回来，你看是不是真的?", "不错，这就是那本遗失的《暗器谱》，你为本堂消解了一场弥天大祸，真是功劳不小啊!")
			else									--丢失处理
				Talk(1,"","虽然找出了叛徒唐禾，但是不把暗器谱找回来是不行的!")
			end
		elseif (UTask_tm > 50*256) and (UTask_tm < 60*256) then					--尚未完成50级任务
			Talk(1,"","唐闲：秘笈被盗，非同小可，不仅老夫脱不了干系，还可能牵连许多无辜的人!")
		elseif (UTask_tm >= 60*256) then					--已经完成50级任务，尚未出师
			Talk(1,"","幸亏你消解了这场弥天大祸，否则后果不堪设想!")
		else
			Talk(1,"","暗器功夫，你有什么不懂的地方可以问老夫!")
		end
	elseif (UTask_tm >= 70*256) then							--已经出师
		Talk(1,"","江湖上，明枪易躲，暗箭难防.")
	else											-- 缺省对话
		Talk(1,"","天下的暗器功夫，如果老夫认了第二，没人敢认第一，你服不服气?")
	end
end;

function L50_step0()
	Talk(2,"L50_get","本门戒备森严，外人不懂秘笈藏在哪里，想偷也偷不到，所以，盗秘笈的人神出鬼没，一定也可以接近盗贼。我怀疑有内奸，但是此事关系重大，如果告诉掌门，将引起轩然大波，我只希望快点找到盗贼，会把此事平息!", "秘笈什么时候被盗的?")
end;

function L50_get()
	Say("根据推断，秘笈应该是昨天被盗走的!", 2, "帮助寻找秘笈/L50_get_yes", "无能为力/L50_get_no")
end;

function L50_get_yes()
	Talk(1,"","我去向其他人<color=Red>打听打听<color>，说不定会有什么线索!")
	SetTask(2, 50*256+20)
	AddNote("在暗器房见到唐闲(504, 317) , 接<color=red>找暗器谱任务color> ")
	Msg2Player("接暗器谱任务，去找被盗的暗器谱. ")
end;

function L50_get_no()
end;

function L50_prise()
	DelItem(48)
	SetRank(30)
	SetTask(2, 60*256)
--	AddMagic(349)
	add_tm(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("把暗器谱交给唐闲，升为唐门四老门人，学到雷击术 ")
	AddNote("把暗器谱交给唐闲，任务完成，升为唐门四老门人。")
end;
