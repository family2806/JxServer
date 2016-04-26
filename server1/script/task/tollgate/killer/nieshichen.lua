--Boss杀手任务接引npc脚本
--By LiuKuo 2005.3.25
Include ("\\script\\class\\ktabfile.lua")
Include ("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main.lua")
Include("\\script\\event\\birthday_jieri\\200905\\chuangguan\\chuangguan.lua");
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\log.lua")
-- 闯关活动每日排行榜
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
---- Describ图片描述
--DescLink_NieShiChen = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>聂弑尘：<link>";
--TSKID_KILLTASKID = 1082;	-- 接受的哪个任务
--TSKID_KILLERDATE	= 1192;	--接任务时的日期
--TSKID_KILLERMAXCOUNT	= 1193;	--每天杀人次数
--KILLER_MAXCOUNT		= 8;	--每天杀人上限8人

--添加检查组队参加挑战的条件- Modified by DinhHQ - 20110504
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")

ContentList = {
	"<#>如果谁能完成160次杀手锏任务，那么变成第一杀手的梦想就算是完成了. 每天只需完成<color=yellow>8次任务<color>就行. <enter>赶快接引任务，在挑战时间内，体验同队的力量和自己的杀手能力.",
	"<#> 杀手任务20/killer20",
	"<#> 杀手任务30/killer30",
	"<#> 杀手任务40/killer40",
	"<#> 杀手任务50/killer50",	--5
	"<#> 杀手任务60/killer60",
	"<#> 杀手任务70/killer70",
	"<#> 杀手任务80/killer80",
	"<#> 杀手任务90/killer90",
	"<#> 我打不想杀人，放弃任务 /cancel",	--10
	"<#> 出血掉头，我最好还是远离吧/no",
	"<#> 你已放弃任务，作为杀手，首先要有超凡手法，其次是下手无情，看起来你不适合，不去也没事.",
	"<#> 上次我说的人，你去下手还活着，快去证明自己的实力先吧.",
	"<#> 你的等级不符合，需要与同等级的人交手才行.",
	"<#> 关闭/no",	--15
	"<#> 这样的等级有20杀手，每个人的手都染血了，你想与谁打?",
	"<#> 合成杀手锏/compose",
	"<#> 你放的杀手锏不对，观察能力很重要.",
	"<#> 你放的杀手令太多，杀手也要有他的艺术，不能连自己的生命都不懂.",
	"<#> 你放的杀手令太少，杀手也要有他的艺术，不能连自己的生命都不懂.",	--20
	"<#> 再合成一次/compose",
	"<#> 你已合成一个<color=",
	"<#> 属性<color> 杀手锏，杀手锏是一个非凡杀手，你可以用一个同级的杀手与杀手锏对比，胜负规则按照五行相克的规则来运用. ",
	"<#> 试炼杀手 /annealofkiller",
	"<#> 参加挑战/want_playboat",	--25
	"<#> 试炼杀手首先从参加挑战开始，你敢继续接任务吗?",
	"<#> 与挑战相关/aboutchallenge",
	"<#>系统将每小时通报一次，报名时间为5分钟，时间为30分钟。每个人最多只能每天2次，需要由队长来报名. <enter>挑战时间任务包括2个参加区域: 玩家从50到89级，由队长带2个90级以下杀手锏，（五行不齐）去报名。高级：玩家从90级以上，由队长带2个90级以上杀手锏（五行不齐）去报名. <enter>在规定时间，如果穿过28关将完成. 每关经验奖励不同。如果提前完成任务，经验奖励就更高 <enter>如果提前完成，可能将多出现一关，其中有很多意想不到的奖励(偶然物品，黄金装备）. 只有在规定时间内闯过28关的队才能在排行榜上有自己的名字.",
	"<#>任务 \"过关寻宝\"/guoguan_xunbao",
	"<#>我来领奖/rank_award",
	"<#>我来看今日排名最高的5队./get_top5team"
}

killertabfile = new(KTabFile,"/settings/task/tollgate/killer/killer.txt","KILLER")

function main()
	UWorld1082 = nt_getTask(1082);
--	local tbDialog = {ContentList[24],ContentList[17],ContentList[2],ContentList[3],ContentList[4],ContentList[5],ContentList[6],ContentList[7],ContentList[8],ContentList[9],ContentList[10],ContentList[11],ContentList[30], ContentList[31], ContentList[15]};
	local tbDialog = {ContentList[24],ContentList[17],ContentList[9],ContentList[10],ContentList[11],ContentList[30], ContentList[31], ContentList[15]};
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 12, ContentList[29]);
	end
	Describe(DescLink_NieShiChen..ContentList[1], getn(tbDialog), unpack(tbDialog));
end

function annealofkiller()
--添加检查组队参加挑战的条件- Modified by DinhHQ - 20110504
	--Describe(DescLink_NieShiChen..ContentList[26], 3, ContentList[25],ContentList[27],ContentList[11]);
	Describe(DescLink_NieShiChen..ContentList[26], 4, ContentList[25], "<#> 检查组队条件/#tbCOT_Party:CheckCondition()",ContentList[27],ContentList[11]);
end

function aboutchallenge()
	Describe(DescLink_NieShiChen..ContentList[28],1, ContentList[15]);
end

function killer20()
	if ( killerCoundTakedTask(20, 29) == 0) then
		return 0;
	end;
	showboss( 0 );
end

function killer30()
	if ( killerCoundTakedTask(30, 39) == 0) then
		return 0;
	end;
	showboss( 20 );
end

function killer40()
	if ( killerCoundTakedTask(40, 49) == 0) then
		return 0;
	end;
	showboss( 40 );
end

function killer50()
	if ( killerCoundTakedTask(50, 59) == 0) then
		return 0;
	end;
	showboss( 60 );
end

function killer60()
	if ( killerCoundTakedTask(60, 69) == 0) then
		return 0;
	end;
	showboss( 80 );
end

function killer70()
	if ( killerCoundTakedTask(70, 79) == 0) then
		return 0;
	end;
	showboss( 100 );
end

function killer80()
	if ( killerCoundTakedTask(80, 89) == 0) then
		return 0;
	end;
	showboss( 120 );
end

function killer90()
	if ( killerCoundTakedTask(90, 350) == 0) then
		return 0;
	end;
	showboss( 140 );
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBossSatThu")
end

function cancel()
	nt_setTask(1082, 0);
	Describe(DescLink_NieShiChen..ContentList[12], 1,ContentList[15]);
end

function havetask()
	if ( UWorld1082 ~= 0 ) then
		Describe(DescLink_NieShiChen..ContentList[13], 1,ContentList[15]);
		return 0
	end
	return 1
end

function showboss(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+1).."/#givetask("..(row+1)..")", killertabfile:getCell("BossName",row+2).."/#givetask("..(row+2)..")", killertabfile:getCell("BossName",row+3).."/#givetask("..(row+3)..")", killertabfile:getCell("BossName",row+4).."/#givetask("..(row+4)..")", killertabfile:getCell("BossName",row+5).."/#givetask("..(row+5)..")", killertabfile:getCell("BossName",row+6).."/#givetask("..(row+6)..")", killertabfile:getCell("BossName",row+7).."/#givetask("..(row+7)..")", killertabfile:getCell("BossName",row+8).."/#givetask("..(row+8)..")", killertabfile:getCell("BossName",row+9).."/#givetask("..(row+9)..")", killertabfile:getCell("BossName",row+10).."/#givetask("..(row+10)..")", "下一页 /#showbossnext("..row..")", ContentList[15]);
end

function showbossnext(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+11).."/#givetask("..(row+11)..")", killertabfile:getCell("BossName",row+12).."/#givetask("..(row+12)..")", killertabfile:getCell("BossName",row+13).."/#givetask("..(row+13)..")", killertabfile:getCell("BossName",row+14).."/#givetask("..(row+14)..")", killertabfile:getCell("BossName",row+15).."/#givetask("..(row+15)..")", killertabfile:getCell("BossName",row+16).."/#givetask("..(row+16)..")", killertabfile:getCell("BossName",row+17).."/#givetask("..(row+17)..")", killertabfile:getCell("BossName",row+18).."/#givetask("..(row+18)..")", killertabfile:getCell("BossName",row+19).."/#givetask("..(row+19)..")", killertabfile:getCell("BossName",row+20).."/#givetask("..(row+20)..")", "上一页/#showboss("..row..")", ContentList[15]);
end

function givetask(taskid)
	nt_setTask(1082,taskid);
	Describe(DescLink_NieShiChen..killertabfile:getCell("BossName",taskid)..killertabfile:getCell("BossInfo",taskid), 1, ContentList[15]);
end

function compose()
	GiveItemUI("合成杀手锏界面","同等级的5个杀手令奖合成一个相应的杀手锏，杀手锏的属性与5个杀手令的属性相关。你可以用杀手锏来和其他人的同级杀手锏对比，胜负规则按照五行相克的规则。.","exchange_token", "no")
end

function exchange_token(ncount)
	local scrollidx = {}
	local scrollattr = {}
	local y = 0
	local compare_level = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype, level, attribute = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype == 399  ) then	
			if( y > 0 ) then
				if( level ~= compare_level ) then
					Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
					return
				end
			end
			y = y + 1;
			scrollidx[y] = nItemIdx;
			scrollattr[y] = attribute;
			compare_level = level;
		end
	end
	if( y ~= ncount) then
		Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y > 5 ) then
		Describe(DescLink_NieShiChen..ContentList[19], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y < 5 ) then
		Describe(DescLink_NieShiChen..ContentList[20], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y == 5 ) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i]);
		end
		givesword(scrollattr,compare_level);
	end
end

function givesword(attr,level)
	series = {"metal>金", "wood>木", "water>水", "fire>火", "earth>土"};
	i = random( 1, 5 );
	AddItem( 6, 1, 400, level, attr[i], 0);
	j = attr[i] + 1;
	Describe(DescLink_NieShiChen..ContentList[22]..series[j]..ContentList[23], 1, ContentList[15]);
end

function no()
end

--每天接任务的限制
function killerCoundTakedTask(nLowLevel, nHighLevel)
	if ( havetask() == 0) then
		return 0;
	end;
	local myLevel = GetLevel();
	if( myLevel < nLowLevel or myLevel >  nHighLevel) then
		Describe(DescLink_NieShiChen..ContentList[14], 1,ContentList[15]);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local myDate = nt_getTask(TSKID_KILLERDATE);
	if (myDate == nDate and nt_getTask(TSKID_KILLERMAXCOUNT) >= KILLER_MAXCOUNT) then
		Describe(DescLink_NieShiChen.."杀手有一个素质很重要，叫做轻敌败阵。今天你已"..KILLER_MAXCOUNT.." 下来了，明天再来吧.", 1, ContentList[15]);
		return 0;
	elseif (myDate ~= nDate) then
		nt_setTask(TSKID_KILLERMAXCOUNT, 0);
		nt_setTask(TSKID_KILLERDATE, nDate);
	end;
	return 1;
end;
