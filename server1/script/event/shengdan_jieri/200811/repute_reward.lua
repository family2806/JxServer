Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

repute_reward_taskid	= 1865;
repute_reward_date_s	= 20081205;
repute_reward_date_e	= 20090104;

function christmas_repute_main()
	local n_dateD	= tonumber(GetLocalDate("%y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	local n_dateW	= tonumber(GetLocalDate("%w"));
	
	if (n_dateW ~= 0 or n_dateH < 12 or n_dateH >= 14) then	-- �ʱ���ж�
		Say("���: ���ڻ������콱ʱ�������һ������.", 0);
		return
	end
	
	if (GetLevel() < 50) then	-- �ȼ��ж�
		Say("���: ��Ϻ��δ��50�����Ȱѵȼ�����ȥ�������콱��", 0);
		return
	end
	
	if (GetRepute() < 450) then
		Say("���:���µ�����ֵ����450�������콱.", 0);
		return
	end
	
	if (GetTask(repute_reward_taskid) == n_dateD) then	-- һ��ֻ����ȡһ�ε��ж�
		Say("���:���մ�������ȡ�˽���.", 0);
		return
	end
	
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("���������ռ䲻��!",0);
		return
	end
	
	SetTask(repute_reward_taskid, n_dateD);
	local szName 		= "";
	local nItemIndex	= 0;
	if (GetRepute() > 10000) then
		nItemIndex	= AddItem(6, 1, 1838, 1, 0, 0);
		szName	= "�׽���";		
	elseif (GetRepute() > 3600) then
		nItemIndex	= AddItem(6, 1, 1837, 1, 0, 0);
		szName	= "�ƽ���";
	else
		nItemIndex	= AddItem(6, 1, 1836, 1, 0, 0);
		szName	= "������";
	end
	if (ITEM_GetExpiredTime(nItemIndex) == 0) then
		ITEM_SetExpiredTime(nItemIndex,christmas_box_expiredtime);
		SyncItem(nItemIndex);
	end
	Msg2Player(format("��ϲ�����õ�1 %s!", szName));
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",
			"2008���ջ��������ֵ�콱",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			szName));
end

function christmas_repute_info()
	Say("���: �������콱���05-12-2008��04-01-2009��ÿ����12:00��14:00. ��ڼ䣬��λͬ����NPC��ٴ��Ի��콱�����Ҫ�ﵽ50������ͬʱ����Ҫ��450�ſ�����ȡ����Ӧ����.", 0);
end