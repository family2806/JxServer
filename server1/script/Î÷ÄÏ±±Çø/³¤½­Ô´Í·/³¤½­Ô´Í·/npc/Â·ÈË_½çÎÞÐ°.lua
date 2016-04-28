-- 长江源头 路人_界无邪.lua　丐帮90级技能任务
-- By：XiaoYang(2004-04-29)
-- Update：dan_deng(2004-05-20)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(2) == 1 then
		allbrother_0801_FindNpcTaskDialog(2)
		return 0;
	end
	
	Uworld128 = GetTask(128)
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld128 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="gaibang") and (Uworld30 ==127) then
		Talk(8,"Uworld128_get","长江源头，你看到一个青年正在吹哨，哨声很悲伤。","阁下的哨声怎么那么凄凉，好像有什么心事？","国家有难，匹夫有责，兄弟家园正在被金军残杀，在下怎么能高兴呢?","关山万里，不懂有多少仇恨，只是世人错误的用炮火来换取繁荣","在下是界无邪，今天见到英雄，拿酒出来共饮!","天下英雄有几人","干杯 ","干杯")
   elseif (Uworld128 == 10) and (HaveItem(76) == 1) then
   	Talk(11,"Uworld128_envelop","兄台真是讲信用","知己相逢千杯少，今天一定要喝个痛快","天下英雄有几人?","阁下不知，时势造英雄!","为什么这么说?","在下虽然入门不久，但是，已经历过很多激战，很多人不该死也死了，在下依然活着，他们都有父母，妻儿，难道想死吗？只是，时事如此，不能不这样做","遗憾，这样的人真是少!","也行吧，到我了，不说不开心的事了，喝酒吧。!","界某这里有封信，麻烦你帮我把这封信带给丐帮罗长老!","行!")
   elseif (Uworld128 == 40) then
   	Talk(7,"Uworld128_kill","界大哥，你没事吧?","放心，我没事!","你怎么知道有人要杀你!","这个和丐帮内部有关，如果我没有掌握实情，我不会乱说的","那你要小心，我要去告诉罗长老!","朋友，界某没有什么能报答你的，以后有什么事，界某定相助!","大哥不要这么说，否则我感到很不好意思")
   elseif (Uworld128 == 10) then
   	Talk(1,"","从这里去扬州的路很危险，一路上要小心!")
   elseif (Uworld128 == 30) then
   	Talk(2,"","界大哥要小心，否则会被暗害","来得真是时候，一起去杀尽贼人!")
   elseif (Uworld128 == 20) and (HaveItem(390) == 0) then
   	AddEventItem(390)
   	Msg2Player("收到界无邪的信")
   	Talk(1,"","事情很重大，麻烦你极速把这封信带给本帮罗长老")
   else
   	Talk(1,"","饮酒歌唱，人生知己有几人?")
   end
end

function Uworld128_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","今天我和阁下要畅饮到黑，明天早上再上路!")
	else
		Say("遗憾的是，今天在下不懂会遇到知己，所以没来得及准备好酒",2,"在下知道在扬州有一座酒楼卖惠泉酒，很好喝，在下现在就去买. /Uworld128_wait","兄弟萍水相逢，在下不懂前方的路如何/Uworld128_no")
	end
end

function Uworld128_wait()
	SetTask(128,10)
--	Uworld135 = GetGameTime()
   Msg2Player("你和界无邪约定去扬州品尝美酒")
   AddNote("你和界无邪约定去扬州品尝美酒")
end

function Uworld128_no()
end

function Uworld128_envelop()
	DelItem(76)
	AddEventItem(390)
	Msg2Player("收到界无邪的信，到丐帮找罗长老")
	AddNote("收到界无邪的信，到丐帮找罗长老")
	SetTask(128,20)
end

function Uworld128_kill()
	SetTask(128,50)
	Msg2Player("救出界无邪，回去报告罗长老")
	AddNote("救出界无邪，回去报告罗长老")
end
