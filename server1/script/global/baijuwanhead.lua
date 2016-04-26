--baijuwanhead.lua
--���峣��

AEXP_SMALL_TIME_TASKID		= 1801;							-- ��¼ С�׾ԣ��Դ�Ϊ�����ģ� ����һ�ʣ��ʱ��
AEXP_TASKID 				= 605;							-- ��¼ ��׾ԣ�С�׾Ե�1.5����ʣ��һ�ʱ���������
AEXP_SPECIAL_TIME_TASKID	= 2317;							-- ��¼ ��Ч��׾ԣ�С�׾Ե�2��Ч��������һ�ʣ��ʱ��
AEXP_TIANXING_TIME_TASKID	= 2655;							-- ��¼ ���ǰ׾��裨С�׾Ե�5����ʣ��һ�ʱ���������

AEXP_SMALL_SKILL_TASKID 	= 1802							-- ��¼ ����С�׾ԣ��Դ�Ϊ�����ģ� ���ܹһ�ʣ��ʱ��
AEXP_SKILL_TIME_TASKID		= 2315;							-- ��¼ ���ܴ�׾ԣ�����С�׾Ե�1.5��Ч����ʣ��Ҽ���ʱ���������
AEXP_SPECIAL_SKILL_TASKID	= 2318;							-- ��¼ ��Ч���ܴ�׾ԣ�����С�׾Ե�2��Ч�������ܹһ�ʣ��ʱ��

AEXP_SKILL_ID_TASKID		= 2316;							-- ��¼���߹Ҽ��������ļ���ID�������

AEXP_FREQ					= 5;							-- �۳�ʱÿ��ѭ���۳�ʱ�䣬����ÿ5��������һ��
FRAME2TIME					= 18;							-- ��ʱ��ת��Ϊ������18���൱����Ϸ��1����
AEXP_MAXTIME				= 10000 * 3600 * FRAME2TIME;	-- �û������ۻ������ʱ��
AEXP_BIGCHANGE				= 8 * 3600 * FRAME2TIME;	    -- һ����׾������ӵ�ʱ��	8Сʱ
AEXP_SMALLCHANGE 			= AEXP_BIGCHANGE	    		-- һ���׾������ӵ�ʱ��
AEXP_SKILLCHANGE			= AEXP_BIGCHANGE				-- һ�����ܴ�׾������ӵ�ʱ��
AEXP_SPECIALCHANGE			= AEXP_BIGCHANGE				-- һ����Ч�׾������ӵ�ʱ��
AEXP_SPECIALSKILLCHANGE 	= AEXP_BIGCHANGE				-- һ����Ч���ܴ�׾������ӵ�ʱ��

AEXP_INTERVAL		= 5 * 60 * FRAME2TIME;		    -- ���Ӿ��������
--��׾������ϸ��Ϣ
AEXP_BIG_NGENTYPE 	= 6;
AEXP_BIG_DETAILTYPE	= 1;
AEXP_BIG_PARTYPE 	= 130;
--�׾������ϸ��Ϣ
AEXP_SMALL_NGENTYPE 	= 6;
AEXP_SMALL_DETAILTYPE	= 1;
AEXP_SMALL_PARTYPE		= 74;
--�Ӿ���ĵȼ�����
AEXP_NEEDLEVEL					= 50;
AEXP_NEEDLEVEL_PARTNER	= 10;	--ͬ�����й�ʱ��þ������͵ȼ�
AEXP_OFFLINE_PLAYERCOUNT_LIMIT	= 800;				-- ��һ̨��������������������Ŀ���������������̨�������ڽ��������й�
AEXP_OFFLINE_PLAYERCOUNT_SPECIAL = 750;				--ר���йܷ����������йܵ�����
AEXP_INVALIDTIMEBEGIN 			= 18;		        --���߹һ���Ч����ʼʱ��
AEXP_INVALIDTIMEEND 			= 24;		        --���߹һ���Ч����ֹʱ��

AEXP_TEMPOFFLINETASKID 			= 170;				--ʹ�ð׾���ʱ���������

AEXP_120SKILL_UPGRADE_EXP = 137500;					--120��������������Ϊ��ֵ

--���߹Ҽ��ܸ����ܼ����Ӧ����������������
ARY_UPGRADE_SKILL_EXP_PERCENT = {	0.0775,	0.0388,	0.0258,	0.0194,	0.0155,	0.013,	0.0111,	0.0097,	0.0086,	0.0039,
									0.0035,	0.0032,	0.0030,	0.0028,	0.0026,	0.0024,	0.0023,	0.0022,	0.0020	};
--���߹Ҽ��ܿ������ļ���ID
ARY_UPGRADE_SKILL = { 318, 319, 321, 322, 323, 325, 339, 302, 342, 353, 355, 328, 380, 336, 337, 357, 359, 362, 361, 368, 365, 375, 372, 709, 708, 710, 711, 712, 713, 714, 715, 716, 717 };

		--��Ӧ����			1   0    2    3    4    5    6    7    8    9
ARY_120SKILLID = { 708, 709, 710, 711, 712, 713, 714, 715, 716, 717 };
-- 150������
ARY_UPGRADE_SKILL_150 = {1055,1056,1057,1059,1060,1058,1066,1067,1069,1070,1071,1061,1062,1114,1063,1065,1075,1076,1074,1073,1079,1078,1080,1081,}

--Include("\\script\\missions\\boss\\makeboss_head.lua")
IncludeLib("SETTING")

if (GetProductRegion() == "cn_ib") then
	Include("\\script\\item\\ib\\zimudai.lua");
end

--��ѯʣ��ʱ��
function get_left_time()
	--�׾���
	local nSmallExpSpareTime = GetTask(AEXP_SMALL_TIME_TASKID);
	local nSmallExpSpareTime_Hours, nSamllExpSpareTime_Minutes = getFrame2MinAndSec(nSmallExpSpareTime);					--���û���ʾ��ʾ������
	
	--���ܰ׾���
	local nSamllSkillSpareTime = GetTask(AEXP_SMALL_SKILL_TASKID);
	local nSamllSkillSpareTime_Hours, nSamlllSkillSpareTime_Minutes = getFrame2MinAndSec(nSamllSkillSpareTime);	--���û���ʾ��ʾ������
	
	--��ͨ��׾���
	local nExpSpareTime = GetTask(AEXP_TASKID);
	local nExpSpareTime_Hours, nExpSpareTime_Minutes = getFrame2MinAndSec(nExpSpareTime);					--���û���ʾ��ʾ������
	
	--���ܴ�׾���
	local nSkillExpSpareTime = GetTask(AEXP_SKILL_TIME_TASKID);
	local nSkillExpSpareTime_Hours, nSkillExpSpareTime_Minutes = getFrame2MinAndSec(nSkillExpSpareTime);	--���û���ʾ��ʾ������
	
	--��Ч��׾���
	local nSpecialExpSpareTime = GetTask(AEXP_SPECIAL_TIME_TASKID);
	local nSpecialExpSpareTime_Hours, nSpecialExpSpareTime_Minutes = getFrame2MinAndSec(nSpecialExpSpareTime);
	
	--��Ч���ܴ�׾���
	local nSpecialSkillSpareTime = GetTask(AEXP_SPECIAL_SKILL_TASKID);
	local nSpecialSkillSpareTime_Hours, nSpecialSkillSpareTime_Minutes = getFrame2MinAndSec(nSpecialSkillSpareTime);
	
	-- ���ǰ׾���
	local nTianxingExpSpareTime = GetTask(AEXP_TIANXING_TIME_TASKID);
	local nTianxingExpSpareTime_Hours, nTianxingExpSpareTime_Minutes = getFrame2MinAndSec(nTianxingExpSpareTime);
	

if (GetProductRegion() == "cn_ib") then
	--��̯
	local restStall = GetTask(AEXP_STALL_TIME_TASKID)
	local nStall_Hour, nStall_Min = getFrame2MinAndSec(restStall)

	--�����ɲ�¶
	local nXianCaoTime = GetTask(AEXP_XIANCAO_TIME_TASKID);
	local nXianCao_Hour, nXianCao_Min = getFrame2MinAndSec(nXianCaoTime);
end	

	local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
	local szSkillExpName = "";
	if (nSkillExpID ~= 0) then
		szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
	else
		szSkillExpName = "<color=blue>δѡ����<color>";
	end
	
	local szmsg = format("��������й�ʣ��ʱ��Ϊ:���ǰ׾��� <color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>��Ч��׾��� <color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>��׾��� <color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>�׾��� <color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>����������(%s):��Ч���ܴ�׾��� <color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>���ܴ�׾��� <color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>���ܰ׾��� <color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>�й�ʱ��������ǰ׾���Ч�������Ȱ���Ч�����뾭�鲢�۳����ӦЧ��ʱ�䡣",
	 				nTianxingExpSpareTime_Hours, nTianxingExpSpareTime_Minutes,
					nSpecialExpSpareTime_Hours,nSpecialExpSpareTime_Minutes,
					nExpSpareTime_Hours,nSamllExpSpareTime_Minutes,
					nSmallExpSpareTime_Hours,nExpSpareTime_Minutes,
					szSkillExpName, nSpecialSkillSpareTime_Hours,nSpecialSkillSpareTime_Minutes,
					nSkillExpSpareTime_Hours,nSkillExpSpareTime_Minutes,
					nSamllSkillSpareTime_Hours,nSamlllSkillSpareTime_Minutes);
	
	Describe(szmsg, 1, "�����Ի�/cancel");
end


--��������
function help()
	Talk(1,"help1","�����йܵ���ϸ���ܣ��������������ý�ҹ����׾��衣");
end
function help1()
	Talk(2,"help2","һ��<color=blue>�׾���<color>���������й�<color=red>1Сʱ<color>��һ��<color=blue>��׾���<color>���������й�<color=red>8<color>Сʱ��һ��<color=blue>��Ч��׾���<color>���������й�<color=red>80<color>Сʱ�������ۻ������й�ʱ�䡣",
    "��������ߴ���е�<color=red>�㷷<color>����ѯ��ʣ��������й�ʱ�䣬Ҳ����ʹ�������й���Ʒʱ��ѯ��");
end

function help2()
	Talk(1,"help3","ʹ�����ƣ�����������г��򡢴�ׯ�Լ�ʮ�������ڣ�ѡ���˳����棨��Esc�������Ľ��棩�е������й�ѡ��Զ����������й�״̬��");
end
function help3()
	Talk(2,"help4", "���󣩰׾���ʹ��Ч����������������й�״̬�������й�ʱ�俪ʼ���㡣ϵͳ�ᱣ����ĵ�ǰ״̬��������̯���ڣ����������йܡ��������й�״̬�У�<color=red>50������<color>����Ҳ����þ���ֵ��","<color=red>50����50������<color>�����ÿ<color=red>5����<color>�ܹ������Ӧ�ľ���ֵ�����������й�״̬��ʹ���������Ӿ�����Ʒ���ɲ�¶�����丣����Բ����û��Ч��������Ʒ�Ĺ�Чʱ���Ի�˥�����������й�״̬�У�����������Ŀɽ�����Ϸʱ�䡣");
end
function help4()
	Talk(2,"help5", "���ܣ��󣩰׾���ʹ��Ч����������������й�״̬�������й�ʱ�俪ʼ���㡣ϵͳ�ᱣ����ĵ�ǰ״̬��������̯���ڣ����������йܡ��������й�״̬�У�90�����ܵ�������ÿ5���ӻ��Զ�����1�Ρ�","��������й�ǰѡ�����Ҫ���������ȵ�90�����ܡ��������й�״̬�У�����������Ŀɽ�����Ϸʱ�䡣");
end
function help5()
	Talk(2,"", "����������й�ʱ�������Ŀɽ�����Ϸʱ��Ϊ<color=red>0<color>������Զ����ߡ������ڽ��������й�״̬���������������������Զ����ߣ�ͬʱ������ʣ��������й�ʱ�䣬���Ҳ���������","�������µ�¼��Ϸʱ�����Զ����������й�״̬��ͬʱ������ʣ��������й�ʱ�䡣");
end

-- ��ȡ��ҿ������߹Ҽ��������ļ���
function getexpskill()
	local aryExpSkill = {};
	local nExpSkillCount = 0;
	local nAllUpgradeSkillCount = getn(ARY_UPGRADE_SKILL);
	for i = 1, nAllUpgradeSkillCount do
		local nCurSkillID = ARY_UPGRADE_SKILL[i];
		local nCurSkillLevel = GetCurrentMagicLevel(nCurSkillID, 0);
		if (nCurSkillLevel >= 1 and nCurSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT)) then
			nExpSkillCount = nExpSkillCount + 1;
			aryExpSkill[nExpSkillCount] = {};
			aryExpSkill[nExpSkillCount][1] = nCurSkillID;
			aryExpSkill[nExpSkillCount][2] = GetSkillName(nCurSkillID);
		end
	end
	return aryExpSkill;
end

-- ѡ�������йܼ���
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "��ѡ������Ҫ�����йܵļ���:";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "����/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- ���������йܼ���
function onSetUpgradeSkill(nUpgradeSkillID, funcCallBack)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	funcCallBack();
end

-- ���ݼ��ܼ����������Զ��������߹Ҽ��������ļ���ID
function autosetupgradeskill()
	local nSkillCount = getn(ARY_UPGRADE_SKILL);
	local nUpgradeSkillID = 0;
	local nUpgradeSkillLevel = 0;
	local nUpgradeSkillExp = 0;
	for i = 1, nSkillCount do
		local nCurSkillID = ARY_UPGRADE_SKILL[i];
		local nCurSkillLevel = GetCurrentMagicLevel(nCurSkillID, 0);
		local nCurSkillExp = GetSkillExp(nCurSkillID);
		if (nCurSkillLevel >= 1 and nCurSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT) and
			(nCurSkillLevel > nUpgradeSkillLevel or 
			(nCurSkillLevel == nUpgradeSkillLevel and nCurSkillExp > nUpgradeSkillExp))) then
			nUpgradeSkillID = nCurSkillID;
			nUpgradeSkillLevel = nCurSkillLevel;
			nUpgradeSkillExp = nCurSkillExp;
		end
	end
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
end

function getFrame2MinAndSec(nframe)
	local minutes = floor(nframe / (FRAME2TIME * 60));		--���û���ʾ��ʾ������
	local hours = floor(minutes / 60);
	local minutes = minutes - hours * 60; 
	return hours, minutes;
end;

--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end;

function cancel()
--do nothing
end;

function getBaiJutimeinfo()
										--��Ч��׾���	��ͨ��׾���	�׾���
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--��Ч���ܴ�׾���	���ܴ�׾���	���ܰ׾���
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local tbszItem = {"offlineitem_tianxing", "offlineitem_special",	"offlineitem_normal",	"offlineitem_small",
						"skillofflineitem_special",	"skillofflineitem_normal",	"skillofflineitem_small"};
	local szmsg = "";
	for i = 1, getn(tbAexpTask) do
		local nhour, nminite = getFrame2MinAndSec(GetTask(tbAexpTask[i]));	--���û���ʾ��ʾ������
		szmsg = format("%s\n          %s lasttime:%d hour %d minite", szmsg, tbszItem[i], nhour, nminite);
	end;
	return szmsg;
end;

function writeUseBaiJulog(szitem, nhour,nmin)
	local szlog = format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tuse<%s>, lasttime %d hour %d minite", 
		GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), szitem, nhour, nmin);
	WriteLog(szlog);
end;