
-- 龙泉村傅雷书脚本
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");
Include("\\script\\task\\random\\treasure_head.lua");  -- 藏宝图鉴赏功能

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==140) then
		task_level30_09();
		return
	elseif (myTaskValue==150) then
		Say("傅雷书：墨蛛香主现在名叫桑珠，五毒教就在龙泉村的东南初，我说的可是够明白了吧？",0);
		return
	elseif (myTaskValue==151) then
		task_level30_10();
		return
	elseif (myTaskValue==160) then -- 见了桑珠后回到龙泉村与傅雷书的对话
		task_level30_16();
		return
	elseif (myTaskValue==230) then
		task_level50_01(); -- 得到了镇冥之链后回到龙泉村与傅雷书的对话
		return
	end
	
	local tbOpp = {
		--"我是来请您鉴定一下藏宝图的/CheckTreasureMap_Say",
		"结束对话/OnExit"
		};
	
	
	Say("傅雷书：嗯、咳咳、穹隐处兮窟穴自藏……与其随佞而得志兮……你又来找我老头子有什么事情啊？",
				getn(tbOpp),
				tbOpp	);

end;


function CheckTreasureMap_Say()
	Say("傅雷书：嗯……这个藏宝图啊，包含了绝世宝藏的所在地点，不是一般人能看得懂的，老朽自从隐退江湖之后就不曾过问此事了，不过如果你有<color=yellow>二十万两银子<color>的话……",2,
		"行行，我就给你二十万两/CheckMoney",
		"我可没这么多钱/OnExit");
	return 1;
end;


function CheckMoney()

	-- 在这里第一次判断金钱，准备鉴定时再判断一次
	if GetCash()>=300000 then
		-- 弹出给予界面
		GiveItemUI("藏宝图鉴定","请将你的藏宝图放进去吧","CheckTreasureMap","OnExit");
		return
	else
		Say("傅雷书：哈哈……年轻人，钱没带够不要紧，可不能蒙我这老头子啊。这绝世珍宝可能就此与你无缘了哦！",0);
		return
	end;

end;

