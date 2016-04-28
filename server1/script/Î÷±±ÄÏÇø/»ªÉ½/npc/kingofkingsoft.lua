-- 华山 绝顶 建帮NPC
-- By：Dan_Deng(2003-09-23)
--edit by 小浪多多(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function about_tong()
	Talk(6,"","Ngi h醝 th祅h l藀 bang h閕 c� 甶襲 ki謓 g� , ta t� t� n鉯 cho ngi nghe !","u ti猲 ngi nh蕋 nh ph秈 xu蕋 s� c l藀 x玭g x竜 giang h�, ti誴 theo ngi kh玭g th� � b蕋 k� bang h閕 n祇, danh v鋘g tr猲 450 v� t礽 l穒 o tr猲 30","Mu鑞 c� Nh筩 Vng Ki誱 ngi c� th� mua Nh筩 Vng Ki誱 L� Bao � k� tr﹏ c竎 ho芻 tham gia chi課 trng t鑞g kim c� c� h閕 nh薾 頲","Sau khi th祅h l藀 bang h閕 c� 3 ng祔 th� th竎h, ngi ph秈 chi猽 h� 頲 輙 nh蕋 16 ngi v祇 bang","N誹 sau 3 h玬 bang h閕 kh玭g  16 ngi, bang s� t� ng b� gi秈 t竛","Cu鑙 c飊g , th祅h l藀 bang h閕 c莕 ph秈 c� 100 v筺 lng ")
end

function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Tung ho祅h giang h� ph秈 l藀 bang m韎 n猲 ch� l韓!",2,"B総 u l藀 bang /Direct_CreateTong","Ch� m閠 ch髏 /wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 1) and (GetReputeLevel(GetRepute()) >= 1) and (GetLeadLevel() >= 1) and (HaveItem(195) == 1) then
		Talk(4,"create_pay","Nh� ch琲 # kim s琻 chng m玭 nh﹏ , xin h醝 ta mu鑞 nh� th� n祇 m韎 c� th� gi鑞g ngi m閠 d筺g tr� th祅h khai t玭g l藀 ph竔 tr� th祅h m閠 gi髉 t玭g ch� y ? ","Kim s琻 chng m玭 nh﹏ # u ti猲 ngi mu鑞 tin ch綾 m譶h c� tng 鴑g n╪g l鵦 , sau  t譵 ra m閠 d筺g c bi謙 v藅 ph萴 l祄 bang ch� t輓 v藅 , n鉯 th� d� nh� � tr猲 chi課 trng ph蕁 d騨g gi誸 ch c� th� l蕐 頲 nh筩 vng ki誱 ","Nh� ch琲 # nh筩 vng ki誱 ? ngi n鉯 l� thanh ki誱 n莥 sao ? ","Kim s琻 chng m玭 nh﹏ # th� ra l� ngi  c� n� . kh玭g t� , qu� nhi猲 tu鎖 tr� t礽 cao . ")
	else				-- 此部份为缺省对话，待扩充。
		Say("<#> ngi c� chuy謓 g� kh玭g ?",
			2,
			"<#> hi觰 r� d鵱g bang phng ph竝 !/about_tong",
--			"<#> nh薾 l蕐 th祅h ch� bang h閕 tng thng /talk_citytong_award",
			"<#> kh玭g c� g� /nothing")
--		i = random(0,1)
--		if (i == 0) then
--			Talk(1,"","Kim s琻 chng m玭 nh﹏ # n誹 nh� mu鑞 th祅h l藀 m譶h bang h閕 , s� v� n� b� ra i lng th阨 gian tinh l鵦 c飊g t﹎ huy誸 , thi誸 kh玭g th� n鯽 阯g h駓 b� . ")
--		else
--			Talk(4,"","Kim s琻 chng m玭 nh﹏ # ngi h醝 th祅h l藀 bang h閕 c� 甶襲 ki謓 g� , ta t韎 t� t� n鉯 cho ngi nghe . ","Kim s琻 chng m玭 nh﹏ # u ti猲 ngi nh蕋 nh ph秈  xu蕋 s� c l藀 x玭g x竜 giang h� # ti誴 theo ngi kh玭g th� � b蕋 k� bang h閕 trung # l莕 n鱝 ngi mu鑞 c� c� nh蕋 nh giang h� danh v鋘g # cu鑙 c飊g ngi th鑞g su蕋 l鵦 kh玭g th� nh� v韎 30 c蕄 . ","Kim s琻 chng m玭 nh﹏ # t t韎 nh鱪g th� n祔 y猽 c莡 sau ngi ch� c莕 t� tr猲 chi課 trng t 頲 m閠 thanh nh筩 vng ki誱 l蕐 n祔 l祄 bang ch� t輓 v藅 l� 頲 r錳 . n誹 nh� ngi th祅h l藀 ch bang ph竔 c� y  nhi襲 ngi 駈g h� , c竔 n祔 bang h閕 l� c� th� tr� th祅h ch輓h th鴆 bang h閕 m� v薾 h祅h . ","Kim s琻 chng m玭 nh﹏ # cu鑙 c飊g , c� th� tng tng 頲 bang ph竔 v薾 h祅h c遪 c莕 i lng ti襫 b筩 , hng m鬰 ti猽 c馻 ngi c� g緉g l猲 , ngi tu鎖 tr� #")
--			Talk(6,"","Kim s琻 chng m玭 nh﹏ # ngi h醝 th祅h l藀 bang h閕 c� 甶襲 ki謓 g� , ta t韎 t� t� n鉯 cho ngi nghe . ","Kim s琻 chng m玭 nh﹏ # u ti猲 ngi nh蕋 nh ph秈  xu蕋 s� c l藀 x玭g x竜 giang h� # ti誴 theo ngi kh玭g th� � b蕋 k� bang h閕 trung # l莕 n鱝 ngi mu鑞 c� c� nh蕋 nh giang h� danh v鋘g # cu鑙 c飊g ngi th鑞g su蕋 l鵦 kh玭g th� nh� v韎 30 c蕄 . ","Kim s琻 chng m玭 nh﹏ # t t韎 nh鱪g th� n祔 y猽 c莡 sau ngi ch� c莕 t� tr猲 chi課 trng t 頲 m閠 thanh nh筩 vng ki誱 l蕐 n祔 l祄 bang ch� t輓 v藅 l� 頲 r錳 th祅h l藀 bang h閕 li評 . ","Kim s琻 chng m玭 nh﹏ # b蕋 qu� c遪 ph秈 ch� � l� , ngi mu鑞 tin ch綾 m譶h c� tng 鴑g 秐h hng l鵦 c飊g n╪g l鵦 l穘h o , ngi nh蕋 nh ph秈 � 3 ng祔 b猲 trong t譵 頲 輙 nh蕋 16 t猲 ch� ng o h頿 ngi t韎 駈g h� ngi , n誹 kh玭g bang h閕 c騨g kh玭g c竎h n祇 th祅h l藀 , ba ng祔 nay b譶h thng x璶g l� � kh秓 nghi謒 k� � . ","Kim s琻 chng m玭 nh﹏ # h琻 n鱝 b蕋 c� l骳 n祇 n誹 nh� ngi bang h閕 nh﹏ s� 輙 v韎 16 ngi tho筰 , giang h� s� l藀 t鴆 甧m ngi bang h閕 l莕 n鱝 ti課 h祅h kh秓 nghi謒 , n誹 nh� � trong v遪g ba ng祔 kh玭g th� kh玦 ph鬰 l筰 16 ngi tr� l猲 , giang h� ng o v蒼 s� kh玭g th鮝 nh薾 ngi bang h閕 . ","Kim s琻 chng m玭 nh﹏ # cu鑙 c飊g , c� th� tng tng 頲 bang ph竔 v薾 h祅h c遪 c莕 i lng ti襫 b筩 , hng m鬰 ti猽 c馻 ngi c� g緉g l猲 , ngi tu鎖 tr� #")
--		end
	end
end

function create_pay()
	Say("Kim s琻 chng m玭 nh﹏ # nh� v藋 , ngi ch� c莕 c� y  ti襫 b筩  cho bang ph竔 c� th� v薾 chuy觧 l猲 l� 頲 r錳 , n鉯 th� d� nh� c� c� 100 v筺 lng b筩 甶 . ",2,"Kh玭g th祅h v蕁  , ta  c� 100 v筺 lng b筩 /create_pay_yes","Qu� ph� ti襫 , 輙 m閠 ch髏 c� 頲 hay kh玭g /create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)				-- 收费
		DelItem(195)			-- 删除相关道具
		SetTask(99,1)				-- 并打上标记（同时定义为帮派中的第一个人（即帮主本人））
		Direct_CreateTong()		-- 开始建帮
	else
		Talk(1,"","Kim s琻 chng m玭 nh﹏ # ngi t鵤 h� c騨g kh玭g c� nhi襲 ti襫 nh� v藋 a , nh� v藋 l� kh玭g 頲 . ch� ngi c� y  kinh t� n╪g l鵦 t韎 t譵 ta n鱝 甶 . ")
	end
end

function create_pay_no()
	Talk(1,"","Kim s琻 chng m玭 nh﹏ # � duy tr� bang h閕 ch b譶h thng v薾 h祅h v鑞 ch輓h l� r蕋 ph� ti襫 , n誹 nh� ngi 甶襲 n祔 c騨g th秓 gi韎 ho祅 gi韎 , theo l穙 phu th蕐 c遪 ch璦 ph秈 mu鑞 d鵱g bang ch h秓 . ")
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
			Talk(1, "", "<#> ch� c� chi誱 l躰h th祅h ph� ch bang ph竔 m韎 c� th� d蒼 tng , d蒼 huynh  c馻 m譶h 甶 chi誱 l躰h m閠 t遖 th祅h 甶 !")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#> ch� c� bang ch� m韎 c� th� nh薾 l蕐 bang ph竔 tng thng , g鋓 bang ch� t韎 y ")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- 今天是星期几？
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#> ch� c� m鏸 tu莕 m閠 9:00~20:00 m韎 l� d蒼 tng th阨 gian , n l骳  tr� l筰 甶 ")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#> tu莕 n祔 ch ph莕 thng  l躰h , cu鑙 tu莕 tr� l筰 甶 . ")
		end
		return 0
	end

	return 1
end

-- 领取城主帮会奖励
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#> nh薾 l蕐 th祅h ch� bang h閕 tng thng ",
			2,
			"<#> ta mu鑞 d蒼 60 c� /#take_tong_award(60)",
			"<#> ta t筸 th阨 kh玭g d蒼 /nothing")
	end
end

-- 领取红包
function take_tong_award(count)
	-- 一个红包占一个格子
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> l璶g c馻 ngi t骾 y , s鯽 sang l筰 sau n鱝 d蒼 tng .")
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
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#> i bao ti襫 l� x� from kim s琻 chng m玭 nh﹏ "
	WriteLog(msg);
	Talk(1, "", "<#> y l� ngi c鯽 ch ph莕 thng , c莔 甶 甶 ")
end
