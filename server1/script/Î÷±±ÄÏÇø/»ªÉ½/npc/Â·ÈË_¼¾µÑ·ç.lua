-- \script\西北南区\华山\npc\路人_uworld122_季笛风.lua
-- by xiaoyang(2004\4\15) 少林90级任务

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld122 = GetTask(122)
	Uworld38 = GetByte(GetTask(38),2)
	if(Uworld122 < 10) and (GetLevel() >= 90) and (Uworld38 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="shaolin" ) then
		Talk(8,"U122_get","季兄，论文我比不上你，但是习武不像读书，还要有功夫","常兄，藏经阁中有千万本书，要是谁都像你一样不读书那么少林佛法早就不存在了.","佛道应该是自然的，修行不一定要照着书本来。况且常某虽不曾读书但也不是不识字。你的武功不像我一样，还想学上乘的武功","这样的话不合理。这样不合理。我们寺在学武之前都要研究佛典和洗清罪孽，不然的话会死得早，我只是为你好.","既然这样我们就比试一阵吧，少林严禁同门相残，我们到华山擂台公平对决，生死各安天命.","比就比，我劝你不代表我怕你!","哈哈哈！二位！在下在外面都听到了。少林是武林泰斗。二位不要伤了彼此的性命","这位...在下也是不得已!")
	elseif(Uworld122 > 10) and (Uworld122 < 50) then
		Talk(2,"","季兄不谦让那在下只好不客气了.","在下优势明显，常兄不要为难！")
	elseif (Uworld122 == 60) then
		Talk(4,"Uworld122_ashamed","常兄！季兄！二位不要这样!","感谢阁下救命之恩","同门相争，后果难料，后悔也来不及了!","少林是武林的栋梁，在下可以帮助二位，真是荣幸.事情都处理好了！我要回少林复命了。")
   elseif (Uworld122 == 50) and (HaveItem(392) == 1) then
   	Talk(4,"U122_step","少林僧众令在此!少林弟子立即听令!","证实是少林众僧令!我谨遵效令","阁下尽管吩咐!","现在金兵隐匿在华山已经把我们包围了。趁着他们布置，我们先分开之后再集合.")
   elseif (Uworld122 == 50) then			-- 状态正确，但没有令牌
   	Talk(1,"","你是谁？凭什么来干涉我们?")
   elseif (Uworld122 == 55) then			-- 任务中的缺省对话
   	Talk(2,"","我的任务完成了，你那边怎么样?","我真不放心，各位师兄回来看看，等我一下!.")
   elseif (Uworld122 == 65) and (HaveItem(392) == 0) then		-- 重新取回令牌
   	Talk(1,"","多谢阁下的救命之恩，这是令牌请收下!")
   	AddEventItem(389)
   	Msg2Player("拿少林金牌回去")
   elseif (Uworld122 >= 240) then		-- 任务已完成
   	Talk(1,"","之前我一时糊涂，如果没有阁下相助的话后果不堪设想!")
   else
   	Talk(1,"","常兄，这次我个人比武要是师傅知道了一定会责骂的对不?")
   end
end

function U122_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","看你样子不舒服，还是远离战场免得被杀伤.")
	else
		Say("这样说吧，如果师兄要让名号，在下决不阻拦!",2,"看来二人还没有劝服，我只好上少林一趟，问清根源. /Uworld122_yes","你们要打就打但是不要牵连到我，劝你们但是不听，损失的是你们. /Uworld122_no")
	end
end

function Uworld122_yes()
	Msg2Player("少林弟子常百里与季笛风为了重习武还是重读书而争执，最后决定决一生死。你决定上少林找他们的师父来劝说. ")
	AddNote("少林弟子常百里与季笛风为了重习武还是重读书而争执，最后决定决一生死。你决定上少林找他们的师父来劝说. ")
	SetTask(122,10) --少林任务启动
end

function Uworld122_no()
end

function U122_step()
	DelItem(392)
	SetTask(122,55)			-- 插入变量中
	Msg2Player("少林弟子常百里与季笛风为了重习武还是重读书而争执，最后决定决一生死。你决定上少林找他们的师父来劝说. ")
end

function Uworld122_ashamed()
	SetTask(122,65)  --设置任务变量为60
  	AddEventItem(392)		-- 此处再取回令牌
	Msg2Player("救常百里与季笛风，带少林令牌去少林报信. ")
	AddNote("救常百里与季笛风，带少林令牌去少林报信. ")
end
