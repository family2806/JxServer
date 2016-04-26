-- 华山 绝顶 建帮NPC
-- By：Dan_Deng(2003-09-23)
--edit by 小浪多多(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function about_tong()
	Talk(6,"","：你问建立帮会有什么条件，我来慢慢的讲给你听!","首先你必须已经出师独立闯荡江湖；其次你不可以在任何帮会中；再次你要具有一定的江湖声望；最后你的统率力不能小于30级!","达到了这些要求后你只要从宋金战场上获得一把岳王剑以此作为帮主信物就可以了。如果你建立的帮派有足够多的人支持，这个帮会就能成为正式帮会而运作","首先你要有能力，在3天之内至少要找到16个和你志趣相投的人加入，如果不够的话就没没有别的办法了，这3天可以叫做考验期'.","在你的帮会有16人之后江湖会给你考验，如果3天之后不够16人江湖就不承认你的帮会","最后，建立帮会要有大量资金。努力达到目标吧!")
end

function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("继续立你的帮会，开始江湖事业!",2,"开始建帮/Direct_CreateTong","等一下/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 1) and (GetReputeLevel(GetRepute()) >= 1) and (GetLeadLevel() >= 1) and (HaveItem(195) == 1) then
		Talk(4,"create_pay","玩家：金山掌门人，请问我要怎样才能象你一样成为开宗立派成为一帮宗主呢？","金山掌门人：首先你要确信自己拥有相应的能力，然后找出一样特别的物品作为帮主信物，比如说在战场上奋勇杀敌可以得到岳王剑","玩家：岳王剑？你是说这把剑吗？","金山掌门人：原来你已经拥有它了。不错，果然年轻有为。")
	else				-- 此部份为缺省对话，待扩充。
		Say("<#>你有什么事吗?",
			2,
			"<#>了解建帮方法!/about_tong",
--			"<#>领取城主帮会奖励/talk_citytong_award",
			"<#>没有什么/nothing")
--		i = random(0,1)
--		if (i == 0) then
--			Talk(1,"","金山掌门人：如果想建立自己的帮会，就要为它付出大量时间精力与心血，切不可半途而废。")
--		else
--			Talk(4,"","金山掌门人：你问建立帮会有什么条件，我来慢慢的讲给你听。","金山掌门人：首先你必须已经出师独立闯荡江湖；其次你不可以在任何帮会中；再次你要具有一定的江湖声望；最后你的统率力不能小于30级。","金山掌门人：达到了这些要求后你只要从战场上获得一把岳王剑以此作为帮主信物就可以了。如果你建立的帮派有足够多的人支持，这个帮会就能成为正式帮会而运作。","金山掌门人：最后，可以想像得到帮派运作还需要大量资金，向着你的目标努力吧，年轻人！")
--			Talk(6,"","金山掌门人：你问建立帮会有什么条件，我来慢慢的讲给你听。","金山掌门人：首先你必须已经出师独立闯荡江湖；其次你不可以在任何帮会中；再次你要具有一定的江湖声望；最后你的统率力不能小于30级。","金山掌门人：达到了这些要求后你只要从战场上获得一把岳王剑以此作为帮主信物就可以了建立帮会了。","金山掌门人：不过还要注意的是，你要确信自己拥有相应的影响力和领导能力，你必须在3天内找到至少16名志同道合之人来支持你，否则帮会也无法建立，这三天通常称之为“考验期”。","金山掌门人：而且任何时候如果你的帮会人数少于16人的话，江湖会立即把你的帮会重新进行考验，如果在三天内不能恢复到16人以上，江湖同道仍然不会承认你的帮会。","金山掌门人：最后，可以想像得到帮派运作还需要大量资金，向着你的目标努力吧，年轻人！")
--		end
	end
end

function create_pay()
	Say("金山掌门人：那么，你只要有足够的资金让帮派能够运转起来就可以了，比如说有个100万两银子吧。",2,"没问题，我已经有100万两银子了/create_pay_yes","太费钱了，少一点行不行/create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)				-- 收费
		DelItem(195)			-- 删除相关道具
		SetTask(99,1)				-- 并打上标记（同时定义为帮派中的第一个人（即帮主本人））
		Direct_CreateTong()		-- 开始建帮
	else
		Talk(1,"","金山掌门人：你似乎并没有那么多钱啊，这样是不行的。等你有了足够的经济能力了再来找我吧。")
	end
end

function create_pay_no()
	Talk(1,"","金山掌门人：在维持帮会的正常运作本来就是很费钱的，如果你这也讨价还价，依老夫所见还是不要建帮的好。")
end

function Direct_CreateTong()
	CreateTong(1)				-- 弹出建帮对话框，结束脚本控制
end

function wait_a_moment()
end

--得到一个玩家所在帮会占领的城市,返回索引值
function gettongownercity()
	--得到玩家帮会名称
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--分别得到七大城市的帮会名称与玩家帮会名称对比
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--表示玩家所在的帮会没有占领城市
	return 0
end

-- 检查领奖条件
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#>只有占领了城市的帮派才能领奖，领自己的兄弟去占领一座城吧!")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#>只有帮主才可以领取帮派奖励，叫帮主过来")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- 今天是星期几？
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#>只有每周一9:00~20:00才是领奖时间，到时再来吧")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#>这周的奖品已经领了，下周再来吧。")
		end
		return 0
	end

	return 1
end

-- 领取城主帮会奖励
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#>领取城主帮会奖励",
			2,
			"<#>我想领60个/#take_tong_award(60)",
			"<#>我暂时不领/nothing")
	end
end

-- 领取红包
function take_tong_award(count)
	-- 一个红包占一个格子
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#>你的背包满了，整理之后再领奖.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local today = tonumber(date("%Y%m%d"))
	set_citybonus_date(city_index, today)
	-- 给红包
	for i = 1, count do
		AddItem(6,1,1535,1,1,1)
	end
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#>大红包 from 金山掌门人"
	WriteLog(msg);
	Talk(1, "", "<#> 这是你们的奖品，拿去吧")
end
