--==============一般比赛相关数据===============
/*
if (not WLLS_HEAD) then
	return
end
*/
-- 奖励规则，奖品表
function tmp_help_award(tbData, nLevel)
	local tbAward	= tbData.award_rank[nLevel]
	local str = " 1. m謙 m醝 k� tng thng : th緉g phng t 頲 "..(5*nLevel).." 甶觤 , c飊g "..(2*nLevel).." 甶觤 , b�/cha/ch辵 phng : 0 甶觤 . m鏸 cu閏 tranh t礽 甧m gia t╪g <color=red> ch髏 kinh nghi謒 tng <color>. th緉g b筰 u c� tng 鴑g tng thng \n"
		.." 2. ng h祅g tng thng : sau khi cu閏 tranh t礽 k誸 th骳 , d鵤 theo chi課 i th祅h t輈h , ng h祅g th� <color=red> t� 1 n "..tbAward[getn(tbAward)][1].."<color>, th祅h vi猲 c� th� t 頲 ng h祅g tng thng ( vinh d� tr� gi� .\n"
		.." <t> ng h祅g tng thng : \n"
		.." ng h祅g tng thng "
	if (tbData.max_member ~= 1) then
		str	= str.."( chi課 i th祅h vi猲 )"
	end

	local nLastRank	= 1
	for nAward = 1, getn(tbAward) do
		local nRank	= tbAward[nAward][1]
		local szRank
		if (nLastRank == nRank) then
			szRank	= nRank
		else
			szRank	= nLastRank.."-"..nRank
		end
		str = str.."\n"..strfill_left(format(" l莕 %s ", szRank), 16)..tbAward[nAward][2].." vinh d� tr� gi� "
		nLastRank	= nRank + 1
	end

	return str
end

-- 帮助文字
-- 格式1：
--	{"B� m玭 t猲 ", "Tr� gi髉 n閕 dung ", 1/2(限定，可选)},
--	限定：1、只针对单人类型；2、只针对多人；nil、全部（下同）
-- 格式2：
--	{"B� m玭 t猲 ", function(返回Tr� gi髉 n閕 dung 的函数), 1/2(限定，可选)},
-- 格式3：
--	{
--		"B� m玭 t猲 ",
--		{
--			"新秀赛Tr� gi髉 n閕 dung ",
--			"高级赛Tr� gi髉 n閕 dung ",
--		},
--		1/2(限定，可选)
--	},
tmp_help = {
	{
		"<t> gi韎 thi謚 ",
		{
			" l莕 n祔 t﹏ t� li猲 cu閏 so t礽 v� <color=red><s><color>, tham gia ngi c蕄 b薱 c莕 t� <color=red>80-119<color>. nh� ch琲 甶 g苝 <color=red> t﹏ t� s� gi� <color> ghi danh th祅h l藀 chi課 i , sau  ti課 v祇 t﹏ t� li猲 cu閏 so t礽 h閕 trng ti課 h祅h tranh t礽 ",
			" l莕 n祔 v� l﹎ li猲 cu閏 so t礽 v� <color=red><s><color>, tham gia ngi c蕄 b薱 c莕 t� <color=red>120<color>. 甶 g苝 <color=red> li猲 cu閏 so t礽 s� gi� <color>, ghi danh th祅h l藀 chi課 i , sau  ti課 v祇 v� l﹎ li猲 cu閏 so t礽 h閕 trng ti課 h祅h tranh t礽 ",
		}
	},
	{"Ghi danh tham gia tranh t礽 tr譶h t� ", " � tranh t礽 giai 畂筺 , nh� ch琲 c� th� ghi danh tham gia b蕋 k� h譶h th鴆 ch tranh t礽 ", 1},
	{"Ghi danh tham gia tranh t礽 tr譶h t� ", "Ghi danh tham gia <s>, c莕 th祅h l藀 chi課 i . nh� ch琲 c� th� l鵤 ch鋘 m譶h chi課 i , c騨g c� th� gia nh藀 nh鱪g chi課 i kh竎 . i trng c飊g h緉 ngi h鋚 th祅h i sau , 甧m c飊g quan vi猲 i tho筰 <t>, l鵤 ch鋘 <color=red> chi課 i <t> l藀 t鴆 t筼 th祅h chi課 i . th祅h vi猲 s� lng nhi襲 nh蕋 v� <color=red><d> ngi <color><e>.", 2},
	{"R阨 甶 tranh t礽 i ", " � <color=red> c竎h ngh� ng琲 giai 畂筺 c ch鮪g <color>, nh� ch琲 c� th� t� 甶 tho竧 kh醝 chi課 i . � tranh t礽 giai 畂筺 , n誹 nh� ngi chi課 i <color=red> ch璦 t韎 tranh t礽 th阨 甶觤 <color>, nh� ch琲 c� th� t� 甶 r阨 甶 chi課 i , n誹 nh�  so t礽 th� kh玭g th� r阨 甶 . <color=yellow> r阨 甶 chi課 i sau , th� kh玭g th� d蒼 ng h祅g tng thng <color>. <color=yellow> r阨 甶 chi課 i sau , 甧m kh玭g th� tr� v� tranh t礽 <color>.", 1},
	{"R阨 甶 tranh t礽 i ", " � <color=red> c竎h ngh� ng琲 giai 畂筺 c ch鮪g <color>, nh� ch琲 c� th� t� 甶 tho竧 kh醝 chi課 i . � tranh t礽 giai 畂筺 , n誹 nh� ngi chi課 i <color=red> ch璦 t韎 tranh t礽 th阨 甶觤 <color>, nh� ch琲 c� th� t� 甶 r阨 甶 chi課 i , n誹 nh�  so t礽 th� kh玭g th� r阨 甶 . <color=yellow> r阨 甶 chi課 i sau , th� kh玭g th� d蒼 ng h祅g tng thng <color>. n誹 nh� i trng r阨 甶 chi課 i , l� i trng quy襫 l頸 甧m chuy觧 giao cho nh鱪g ngi kh竎 . <color=yellow> n誹 nh� chi課 i kh玭g ai li評 , 甧m t� ng gi秈 t竛 <color>. m鏸 l莕 li猲 cu閏 so t礽 k誸 th骳 , c竔 n祇 chi課 i kh玭g ph� h頿 l莕 sau tranh t礽 li襫 t� ng b� gi秈 t竛 ", 2},
	{"u trng l莕 ", "M鏸 tu莕 t� th� hai n th� n╩ , t� <color=red>18: 00- 19: 00<color> khai trng tranh t礽 <color=yellow>4 tr祅g <color>. c遪 s鉻 l筰 3 ng祔 t� <color=red>18: 00-19: 00<color> c飊g <color=red>21: 00-22: 00<color> c� th� tranh t礽 <color=yellow>8 tr祅g <color>. to祅 b� tranh t礽 giai 畂筺 <color=red>( m鏸 th竛g t� 8-28)<color> t蕋 c� tranh t礽 <color=yellow>108 tr祅g <color>. tham gia chi課 i nhi襲 nh蕋 tham gia <color=red>48 tr祅g <color> "},
	{"Tranh t礽 l璾 tr譶h ", "Chi課 i i vi猲 甶 c飊g <t> i tho筰 ti課 v祇 h閕 trng <t>, ti誴 theo sau  c飊g h閕 trng quan vi猲 i tho筰 , c騨g s� b� mang v祇 trang b� khu v鵦 . n tranh t礽 th阨 gian , tham gia i vi猲 甧m t� ng b� a ngi cu閏 so t礽 tr祅g . <color=red> c� th� t� do l鵤 ch鋘 v� kh� c飊g trang b� <color>."},
	{"Tranh t礽 quy t綾 ",	-- 单人
[[    1. 在比赛时间, 打败对手立即获胜
    2. 在比赛时间 <color=red>如果一边不剩一个成员了就是负方<color> 立即被处理
    3. 如果结束比赛，2边成员都是一样的，系统将会判断那边被打中的次数最少为获胜方，如果还是一样的，就是和。
    4. 如果哪队不及时进入赛场就是负方, <color=red>剩下方为胜利方<color>
    5. 计分: 胜方<pw> 点; 和<pt> 点; 负方 0 点
    6. 比赛队员只能使用在药店买的药品
    7. <color=red>进场10秒后开始比赛<color>; 比赛时间为14分50秒 
    8. 2场比赛休息间隔 <color=red>10 分钟<color>. <color=red>准备时间<color> 5 分钟
]], 1},
	{"Tranh t礽 quy t綾 ",	-- 多人
[[    1. 在比赛时间 <color=red>哪边全部死亡color> 就为负方, 比赛结束
    2. 在比赛时间 <color=red>如果一边不剩一个成员了就是负方<color> 立即被处理
    3. 比赛时间结束 <color=red>哪边剩余的成员最多为胜方<color>. 如果 <color=red>2方人数一样<color> 则被打中最少的一方取胜。否则为和。
    4. 如果哪队不及时进入赛场就是负方, <color=red>剩下方为胜利方<color>
    5. 计分: 胜方<pw> 点; 和<pt> 点; 负方 0 点
    6. 比赛队员只能使用在药店买的药品
    7. <color=red>进场10秒后开始比赛<color>; 比赛时间为14分50秒
    8. 每场比赛准备时间为 <color=red>5 分钟<color>
]], 2},
	{"Цnh tr髇g s� l莕 ",
[[Цnh tr髇g s� l莕 ：就是被对方用锤子，毒，或者被打中受伤次数

计算被打中次数规则
    1. 每场被对方打中，血量减少
    2. 被对方的锤子打中，血量减少
    3. 被对方反击打中，血量减少
    4. 被对方毒中，血量减少
    5. 如果因为使用技能导致血量减少就不被计入被打中次数内
]]
	},
	{"Ghi danh quy t綾 ", "     <color=red>比赛积分 <t><color>用于作为排行依据 <t>. 结束比赛<color=red><pw><color> 甶觤 , c飊g <color=red><pt><color> 点; 负方 <color=red>0<color> 点. 每次<t>结束，根据<color=red>战队总积分<color>排名. 如果积分一样，将根据<color=yellow>胜利比例<color> 排行。如果胜利比例一样，将根据<color=green> 每个战队比赛总时间<color> 排行。比赛阶段<t> 后，积分将重新计算"},
	{"Hi觰 r� nhi襲 h琻 tng t譶h ", tmp_help_award},
}

tmp_main = {	--officer主对话
	" giang h� phong ba lo筺 kh雐 , nh璶g l� , hay kh玭g v� c飊g th竔 lai . khi m閠 t﹏ t� anh h飊g xu蕋 hi謓 th阨 甶觤 , c騨g l� m閠 m韎 l辌h s� b� t竔 nh藀 s� s竎h . ngi n祇 s� l� c飊g m閠 ng祔 h� ch m韎 anh h飊g y ?",
	" v�  tr竛h cho anh h飊g h祇 ki謙 l筰 m閠 l莕 n鱝 ph﹏ tranh , c c� minh ch� c� h祅h tranh t礽 n t譵 ra nh﹏ t礽 , ph鬰 v� qu鑓 gia ",
}

tmp_creat = " th祅h l藀 chi課 i tham gia sau <s>, ngi c� th� <color=red> m譶h l祄 i trng <color><enter>"
	.." th祅h l藀 chi課 i sau , v� lu薾 khi n祇 , ngi c騨g c� th� xin/m阨 ngi kh竎 tham gia ho芻 l� gia nh藀 nh鱪g kh竎 i . m鏸 chi課 i nhi襲 nh蕋 ch� c� th� <d> ngi ( bao g錷 i trng ). <color=red> n誹 nh� ch璦 t韎 tranh t礽 th阨 甶觤 <color> c騨g <color=red> kh玭g t竔 qu� b蕋 k� tr祅g l莕 <color>, ngi c� th� t飝 � r阨 甶 chi課 i . ngi x竎 nh th祅h l藀 m譶h chi課 i sao ? "

--====Functions====
--返回当前角色可以参加的比赛类型，nil为不能参赛
function tmp_player_type()
	local nLevel = wlls_player_level()
	return iif(nLevel > 0, nLevel, nil)
end

--检查当前角色是否可以加入指定的战队
function tmp_check_addmem(n_capidx, n_lid, n_mtype)
	if (n_mtype ~= wlls_player_type()) then
	 	return " th藅 xin l鏸 , i trung i vi猲 :"..GetName().." c飊g <color=red> tranh t礽 lo筰 h譶h <color> kh玭g ph� h頿 , cho n猲 , kh玭g th� v祇 ngi chi課 i !"
	end
end

function tmp_str(str, tbData)
	str	= gsub(str, "<s>", tbData.name)
	str	= gsub(str, "<d>", tbData.max_member)
	str	= gsub(str, "<e>", tbData.addmem_ex)
	return str
end

function tmp_process_data(tbData)
	-- 默认值
	if (not tbData.addmem_ex) then
		tbData.addmem_ex	= ""
	end
	if (not tbData.text_creat) then
		tbData.text_creat	= tmp_str(tmp_creat, tbData)
	end
	if (not tbData.player_type) then
		tbData.player_type	= tmp_player_type
	end
	if (not tbData.check_addmem) then
		tbData.check_addmem	= tmp_check_addmem
	end

	--建立地图索引（快速找到某一地图对应的比赛类型、场地组编号、场地类型）
	local tbMapIdx = {}
	for nMType, tbMType in tbData.match_type do
		for nGroup, tbGroup in tbMType.map do
			for i = 1, 3 do
				tbMapIdx[tbGroup[i]] = {nMType, nGroup, i}
			end
		end
	end
	tbData.map_index = tbMapIdx

	-- 处理帮助文字
	local nCount = 0
	local nMultiple = iif(tbData.max_member == 1, 1, 2)
	local tbSpecialHelp	= tbData.help_msg	-- 特定帮助信息
	if (not tbSpecialHelp) then
		tbSpecialHelp	= {}
	end
	tbData.help_msg	= {}
	for _, tbTopic in tmp_help do
		local szTitle	= tmp_str(tbTopic[1], tbData)
		local varText, nLimit
		if (tbSpecialHelp[tbTopic[1]]) then	-- 有自定义帮助信息
			varText	= tbSpecialHelp[tbTopic[1]]
			nLimit	= nil
		else
			varText	= tbTopic[2]
			nLimit	= tbTopic[3]
		end
		if (not nLimit or nLimit == nMultiple) then
			nCount	= nCount + 1
			local szType	= type(varText)
			local tbText	= {"", ""}
			if (szType == "function") then
				tbText[1]	= varText(tbData, 1)
				tbText[2]	= varText(tbData, 2)
			elseif (szType == "table") then
				tbText[1]	= varText[1]
				tbText[2]	= varText[2]
			else
				tbText[1]	= tostring(varText)
				tbText[2]	= tbText[1]
			end

			tbData.help_msg[nCount]	= {}
			for nLevel = 1, 2 do
				tbText[nLevel]	= tmp_str(tbText[nLevel], tbData)
				tbText[nLevel]	= gsub(tbText[nLevel], "<t>", WLLS_LEVEL_DESC[nLevel])
				tbText[nLevel]	= gsub(tbText[nLevel], "<pw>", 5*nLevel)
				tbText[nLevel]	= gsub(tbText[nLevel], "<pt>", 2*nLevel)
				tbData.help_msg[nCount][nLevel]	= {
					gsub(szTitle, "<t>", WLLS_LEVEL_DESC[nLevel]),
					tbText[nLevel],
				}
			end
		end
	end

	-- 处理Officer主对话文字
	tbData.text_main[1]	= tmp_main[1]..tbData.text_main[1]
	tbData.text_main[2]	= tmp_main[2]..tbData.text_main[2]
end
