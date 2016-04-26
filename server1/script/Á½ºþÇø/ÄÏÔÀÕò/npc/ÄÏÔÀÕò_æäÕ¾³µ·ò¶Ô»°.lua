--两湖区 南岳镇 驿站车夫对话  世界任务
-- Update: Dan_Deng(2003-09-16)暂时屏蔽任务（以后重写重开放）

CurStation = 11;
Include("\\script\\global\\station.lua")
--Include("\\script\\global\\skills_table.lua")

function main(sel)
--	check_update()					-- 技能更新、门派加标识（2004-05-31）
--	UTask_world15 = GetTask(15)
--	if (UTask_world15 < 255) then	
--		Say("车夫：唉，现在的生意越来越难做了，原本还有不少富商大爷去神农架那儿游玩，可是最近不知从哪儿窜出一群黑叶猴，沿路打劫客人，搞得我生意大受影响，如果有人能赶走这些黑叶猴就好了。你帮我赶走十只猴子，就可以免费在我这里使用一次车马。您要坐车吗？", 2, "帮忙/yes", "不帮忙/no")
--		SetTask(15, 1)
--	else
		Say("车夫：咱们车夫做的是气力活，吃的是辛苦饭，您好心帮衬一下吧？", 4, "路经的地点/WayPointFun", "各大城市/StationFun", "返回的地点/TownPortalFun", "不用了/OnCancel");
--	end
end;

function yes()
	Task0013 = GetTaskTemp(13);
	if (Task0013 < 10) then			--没有杀到十只黑叶猴
		Say("做车夫真是辛苦的，有时候连白粥都喝不上!", 4, "路经地点/WayPointFun", "路经城市/StationFun", "返回的地点/TownPortalFun", "不用了/OnCancel");
	else
		SetTaskTemp(13, 0)
		Say("谢谢你帮我赶走了黑叶猴！我免费载你!", 4, "路金经的地点/WayPointFun", "各大城市/StationFun", "返回的地点/TownPortalFun", "不用了/OnCancel")
	end
end;

function  OnCancel()
   Say("车夫：有了钱再来坐车吧。",0)
end;
