Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc\\duanwu_convert.lua")
IncludeLib("RELAYLADDER")

DWGOLDENLASTDATE = tonumber(date("%d")) --上一次用巨型龙舟换取黄金装备的日期 只记录天
DWGOLDENMAXCOUNT = 2	--端午用巨型龙舟换定国安邦、侠骨柔情，每天每台服务器可以换取的数量，每台gameserver的上限，共16个
DWGOLDENNOWCOUNT = 0 --当前用巨型龙舟换取黄金装备数

DWORELASTDATE = tonumber(date("%d")) --上一次用兽型龙舟换取玄晶、神秘矿石的日期 只记录天
DWOREMAXCOUNT = 12	--端午用兽型龙舟换玄晶、神秘矿石，每天每台服务器可以换取的数量，每台gameserver的上限，共96个
DWORENOWCOUNT = 0 --当前用兽型龙舟换取玄晶、神秘矿石数

AWARD_BIRDBOAT = {
					{"仙草露 ",{6,1,71,1,0,0},30},
					{"紫水晶",{239},15},
					{"蓝水晶",{238},15},		
					{"绿水晶",{240},15},
					{"晶红宝石",{353},15},	
					{"天山宝露 ",{6,1,72,1,0,0},10},	
					}

AWARD_BEASTBOAT = {
					{"玄晶5级",{6,1,147,5,0,0},20},
					{"玄晶6级",{6,1,147,6,0,0},43},
					{"玄晶7级",{6,1,147,7,0,0},30},		
					{"玄晶8级",{6,1,147,8,0,0},3},
					{"神秘矿石",{6,1,398,1,0,0},4},
					}

AWARD_HUGEBOAT = {
					{"定国之青纱长衫",{159},100},
					{"定国之钨砂发冠",{160},51},
					{"定国之赤绢软靴",{161},70},	
					{"定国之紫藤护腕",{162},70},
					{"定国之银蚕腰带",{163},70},
					{"安邦之冰晶石项链",{164},51},
					{"安邦之菊花石指环",{165},51},
					{"安邦之田黄石玉佩",{166},51},
					{"安邦之鸡血石戒指 ",{167},51},
					{"侠骨之铁血衫",{186},70},
					{"侠骨之多情环",{187},70},
					{"侠骨之丹心戒",{188},70},
					{"侠骨之情意结",{189},20},
					{"柔情之巾帼霓裳",{190},14},
					{"柔情之淑女项链",{191},60},
					{"柔情之凤仪戒指",{192},80},
					{"柔情之慧心玉佩",{193},51},
					}
																									
function dragonboat_main()
	Say(" 端午节活动已结束，但是大家还可以用余下的物品合成龙舟和换取礼品。排名前十的玩家快来我这换黄金装备。.", 5,"制造龙舟/duanwu_convert","用龙舟换取领奖/dragon_award","排名前十的领取黄金装备./dragon_golden","相关活动/aboutboat", "不需要/OnCancel");
end

function want_playboat()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	local blevel = 0
	if (IsCaptain() ~= 1) then
		Say(" 对不起! 需要队长报名参加赛龙舟活动才行.",0)
		return
	end
	if (GetTeamSize() < 4) then
		Say(" 对不起! 参加赛龙舟活动队伍至少需要 <color=red>4<color> 人. 目前您的队不够人! 快去找些人来吧 ",0)
		return
	end
	if (GetLevel() >= 90) then
		blevel = 1
	end
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" 对不起! 在你的队伍中有人等级 <color=red>超过90级<color>, 不能参加比赛! 检查后再来参加报名! ",0)
				return
			else
				Say(" 对不起! 在你的队伍中有人等级 <color=red>不足90级<color>, 不能参加比赛! 检查后再来参加报名! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and map_isadvanced[map_map[i]] == blevel) then
				freeboat = freeboat + 1
			end
		end
	end
	print("total"..totalboat.."free"..freeboat)
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "初级龙舟赛"
	else
		strlevel = "高级龙舟赛"
	end
	
	if (startboat == 1) then
		if (freeboat == 0) then
			Say(" 该区域正在"..strlevel.." 开始. 没有地方了 ",0)
			return
		else
			Say(" 该区域正在"..strlevel.."赛龙舟报名阶段, 还有 <color=red>"..freeboat.."<color>龙舟还空的. 参加比赛需要交 <color=red>5 万<color>两, 你想参加吗?",2, "是的! 我想带我的队参加./dragon_join", "不需要/OnCancel")
			return
		end
	else
		Say(" 对不起! 该区域"..strlevel.."目前没有赛龙舟比赛. 报名 <color=red>按时<color> 开始. 报名时间为5分钟. 请注意系统通知!",0)
		return
	end
	
end

function dragon_join()
	local blevel = 0
	if (GetLevel() >= 90) then
		blevel = 1
	end
	if (IsCaptain() ~= 1) then
		Say(" 对不起! 需要队长报名参加赛龙舟活动才行.",0)
		return
	end
	if (GetTeamSize() < 1) then
		Say(" 对不起! 参加赛龙舟活动队伍至少需要 <color=red>4<color> 人. 目前您的队不够人! 快去找些人来吧",0)
		return
	end
	local bhaveboat = 0
	local boatstr = "小龙舟 "
	if (blevel > 0) then
		boatstr = "传统龙舟"
	end
	
	if (blevel == 0) then
		bhaveboat = CalcEquiproomItemCount( 6, 1, 422, 1 )
	else
		bhaveboat = CalcEquiproomItemCount( 6, 1, 423, 1 )
	end
	
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 0) then
		Say(" 对不起! 参加赛龙舟比赛需要交<color=red> 5 万两 和 "..boatstr.."<color>才行, 你的钱不够或者没带小龙舟。准备好了再来!.", 0)
		return
	end
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 1) then
		Say(" 对不起! 参加赛龙舟比赛需要交<color=red> 5 万两 和"..boatstr.."<color=red>才行, 你的钱不够或者没带传统龙舟! 准备好了再来!", 0)
		return
	end
	
	local OldPlayer = PlayerIndex
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" 对不起! 在你的队伍中有人等级 <color=red>超过90级<color>, 不能参加比赛! 检查后再来参加报名! ",0)
				return
			else
				Say(" 对不起! 在你的队伍中有人等级 <color=red>不足90级<color>, 不能参加比赛! 检查后再来参加报名! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	
	OldSubWorld = SubWorld
	
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and blevel == map_isadvanced[map_map[i]] ) then
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					print("plal"..tabplayer[i])
				end
				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(VARV_SIGNUP_WORLD, w)
				SetMissionV(VARV_SIGNUP_POSX, x)
				SetMissionV(VARV_SIGNUP_POSY, y)
				SetMissionS(VARS_TEAM_NAME,GetName())
				
				-- DEBUG
				print(format("%s 从(%d, %d, %d) 和位置进入龙舟", GetName(), w, x, y));

				Pay(50000)
				if (blevel == 0) then
					ConsumeEquiproomItem( 1, 6, 1, 422, 1)
				else
					ConsumeEquiproomItem( 1, 6, 1, 423, 1)
				end

				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					print("player"..PlayerIndex)
					JoinMission(MISSION_MATCH, 1)
				end
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "初级龙舟赛"
	else
		strlevel = "初级龙舟赛"
	end
	Say("对不起! 目前<color=red>"..strlevel.."<color> 已没有座位。请等下一轮!",0)
end

function dragon_award()
	Say(" 赛龙舟比赛正在如火如荼地进行，老夫正在收龙舟。你想用哪种龙舟换取奖励?",7,"小龙舟换取豆沙粽子/dousha","传统龙舟换取香菇粽子/xianggu","马头龙舟换取蛋黄粽子/danhuang"," 鸟头龙舟随机换取仙草露，水晶，宝石，天山宝露/birdboat_award","兽头龙舟随机换取神秘矿石，5-玄晶矿石8级/beastboat_award","大龙舟随机换取定国安邦，一套柔情侠骨黄金装备/hugeboat_award","不需要!/OnCancel");
end

function dragon_golden()
	--Say("礼官：龙舟大赛正在如火如荼的进行中，要等到<color=red>活动结束<color>后才能来领奖哦。",0);
	Say(" 你想领取什么比赛奖励?", 3, "初级龙舟赛/dragon_golden_low","a 高级龙舟赛/dragon_golden_high","不需要!/OnCancel");
end

function dragon_golden_low()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10141, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1507) ~= 0) then
				Say(" 你已领取初级龙舟赛排名前十奖励!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" 你的装备空位不够. 整理好后再来换吧",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1507,1);
			return 1
		end
	end
	Say(" 你不在初级龙舟赛排名前十行列, 不能领奖.",0);
end

function dragon_golden_high()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10142, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1508) ~= 0) then
				Say(" 你已领取级龙舟赛排名前十奖励!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" 你的装备空位不够. 整理好后再来换吧",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1508,1);
			return 1
		end
	end
	Say(" 不在高级龙舟赛排名前十行列, 不能领奖.",0);
end

function aboutboat()
	Say(" 你想了解哪一项?", 5,"合成龙舟的公式/aboutmaking","龙舟赛历史/abouthistory","相关报名/aboutjoin","注意项目 /aboutnotice","我知道了!/OnCancel");
end

function aboutmaking()
	local a = "小龙舟= 1 龙头 + 1 龙尾 + 1 龙身 + 1 龙骨 + 4 桨+ 1 方向盘 + 1 鼓";
	local b = "<enter>传统龙舟 = 1 小龙舟+ 4 桨";
	local c = "<enter>马头龙舟= 1 小龙舟+ 1 传统龙舟 + 1 龙头";
	local d = " 鸟头龙舟 = 1 马头龙舟 + 1 传统龙舟 + 1 龙头";
	local e = "<enter>兽头龙舟= 1 鸟头龙舟 + 1 马头龙舟 + 1 龙头";
	local f = "<enter>大龙舟 = 1 兽头龙舟+ 1 鸟头龙舟 + 1 马头龙舟";
	Talk(2,"",a..b..c,d..e..f);
end

function abouthistory()
	Talk(1,"","传说，屈原跳河后，当地人们梦见屈原身形消瘦，就用竹叶包饭成粽子，放上龙舟后推向河内，水下的水族开到是龙，就认为是龙王的东西，就不敢吃，所以，可以祭拜给屈原用。这就是龙舟赛和吃粽子的原由。");
end

function aboutjoin()
	Talk(2,"","玩家用 <color=red>小龙舟和传统龙舟<color> 作为<color=red>队长<color>, 领着各位队友到<color=red>礼官处<color> 报名参加初级和高级龙舟赛，没小时举行一次,<color=red>到时 <color>通知开始接受报名。报名时间为五分钟.","初级比赛最多允许 <color=red>8<color> 队伍参加，对应的是8张龙舟地图;高级比赛最多允许 <color=red>16<color> 队参加，对应的是16张龙舟地图。如果在礼官处报名数量够了，请玩家到其他城市的礼官处报名。");
end

function aboutnotice()
	Talk(3,"","报名成功后，所有队伍被转移到龙舟地图。在等比赛时间开始时，玩家<color=red>死亡的<color> 就会被判定为失去比赛资格。如果队长死亡的，余下成员依然可以继续比赛和领奖，但是成绩不能计入排行榜。.","在 <color=red>2 周后<color> 龙舟赛活动结束<color=red> 初级和高级比赛排名前十的队伍<color> 可以到礼官处领取定国安邦，1套柔情侠骨随机黄金装备.","想了解详细信息，请看主页： www.volam.com.vn");
end

function dousha()
	Say(" 吃豆沙粽子随机获得 <color=red>1 万, 2 万, 5 万经验值<color> 或者参加<color=red>初级龙舟赛<color>, 你真想换吗?",2,"我想换/dousha_yes","不需要!/OnCancel");
end

function dousha_yes()
	if(CalcEquiproomItemCount(6,1,422,1) <= 0) then
		Say(" 你没有小龙舟不能换奖励!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" 你的装备空位不够. 整理好后再来换吧",0);
		return
	end
	DelCommonItem(6,1,422);
	AddItem(6,1,435,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:领一个豆沙粽子");
	Say(" 你获得豆沙粽子.",0);
end

function xianggu()
	Say(" 吃香菇粽子随机获得<color=red>5 万, 10 万, 25 万经验值<color>或者参加<color=red>高级龙舟赛<color>, 你真的想换吗?",2,"我想换/xianggu_yes","不需要!/OnCancel");
end

function xianggu_yes()
	if(CalcEquiproomItemCount(6,1,423,1) <= 0) then
		Say(" 你没有<color=red>传统龙舟<color>,不能换奖励!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" 你的装备空位不够. 整理好后再来换吧",0);
		return
	end
	DelCommonItem(6,1,423);
	AddItem(6,1,436,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 领一个香菇粽子");	
	Say(" 你获得1 个香菇粽子.",0);
end

function danhuang()
	Say(" 吃蛋黄粽子随机获得<color=red>15 万, 30 万, 75 万经验值<color>, 你真想换吗?",2,"我想换/danhuang_yes","不需要!/OnCancel");
end

function danhuang_yes()
	if(CalcEquiproomItemCount(6,1,424,1) <= 0) then
		Say(" 你没有<color=red>马头龙舟<color>,不能换奖励!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" 你的装备空位不够. 整理好后再来换吧",0);
		return
	end
	DelCommonItem(6,1,424);
	AddItem(6,1,437,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:领一个蛋黄粽子");		
	Say(" 你获得1 个蛋黄粽子.",0);
end

function birdboat_award()
	local awardpro = {}
	if(CalcEquiproomItemCount(6,1,425,1) <= 0) then
		Say(" 你没有<color=red>鸟头龙舟<color>,不能换奖励!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" 你的装备空位不够. 整理好后再来换吧",0);
		return
	end
	for i = 1, getn(AWARD_BIRDBOAT) do
		awardpro[i] = AWARD_BIRDBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BIRDBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BIRDBOAT[numth][2][1],AWARD_BIRDBOAT[numth][2][2],AWARD_BIRDBOAT[numth][2][3],AWARD_BIRDBOAT[numth][2][4],AWARD_BIRDBOAT[numth][2][6],AWARD_BIRDBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BIRDBOAT[numth][2][1])
	end
	DelCommonItem(6,1,425);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 领一个"..AWARD_BIRDBOAT[numth][1]);		
	Say(" 你获得1 个"..AWARD_BIRDBOAT[numth][1]..".",0);
end

function beastboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,426,1) <= 0) then
		Say(" 你没有<color=red>兽头龙舟color>,不能换奖励!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" 你的装备空位不够. 整理好后再来换吧",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWORELASTDATE ) then	--如果上次用兽形龙舟换取玄晶、神秘矿石是当天的话
		if ( DWORENOWCOUNT >= DWOREMAXCOUNT ) then	--达到用兽形龙舟换取玄晶、神秘矿石最大数不能再换
			print(" 今天用兽头龙舟换取玄晶和神秘矿石已超过数量.")
			Say(" 今天用兽头龙舟换取玄晶和神秘矿石太多。老夫没有货了。去其他城市吧，明天再来!",0);
			return
		end
	else	--如果用兽形龙舟换取玄晶、神秘矿石数日期与当前不是同一天
		DWORELASTDATE = nNowDate;	--更新最近的日期
		DWORENOWCOUNT = 0;	--当前用兽形龙舟换取玄晶、神秘矿石数置0
	end
	
	for i = 1, getn(AWARD_BEASTBOAT) do
		awardpro[i] = AWARD_BEASTBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BEASTBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BEASTBOAT[numth][2][1],AWARD_BEASTBOAT[numth][2][2],AWARD_BEASTBOAT[numth][2][3],AWARD_BEASTBOAT[numth][2][4],AWARD_BEASTBOAT[numth][2][6],AWARD_BEASTBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BEASTBOAT[numth][2][1])
	end
	DWORENOWCOUNT = DWORENOWCOUNT + 1;
	DelCommonItem(6,1,426);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 领一个"..AWARD_BEASTBOAT[numth][1]);		
	Say(" 你获得1 个"..AWARD_BEASTBOAT[numth][1]..".",0);	
end

function hugeboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,427,1) <= 0) then
		Say(" 你没有<color=red>大龙舟<color>,不能换奖励!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 6) then
		Say(" 你的装备空位不够. 整理好后再来换吧 ",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWGOLDENLASTDATE ) then	--如果上次用巨型龙舟换取黄金装备是当天的话
		if ( DWGOLDENNOWCOUNT >= DWGOLDENMAXCOUNT ) then	--达到用巨型龙舟换取黄金装备最大数不能再换
			print(" 今天用大龙舟换取黄金装备太多.")
			Say(" 今天用大龙舟换取黄金装备太多. 去其他城市吧，明天再来!",0);
			return
		end
	else	--如果用巨型龙舟换取黄金装备日期与当前不是同一天
		DWGOLDENLASTDATE = nNowDate;	--更新最近的日期
		DWGOLDENNOWCOUNT = 0;	--当前用巨型龙舟换取黄金装备数置0
	end
	
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	if( getn(AWARD_HUGEBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_HUGEBOAT[numth][2][1],AWARD_HUGEBOAT[numth][2][2],AWARD_HUGEBOAT[numth][2][3],AWARD_HUGEBOAT[numth][2][4],AWARD_HUGEBOAT[numth][2][6],AWARD_HUGEBOAT[numth][2][6]);
	else
		AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	end
	DWGOLDENNOWCOUNT = DWGOLDENNOWCOUNT + 1;
	DelCommonItem(6,1,427);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 领一个"..AWARD_HUGEBOAT[numth][1]);		
	Say(" 你获得1 个"..AWARD_HUGEBOAT[numth][1]..".",0);	
end

function randomaward(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	local nCompareSum = 0;
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = random(1,nSum);
	for i = 1,nArgCount do
		nCompareSum = nCompareSum + aryProbability[i]
		if( nRandNum <= nCompareSum) then
			return i;
		end
	end
end

function dragon_givegolden()
	local awardpro = {};
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 排名前十获得1 个"..AWARD_HUGEBOAT[numth][1]);		
	Say(" 你获得1 个"..AWARD_HUGEBOAT[numth][1]..".",0);	
end	