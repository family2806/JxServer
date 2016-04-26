--西南北区江津村铁匠
--江津村新手任务：虎子的弹弓
--suyu
-- Update: Dan_Deng(2003-08-11)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>铁匠：我铺里的兵刃全都是精铁打就，而且价格公道，大侠行走江湖、行侠仗义，没个称手的兵刃怎么行？买一把吧？"

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	Uworld1000 = nt_getTask(1000)	
	if(UTask_world45 == 10) then
		Talk(1,"","铁匠：你来问小虎子的弹弓呀，我还没有动手做呢，需要的原料还没有去找，我的铺子又走不开。这样吧，你帮我找到树杈和牛皮，有了原料我马上就能做好。")
		SetTask(45, 20)
		AddNote("铁匠需要新的原料才能做弹弓，你帮他找一个树杈和牛皮 .")
		Msg2Player("铁匠需要新的原料才能做弹弓，你帮他找一个树杈和牛皮.")
	elseif(UTask_world45 == 20) then
		if((HaveItem(177) ==1 ) and (HaveItem(178) == 1)) then	--判断是否有道具
		Talk(2,"","铁匠：你这么快就找到了！把树杈和牛皮交给我吧，我马上动手做。","铁匠：做好了，你帮我把弹弓带给小虎子吧。顺便告诉他不要太调皮哟。")
			DelItem(177)		--删掉树杈
			DelItem(178)		--删掉牛皮
			AddEventItem(176)		--给玩家弹弓
		Msg2Player("你得到了一把弹弓。")
			AddNote("铁匠做好了弹弓，你带回去给虎子 .")
			Msg2Player("铁匠做好了弹弓，你带回去给虎子.")
--			SetTask(46, 3)
		else
			tiejiang_village("<dec><npc>铁匠：树杈和牛皮，找到了拿给我，我马上帮小虎子做个弹弓。")
		end
	else
		tiejiang_village();
	end
end;

function yes()
	Sale(22);  				--弹出交易框
end;
