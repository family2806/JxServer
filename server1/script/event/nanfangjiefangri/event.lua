--�Ϸ���ż����ջ
--byС�˶��
--2007-04-13
XINGYUNLIBAO = 2556 --Byte:1.�� 2.�� 3.�� 4.����

function nanfangjiefangri_main()
	local aryTalk = {
		"<dec><npc>���գ��ν�ս�����漤�ҡ����ص�������ʿ����۲�ս�����������������˳��˱��������Ϊ�˸����������徫��������������Ҫ�����ν�ս��������ս����Ӣ�������Խ���.",
		"�����˽�./about",
		"�����칦����./getGongLaoLin",
		"������ս��Ӣ�۽���./getXingYunLiBao",
		"�治����˼���Ҵ�������./no",
	}
	CreateTaskSay(aryTalk)
	
end
function getGongLaoLin()
	if (GetCash()<300000) then
		CreateTaskSay({"<dec><npc>Ҫ��30�����ǼǷ��ã�������Ǯ�����أ�/no"});
		return 0;
	end
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>ֻ�г�ֵ��Ҳſ�����ȡ.","֪����/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>ֻ��50��������Ҳſ�����ȡ.","֪����/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>׼����1����λ��1��<color=yellow>������<color>.","֪����/no"});
		return 0;
	end
	Pay(300000);
	local nidx = AddItem(6,1,1411,1,0,0);
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>���Ѿ���ȡ��1�� <color=yellow>������<color>.","֪����/no"});
end

function getXingYunLiBao()
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>ֻ�г�ֵ��Ҳſ�����ȡ.","֪����/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>ֻ��50��������Ҳſ�����ȡ.","֪����/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>׼����1����λ��1��<color=yellow>������<color>.","֪����/no"});
		return 0;
	end
	local ndate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nlibao = GetTask(XINGYUNLIBAO);
	local olddate = tonumber(GetByte(nlibao,1)..GetByte(nlibao,2)..GetByte(nlibao,3));
	local num = GetByte(nlibao,4);
	if num == nil then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,0));
		num = 0;
	end
	if ndate == olddate then 
		CreateTaskSay({"<dec><npc>ÿ�����ֻ����ȡ50�������������ɡ�","֪����/no"});
		return 0;
	end
	local ngonglao = CalcEquiproomItemCount(6,1,1411,-1)
	local nxunzhang = CalcEquiproomItemCount(6,1,1412,-1)
	if ngonglao < 1 then
		CreateTaskSay({"<dec><npc> ����û�д�<color=yellow>������<color>.","֪����/no"});
		return 0;
	end
	if nxunzhang < 1 then
		CreateTaskSay({"<dec><npc> ����û�д�<color=yellow>�ν����<color>. �û��۵㻻�ν����","֪����/no"});
		return 0;
	end	
	num = num + 1;
	if num >= 50 then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),1,tonumber(GetLocalDate("%y"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,tonumber(GetLocalDate("%m"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),3,tonumber(GetLocalDate("%d"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,0));
	else
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,num));
	end
	ConsumeEquiproomItem(1, 6, 1, 1411, -1)
	ConsumeEquiproomItem(1, 6, 1, 1412, -1)
	local nidx = AddItem(6,1,1413,1,0,0);
	WriteLog(format("[XINGYUNLIBAO]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>�ɹ���ȡ1��<color=yellow>�������<color>.","֪����/no"});
end

function about()
	CreateTaskSay({"<dec><npc>��28/4/2007��13/5/2007, 50�����ϵĳ�ֵ��ҿ��Ե�������1��<color=yellow>������<color> (����30��ǼǷ��Ҳų���) ��1��<color=yellow>�ν����<color> (�ھ���ٴ���500���۵�ɶһ�) ���жһ�","֪����/no"})
end