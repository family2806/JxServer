--����ؼ�ͼ��NPC
--Edit by �ӷ����
--2006-06-20

Include("\\script\\tong\\tong_setting.lua")
-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");
IncludeLib("ITEM");
Include([[\script\lib\coordinate.lua]]);--֧���趨�ļ�����
LINK_TONG_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>���ͼ����: <link>"
LINK_CITY_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>����ͼ����: <link>"

--���ͼ��
function main()
	local _Name, nTongID = GetTongName()
	
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("�㻹û�м����ᣬ��������ι���?")
		return
	end
	
	local nstuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("�ⲻ�ǹ�����أ�ֻ�����ι�һ��.")
		return
	elseif (nstuntID == 0) then
			totempole_dec("��Ἴ�ܻ�û�п���������ʹ��ͼ������ȥ���߰���쵼��������")
			return
	elseif (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE) == 0 or TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE) == 1) then
		totempole_dec("����Ѿ�����ά�޼��ܣ����ڲ���ʹ��ͼ����.")
		return
	elseif (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED) == 0) then
			totempole_dec("����ս���ʽ𲻹�ά��������ܣ�����ʹ�ð�Ἴ��!")
			return
	end
		--ִ�ж�Ӧ�ؼ�
		getglobal(TB_STUNTID_INFO[nstuntID].func)(nTongID, nstuntID)
end


function IsTakeStunt(nTongID,nStuntRight,nstuntID)
	local _Name, nTongID = GetTongName()
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("�㻹û�м����ᣬ�������ι���?")
		return
	end
	if (nstuntID == nil or nstuntID ~= TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)) then
		nstuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	end
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("�ⲻ�ǹ�����أ�ֻ�����ι�һ��.")
		return
	elseif (nstuntID == 0) then
			totempole_dec("��Ἴ�ܻ�û�п���������ʹ��ͼ������ȥ���߰���쵼��������")
			return
	elseif (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED) == 0) then
			totempole_dec("����ս���ʽ𲻹�ά��������ܣ�����ʹ�ð�Ἴ��!")
			return
	elseif (TONG_GetWeek(nTongID) > TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD)) then
		totempole_dec("��Ἴ���Ѿ����˱����ڣ����ڲ��ܽ��ܣ�����ά��֮����������.")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if (nHour < 20 or nHour > 22) then
		totempole_dec("���Ἴ�ܵ�ʱ����20h00��22h00,��ʱȥ��.")
		return
	end
	
	if (nStuntRight == 1) then
	--�����ؼ���Ȩ��
		local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006)
		if (nFigure == 1) then
			if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT) > 0) then
				return 1
			else
				totempole_dec("���ܵİ�Ἴ���Ѿ������ˣ�����������.")
			end
		else
			totempole_dec("ֻ���쵼��ſ����������Ἴ��.")
		end
		return
	end
	
	if (GetTask(TASKID_STUNT_LASTWEEK) ==  TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) and GetTask(TASKID_STUNT_TAKED) >= TB_STUNTID_INFO[nstuntID].cntper) then
		totempole_dec("�����Ѿ���ȡ�˰�Ἴ�ܣ�����������.")
		return
	elseif (GetTask(TASKID_STUNT_LASTWEEK) ~= TONG_GetWeek(nTongID)) then
		SetTask(TASKID_STUNT_TAKED, 0)
	end
	
	if (GetTask(TASKID_STUNT_LASTDAY) == TONG_GetDay(nTongID)) then
		totempole_dec("��Ἴ��ÿ��ֻ����һ�Σ�����������")
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT) <= 0) then
		totempole_dec("�����Ѿ������Ἴ���ˣ�����������.")
		return
	end
	
	--�����ۻ����׶�����
	--if �����ۻ����׶� < MIN then return end
	return nTongID
end

function OnCancel()
end

--����ؼ����ƽ���
function stunt_huangjinling(nTongID, nstuntID)

	TB_STUNT_HUANGJINLING = TB_STUNTID_INFO[nstuntID]

	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_HUANGJINLING.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_HUANGJINLING.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.describe.."<color>"..
	"<enter>������ܵ�ʱ����1�ܡ�����������"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."�����켼��.", 
	"���ܼ���/stunt_huangjinling1",
	"�뿪/OnCancel")
end

function stunt_huangjinling1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("������Ҫ<color=yellow>%d<color>�ռ�.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_HUANGJINLING.right)) then
		return
	end
	if (AddItem(6, 1, 1107, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		--��������������ʵ����Ҫ
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		totempole_dec("�õ�1��<color=yellow>�ƽ���!<color>")
		Msg2Tong(nTongID, GetName().."�õ�1���ƽ���")
		TONG_ApplyAddEventRecord(nTongID, GetName().."�õ�1���ƽ���")
	end
end

--����ؼ��������
function stunt_lingshenli(nTongID, nstuntID)
	TB_STUNT_LINGSHENLI = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_LINGSHENLI.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_LINGSHENLI.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.describe.."<color>"..
	"<enter>������ܵ�ʱ����1�ܣ���1��������������"..TB_STUNT_LINGSHENLI.maxmem.."��������������ܣ�ÿ��ÿ��ֻ����һ�Ρ����컹������"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."�����켼��.", 
	"���ܼ���/stunt_lingshenli1",
	"�뿪/OnCancel")
	
end

function stunt_lingshenli1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_LINGSHENLI.right)) then
		return
	end
	if (AddItem(6, 1, 1110, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		totempole_dec("�쵽һ�� <color=yellow>�˲κ�<color>, ����������ȡǧ���˲ε�����.")
	else
		Msg2Player("�������ʧ��!")
	end
end

--112
function stunt_shiweiying(nTongID, nstuntID)
	TB_STUNT_SHIWEIYING = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_SHIWEIYING.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_SHIWEIYING.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.describe.."<color>"..
	"<enter>������ܵ�ʱ����1�ܣ���1��������������"..TB_STUNT_SHIWEIYING.maxmem.."��������������ܣ�ÿ��ÿ��ֻ����һ�Ρ����컹������"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."�����켼��.", 
	"���ܼ���/stunt_shiweiying1",
	"�뿪/OnCancel")
end

function stunt_shiweiying1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	if (PARTNER_Count() >= 5) then
		totempole_dec("���������Ѿ������޶��ˣ�ֻ�г�ȥһ�˲ſ�����ȡ������ܡ����ǳ�ȥһ����̫�����ˣ��㻹�Ǻú�����.")
		return
	end
	totempole_dec("Ϊͬ�е���ѡ����.",
	"��ϵ/stunt_shiweiying2",
	"ľϵ/stunt_shiweiying2",
	"ˮϵ/stunt_shiweiying2",
	"��ϵ/stunt_shiweiying2",
	"��ϵ/stunt_shiweiying2",
	"������/OnCancel"	)
end

TB_SERIES_NAME = {"��", "ľ", "ˮ", "��", "��"}
TB_CHARACTOR = {"����","����","³ç","ų��"}
function stunt_shiweiying2(nSel)
	SetTaskTemp(112, nSel)
	totempole_dec("Ϊͬ����ѡ�������� "..TB_SERIES_NAME[nSel+1].." , ����ѡ�Ը�.",
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
		totempole_dec("����ͬ����Աʧ�ܣ�����һ��.")
		return
	end
	PARTNER_SetCurPartner(partnerIndex)
	PARTNER_CallOutCurPartner(1)
	local nlevel = random(1,49)
	for i = 1, nlevel do
		PARTNER_AddExp(partnerIndex, 825500)	--50����Ҫ����
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
	totempole_dec("�õ�һ��<color=yellow>ϵ��ͬ����"..TB_SERIES_NAME[nseries+1].."<color>, ����<color=yellow>"..TB_CHARACTOR[ncharactor].."<color>.")
end

--����Ǯ��
function stunt_moneybox(nTongID, nstuntID)
	TB_STUNT_MONEYBOX = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_MONEYBOX.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_MONEYBOX.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.describe.."<color>"..
	"<enter>������ܵ�ʱ����1�ܣ���1��������������"..TB_STUNT_MONEYBOX.maxmem.."��������������ܣ�ÿ��ÿ��ֻ����һ�Ρ����컹������"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."�����켼��.", 
	"���ܼ���/stunt_moneybox1",
	"�뿪/OnCancel")
end

function stunt_moneybox1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_RIGHT_DS.right)) then
		return
	end
	
	local ntime = floor(GetCurServerTime()/60) + 2 * 24 * 60
	SetTask(TASKID_MONEYBOX_LASTTIME, ntime)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
	totempole_dec("��õ�1��<color=yellow>����Ǯ<color>,2������Ч!")

end

--��˫ɱ��--------------------------------
function stunt_wushuang(nTongID, nstuntID)
	TB_STUNT_WSSZ = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WSSZ.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_WSSZ.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.describe.."<color>"..
	"<enter>������ܵ�ʱ����1��.", 
	"���ܼ���/wsh_getwushuangshazhen",
	"��˫ɱ������/wsh_typewushuangshazhen",
	"�뿪/OnCancel")
end

--��ȡ ��˫ɱ��
function wsh_getwushuangshazhen()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("����Ҫ��<color=yellow>%d<color>�ռ�.",5))
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
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)

	local nItem = AddItem(6, 1, 1106, 1, 0, 0, 0); --�õ�һ�� ��˫ɱ��
	
	if (nItem > 0) then
		SetSpecItemParam(nItem, 1, 3 * 60 * 6);
		SyncItem(nItem)
		totempole_dec("�õ�<color=yellow>��˫ɱ��<color>.")
		Msg2Player("�ɹ���ȡ1��<color=yellow>��˫ɱ��<color>.");
		Msg2Tong(nTongID, GetName().."���Ἴ����˫ɱ��")
		TONG_ApplyAddEventRecord(nTongID, GetName().."���Ἴ����˫ɱ��")
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
	local szContent = "�����˫ɱ�����ڵ�ģ����:<color=yellow>"; 
	local tab_mask = {};
	
	local _, nTongID = GetTongName()
	local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006);
	if (nFigure ~= 1) then
		SetTaskTemp(193, 0);
		totempole_dec("<color=yellow>ģ��<color>��˫ɱ��ֻ�а�����쵼������˲ſ��Ա任.");
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
		szContent = "������˫ɱ��û���κ�ģ��";
	end;
	
	Say(szContent.."��Ҫ����ʲô����?", 3, 
		"�����ģ��/add_face", 
		"���붪��ģ��/removeface", 
		"�뿪/OnCancel");
end;

function add_face()
	local nFaceCount = getfacecount();
	if (nFaceCount >= 10) then
		Say("��ѡ��10��ģ�ͣ�Ҫ������µ�ģ�;�Ҫ����1����Ҫ������?", 2, "���м�����ģ��./removeface", "������/no")
		return
	end;
	
	--дһ���������
	GiveItemUI("����һ�����", "�Ѿ�����һ����ߣ�����˫ɱ�󷢻����þͻ���ϣ��������", "add_ui_confirm", "no");
end;

function add_ui_confirm(nCount)
	if (nCount ~= 1) then
		Say("�������Ʒ��������.", 0);
		return
	end;
	
	local nItemIdx = GetGiveItemUnit(1);
	nItemGenre, nDetailType, nParticualrType = GetItemProp(nItemIdx);
	
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("�������Ʒ�������", 0);
		return
	end;
	
	if (nParticualrType == 366) then
		Say("<color=yellow>αװ���<color>��������˫ɱ���ģ��.", 0);
		return
	end;
	
	if (itemcheck(nParticualrType) == 0) then
		Say("������ģ���Ѿ�����.", 0);
		return
	end;
	
	addoneface(nParticualrType); --����һ������
	Msg2Player("���Ѿ�����˫ɱ��ģ�ͼ�������.");
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
			tinsert(tab_sel, "ȡ��"..szMaskName.."��ģ��/#deloneface("..i..")");
		end;
	end;
	tinsert(tab_sel, "���Һú�����/OnCancel");
	if (getn(tab_sel) <= 0) then
		Say("��û��ѡ�κ�һ����˫ɱ��.", 0);
		return
	end;
	Say("��Ҫȡ���Ǹ�ģ��?", getn(tab_sel), tab_sel);
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
	Msg2Player("ȡ��1��������˫ɱ��ģ��.");
end;
-------------------------------------------------------------
--�����-----
REPAREATT = 40; --ÿ�����Ӷ����;ö�
function stunt_duanwuhun(nTongID, nstuntID)
	TB_STUNT_DWH = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_DWH.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_DWH.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_DWH.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.describe.."<color>"..
	"<enter>������ܵ�ʱ����1�ܣ���1��������������"..TB_STUNT_DWH.maxmem.."��������������ܣ�ÿ��ÿ��ֻ����һ�Ρ����컹������"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."�����켼��.", 
		"�Եģ��ö�������ӹ�����/dwh_Enhance", 
		"֮����˵!/OnCancel");
end

function dwh_Enhance()
	TRepair("EnhanceRepair( %d )");
end;

--����ǿ������
function EnhanceRepair(nItemIdx)
	
	local nDur = GetCurDurability(nItemIdx);
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "���װ������ǿ��.")
	end
	local nRepairDur = nDur + REPAREATT;
	if (nRepairDur > 255) then
		nRepairDur = 255;
	end;
	
	totempole_dec("<#>�ӹ����װ���������ǿ�ȣ�ÿ������<color=yellow>"..REPAREATT.."<color>��,���ǿ����<color=yellow>"..(255).."<color>��, ����װ����ǿ����<color=yellow>"..nDur.."<color>, �ӹ�֮��ǿ�Ƚ���<color=yellow>"..nRepairDur.."<color>, ����ӹ���?",
		"�ӹ�/#Enhance_Repair("..nItemIdx..", "..nRepairDur..")", 
		"������/cancel")
end

function Enhance_Repair(nItemIdx, nRepairDur)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_DWH.right)) then
		return
	end
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "���װ������ǿ��.")
	end

	if (nItemIdx > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		
		EH_SetCurDurability(nItemIdx, nRepairDur);
		Msg2Player("װ�����ӹ���");
	end;
end

function stunt_fenghuang(nTongID, nstuntID)
	TB_STUNT_FHY = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_FHY.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_FHY.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_FHY.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.describe.."<color>"..
	"<enter>������ܵ�ʱ����1�ܣ���1��������������"..TB_STUNT_FHY.maxmem.."��������������ܣ�ÿ��ÿ��ֻ����һ�Ρ����컹������"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."�����켼��.", 
		"���ǣ���������ӡ/fhy_getfenghuangyin", 
		"֮����˵!/OnCancel");
end

function fhy_getfenghuangyin()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("������Ҫ<color=yellow>%d<color>�ռ�.",5))
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
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)

	AddItem(6, 1, 1105, 1, 0, 0, 0);
	totempole_dec("��õ�1��<color=yellow>���ӡ<color>.")
	Msg2Player("�ɹ���ȡ1��<color=yellow>���ӡ<color>.");
	
	SetTaskTemp(193, 0);
end;

function totempole_dec(szMsg, ...)
	if (szMsg == nil) then
		return
	end	
		
	szMsg = LINK_TONG_TOTEMPOLE..szMsg
	if (getn(arg) == 0) then
		Describe(szMsg, 1, "�����Ի�/OnCancel")
	else
		Describe(szMsg, getn(arg), arg)
	end
end

function stunt_wushenbless(nTongID, nStuntID)
	TB_STUNT_WUSHENBLESS = TB_STUNTID_INFO[nStuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>���ڵİ�Ἴ��: "..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.name.."<color>"..
	"<enter>���ܼ���Ȩ: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WUSHENBLESS.right].."<color>"..
	"<enter>ά���ؼ�����"..
	"<enter><color=yellow>    "..(TB_STUNT_WUSHENBLESS.consume).."��ս����<color>"..
	"<enter>�ؼ�����:"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.describe.."<color>"..
	"<enter>������ܵ�ʱ����1�ܣ���1��������������"..TB_STUNT_WUSHENBLESS.maxmem.."��������������ܣ�ÿ��ÿ��ֻ����һ�Ρ����컹������"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."�����켼��.", 
	"���ܼ���/stunt_wushenbless1",
	"�뿪/OnCancel")
end;

function stunt_wushenbless1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("������Ҫ<color=yellow>%d<color>�ռ�.",5))
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
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		totempole_dec("�õ�<color=yellow>����͸�<color>, ʹ��֮�󽫵õ�2Сʱ��˫������ֵ(ֻ���ν�����ʹ������սʱ�䣬����������ɱ�����Ի�֮ҹ).")
	else
		Msg2Player("��ȡ����͸�ʧ��!")
	end
end;

-------��õ�����24ʱ��ʱ����λ����
function getExpiredTime2DayEnd()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMin = tonumber(GetLocalDate("%M"));
	
	return (24 - nNowHour - 1) * 60 + (60 - nNowMin);
end;
