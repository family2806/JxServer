--�����ؼ�ͼ��NPC
--Edit by �ӷ����
--2006-06-20

Include("\\script\\tong\\tong_setting.lua")
-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");
IncludeLib("ITEM");
Include([[\script\lib\coordinate.lua]]);--֧���趨�ļ�����
LINK_TONG_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>����־: <link>"
LINK_CITY_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>���б�־: <link>"

--����ͼ��
function main()
	local _Name, nTongID = GetTongName()
	
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("��δ�����ᣬ�뵽��ι���?")
		return
	end
	
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("�ⲻ�ǹ�����أ�ֻ�����ι۶���.")
		return
	elseif (nStuntID == 0) then
			totempole_dec("�����δ�򿪳��м��ܣ�����ʹ�ñ�־��. ��ͨ������쵼���ڹ���ҳ���Դ򿪳��м���?")
			return
	end
		--ִ�ж�Ӧ�ؼ�
		getglobal(TB_STUNTID_INFO[nStuntID].func)(nTongID, nStuntID)
end



function IsTakeStunt(nTongID,nStuntRight)
	local _Name, nTongID = GetTongName()
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("��δ�����ᣬ�뵽��ι���?")
		return
	end
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (nStuntID == 0) then
		print("����ռ�ǰ��!")
		return
	end
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("�ⲻ�ǹ�����أ�ֻ�����ι۶���.")
		return
	elseif (TONG_GetWeek(nTongID) > TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD)) then
		totempole_dec("���м����ѹ������ڣ�Ŀǰ������ȡ���������Խ���ı���ʱ��.")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if (nHour < 20 or nHour > 22) then
		totempole_dec("���ճ��м���ʱ��Ϊ20:00��22:00���ڸ�ʱ���������켼��.")
		return
	end
	
	if (nStuntRight == 1) then
	--�����ؼ���Ȩ��
		local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006)
		if (nFigure == 1) then
			if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) > 0) then
				return 1
			else
				totempole_dec("���ܳ��м����������ˣ�������ܲ�����.")
			end
		else
			totempole_dec("�ó��м���ֻ�ܰ���쵼����.")
		end
		return
	end
	
	if (GetTask(TASKID_STUNT_LASTWEEK) == TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) and GetTask(TASKID_CITYST_TAKED) >= TB_STUNTID_INFO[nStuntID].cntper) then
		totempole_dec("�����ѽ��ճ��м����ˣ�����������.")
		return
	elseif (GetTask(TASKID_STUNT_LASTWEEK) ~= TONG_GetWeek(nTongID)) then
		SetTask(TASKID_STUNT_TAKED, 0)
	end
	
	if (GetTask(TASKID_CITY_LASTDAY) == TONG_GetDay(nTongID)) then
		totempole_dec("ÿ���Ἴ��ֻ����һ�Σ�����������")
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) <= 0) then
		totempole_dec("����ĳ��м����������ˣ����������� ")
		return
	end
	
	--�����ۻ����׶�����
	--if �����ۻ����׶� < MIN then return end
	return nTongID
end

function OnCancel()
end

--�����ؼ����ƽ���
function stunt_huangjinling(nTongID, nStuntID)

	TB_STUNT_HUANGJINLING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_HUANGJINLING.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.describe.."<color>"..
	"<enter>������Ч��Ϊ7��. ������Ȼ����"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ������ü���.", 
	"���ռ���/stunt_huangjinling1",
	"�뿪/OnCancel")
end

function stunt_huangjinling1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("װ���� <color=yellow>%d<color> ��λ.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_HUANGJINLING.right)) then
		return
	end
	if (AddItem(6, 1, 1107, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		--��������������ʵ����Ҫ
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("��� 1 <color=yellow>�ƽ���!<color>")
		Msg2Tong(nTongID, GetName().."��� 1 ���м��ܻƽ���")
		TONG_ApplyAddEventRecord(nTongID, GetName().."��� 1 ���м��ܻƽ���")
	end
end

--�����ؼ��������
function stunt_lingshenli(nTongID, nStuntID)
	TB_STUNT_LINGSHENLI = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_LINGSHENLI.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.describe.."<color>"..
	"<enter>����ʱ��Ϊ7�죬�ڸ�ʱ�����������"..TB_STUNT_LINGSHENLI.maxmem.." ���ռ��ܵ��ˣ�ÿ��ÿ��ֻ�ܻ��һ�Ρ����컹����"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ������ü���.", 
	"���ռ���/stunt_lingshenli1",
	"�뿪/OnCancel")
	
end

function stunt_lingshenli1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_LINGSHENLI.right)) then
		return
	end
	if (AddItem(6, 1, 1110, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("���1 <color=yellow>�˲κ� <color>, ���������ǧ���˲�����.")
	else
		Msg2Player("��ȡ����ʧ��!")
	end
end

--112
function stunt_shiweiying(nTongID, nStuntID)
	TB_STUNT_SHIWEIYING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_SHIWEIYING.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.describe.."<color>"..
	"<enter>����ʱ��Ϊ7�죬�ڸ�ʱ�����������"..TB_STUNT_SHIWEIYING.maxmem.." ���ռ��ܵ��ˣ�ÿ��ÿ��ֻ�ܻ��һ�Ρ����컹����"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ������ü���.", 
	"���ռ���/stunt_shiweiying1",
	"�뿪/OnCancel")
end

function stunt_shiweiying1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	if (PARTNER_Count() >= 5) then
		totempole_dec("ͬ�����������ޣ�, ֻ��ɾ��һ��ͬ�������ü���. ���ǣ�ɾ��һ��ͬ�кܲ��̣���Ҫ��˼")
		return
	end
	totempole_dec("ѡ����ͬ�������.",
	"��ϵ/stunt_shiweiying2",
	"ľϵ/stunt_shiweiying2",
	"ˮϵ/stunt_shiweiying2",
	"��ϵ/stunt_shiweiying2",
	"��ϵ/stunt_shiweiying2",
	"����������/OnCancel"	)
end

TB_SERIES_NAME = {"��", "ľ", "ˮ ", "��", "��"}
TB_CHARACTOR = {"����","���� ","��å ","ų��"}
function stunt_shiweiying2(nSel)
	SetTaskTemp(112, nSel)
	totempole_dec("��ѡ��ͬ������Ϊ "..TB_SERIES_NAME[nSel+1].." , �����ѡ���Ը�.",
	TB_CHARACTOR[1].."/stunt_shiweiying3",
	TB_CHARACTOR[2].."/stunt_shiweiying3",
	TB_CHARACTOR[3].."/stunt_shiweiying3",
	TB_CHARACTOR[4].."/stunt_shiweiying3",
	"�����Ի�/OnCancel"	)
end

function stunt_shiweiying3(nSel)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	local nseries = GetTaskTemp(112)
	local ncharactor = nSel + 1
	if (nseries == 0) then
		partnerIndex = PARTNER_AddFightPartner(5, 0, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 1) then
		partnerIndex = PARTNER_AddFightPartner(4, 1, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 2) then
		partnerIndex = PARTNER_AddFightPartner(2, 2, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 3) then
		partnerIndex = PARTNER_AddFightPartner(3, 3, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	else
		partnerIndex = PARTNER_AddFightPartner(1, 4, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	end
	if (partnerIndex == -1) then
		totempole_dec("����ͬ��ʧ�ܣ�������.")
		return
	end
	PARTNER_SetCurPartner(partnerIndex)
	PARTNER_CallOutCurPartner(1)
	local nlevel = random(1,49)
	for i = 1, nlevel do
		PARTNER_AddExp(partnerIndex, 825500)	--50����Ҫ����
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("���һ��ͬ�� <color=yellow>"..TB_SERIES_NAME[nseries+1].."<color>, ����<color=yellow>"..TB_CHARACTOR[ncharactor].."<color>.")
end

--����Ǯ��
function stunt_moneybox(nTongID, nStuntID)
	TB_STUNT_MONEYBOX = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_MONEYBOX.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.describe.."<color>"..
	"<enter>����ʱ��Ϊ7�죬�ڸ�ʱ�����������"..TB_STUNT_MONEYBOX.maxmem.." ���ռ��ܵ��ˣ�ÿ��ÿ��ֻ�ܻ��һ�Ρ����컹����"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ������ü���.", 
	"���ռ���/stunt_moneybox1",
	"�뿪/OnCancel")
end

function stunt_moneybox1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_RIGHT_DS.right)) then
		return
	end
	
	local ntime = floor(GetCurServerTime()/60) + 2 * 24 * 60
	SetTask(TASKID_MONEYBOX_LASTTIME, ntime)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("����1 <color=yellow>����Ǯ<color>, ��Ч��Ϊ����!")

end

--��˫ɱ��--------------------------------
function stunt_wushuang(nTongID, nStuntID)
	TB_STUNT_WSSZ = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WSSZ.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.describe.."<color>"..
	"<enter>�ü���ʱ��Ϊ7��.", 
	"���ռ���/wsh_getwushuangshazhen",
	"��˫ɱ������/wsh_typewushuangshazhen",
	"�뿪/OnCancel")
end

--��ȡ ��˫ɱ��
function wsh_getwushuangshazhen()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("װ���� <color=yellow>%d<color> ��λ.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WSSZ.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	local nItem = AddItem(6, 1, 1106, 1, 0, 0, 0); --�õ�һ�� ��˫ɱ��
	
	if (nItem > 0) then
		SetSpecItemParam(nItem, 1, 120);
		SyncItem(nItem)
		totempole_dec("��� <color=yellow>��˫ɱ��<color>.")
		Msg2Player("�ɹ���ȡ 1 <color=yellow>��˫ɱ��<color>.");
		Msg2Tong(nTongID, GetName().."��ó��м��� - ��˫ɱ��")
		TONG_ApplyAddEventRecord(nTongID, GetName().."��ó��м���- ��˫ɱ��")
	end;
	
	SetTaskTemp(193, 0);
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
MAPFILE = [[\settings\item\004\mask.txt]];
function wsh_typewushuangshazhen()
	local nMaskIdx;
	local szMaskName;
	local szContent = "�����˫ɱ��Ŀ��Ϊ <color=yellow>"; 
	local tab_mask = {};
	
	local _, nTongID = GetTongName()
	local nFigure = TONGM_CheckRight(nTongID, GetName(), RIGHTID_STUNT);
	if (nFigure ~= 1) then
		SetTaskTemp(193, 0);
		totempole_dec("<color=yellow>���<color> ��˫ɱ��ֻ�а���쵼���ܸı�.");
		return
	end
	
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_mask, szMaskName);
		end;
	end;
	
	if (getn(tab_mask) > 0) then
		szContent = szContent..tab_mask[1];
		for i = 2, getn(tab_mask) do
			szContent = szContent..", "..tab_mask[i];
		end;
		szContent = szContent.."<color>.";
	else
		szContent = "��˫ɱ����Ȼ��û��ʲô��� ";
	end;
	
	Say(szContent.."�������ʲô���� ", 3, 
		"���������/add_face", 
		"������ٿ��/removeface", 
		"�뿪/OnCancel");
end;

function add_face()
	local nFaceCount = getfacecount();
	if (nFaceCount >= 10) then
		Say("����ѡ��10����ܣ�����������µ�ģ����Ҫ���ٿ�� ", 2, "��������µĿ��./removeface", "����������/no")
		return
	end;
	
	--дһ���������
	GiveItemUI("�뷢�����1����� ", "�ѷ���һ����ߣ���˫ɱ�󷢻����ú󽫱����Ҫ������?", "add_ui_confirm", "no");
end;

function add_ui_confirm(nCount)
	if (nCount ~= 1) then
		Say("�������Ʒ��������.", 0);
		return
	end;
	
	local nItemIdx = GetGiveItemUnit(1);
	nItemGenre, nDetailType, nParticualrType = GetItemProp(nItemIdx);
	
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("������Ʒ������� ", 0);
		return
	end;
	
	if (nParticualrType == 366) then
		Say("<color=yellow>αװ���<color> ��������˫ɱ����.", 0);
		return
	end;
	
	if (itemcheck(nParticualrType) == 0) then
		Say("��߿��û����.", 0);
		return
	end;
	
	addoneface(nParticualrType); --����һ������
	Msg2Player("���Ѹ���������˫ɱ����.");
end;

function itemcheck(nParticualrType)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == nParticualrType) then
			return 0;
		end;
	end;
	return 1;
end;

function removeface()
	local tab_sel = {};
	_, nTongID = GetTongName();
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_sel, "����"..szMaskName.."����/#deloneface("..i..")");
		end;
	end;
	tinsert(tab_sel, "��������/OnCancel");
	if (getn(tab_sel) <= 0) then
		Say("δѡ����˫ɱ����.", 0);
		return
	end;
	Say("��������ֿ�� ", getn(tab_sel), tab_sel);
end;

function getfacecount()
	_, nTaskID = GetTongName();
	local nCount = 0;
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) ~= 0) then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;

function addoneface(nValue)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == 0) then
			TONG_ApplySetTaskValue(nTaskID, TTK_FACE[i], nValue);
			return
		end;
	end;
end;

function deloneface(nIdx)
	_, nTaskID = GetTongName();
	if (nIdx < 1 or nIdx > 10) then
		return
	end;
	TONG_ApplySetTaskValue(nTaskID, TTK_FACE[nIdx], 0);
	Msg2Player("����1�������˫ɱ����.");
end;
-------------------------------------------------------------
--�����-----
REPAREATT = 40; --ÿ�����Ӷ����;ö�
function stunt_duanwuhun(nTongID, nStuntID)
	TB_STUNT_DWH = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_DWH.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.describe.."<color>"..
	"<enter>����ʱ��Ϊ7�죬�ڸ�ʱ�����������"..TB_STUNT_DWH.maxmem.." ���ռ��ܵ��ˣ�ÿ��ÿ��ֻ�ܻ��һ�Ρ����컹����"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ������ü���.", 
		"���ˣ��������ӹ����� /dwh_Enhance", 
		"�Ժ���˵!/OnCancel");
end

function dwh_Enhance()
	TRepair("EnhanceRepair( %d )");
end;

--����ǿ������
function EnhanceRepair(nItemIdx)
	
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "��װ������ǿ��.")
	end
	local nDur = GetCurDurability(nItemIdx);
	local nRepairDur = nDur + REPAREATT;
	if (nRepairDur > 255) then
		nRepairDur = 255;
	end;
	
	totempole_dec("<#>�ӹ̸�װ����������Ͷȣ�ÿ������<color=yellow>"..REPAREATT.."<color> ��, �Ͷ����Ϊ<color=yellow>"..(255).."<color> ��, Ŀǰװ���Ͷ�Ϊ <color=yellow>"..nDur.."<color>, �ӹ̺���Ͷ�Ϊ <color=yellow>"..nRepairDur.."<color>, ����������?",
		"����/#Enhance_Repair("..nItemIdx..", "..nRepairDur..")", 
		"����Ҫ/cancel")
end

function Enhance_Repair(nItemIdx, nRepairDur)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_DWH.right)) then
		return
	end
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "��װ������ǿ��.")
	end

	if (nItemIdx > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		
		EH_SetCurDurability(nItemIdx, nRepairDur);
		Msg2Player("װ���õ��ӹ� ");
	end;
end

function stunt_fenghuang(nTongID, nStuntID)
	TB_STUNT_FHY = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_FHY.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.describe.."<color>"..
	"<enter>����ʱ��Ϊ7�죬�ڸ�ʱ�����������"..TB_STUNT_FHY.maxmem.." ���ռ��ܵ��ˣ�ÿ��ÿ��ֻ�ܻ��һ�Ρ����컹����"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ������ü���.", 
		"���ˣ�������ȡ���ӡ/fhy_getfenghuangyin", 
		"�Ժ���˵!/OnCancel");
end

function fhy_getfenghuangyin()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("װ���� <color=yellow>%d<color> ��λ.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_FHY.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	AddItem(6, 1, 1105, 1, 0, 0, 0);
	totempole_dec("����1 <color=yellow>���ӡ<color>.")
	Msg2Player("�ɹ���ȡ 1<color=yellow>���ӡ<color>.");
	
	SetTaskTemp(193, 0);
end;

function totempole_dec(szMsg, ...)
	if (szMsg == nil) then
		return
	end	
		
	szMsg = LINK_CITY_TOTEMPOLE..szMsg
	if (getn(arg) == 0) then
		Describe(szMsg, 1, "�����Ի�/OnCancel")
	else
		Describe(szMsg, getn(arg), arg)
	end
end

function stunt_wushenbless(nTongID, nStuntID)
	TB_STUNT_WUSHENBLESS = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."���м���"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.name.."<color>"..
	"<enter>���ռ���Ȩ��: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WUSHENBLESS.right].."<color>"..
	"<enter>��Ч��������:"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.describe.."<color>"..
	"<enter>����ʱ��Ϊ7�죬�ڸ�ʱ�����������"..TB_STUNT_WUSHENBLESS.maxmem.." ���ռ��ܵ��ˣ�ÿ��ÿ��ֻ�ܻ��һ�Ρ����컹����"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ������ü���.", 
	"���ռ���/stunt_wushenbless1",
	"�뿪/OnCancel")
end;

function stunt_wushenbless1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("װ���� <color=yellow>%d<color> ��λ.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WUSHENBLESS.right)) then
		return
	end
	local nItemIdx = AddItem(6, 1, 1264, 1, 1, 1);
	if (nItemIdx > 0) then
		local nlasttime = getExpiredTime2DayEnd() * 60;
		local nlastday = 7 - tonumber(GetLocalDate("%w"));
		if (nlastday == 7) then
			nlastday = 0;
		end;
		local ntime = GetCurServerTime() + nlasttime + nlastday * 24 * 60 * 60;
		
		SetSpecItemParam(nItemIdx, 1, ntime);
		SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
		SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
		SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
		SyncItem(nItemIdx);
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("��� <color=yellow>�����ĸ�<color>, ʹ�ú󽫻��2Сʱ˫�����׶�(ֻ���ν�����ʹ����ʱ����ս������������Ұ�ţ��Ի�ҹ).")
	else
		Msg2Player("��ȡ�����ĸ�ʧ��!")
	end
end;

-------��õ�����24ʱ��ʱ����λ����
function getExpiredTime2DayEnd()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMin = tonumber(GetLocalDate("%M"));
	
	return (24 - nNowHour - 1) * 60 + (60 - nNowMin);
end;
