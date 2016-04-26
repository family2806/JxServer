-- ������Եonline 2007 Ԫ���ͷ�ļ�

if (not __H_NEWYEAR_2007__) then
	__H_NEWYEAR_2007__ = 1;
Include([[\script\lib\pay.lua]]);

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ���� 2006 Ԫ���ͷ�ļ�
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- �������Ĵ���֧��
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������
--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- ��������ľ����

ID_GETTASKBOOK_DATE_NY07  		 = 1789;  -- ��ȡ������������
ID_MOREEXP_ONLINETIME_NY07        = 1790;  -- �����������ʱ��
ID_MOREEXP_DATE_NY07              = 1791;  -- ��¼����ϴ���ȡ���������
ID_MEDAL_DATE_NY07              = 1792;  -- ��¼����ϴ���ȡ�����������


-- �ж��Ƿ�Ԫ�����ڵ�������
function ny07_isactive()
	local nDate  = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070101 and nDate <= 20070103) then
		return 1;
	end;
	return 0;
end;

-- �������
function ny07_entrance()
	if (IsCharged() == 0) then
		Say("ֻ��<color=red>�俨���<color>���ܲμ�������", 0);
		return
	end;
	Say("�������֣��˽ܱ��������������¾�ͼǿ��������������λ��Ϊ�����˾��Ľ�����ǡ��ѽڣ�����������Ϊ��λ��ʿ��Ů���Ͻ��պ���ף�ϼҰ������������⣡", 4,
	"��ȡÿ�վ���/ny07_getexp",
	"��ȡÿ���ؼ�����/ny07_getTaskBook",
	"��ȡÿ�յ���������/ny07_getmedal",
	"R�i kh�i/no"
	);
end;


ny07_tab_medal = {
{"�ƽ���������",	1	,1254	},
{"������������",	10	,1255	},
{"��ͭ��������",	30	,1256	},
{"��������",	259	,1294	},
{"������������",	700	,1257	},
};
function ny07_getmedal()
	if (GetLevel() < 120) then
		Say("<color=yellow>120��<color>���ϵ���Ҳ�����ȡ���������", 0);
		return
	end;
	
	if (ny07_isactive()==0) then
		Say("Ԫ���Ѿ�����!", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 1) then
		Say("��ı����ռ䲻��������������", 0);
		return
	end;
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate == GetTask(ID_MEDAL_DATE_NY07)) then
		Say("������Ѿ���ȡ���ˣ���������ȡ�ˡ�", 0);
		return
	end;
	
	local nSeed = random(1, 1000);
	local nSum = 0;
	for i = 1, getn(ny07_tab_medal) do
		nSum = nSum + ny07_tab_medal[i][2];
		if (nSeed <= nSum) then
			SetTask(ID_MEDAL_DATE_NY07, nDate);
			local nidx = AddItem(6, 1, ny07_tab_medal[i][3], 1, 0, 0, 0);
			SetSpecItemParam(nidx, 1, 20070131);
			SetSpecItemParam(nidx, 2, 2007);
			SetSpecItemParam(nidx, 3, 1);
			SetSpecItemParam(nidx, 4, 31);
			SyncItem(nidx);
			local str = "��õ� <color=yellow>"..ny07_tab_medal[i][1].."<color>�������Ƶ���Чʱ�����<color=yellow>2007��1��31��<color>��"
			Msg2Player(str);
			Say(str, 0);
			break;
		end;
	end;
end;

-- �ж�����Ƿ��ܻ�ȡ���͵ľ���
function ny07_canGetMoreExp()
	local nTime       = GetGameTime();
	local nLateTime   = GetTask(ID_MOREEXP_ONLINETIME_NY07);
	local nDate       = tonumber(GetLocalDate("%Y%m%d"));
	local nLateDate   = GetTask(ID_MOREEXP_DATE_NY07);
	
	if (nLateDate == 0) then
		return 1;
	end;

	if ((nTime - nLateTime >= 60*60) and (nDate~=nLateDate)) then
		return 1;
	end;
	return 0;
end;

-- �еȼ����Ƶ�������Ҿ��飬��� nLimitLevel Ϊ 0 ������
function ny07_addPlayerExpForLimit(myExpValue, nLimitLevel)
	tl_addPlayerExpForLimit	(myExpValue, nLimitLevel);
end;


-- ѯ������Ƿ���ȡ����
function ny07_getexp()
	Say("��<color=yellow>20-12-2005��01-01-2006<color>, ÿ��������������ȡ�����������ŵľ���.<color=yellow>����3���ڿ�����1��<color>, ��������ȡ����֮�������Ҫ<color=yellow>���߳���һСʱ<color>. ��Ҫ����?",2,
		"�ǵ�! ��Ҫ��ȡ!/ny07_getexp_next",
		"�����/no"
	);
end;

ny07_aryExp = {
5000000,
10000000, 
15000000, 
};
-- ��ȡÿ�յľ���
function ny07_getexp_next()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nIndex = tonumber(mod(nDate, 10));
	if (nIndex > 3 or nIndex < 1) then
		return
	end;
	local nExp = ny07_aryExp[nIndex];
	-- ������ڲ��ԣ�ֱ�ӷ���
	if ny07_isactive()==0 then
		Say("Ԫ���Ѿ�����!", 0);
		return
	end;
	
	if (ny07_canGetMoreExp()==1) then
		if GetLevel()<50 then
			ny07_addPlayerExpForLimit(nExp, 5); -- ����ֻ���� 5 ��
		else
			ny07_addPlayerExpForLimit(nExp, 0); -- ������
		end;
		Msg2Player("����Ԫ����еõ��Ľ���:<color=yellow>"..nExp.."<color>����!");
		
		-- ��¼��ȡ������������
		local nTime       = GetGameTime();
		SetTask(ID_MOREEXP_ONLINETIME_NY07, nTime);
		SetTask(ID_MOREEXP_DATE_NY07, nDate);
		WriteTaskLog("��ȡÿ�վ���:"..nExp);
	else
		Say("�����ڵ��������ܹ���ȡÿ�յľ��飬��1��1����1��3���ڼ䣬ÿ�����߶����ö����������͵Ĵ������顣<color=yellow>������֮��ÿ������һ��<color>����������ȡ����֮�������Ҫ<color=yellow>���߳���1Сʱ<color>Ŷ��", 0);
		return
	end;
end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)
	if strMain==nil then return end;	-- ����ǿ�ֵ��д��
	WriteLog("[2007��Ԫ���]"..date(" [%y �� %m �� %d ��  %H ʱ%M ��]").." [����:"..GetAccount().."] [����:"..GetName().."]"..strMain);
end;

-- �õ��������
function ny07_getTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	local nDate  = tonumber(GetLocalDate("%Y%m%d"));
	-- ������ڲ��ԣ�ֱ�ӷ���
	if ny07_isactive()==0 then
		Say("Ԫ���Ѿ�����!", 0);
		return
	end;
	
	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("ֻ��80�����ϵĳ�ֵ��Ҳſ�����ȡ����ؼ�����!", 0);
		return
	end;
	
	if (GetTask(ID_GETTASKBOOK_DATE_NY07) == nDate) then
		Say("�������Ѿ���ȡ���ؼ�������!", 0);
		return
	end;

	-- �����������
	SetTask(ID_GETTASKBOOK_DATE_NY07, nDate);
	
	-- ����һ���������
	nRandomTaskID = TaskNo(selectNextTask());
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	SyncItem(nRandomItemIndex);		-- ͬ����Ʒħ������
	Msg2Player("��õ� <color=green>żȻ����!<color>");
	WriteTaskLog("�õ�1���ؼ�����������"..nRandomTaskID);
end;


function no()

end;
end;	--	__H_NEWYEAR_2007__
