-- 路人_徐中原.lua
-- By: Dan_Deng(2004-04-13)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld50 = GetTask(50)
	if (Uworld50 == 10) then
		Talk(8,"Uworld50_10","我们都是青年，你怎么像老人一样来教我人生?","不是，所有这些只是个人印象而已，因为每个人有各自的立场。所以，我想听你关于白莹莹的想法.","莹莹本性善良，有一次我们进山打猎，她因为一只被我打中的小动物而伤心流泪","五毒教投靠金军，视我们为敌，你难道分辨不出虚实吗?","之前她可能是这样，但是后来她看到民不聊生，甚至还被金军杀害，就已经改过自新了。她没有办法说服自己的兄弟!","这样我就明白了!","你是第一个听我说白莹莹的事的人，请你向我父亲和其他人解释一下.","也不一定这样。之前，我准备去五毒教一趟听白莹莹说话.")
	elseif (Uworld50 == 30) then
		Talk(2,"","我说白莹莹是好人，你们还不信吗?","也许是这样。但是我劝你一定要小心。不要太相信她。我也继续留意她的行踪，看是不是真的.")
	elseif (Uworld50 == 40) and (HaveItem(383) == 1) then		-- 交任务了
		Talk(5,"Uworld50_prise","那.....难道白莹莹总是骗我?","真遗憾。但是，她与金军勾结是事实!","那我一直被她利用，我真是愚蠢!","徐少侠只是一时看不明白，被妖女利用，醒来就好了，也不用太上心","这次真亏了你，不懂怎么感谢你才行.")
	elseif (Uworld50 >= 50) then			-- 任务已经完成
		Talk(1,"","很感谢你，如果不是你帮助，现在我已经被白莹莹迷惑，不懂会犯什么重大错误.")
	else
		Talk(1,"","像白莹莹这么好的姑娘，怎么人人都反对?")
	end
end

function Uworld50_10()
	SetTask(50,20)
	Msg2Player("你决定去五毒教一趟，听白莹莹解释. ")
end

function Uworld50_prise()
	Talk(1,"","这样吧，我和你说我练武的经验，希望对你有参考作用.")
	DelItem(383)
	SetTask(50,50)
	AddProp(1)
	AddVit(1)
	Task88_3 = GetByte(GetTask(88),3) + 1
	if (Task88_3 > 255) then Task88_3 = 255 end
	Task88 = SetByte(GetTask(88),3,Task88_3)
	SetTask(88,Task88)			-- 记录任务得外功点总数
	Msg2Player("与徐中原一起研究，你的外功升1点. ")
	i = ReturnRepute(25,60,4)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)		-- 加声望
end
