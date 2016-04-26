Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\event\\wulin_final_match\\wulin_watchticket.lua")
Include("\\script\\event\\wulin_final_match\\awardevent.lua")
Include("\\script\\tong\\tong_header.lua");

--���ִ���Ա
function main()
	--Say("���ִ���Ա�����ֺ��ܣ���¹����֮��������Ӣ�ۣ��뼯�Ͻ�֮�ۡ��������ִ����Ϊ����Ԥѡ��������ѡ��90�����ָ�����Ϊ��������ѡ�ֲμ����յ�ȫ��ȫ�����ִ�ᣡȼ����ļ��飬��Ͷ���ⳡ������ҵ����ִ�ᣡ", 1, "ȷ��/want_bid_option")
	--	wulin_watchticketmain()
	wulin_awardmain()	--���ִ�ά�����
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
	if (validateDate(CP_BEGIN_BID_DATE, CP_END_BID_DATE)) then	--�ھ�ѡ��ӵ�ʱ��ʱ
		talkstr = "Ҫ������������Ӱ�?"
		optiontab = {
						"��ѡ����ӵĽ���ʱ��/look_endbid",
						"�������ִ������/transtoplace",
						"����Ҫ����������ͳ�죨��������/want_bid",
						"�鿴�����ڵ���ս���ʲ�	1/look_bid_self",
						"�鿴�����ڵ���ս���/look_bid_first",
						"�õ���������ѡ�ֳƺ� /catch_title",
						"�������ִ��/help_championship",
						"��һ�����!/OnCancel"
					}
	elseif(tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT) then
		talkstr = "��Ҫȡ������ѡ���ʸ���?"	--�Ѿ����������
		optiontab = {
						"�����μ���'��������'����'/regist_freshman",
						"����ս��/give_back",
						"��ȡ��������ѡ�ֳƺ�/catch_title",
						"����ս������ӣ�/send_card",
						"�鿴��������ѡ�������ͱ����ʸ�/look_card",
						"�������ִ��/help_championship",
						"��һ�����!/OnCancel"
			}
	elseif (tonumber(date("%y%m%d%H")) > CP_END_BID_DATE) then
		Say("������ѽ�������ȴ����ִ��Ԥѡ����ʼ��֮��鿴�����", 0)
		return
	else
		Say(" ���ִ�����ڿ�ʼ����ע��֪ͨ��Ϣ!",0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end

function want_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("ֻ�а������ʸ�μӾ��������ȥ��!", 0);
		return 0
	end
	if(GetLevel() < 90) then
		Say("90�����ϵİ����ſ��Ծ�������ӣ����ȥ�ɣ�", 0)
		return
	end
	local strName = GetName();
	if (str__findicon(strName) == 0) then
		Say("ÿ��Ͷ��Ҫ100��������ͼ���100������ÿ��Ͷ�������5����. ", 2, "ȷ��/sure_bid", "ȡ��/OnCancel")
	end
end

function sure_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("ֻ�а�������Ͷ���ʸ����ȥ��!", 0);
		return 0
	end

	local flag = check_bid_title()
	if (not flag) then  
		return
	end
	AskClientForNumber("bit",1000000,500000000, "������Ͷ��Ǯ��:");
end

function check_bid_title()
	biwu_loadfile(LEVELTOP10)
	local name = GetName()
	for i =1 , 10 do 
		topten_name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i)
		if (name == topten_name) then
			Say("���ѽ���ʮ��������磬���ʸ�μ����������������!�㲻�ܾ�������ӣ���ȥ�ɣ�", 0)
			return nil
		end
	end
	return 1
end


function bit(fee)
	if( fee < 1000000 ) then
		Say("���������100��.", 0);
		return 0
	end
	if( fee > 500000000 ) then
		Say("ÿ�ξ��������5����.", 0);
		return 0
	end
	if( GetCash() < fee ) then
		Say("��Ǯ��������׼�����������ɣ�", 0);
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
		Msg2Player(" ÿ�ξ���Ҫ100����������Ǯ֮����ʣ���"..dibs.."��")
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
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]����"..fee.."����.");
		Say("���һ�ξ���.��ξ���ļ�Ǯ��"..fee.."������ϵͳ�Ѽ�ס������֣��ʽ���˻����μӾ���Ĳ��������.",0);
		Msg2SubWorld("��� <color=blue> "..GetName().."<color> �ողμ�����������ӵľ���")
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
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]��������"..fee.."����. ��������Ϊ"..TongBid.."����.");
		Say("��ξ���Ŀ�����"..fee.."����. ϵͳ�Ѽ�¼��������֣��ʽ������˻����μӾ���Ĳ�������ɡ������ڣ���ľ������ʽ�Ϊ"..TongBid.."����.", 0);
		Msg2SubWorld("���<color=blue> "..GetName().."<color>�ողŲμ���������ӵľ���")
	return 1
end

CP_SENDCARD_OPEN = 5052820
CP_SENDCARD_END = 5060420

function send_card()	--ѡ���Ƿ��ɷ�

	sendmonth , senddate , sendhour = look_the_time( CP_SENDCARD_OPEN )
	endmonth , enddate , endhour = look_the_time( CP_SENDCARD_END )
if ( tonumber( date( "%y%m%d%H" ) ) < CP_SENDCARD_OPEN ) then
	Say(" ������ʸ�"..sendmonth.."��"..senddate.."��"..sendhour..",��"..endmonth.."�� "..enddate.."��"..endhour.."����", 0)
	return
end

if ( tonumber( date( "%y%m%d%H" ) ) > CP_SENDCARD_END ) then
	Say("����ӷ���μ��������������ʸ��ѽ����������ȥ�鿴������������ѡ�ֵ�����!", 0)
return
end

	local orgindex = PlayerIndex
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (GetName() ~= leader_name) then
		Say("�㲻����������ӣ�û���ʸ�ѡ��μ����������������ʸ�!", 0)
		return
	end
	if ( IsCaptain() ~= 1 ) then
		Say("�㲻�Ƕӳ���Ӧ��С��ӳ��ɳ�. ",0);
		return 0
	end
	MemCount = GetTeamSize();
	if ( MemCount <= 1 ) then
		Say("��Ķ�����û��������Ա�������ɳ�.",0);
		return 0
	end
	local TeamMembers = "";
	for i = 2, MemCount do
		PlayerIndex = GetTeamMember(i);
		TeamMembers = TeamMembers..","..GetName()
	end
	PlayerIndex = orgindex
	Say("��Ҫ��"..TeamMembers.."�μӾ������������90���Ļ���û���ʸ�μӱ�����Ҫ<color=yellow>"..endmonth.."�� "..enddate.."��"..endhour.." <color>����.", 2, "��/ensure", "��������/OnCancel"); 
	return
end

function ensure(ncount)	--ȷ���ɷ�
	local tabname = {}
	local ncount = 0
	local orgindex = PlayerIndex
	MemCount = GetTeamSize();
	for i = 1, MemCount do
		PlayerIndex = GetTeamMember(i);
		
		cp_checkmember_title()	--ȷ����ǰ��Ա���
				
		if ( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) ~= 9 and GetLevel() >= 90) then --������Ƕӳ��Լ�,����û�����ʸ�
			TeamMemberName = GetName();
			local flag = provide(TeamMemberName);
			if (not flag) then 
				PlayerIndex = orgindex
				Say("����û��Ȩ�����˲μӾ���", 0)
				WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] ����Ӳ����ʸ����˲μӱ���!")
				break 
			end
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--�����Ǹ��Լ��ӻ��Ǹ����ѣ�
			Title_ActiveTitle( 19 );
			Talk(1, "", "��ȥ�����ִ��ѡ�ֳƺ�");
			Msg2SubWorld("��ϲ���["..GetName().."]ȡ�����ִ��ѡ�ֳƺ�")
			WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."]����Ӳ鿴�����ʸ�")
		elseif( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) == 9 ) then
			Msg2Player("�����о���ѡ���ʸ�")
		elseif( IsCaptain() ~= 1 and GetLevel() < 90 ) then
			Msg2Player("��ĵȼ�����90����������ȡ����ѡ�ֵ��ʸ�")
		end
	end
	PlayerIndex = orgindex
end

function provide(MemberName)	--�ɷ��ʸ�
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	if (not MemberCount) then	--��֪��datΪ�ջ᷵��ʲô
		MemberCount = 0;
	end
	if ( MemberCount >= 29 ) then
		Say("�����ı��������������㲻����ȡ����ʸ�.", 0);
		return nil
	end
	count = tostring(MemberCount + 1);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Count", count);	--����
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
		Say("��û�вμӾ�ѡ��ӵĻ��Ϊʲô��Ҫ��ð����?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("������ȡ��������������ʸ񣬲��˻�Ǯ������!", 0)
		return
	end
	if (TongBid == 0) then
		Say("�㾺ѡ�ķ������Ѿ��˻�������.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("�㾺ѡ�ķ������Ѿ�ȫ���˻�������.", 0)
		return
	end
	Say("�����Ŀ����5������ÿ���㽫Ҫ��5��������֮ǰ��ȷ���������ȡ��ЩǮ.", 2, "�������Ѿ�����/sure_give_back", "�ҵ��»���/OnCancel")
end

function sure_give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("��û�вμӾ�ѡ��ӵĻ��Ϊʲô��Ҫ��ð����?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("������ȡ��������������ʸ񣬲��˻�Ǯ������!", 0)
		return
	end
	if (TongBid == 0) then
		Say("�㾺ѡ�ķ������Ѿ��˻�������.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("�㾺ѡ�ķ������Ѿ�ȫ���˻�������.", 0)
		return
	end

	if (GetCash() > 1500000000) then
		Say("�����������Ǯ̫���ˣ�Ҫ�������Ǯ����ʱ���ܡ�������Ҫ��Ǯ��ʱ���������.", 0)
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
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]�õ�5����������"..TongBid.."����û�в���")
		Say("��Ϊ�㾺���ķ��ô���50��������������50�������㻹��<color=yellow>"..TongBid.."<color>������������ȼ����ı����ܲ���װ����ЩǮ����!", 0)
	else
		BackBid = BackBid * 1000000
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(0))
		biwu_save(BID_DATA);
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, 0)
		BackBid = BackBid/10000
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]�õ��˿�"..BackBid.."����, ���˻����о�������.")
		Say("Ta tr?color=yellow>"..BackBid.."<color>�������㣬�����!", 0)
	end
end

function catch_title()
	Say("����Ҫ��ȡ�ĸ����ţ�", 5, "�����/leader", "����ʮ�����/level_top10", "���ִ��ѡ��/nomal_player", "ʮ�����ɵ�ǰ5�����/#faction_top5("..GetLastFactionNumber()..")", "����/OnCancel");
end

function level_top10()	--����ʮ����ȡ�ƺ�
	biwu_loadfile(LEVELTOP10);
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(8, 1, TITLETIME);
			Title_ActiveTitle( 8 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]��ȡ�����ִ��ʮ���������")
			Msg2Player("����ȡ�����ִ��ʮ���������");
			return 1
		end
	end
	Say("��û���ʸ���ȡ����ʮ����ֵĳƺ�.", 0);
	return
end

function faction_top5(factionnumber)	--10������ǰ����ȡ�ƺ�
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("�㲻��ʮ�����ɵ���.", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("����Ԥѡ�����ڻ�û�н�������û�в�������ǰ�壬������ȡ����.", 0)
		return
	end
	biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 9, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 9);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]�õ�"..FactionTitle[factionnumber+1].."����");
			Msg2Player("��õ�"..FactionTitle[factionnumber+1].."����");
			return 1
		end
	end
	Say("��û���ʸ���ȡ���ִ�����ɸ��ֳƺ�",0);
	return
end

function nomal_player()
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
		Say("��������������Ա:����ӻ�û�а䷢����Ԥѡ�ʸ���û���ʸ���ȡ����!", 0)
		return
	end
	local name = GetName()
	for i = 1, count do
		mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
		if (mem_name == name) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--�����Ǹ��Լ��ӻ��Ǹ����ѣ�
			Title_ActiveTitle( 19 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]����ȡ�����ִ��ѡ������");
			Msg2Player("��õ����ִ��ѡ������");
			return
		end
	end
	Say("����ӻ�û�и���Ԥѡ�ʸ����޷�ȡ������ض�!", 0)
end

function leader()	--�����ȡ�ƺ�
	biwu_loadfile(BID_LEADER)
	local name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if(GetName() ~= name) then
		Say("��û���ʸ���ȡ��������ӳƺ�.", 0)
		return
	end
	nt_settask(CP_TASKID_TITLE, 9)
	Title_AddTitle(7, 1, TITLETIME);
	Title_ActiveTitle(7);
	WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]����ȡ�����ִ������ӳƺ�");
	Msg2Player("����ȡ�����ִ�������");
end

function look_bid_first()
	local MasterName = Ladder_GetLadderInfo(10130, 1);
	if (not MasterName ) then
		Say("����û�о�������.", 0)
print("no new ladder1")
		return
	end
	if (MasterName == "") then
		Say("����û�о�������.", 0)
print("no new ladder2")
		return
	end
	Say("���ھ������ǲμӾ��������<color=yellow>"..MasterName.."<color>���.", 0)	
end

function look_bid_self()
	local tabmaster = {}
	local flag = 0
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if( not TongBid ) then
		Say("�㻹û�вμӾ��������Ҫ������?", 0)
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
		Say("�����ڵľ�����Ŀ��"..TongBid.."����, ��δ����ǰʮ.", 0)
	else
		Say("�����ڵľ�����Ŀ��"..TongBid.."����, ����"..flag..", ", 0)
	end
end

function look_card()
	listtab = {
				"ѡ����������ʮ���������/look_list_topten",
				"ѡ������ÿ������ǰ5/look_list_factop",
				"����Ӻ�����ѡ��/look_list_member",
				"����ʲô������/OnCancel"
				}
	Say("��Ҫ���ĸ�����? ", getn(listtab), listtab)
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
		Say("ѡ����������ʮ�������������: ", getn(topten_mem), topten_mem)
	else
		Say("����ʮ�����������û�г���. ", 0)
	end
end

function look_list_factop()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say(" ������δ�����������ɻ�û�и������ʸ������. ", 0)
		return
	end
local factab = {"����/#look_list_fac(1)", "����/#look_list_fac(2)", "����/#look_list_fac(3)", "�嶾/#look_list_fac(4)", "��ü/#look_list_fac(5)", "����/#look_list_fac(6)", "ؤ��/#look_list_fac(7)", "����/#look_list_fac(8)", "�䵱/#look_list_fac(9)", "����/#look_list_fac(10)" , "û�ٿ���!/OnCancel"}
	Say("���뿴�Ǹ�����ѡ������������", getn(factab), factab)
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
		Say("��������������Ա:"..Faction[nfact][3].."��ѡ��������:", getn(topfac_mem), topfac_mem);
	else
		Say("��������������Ա:"..Faction[nfact][3].."����Ԥѡ����������û��", 0)
	end
end

function look_list_member()
	local member_tab = {}
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name == "" or leader_name == nil) then
		Say("����û�������.", 0)
		return
	end
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	if (not MemberCount) then	--��֪��datΪ�ջ᷵��ʲô
		MemberCount = 0;
		Say("�����<color=yellow> "..leader_name.." <color>����û���ʸ��ʣ������.", 0)
		return
	end
	if (MemberCount <= 10) then
		member_tab = member_10_group(1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("��������������<color=yellow>"..leader_name.."<color>, �������ʸ�ѡ�ְ���"..MemberCount.."��, ��������:", getn(member_tab), member_tab)
	else
		member_tab = member_10_group(1, 10)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member1(10)"
		end
		Say("��������������<color=yellow>"..leader_name.."<color>, �����Ѿ����ʸ��ѡ�ְ���"..MemberCount.."��, ��������:", getn(member_tab), member_tab)
	end				
end

function look_list_member1(count)
	local member_tab = {}
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	MemberCount1 = MemberCount1 - count
	count1 = count + 1
	if (MemberCount1 <= 10) then
		member_tab = member_10_group(count1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("��������������Ա:", getn(member_tab), member_tab)
	else
		count2 = count + 10
		member_tab = member_10_group(count1, count2)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member2(20)"
		end
		Say("��������������Ա:", getn(member_tab), member_tab)
	end				
end

function look_list_member2(count)
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	count1 = count + 1
	member_tab = member_10_group(count1, MemberCount)
	for i =1, getn(member_tab) do
		member_tab[i] = member_tab[i].."/OnCancel"
	end
	Say("��������������Ա:", getn(member_tab), member_tab)
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
Say("���������������Ԥѡ��Բ�����������ڿ��Ե��Ҵ��������������ȡ��Ӧ�����š������ڴ����ִ�Ὺʼ.", 0)
do return end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then
		Say(" ���ѴӸ�����Ԥѡ���������б��޳������ܼ��������μ�.", 0)
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
	
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--�Ѿ�ȡ�þ���Ȧ�ʸ�
		Say("����ȡ��ѡ���ʸ񣬲�Ҫ����λ����!", 0)
		return
	end
	
	if (GetLevel() < 90) then
		Say("��Ҫ��90�����ϲſ��Խ������ִ������������������!", 0)
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("������������: ֻ��ʮ�����ɵ��˲ſ��Բμ����ִ�ᣬ���������ɲ��ܲμӡ�����ʮ������֮��ſ��Բμӱ���!", 0)
		return
	end
	
	if (nt_gettask(CP_TASKID_REGIST) == CP_UPTO_TRYOUT) then
		transtoplace()
	else
		local talkstr = "�����μ�Ԥѡ��Ҫ��10����������."
		Say(talkstr, 2, "����10����./sure_regist", "���ٿ���/OnCancel")
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
	Say("�㱨���Ѳ��㣬��10�����ٻ���!", 0)

end

function regist_freshman()
	Msg2Player( "����������������Ա�������μӱ���" )
	NewWorld( 176, 1624, 3233 )
end

function look_endbid()
	local endbid_year = floor(CP_END_BID_DATE / 1000000)
	local endbid_month = mod(floor(CP_END_BID_DATE / 10000), 100)
	local endbid_date = mod(floor(CP_END_BID_DATE / 100), 100)
	local endbid_hour = mod(CP_END_BID_DATE,100)
	Say("��������ʸ�"..endbid_month.."��"..endbid_date.."��"..endbid_hour.."ʱ����, ����ʱ����"..date("d ��% %m �� %Y �� H ʱ"), 0)	
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
