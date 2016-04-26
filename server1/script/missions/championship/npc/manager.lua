Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\event\\wulin_final_match\\wulin_watchticket.lua")
Include("\\script\\event\\wulin_final_match\\awardevent.lua")
Include("\\script\\tong\\tong_header.lua");

--武林大会官员
function main()
	--Say("武林大会官员：武林豪杰，逐鹿纷乱之世；天下英雄，齐集紫禁之巅。本次武林大会作为区域预选赛，将会选出90名武林高手作为代表本服的选手参加最终的全区全服武林大会！燃放你的激情，来投入这场轰轰烈烈的武林大会！", 1, "确认/want_bid_option")
	--	wulin_watchticketmain()
	wulin_awardmain()	--武林大会奖励入口
end

function str__findicon(string)
	len = strlen(string)
	for i = 1, len do 
		if (strbyte(string, i) == 93) then
			return 1
		end
	end
	return 0
end

function want_bid_option()
	local optiontab = {}
	if (validateDate(CP_BEGIN_BID_DATE, CP_END_BID_DATE)) then	--在竞选领队的时间时
		talkstr = "要竞争区域总领队啊?"
		optiontab = {
						"看选总领队的结束时间/look_endbid",
						"进入武林大会赛场/transtoplace",
						"我想要竞争区域总统领（各帮主）/want_bid",
						"查看我现在的挑战总资产	1/look_bid_self",
						"查看我现在的挑战情况/look_bid_first",
						"得到武林新秀选手称号 /catch_title",
						"帮助武林大会/help_championship",
						"我一会回来!/OnCancel"
					}
	elseif(tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT) then
		talkstr = "想要取得区域选手资格吗?"	--已经决出总领队
		optiontab = {
						"报名参加联'武林新秀'赛”'/regist_freshman",
						"领挑战金/give_back",
						"领取武林新秀选手称号/catch_title",
						"领挑战金（总领队）/send_card",
						"查看武林新秀选手名单和比赛资格/look_card",
						"帮助武林大会/help_championship",
						"我一会回来!/OnCancel"
			}
	elseif (tonumber(date("%y%m%d%H")) > CP_END_BID_DATE) then
		Say("竞争活动已结束！请等待武林大会预选赛开始！之后查看结果。", 0)
		return
	else
		Say(" 武林大会活动现在开始！请注意通知信息!",0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end

function want_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("只有帮主有资格参加竞赛，你回去吧!", 0);
		return 0
	end
	if(GetLevel() < 90) then
		Say("90级以上的帮主才可以竞争总领队！你回去吧！", 0)
		return
	end
	local strName = GetName();
	if (str__findicon(strName) == 0) then
		Say("每次投标要100万整，最低价是100万两，每次投标最多是5亿两. ", 2, "确认/sure_bid", "取消/OnCancel")
	end
end

function sure_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("只有帮主才有投标资格，你回去吧!", 0);
		return 0
	end

	local flag = check_bid_title()
	if (not flag) then  
		return
	end
	AskClientForNumber("bit",1000000,500000000, "请输入投标钱数:");
end

function check_bid_title()
	biwu_loadfile(LEVELTOP10)
	local name = GetName()
	for i =1 , 10 do 
		topten_name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i)
		if (name == topten_name) then
			Say("你已进入十大高手世界，有资格参加武林新秀联赛大会!你不能竞争总领队！回去吧！", 0)
			return nil
		end
	end
	return 1
end


function bit(fee)
	if( fee < 1000000 ) then
		Say("竞价最低是100万.", 0);
		return 0
	end
	if( fee > 500000000 ) then
		Say("每次竞争最多是5亿两.", 0);
		return 0
	end
	if( GetCash() < fee ) then
		Say("你钱不够，等准备够了再来吧！", 0);
		return 0
	end
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	intTongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not intTongBid) then
		intTongBid = 0
	end
	intfee = floor(fee/1000000)
	if (mod(fee, 1000000) ~= 0) then
		dibs = mod(fee, 1000000)
		fee = intfee * 1000000
		Msg2Player(" 每次竞争要100万整，找你钱之后还有剩余的"..dibs.."两")
	end
	Pay(fee);
	fee = floor(fee/10000)
	if( intTongBid == 0 ) then
		biwu_setdata(BID_DATA, MasterName, "Bid", intfee);
		biwu_setdata(BID_DATA, MasterName, "MasterName", MasterName);
		biwu_save(BID_DATA);
		cp_saveback_count(fee)
		Ladder_NewLadder(10130, MasterName, intfee, 1);
print("the first bid")
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]竞争"..fee.."万两.");
		Say("你第一次竞标.这次竞标的价钱是"..fee.."万两。系统已记住你的名字，资金和账户，参加竞标的操作已完成.",0);
		Msg2SubWorld("玩家 <color=blue> "..GetName().."<color> 刚刚参加了区域总领队的竞争")
		return 1
	end
print("bid back bid")
	intTongBid = intTongBid + intfee;
	TongBid = 100 * intTongBid;
	biwu_setdata(BID_DATA, MasterName, "Bid", tostring(intTongBid));
	biwu_setdata(BID_DATA, MasterName, "MasterName", MasterName);
	biwu_save(BID_DATA);
	cp_saveback_count(TongBid)
	Ladder_NewLadder(10130, MasterName, intTongBid, 1);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]继续竞标"..fee.."万两. 现在总数为"..TongBid.."万两.");
		Say("这次竞标的开价是"..fee.."万两. 系统已记录下你的名字，资金数和账户，参加竞标的操作已完成。到现在，你的竞标总资金为"..TongBid.."万两.", 0);
		Msg2SubWorld("玩家<color=blue> "..GetName().."<color>刚刚才参加区域总领队的竞争")
	return 1
end

CP_SENDCARD_OPEN = 5052820
CP_SENDCARD_END = 5060420

function send_card()	--选择是否派发

	sendmonth , senddate , sendhour = look_the_time( CP_SENDCARD_OPEN )
	endmonth , enddate , endhour = look_the_time( CP_SENDCARD_END )
if ( tonumber( date( "%y%m%d%H" ) ) < CP_SENDCARD_OPEN ) then
	Say(" 总领队资格到"..sendmonth.."月"..senddate.."日"..sendhour..",到"..endmonth.."月 "..enddate.."日"..endhour.."结束", 0)
	return
end

if ( tonumber( date( "%y%m%d%H" ) ) > CP_SENDCARD_END ) then
	Say("总领队发掘参加武林新秀联赛资格已结束，你可以去查看武林新秀联赛选手的名单!", 0)
return
end

	local orgindex = PlayerIndex
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (GetName() ~= leader_name) then
		Say("你不是区域总领队，没有资格选择参加武林新秀联赛的资格!", 0)
		return
	end
	if ( IsCaptain() ~= 1 ) then
		Say("你不是队长，应由小组队长派出. ",0);
		return 0
	end
	MemCount = GetTeamSize();
	if ( MemCount <= 1 ) then
		Say("你的队伍中没有其他成员，不能派出.",0);
		return 0
	end
	local TeamMembers = "";
	for i = 2, MemCount do
		PlayerIndex = GetTeamMember(i);
		TeamMembers = TeamMembers..","..GetName()
	end
	PlayerIndex = orgindex
	Say("你要派"..TeamMembers.."参加决赛？如果低于90级的话将没有资格参加比赛。要<color=yellow>"..endmonth.."月 "..enddate.."日"..endhour.." <color>结束.", 2, "想/ensure", "我正在想/OnCancel"); 
	return
end

function ensure(ncount)	--确认派发
	local tabname = {}
	local ncount = 0
	local orgindex = PlayerIndex
	MemCount = GetTeamSize();
	for i = 1, MemCount do
		PlayerIndex = GetTeamMember(i);
		
		cp_checkmember_title()	--确定当前队员身份
				
		if ( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) ~= 9 and GetLevel() >= 90) then --如果不是队长自己,并且没给过资格
			TeamMemberName = GetName();
			local flag = provide(TeamMemberName);
			if (not flag) then 
				PlayerIndex = orgindex
				Say("你已没有权利派人参加决赛", 0)
				WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] 总领队才有资格派人参加比赛!")
				break 
			end
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--这样是给自己加还是给队友？
			Title_ActiveTitle( 19 );
			Talk(1, "", "你去的武林大会选手称号");
			Msg2SubWorld("恭喜玩家["..GetName().."]取得舞林大会选手称号")
			WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."]总领队查看比赛资格")
		elseif( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) == 9 ) then
			Msg2Player("你已有决赛选手资格")
		elseif( IsCaptain() ~= 1 and GetLevel() < 90 ) then
			Msg2Player("你的等级不到90级，不能领取决赛选手的资格")
		end
	end
	PlayerIndex = orgindex
end

function provide(MemberName)	--派发资格
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	if (not MemberCount) then	--不知道dat为空会返回什么
		MemberCount = 0;
	end
	if ( MemberCount >= 29 ) then
		Say("这区的比赛队伍已满，你不能领取这个资格。.", 0);
		return nil
	end
	count = tostring(MemberCount + 1);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Count", count);	--计数
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Member"..count, MemberName);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Fact"..count, tostring(GetLastFactionNumber()) )
	biwu_save(LEADER_MEMBER);
	return 1
end

function give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("你没有参加竞选领队的活动，为什么还要想冒险呢?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("你已争取到本区的总领队资格，不退还钱给你了!", 0)
		return
	end
	if (TongBid == 0) then
		Say("你竞选的费用我已经退还给你了.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("你竞选的费用我已经全部退还给你了.", 0)
		return
	end
	Say("如果数目大于5亿两，每次你将要付5亿两。领之前请确认你可以领取这些钱.", 2, "现在我已经领了/sure_give_back", "我等下回来/OnCancel")
end

function sure_give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("你没有参加竞选领队的活动，为什么还要想冒险呢?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("你已争取到本区的总领队资格，不退还钱给你了!", 0)
		return
	end
	if (TongBid == 0) then
		Say("你竞选的费用我已经退还给你了.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("你竞选的费用我已经全部退还给你了.", 0)
		return
	end

	if (GetCash() > 1500000000) then
		Say("好像你带来的钱太多了，要还给你的钱我暂时保管。等你需要用钱的时候再来领吧.", 0)
		return
	end

	BackBid = TongBid
	if (BackBid > 500) then
		BackBid = 500
		TongBid = TongBid - BackBid
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(TongBid));
		biwu_save(BID_DATA);
		BackBid = 500 * 1000000
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, nt_gettask(CP_TASKID_BACKCONT) - 1)
		TongBid = TongBid * 100
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]得到5亿两，还有"..TongBid.."万两没有补回")
		Say("因为你竞争的费用大于50亿两，我先找你50万两，你还有<color=yellow>"..TongBid.."<color>万两在我这里，先检查你的背包能不能装下这些钱再来!", 0)
	else
		BackBid = BackBid * 1000000
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(0))
		biwu_save(BID_DATA);
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, 0)
		BackBid = BackBid/10000
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]得到退款"..BackBid.."万两, 已退还所有竞争费用.")
		Say("Ta tr?color=yellow>"..BackBid.."<color>万辆给你，请接受!", 0)
	end
end

function catch_title()
	Say("你想要领取哪个名号？", 5, "总领队/leader", "世界十大高手/level_top10", "武林大会选手/nomal_player", "十大门派的前5大高手/#faction_top5("..GetLastFactionNumber()..")", "不想/OnCancel");
end

function level_top10()	--世界十大领取称号
	biwu_loadfile(LEVELTOP10);
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(8, 1, TITLETIME);
			Title_ActiveTitle( 8 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]领取了武林大会十大高手名号")
			Msg2Player("你领取了武林大会十大高手名号");
			return 1
		end
	end
	Say("你没有资格领取世界十大高手的称号.", 0);
	return
end

function faction_top5(factionnumber)	--10大门派前五领取称号
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("你不是十大门派的人.", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("门派预选赛现在还没有结束，还没有产生门派前五，不能领取名号.", 0)
		return
	end
	biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 9, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 9);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]得到"..FactionTitle[factionnumber+1].."名号");
			Msg2Player("你得到"..FactionTitle[factionnumber+1].."名号");
			return 1
		end
	end
	Say("你没有资格领取武林大会门派高手称号",0);
	return
end

function nomal_player()
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
		Say("武林新秀联赛官员:总领队还没有颁发给你预选资格，你没有资格领取名号!", 0)
		return
	end
	local name = GetName()
	for i = 1, count do
		mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
		if (mem_name == name) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--这样是给自己加还是给队友？
			Title_ActiveTitle( 19 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]已领取到武林大会选手名号");
			Msg2Player("你得到舞林大会选手名号");
			return
		end
	end
	Say("总领队还没有给你预选资格，你无法取得这个特恩!", 0)
end

function leader()	--领队领取称号
	biwu_loadfile(BID_LEADER)
	local name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if(GetName() ~= name) then
		Say("你没有资格领取此区域领队称号.", 0)
		return
	end
	nt_settask(CP_TASKID_TITLE, 9)
	Title_AddTitle(7, 1, TITLETIME);
	Title_ActiveTitle(7);
	WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]已领取到武林大会总领队称号");
	Msg2Player("你领取到武林大会总领队");
end

function look_bid_first()
	local MasterName = Ladder_GetLadderInfo(10130, 1);
	if (not MasterName ) then
		Say("现在没有竞争对手.", 0)
print("no new ladder1")
		return
	end
	if (MasterName == "") then
		Say("现在没有竞争对手.", 0)
print("no new ladder2")
		return
	end
	Say("现在竞争者们参加竞争最高是<color=yellow>"..MasterName.."<color>玩家.", 0)	
end

function look_bid_self()
	local tabmaster = {}
	local flag = 0
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if( not TongBid ) then
		Say("你还没有参加竞争活动，想要试试吗?", 0)
		return
	end
	TongBid = TongBid * 100
	for i = 1, 10 do 
		tabmaster[i] = Ladder_GetLadderInfo(10130, i);
		if (MasterName == tabmaster[i]) then
			flag = i
			break
		end
	end
	if (flag == 0) then
		Say("你现在的竞争数目是"..TongBid.."万两, 还未进入前十.", 0)
	else
		Say("你现在的竞争数目是"..TongBid.."万两, 排行"..flag..", ", 0)
	end
end

function look_card()
	listtab = {
				"选出来的世界十大高手名单/look_list_topten",
				"选出来的每个门派前5/look_list_factop",
				"总领队和其他选手/look_list_member",
				"还有什么好事吗/OnCancel"
				}
	Say("你要看哪个名单? ", getn(listtab), listtab)
end

function look_list_topten()
	biwu_loadfile(LEVELTOP10);
	local topten_mem = {}
	local ncount = 0;
	for i = 1, 10 do
		 name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topten_mem[ncount] = name.."/OnCancel"	
		 end
	end
	
	if (ncount > 0) then
		Say("选出来的世界十大高手名单如下: ", getn(topten_mem), topten_mem)
	else
		Say("世界十大高手名单还没有出来. ", 0)
	end
end

function look_list_factop()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say(" 比赛还未结束，各门派还没有给出有资格的名单. ", 0)
		return
	end
local factab = {"少林/#look_list_fac(1)", "天王/#look_list_fac(2)", "唐门/#look_list_fac(3)", "五毒/#look_list_fac(4)", "峨眉/#look_list_fac(5)", "翠烟/#look_list_fac(6)", "丐帮/#look_list_fac(7)", "天忍/#look_list_fac(8)", "武当/#look_list_fac(9)", "昆仑/#look_list_fac(10)" , "没再看见!/OnCancel"}
	Say("你想看那个门派选出来的名单吗？", getn(factab), factab)
end

function look_list_fac(nfact)
	local ncount = 0
	biwu_loadfile( Faction[nfact][1] );
	local topfac_mem = {}
	for i = 1, 5 do
		name = biwu_getdata(Faction[nfact][1], Faction[nfact][2], "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topfac_mem[ncount] = name.."/OnCancel"
		 end
	end
	if (ncount > 0) then
		Say("武林新秀联赛官员:"..Faction[nfact][3].."中选门派名单:", getn(topfac_mem), topfac_mem);
	else
		Say("武林新秀联赛官员:"..Faction[nfact][3].."门派预选比赛名单还没有", 0)
	end
end

function look_list_member()
	local member_tab = {}
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name == "" or leader_name == nil) then
		Say("现在没有总领队.", 0)
		return
	end
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	if (not MemberCount) then	--不知道dat为空会返回什么
		MemberCount = 0;
		Say("总领队<color=yellow> "..leader_name.." <color>现在没有资格给剩余的玩家.", 0)
		return
	end
	if (MemberCount <= 10) then
		member_tab = member_10_group(1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("此区域的总领队是<color=yellow>"..leader_name.."<color>, 现已有资格选手包括"..MemberCount.."人, 名单如下:", getn(member_tab), member_tab)
	else
		member_tab = member_10_group(1, 10)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member1(10)"
		end
		Say("次区域的总领队是<color=yellow>"..leader_name.."<color>, 现在已经有资格的选手包括"..MemberCount.."人, 名单如下:", getn(member_tab), member_tab)
	end				
end

function look_list_member1(count)
	local member_tab = {}
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	MemberCount1 = MemberCount1 - count
	count1 = count + 1
	if (MemberCount1 <= 10) then
		member_tab = member_10_group(count1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("武林新秀联赛官员:", getn(member_tab), member_tab)
	else
		count2 = count + 10
		member_tab = member_10_group(count1, count2)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member2(20)"
		end
		Say("武林新秀联赛官员:", getn(member_tab), member_tab)
	end				
end

function look_list_member2(count)
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	count1 = count + 1
	member_tab = member_10_group(count1, MemberCount)
	for i =1, getn(member_tab) do
		member_tab[i] = member_tab[i].."/OnCancel"
	end
	Say("武林新秀联赛官员:", getn(member_tab), member_tab)
end


function member_10_group(start, ending)
	biwu_loadfile(LEADER_MEMBER);
	local memtab = {}
	local count = ending - start + 1
	for i = 1, count do
		j = i + start - 1
		memtab[i] = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..j);
	end
	return memtab
end

function cp_saveback_count(tol_money)
	if (mod(tol_money, 50000) > 0) then
		back_count = floor(tol_money / 50000) + 1
	else
		back_count = floor(tol_money / 50000)
	end
	nt_settask(CP_TASKID_BACKCONT, back_count)
end

function regist_champion()
Say("武林新秀联赛大会预选赛圆满结束。现在可以到我处看比赛结果和领取相应的名号。敬请期待武林大会开始.", 0)
do return end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then
		Say(" 你已从各门派预选赛的名单中被剔除，不能继续报名参加.", 0)
		return
	end
	
	biwu_loadfile(BID_LEADER )
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name ~= "" and leader_name ~= nil) then
		if (GetName() == leader_name) then
			nt_settask(CP_TASKID_TITLE, 9)
		end
	end
	
	biwu_loadfile(LEVELTOP10)
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if(Name ~= "" and Name ~= nil) then
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
	end
	
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
	else
		for i = 1, count do
			mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
			if (mem_name ~= "" and mem_name ~= nil) then
				if (mem_name == GetName()) then
					nt_settask(CP_TASKID_TITLE, 9)
				end
			end
		end
	end
	
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--已经取得决赛圈资格
		Say("你已取得选手资格，不要再抢位置了!", 0)
		return
	end
	
	if (GetLevel() < 90) then
		Say("你要到90级以上才可以进入武林大会赛场，继续练级吧!", 0)
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("武林盟主有令: 只有十大门派的人才可以参加武林大会，你无门无派不能参加。加入十大门派之后才可以参加比赛!", 0)
		return
	end
	
	if (nt_gettask(CP_TASKID_REGIST) == CP_UPTO_TRYOUT) then
		transtoplace()
	else
		local talkstr = "报名参加预选赛要交10万两报名费."
		Say(talkstr, 2, "这是10万两./sure_regist", "我再看看/OnCancel")
		return
	end
end

function sure_regist()
	if (GetCash() >= CP_CASH) then
		Pay(CP_CASH)
		
		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end

		transtoplace()
		return
	end
	Say("你报名费不足，够10万两再回来!", 0)

end

function regist_freshman()
	Msg2Player( "到武林新秀联赛官员处报名参加比赛" )
	NewWorld( 176, 1624, 3233 )
end

function look_endbid()
	local endbid_year = floor(CP_END_BID_DATE / 1000000)
	local endbid_month = mod(floor(CP_END_BID_DATE / 10000), 100)
	local endbid_date = mod(floor(CP_END_BID_DATE / 100), 100)
	local endbid_hour = mod(CP_END_BID_DATE,100)
	Say("总领队有资格到"..endbid_month.."月"..endbid_date.."日"..endbid_hour.."时结束, 现在时间是"..date("d 日% %m 月 %Y 年 H 时"), 0)	
end

function look_the_time( THETIME )
	local the_year = floor(THETIME / 1000000)
	local the_month = mod(floor(THETIME / 10000), 100)
	local the_date = mod(floor(THETIME / 100), 100)
	local the_hour = mod(THETIME,100)
	return	the_month, the_date, the_hour
end

function cp_checkmember_title()

		biwu_loadfile(BID_LEADER)
		Name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
		if (GetName() == Name) then
			nt_settask(CP_TASKID_TITLE, 9)
		end

		factionnumber = GetLastFactionNumber()
		biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
			Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
		
		biwu_loadfile(LEVELTOP10);
		for i = 1, 10 do
			Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
end
