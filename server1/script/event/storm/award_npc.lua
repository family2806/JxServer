Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--���ε���������
TB_STORM_LADDERNAME = {"�ھ�", "�Ǿ�", "��3��", " ��4��", " ��5��",
	"��6��", " ��7��", " ��8��", " ��9��", " ��10��", "������������", "û������"}

--�����˴���	
STORM_WLMCR = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>���ִ���<link>"

--���ָ����awardtype
--awardid == nil	���أ�����+/-����	������ȡ�����н���
--awardid > 0		���أ�nil��������ȡ	���򷵻ػ���+/-����
function storm_checkaward(awardtype, awardid)
	storm_anotherday()
	
	if (awardtype == nil or TB_STORM_AWARD[awardtype] == nil) then
		return nil
	end
	
	if (GetTask(TB_STORM_AWARD[awardtype][3]) > 0) then
		Say("������˼! "..TB_STORM_AWARD[awardtype][1].."��Ľ����Ѿ���ȡ����!", 0)
		return nil
	end
	
	local awardvalue = 0
	if (TB_STORM_AWARD[awardtype][2] == 1) then
		awardvalue = -storm_getrank(awardtype)	--�ø������Ƚϸ�����
	else
		awardvalue = GetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if (awardid == nil) then
		local tb_award = {}
		local awardlevel = awardvalue
		for i = 1, getn(TB_STORM_AWARD[awardtype][5]) do
			if (awardvalue >= TB_STORM_AWARD[awardtype][5][i][1]) then
				if (awardlevel == TB_STORM_AWARD[awardtype][5][i][1] or getn(tb_award) == 0) then	--������ͼ�����
					awardlevel = TB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1] = i
				end
			end
		end
		return awardvalue, tb_award
	else
		if (awardvalue < TB_STORM_AWARD[awardtype][5][awardid][1]) then
			Say("���ִ��ˣ������û����˽�Ʒ!", 0)
			return nil
		else
			return awardvalue
		end
	end
end

--���Ի�
function storm_main()
	if (GetTask(STORM_TASKID_LETTER) ~= 2) then
		Describe(STORM_WLMCR.."<#> ���������ĺ�Ϊ�ң� ��ͷ����, ��ͷ��ˮ��ͻȻ�뵽һ�仰����ʹ������ƽ̹, Ӣ�ۺ��ܸ���˭!", 1, "��ʦ9�·籩�/storm_main")
		Msg2Player("��õ�����Զ�������ָ�")
		AddItem(6, 1, 898, 1, 0 ,0)
		SetTask(STORM_TASKID_LETTER, 2)
	else
		local tb_option = {}
		tb_option[getn(tb_option)+1] = "������ȡ���ս���/#storm_award(1)"
		if (GetTask(STORM_TASKID_DAY_LASTAWARD) == 0) then
			tb_option[getn(tb_option)+1] = "������ȡ���ս���/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1] = "������ȡ���ܽ���/#storm_award(2)"
		tb_option[getn(tb_option)+1] = "������ȡ���½���/#storm_award(3)"
		tb_option[getn(tb_option)+1] = "�˽��ҵĻ��۵�/#storm_query(0)"
		tb_option[getn(tb_option)+1] = "�˽�籩�/storm_help"
		tb_option[getn(tb_option)+1] = "����Ҫ!/OnCancel"
		Describe(STORM_WLMCR.."<#> ���ڻ��ҳ���ӻ����", getn(tb_option), tb_option)
	end
	storm_anotherday()
end

--��ȡ�������鿴������
function storm_award(awardtype)
	local awardvalue, tb_award = storm_checkaward(awardtype)
	if (awardvalue == nil) then
		return
	end
	
	local str = ""
	if (awardvalue >= 0) then
		str = "��"..TB_STORM_AWARD[awardtype][1].."�籩������:"..storm_point2str(awardvalue)
	elseif (awardvalue == -12) then
		str = TB_STORM_AWARD[awardtype][1].."���а���û��"
	elseif (awardvalue == -11) then
		str = "��"..TB_STORM_AWARD[awardtype][1].."���а���û��"
	elseif (awardvalue >= -3) then
		str = "��"..TB_STORM_AWARD[awardtype][1].."9�·籩���"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str = "��"..TB_STORM_AWARD[awardtype][1].."9�·籩�������"..storm_point2str(-awardvalue).."�� "
	end
	
	local awardcount = getn(tb_award)
	if (awardcount > 0) then
		local tb_option = {}
		if (awardcount == 1) then
			str = str..", �������ȡ��Ʒ: <enter>"
			str = str.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str = str.."<enter>, ������ȡ��?"
			Say("���ִ���:"..str, 2, "��Ҫ�콱/#storm_getaward("..awardtype..","..tb_award[1]..",0)", "����һ��/OnCancel")
		else
			str = str..", ����������½�Ʒ����ѡһ��: <enter>"
			for i = 1, getn(tb_award) do
				if (i >= 2) then
					str = str.."��"
				end
				local awardname = TB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str = str.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1] = "��"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str = str.."<enter> ȷ������?"
			tb_option[getn(tb_option)+1] = "����Ҫ!/OnCancel"
			Say("���ִ���:"..str, getn(tb_option), tb_option)
		end
	else
		Say("���ִ���:"..str..", ���޷��콱", 0)
		return
	end
end

--��ȡָ����Ʒ
function storm_getaward(awardtype, awardid, sure)
	local awardvalue = storm_checkaward(awardtype, awardid)
	if (not storm_checkaward(awardtype, awardid)) then
		return
	end

	if (sure == 1) then
		Say("�콱ǰ������!", 2, "���Ѿ�׼������!/#storm_getaward("..awardtype..","..awardid..",2)", "�һ�Ҫ�������±���/OnCancel")
	elseif (sure == 2) then
		if (CalcFreeItemCellCount() < storm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])) then
			Say("��ı���û�пռ䣬����һ��!", 0)
		else
			if (awardtype == 1 or awardtype == 4) then
				local mapid = tostring(SubWorldIdx2ID(SubWorld))
				local plcount = GetGlbValue(46) + 1
				SetGlbValue(46, plcount)
				Ladder_NewLadder(10195, mapid, plcount, 1)
			end
			local str = "�õ�"..TB_STORM_AWARD[awardtype][1].."�籩���ֽ���"..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3], 1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if (awardvalue >= 0) then
				str = awardvalue.."�籩����"
			else
				str = "�ŵ�"..(-awardvalue).."��"
			end
			if (awardtype == 2 or awardtype == 3 or awardid <= 2) then	--�󽱷�������
				AddGlobalNews(GetName().."��"..TB_STORM_AWARD[awardtype][1].."�籩��еõ�"..TB_STORM_AWARD[awardtype][5][awardid][2].." ")
			end
		end
	else
		Say("��ȷ����ȡ<color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color> ����? ����֮��������"..TB_STORM_AWARD[awardtype][1].."��Ľ���!", 2, "֪����! ��ֻ��������ˣ�/#storm_getaward("..awardtype..","..awardid..",1)", "����Ҫ!/OnCancel")
	end
end

--��ѯ���˷籩�������
function storm_query(querytype)
	storm_anotherday()
	
	local str = ""
	local tb_sheet = {}
	local var_width, var_align
	if (querytype == 1) then
		if (GetTask(STORM_TASKID_DAY) <= STORM_END_DAY) then
			str = "����յķ籩��������: <enter>%�����ܻ�����:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width = {12,8,8,10}
			var_align = 2
			tb_sheet[getn(tb_sheet)+1] = {"���", "����", "״̬", "��߻���"}
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local trycount = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local state = ""
					if storm_valid_game(i) then
						state = "<color=red>���ڽ���<color>"
					elseif (trycount <= 0) then
						state = "<color=blue>��δ����<color>"
					elseif (trycount < TB_STORM_TRYTIMES[i]) then
						state = "<color=green>�Ѿ�������<color>"
					else
						state = "<color=8947848>�ѽ�����<color>"
					end
					tb_sheet[getn(tb_sheet)+1] = {
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str = "�<color=red>9�·籩<color>�ѽ���!"
		end
	elseif (querytype == 2) then
		str = "  ������ķ籩������:<enter>%s"
		var_width = {8,10,6,8,10}
		var_align = 2
		tb_sheet[getn(tb_sheet)+1] = {
			"�i����Ļ�����", storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), "",
			"�i����Ļ���", storm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"�i���ܵĻ���", storm_point2str(GetTask(STORM_TASKID_WEEK_POINT)), "",
			"�i���ܵĻ���", storm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"�i����µĻ���", storm_point2str(GetTask(STORM_TASKID_MONTH_POINT)), "",
			"�i�ϸ��µĻ���", storm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"��������", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>", "",
			"��������", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("�����˽�ʲô����?", 3, "�ҽ���ķ籩����/#storm_query(1)", "������ķ籩����/#storm_query(2)", "û��ʲô!/OnCancel")
		return
	end
	str = format(str, maketable(tb_sheet, var_width, var_align))
	Say(str, 2, "�����˽�/#storm_query(0)", "ûʲô��лл!/OnCancel")
end

--�˵��������
function storm_help()
	local tb_option = {}
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			tb_option[getn(tb_option)+1] = "��籩��йص�-"..TB_STORM_DESCRIBE[i].."����/#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "��籩��йص�/#storm_help_award(0)"
	tb_option[getn(tb_option)+1] = "֪����!/OnCancel"
	Say("  �籩���8/9/��2/10, �����ν�ս��, Ұ��������, ɱ����������. ÿ�콫�����ϵͳ�еĳɼ�����<color=yellow>�籩����<color> (�μ�����: 50���������) .ÿ�ռ��ֽ���<color=red>24:00֮������<color>, ����24:00ǰ�콱.<enter>. ÿ�� <color=red>23:30<color> �ν�ս����ʼ, �ɼ�����¼���籩����.", getn(tb_option), tb_option)
end

--�˵��������ս
function storm_help_game(gameid)
	local str = TB_STORM_HELP[gameid]
	if (gameid == 1) then	--�ν���Ҫ����˵����������
		str = format(str, "�߼��ν�ս��, ÿ��ÿ�����ֻ����ȡ�ķ籩������<color=yellow>100<color> ��. ���м��ν�ս�����ֱ�õ�<color=yellow>80<color>, <color=yellow>90<color> ��.")
	end
	Say(str, 2, "Ҫ�˽���/storm_help", "֪����!/OnCancel")
end

--�˵����������
function storm_help_award(awardtype,start)
	if (awardtype == 0) then
		Say("  ÿ����ҿ��Ե����ִ��˴�, ����<color=red>�籩����<color> ������ȡ��Ӧ�Ľ���, ͬʱ��ÿ�ܣ�ÿ�¶�����Ӧ�ķ籩��������<color=red>����ǰʮ<color>�����ڵ��µĵڶ������ڵ����ִ��˴��콱", 4,
			"���ս���/#storm_help_award(1)",
			"���ܽ���/#storm_help_award(2)",
			"���½���/#storm_help_award(3)",
			"֪����!/OnCancel")
		return
	end
	
	local tb_awardstr = {"��", "��", "��"}
	local str = "�籩����"..tb_awardstr[awardtype].."��Ʒ����:"
	if (not start) then
		start = 1
	end
	local lastvalue = nil
	local count = 0
	local PERPAGE = 4
	for i = start, getn(TB_STORM_AWARD[awardtype][5]) do
		if (count > PERPAGE) then	--PERPAGE��һҳ
			break
		end
		count = count + 1
		
		local awardvalue = TB_STORM_AWARD[awardtype][5][i][1]
		if (lastvalue ~= awardvalue) then
			if (awardvalue >= 0) then
				str = str.."<enter>".."����"..storm_point2str(awardvalue,3).."��"
			else
				if (lastvalue) then
					str = str.."<enter>"..tb_awardstr[awardtype].."���ڵ�"..storm_point2str(1-lastvalue).."��"..storm_point2str(-awardvalue).."��"
				else
					str = str.."<enter>"..tb_awardstr[awardtype].."���ڵ�"..storm_point2str(-awardvalue).."��"
				end
			end
			lastvalue = awardvalue
		else
			str = str.."��"
		end
		str = str.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local tb_option = {}
	if (start > 1) then
		tb_option[getn(tb_option)+1] = "��һҳ/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if (start + count < getn(TB_STORM_AWARD[awardtype][5])) then
		tb_option[getn(tb_option)+1] = "��һҳ/#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1] = "��Ҫ�˽���/storm_help"
	tb_option[getn(tb_option)+1] = "��֪����!/OnCancel"
	Say(str, getn(tb_option), tb_option)
end

--�õ��������ָ�������е�����
function storm_getrank(laddertype)
	local ladderid = nil
	if (laddertype == 1) then	--�����У�����
		return 12
	elseif (laddertype == 2) then	--������
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 1 and weekid <= 4) then 	--ֻ��2��3��4��5��������
			ladderid = STORM_LADDERID_WEEK1 + weekid - 1
		end
	elseif (laddertype == 3) then	--������
		if (GetTask(STORM_TASKID_MONTH) == 10) then	--ֻ��10��������
			ladderid = STORM_LADDERID_MONTH
		end
	else
		return 12
	end
	
	if (ladderid == nil) then
		return 12
	end
	
	local playername = GetName()
	for i = 1, 10 do
		if (playername == Ladder_GetLadderInfo(ladderid, i)) then
			return i
		end
	end
	return 11
end

--�������ļӾ���
function storm_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end

--����ȫ������
function storm_giveallaward(tb_awards)
	for i = 1, getn(tb_awards) do
		storm_giveoneaward(tb_awards[i])
	end
end

--����һ������
function storm_giveoneaward(tb_award)
	local awardtype = tb_award[1]
	local awardcount = tb_award[3]
	if (awardtype == 1) then	--��ͨ��Ʒ
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 2) then	--�ƽ���Ʒ
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 3) then	--����Ʒ
		if (tb_award[2] == 1) then	--����
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--������չ
			WriteLog("storm_giveoneaward : error tb_award[2]")
		end
	elseif (awardtype == 4) then	--�����Ʒ
		while (awardcount > 0) do
			local giveindex = random(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount = awardcount - 1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward : error awardtype")
	end
end

--����ȫ��������Ʒ����
function storm_countallaward(tb_awards)
	local count = 0
	for i = 1, getn(tb_awards) do
		if (tb_awards[i][1] == 1) then	--��ͨ��Ʒ
			count = count + tb_awards[i][3]
		elseif (tb_awards[i][1] == 2) then	--�ƽ���Ʒ
			count = count + tb_awards[i][3]*2
		elseif (tb_awards[i][1] == 4) then	--�����Ʒ
			count = count + tb_awards[i][3]*2
		end
	end
	return count
end

--�������
function storm_splittb(tb, n)
	if (n == nil) then
		n = 1
	end
	if (n == getn(tb)) then
		return tb[n]
	end
	return tb[n], storm_splittb(tb,n+1)
end
