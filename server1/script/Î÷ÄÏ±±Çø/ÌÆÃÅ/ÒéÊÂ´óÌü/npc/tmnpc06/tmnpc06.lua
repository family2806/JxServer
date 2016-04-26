--description: 唐门唐一尘 20级任务、50级任务
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2004-05-25) 洗清冤屈任务

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
--	if (GetTask(123) >= 80) and (Uworld51 < 10) and (GetReputeLevel(GetRepute()) >= 8) then		-- 洗清冤屈任务启动
		--		Talk(2,"Uworld51_get", 13429, 13430)
	if (Uworld51 == 20) then
		Talk(5,"Uworld51_30","无也不袖手旁观，依然在找办法，只因为我父亲正在怀疑我，我行动恐怕不便.","但是，我知道几天前有几个少林高手遇难，伤口和本门绝技一样，我父亲怀疑我泄露了本门绝技.","你去见掌门解释清楚","没用，我父亲正在生气，不会给我机会解释，这个消息我也是听唐黑说的.","如果是这样，掌门对我没用成见，也许我可以帮你.")
	elseif (Uworld51 == 55) then
		Talk(6,"Uworld51_60","一尘公子，我刚刚从天忍教听到消息，暗杀少林高手的事果然是他们做的，不然公子因为想与你争权，把本门秘籍带给天忍教.","有这事？不然即使想成为掌门，也不能这么做啊.","遗憾的是我正被怀疑，我父亲又不信我，我要立即和唐黑师傅商量一下.","天忍教接下来的刺杀目标是丐帮，请公子提醒丐帮避免天忍教乘机陷害.","本门秘笈落入敌人手中，一定要拿回来，要不麻烦你帮消灭刺客，拿回秘笈.","可以!")
	elseif (Uworld51 == 70) and (HaveItem(377) == 1) then				-- 洗清冤屈任务：已经夺回秘笈
		Talk(2,"Uworld51_80","一尘公子，在下已完成使命，拿到秘笈.","多谢你，我已经和唐黑师傅商量了，请你和我父亲说明真相，因为这事由你调查，只有你说才有说服力.")
	elseif (Uworld51 == 90) then
		Talk(2,"Uworld51_100","我父亲这样说啊？太好了，我要把这个好消息告诉含烟才行。","哈哈，让我去一趟，上次是坏消息，这次是好消息.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 20*256) and (GetLevel() >= 20) then		--20级任务启动
			Talk(2, "L20_get", " 我有一个姑母，叫做 <color=Red>唐幽<color>, 是我爹唯一的妹妹，当年因为违背门规，嫁给了外面的人，被祖父赶出家门，二十年不曾相见。我知道爹虽然口中不说，但是他十分想念这个妹妹.", "那掌门为什么不接她回唐门，一家人团圆呢?")
		elseif (UTask_tm == 20*256+60) then 
			Talk(2, "", "唐幽师姑已经原谅掌门了，她要我把这个<color=Red>金项圈<color>交给掌门.", "真的吗？太好了！你可真有本事，快去把<color=Red>金项圈<color>交给我爹吧！他就在<color=Red>会客大厅<color>里.")
			Msg2Player("回议事房找唐一尘，知道掌门唐仇正在客厅.")
			SetTask(2,20*256+70)
		elseif (UTask_tm == 20*256+70) then
			Talk(1, "", "太好了！快去把<color=Red>金项圈<color>交给我爹吧！他就在<color=Red>会客大厅<color>里.")
		elseif (UTask_tm == 50*256+20) then		--50级任务
			Talk(4, "", "大师兄，你知道昨天有谁去过暗器房吗?", "昨天晚上好像<color=Red>三师弟唐禾<color>和<color=Red>五师弟唐元<color>去过.", "不知他们此刻在哪里?", "<color=Red>Ng?s?<color> 五师弟<color>刚才匆匆忙忙去<color=Red>江津村<color>探望他生病的舅舅，三师弟也出去了，但不知去了哪里. ")
			SetTask(2, 50*256+40)
			Msg2Player("在议事房，从唐一尘处知道三师弟唐禾和五师弟唐元去过暗器房.")
			AddNote("在议事房，从唐一尘处知道三师弟唐禾和五师弟唐元去过暗器房，两人很可疑，唐元去江津村看舅舅，唐和不懂去哪里了.")
		elseif (UTask_tm == 50*256+40) then							--50级任务
			Talk(1,"","为什么你问谁进了暗器房？发生什么事了?")
		elseif (UTask_tm > 20*256) and (UTask_tm < 30*256) then					--已经接到20级任务，尚未完成
			Talk(1,"","姑丈死后，姑母一直住在后山<color=Red>无心谷<color>的一间茅屋里，她从不见唐门中人，我去了好几次，都只能在<color=Red>门口<color>向她请安，这次就拜托你了! ")
		elseif (UTask_tm >= 30*256) then					--已经完成20级任务，尚未出师
			Talk(1,"","多谢你化解了我父亲和姑姑的恩怨")
		else
			Talk(1,"","唐门是武林的中流砥柱，不仅依靠武功，还有暗器功夫，暗器是我们的优势.")
		end
	elseif (Uworld51 >= 10) and (Uworld51 < 100) then		-- 洗清冤屈任务：进行中
		Talk(1,"","一尘虽然不才，但是，不能因此就把武功传外人. ")
	elseif (Uworld51 >= 100) then					-- 洗清冤屈任务：已经完成
		Talk(1,"","如果不是你帮我洗清冤屈，此事不懂会怎么样，我和含烟要感谢你才是!")
	elseif (UTask_tm >= 70*256) then							--已经出师
		Talk(1,"","有空记得来看我们.")
	else
		Talk(1,"","你是刚入门的弟子是吗?")
	end
end;

function L20_get()
	DelItem(41)							--防止重接任务后，玩家捡起任务道具
	Say("商量", 2, "让我想想办法/L20_get_yes", "没有办法/L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","姑丈死后，姑母一直住在后山<color=Red>无心谷<color>的一间茅屋里，她从不见唐门中人，我去了好几次，都只能在<color=Red>门口<color>向她请安，这次就拜托你了! ")
	SetTask(2, 20*256+20)
	AddNote("在议事房(507,319) 见唐一尘，接<color=red> 唐幽任务<color>, 到无心谷化解唐幽和掌门的恩怨.")
	Msg2Player("在议事房见唐一尘，接唐幽任务，到无心谷化解唐幽和掌门的恩怨.")
end;

----------------------- 世界任务 --------------------------
function Uworld51_get()
	Say("哎，说来话长，你可以帮我传话给尹含烟吗?",2,"容易，是什么内容呢?/Uworld51_get_yes","我头痛，你找其他人吧./L20_get_no")
end

function Uworld51_get_yes()
	Talk(1,"","和我姑姑说：我父亲不懂怎么突然反对我们的婚姻，婚礼可能会有困难，但是，姑姑不用太担心.")
	SetTask(51,10)
	Msg2Player("接任务：帮唐一尘传话给尹含烟.")
	AddNote("接洗清冤屈任务：帮唐一尘传话给尹含烟.")
end

function Uworld51_30()
	SetTask(51,30)
	Msg2Player("你决定去见唐仇掌门，帮唐一尘解释.")
end

function Uworld51_60()
	SetTask(51,60)
	Msg2Player("唐一尘请你去进菊洞消灭金国刺客，夺秘笈回来 ")
end

function Uworld51_80()
	SetTask(51,80)
	Msg2Player("唐一尘感谢你帮助他，同时希望你可以帮助他和唐仇掌门说清楚.")
end

function Uworld51_100()
	SetTask(51,100)
	i = random(35,45)
	AddRepute(i)		-- 加声望
	Msg2Player("唐一尘感谢你的帮助，你的名望增加"..i.."点.")
	Msg2Player("你自愿带好消息给尹含烟，帮助她减轻忧虑.")
end

function L20_get_no()
end;
