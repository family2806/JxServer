-- 少林 路人NPC 达摩院玄悲 20级任务
-- by：Dan_Deng(2003-08-01)
-- update by: xiaoyang(2004\4\15) 少林派90级任务 

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if(UTask_sl == 20*256+128) then		--20级任务进行中
			L20_prise()
		elseif((UTask_sl == 20*256) and (GetLevel() >= 20)) then		--20级任务
			Talk(2,"L20_get","最近寺里从福建莆田来了五个挂名弟子，是南少林的方丈推荐来的，因为这五个蛮人把整个南少林闹得鸡犬不宁，方丈无法，只得寄希望于本寺能够教化他们，哪知道这五个南蛮根本不听教化，整日游手好闲，惹是生非，真是让人头痛","这五个蛮人现在在何处?")
		else
			Talk(1,"","出家人注重明心结性!")
		end
	elseif(Uworld122 == 10) then
		Talk(5,"Uworld122_find","玄悲大师，在上华山的路上有很多少林弟子打架致死，不懂是因为什么?","少林想在弟子中选择适合的人在藏经阁来修炼72绝招。有能力的人都是来自达摩院和罗汉堂，罗汉堂弟子不像达摩院的弟子那样总是争权夺位，事情的大概就是这样。","达摩罗汉来自少林，为什么要争夺，谁学不到!","我的弟子超凡出众，选谁让谁?","难道罗汉堂也属于少林吗?")
   elseif(Uworld122 >=20) and (Uworld122 < 30)then
   	Talk(1,"","去找玄难... ")
   elseif(Uworld122 == 30)then
   	Talk(5,"Uworld122_alow","大师，玄难大师不听我劝解。我走过华山，看到很多金国高手埋伏，恐怕又什么阴谋.","你真的看到了?","绝对不乱说! ","请去和达摩院弟子说不要打架了，这是我的令牌。如果真是金军，希望可以帮助消灭他们.","在下尊命.")
	elseif (Uworld122 == 50) and (HaveItem(392) == 0) then
   	Talk(1,"","施主把令牌落在我老衲这里了，没有它恐怕少林弟子不信")
   	AddEventItem(392)
   	Msg2Player("接少林僧众令牌 ")
   elseif(Uworld122 >= 50) and (Uworld122 <= 60) then
   	Talk(1,"","或许我们真的错了... ")
   elseif (Uworld122 == 65) and (HaveItem(392) == 1) then
   	Talk(4,"U122_finish","华山的玫瑰危险都化解了，幸亏没有发生伤亡.","贫僧已收到弟子的信息，真是羞愧." ,"大师不要这样，危险中能解决问题，真是英雄本色.","这位年轻人不要戏弄老衲了，你快去找玄难吧，他有事想对你说，哈哈.!")
   else							-- 常规对话
		Talk(1,"","掌门师兄近几年想抗金的办法，头发都白了.")
	end
end;

function L20_get()
	Say("他们已经去伏魔西山，这几个人以为有几招就不把中原人放在眼里?",2,"让我去教训他们. /L20_get_yes","恐怕我做不了/L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "他们远道而来也是客，你出手要小心哦.")
	SetTask(7,20*256+64)
--	SetTaskTemp(42,0)			-- 创建临时变量（TaskTemp的ID号为42）（取消临时变量）
	AddNote("替达摩院首座玄悲大师教训五个蛮人. ")
	Msg2Player("替达摩院首座玄悲大师教训五个蛮人. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(2,"","师叔，我已经收服了那五个蛮人，他们从此以后不敢再惹是生非了!","我佛慈悲！善哉善哉!")
	SetTask(7,30*256)
	SetRank(3)
--	AddMagic(15)
	add_sl(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("收复五个蛮人，升级为护寺金刚. ")
	Msg2Player("恭喜，你已升级为护寺金刚，学到不动冥王武功. ")
end;

function Uworld122_find()
	Talk(1,"","玄悲:... 你去找玄难吧. ")
	SetTask(122,20)  --设置任务变量20
	Msg2Player("玄悲模棱两可不答，叫你去玄难处问清楚")
	AddNote("玄悲模棱两可不答，叫你去玄难处问清楚")
end

function Uworld122_alow()
	AddEventItem(392)
	Msg2Player("拿到少林僧众令. ")
	SetTask(122,50)  --设置任务变量50
	Msg2Player("答应玄悲，到华山救少林弟子，杀死金国将领. ")
	AddNote("答应玄悲，到华山救少林弟子，杀死金国将领. ")
end

function U122_finish()
	DelItem(392)
	Msg2Player("交来少林僧众令. ")
	SetTask(122,70)
	Msg2Player("与玄悲和解，去找玄难. ")
	AddNote("与玄悲和解，去找玄难. ")
end
