-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ������Ͷʦ��ͷ�ļ�

-- Edited by �ӷ��~
-- 2008/02/28 12:10

-- ======================================================

IncludeLib("LEAGUE");
Include("\\script\\misc\\daiyitoushi\\toushi_head.lua");
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua");
Include("\\script\\lib\\gb_modulefuncs.lua");


-- ��顰����Ͷʦ�����˳����ɵ��������ȼ��ﵽ120������120������
function toushiCheckApplyState()
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (GetLastFactionNumber() == -1) then
		return TOUSHI_NOFACTERR;
	end
	
	return TOUSHI_SUCCEED;
end


-- ��顰����Ͷʦ������������������
function toushiCheckTransFactState(nFactionNumb, nStage)
	local bFlag			= GetTask(TSK_TOUSHI_FLAG);				-- ���תͶʦ�ŵı��
	local nMyFacNumb	= GetLastFactionNumber();				-- ���ԭ����ID
	local nSex			= GetSex();								-- ��ɫ�Ա�
	local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- �ϴ�תͶʦ�ű��
	local nCurTime      = tonumber( GetCurServerTime() );
	
	if (bFlag == 0) then
		return TOUSHI_FLAGERR;
	end
	
	if (bFlag >= 2) then
		return TOUSHI_UNKNOWN;
	end
	
	if (nMyFacNumb == -1) then
		return TOUSHI_NOFACTERR;
	end
	--����ʱ������ת����- Modified By DinhHQ - 20110813
--	if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
--	    return TOUSHI_TIMEERR;
--	end
	
	if ((nSex == 0 and (nFactionNumb == 4 or nFactionNumb == 5)) or (nSex == 1 and nFactionNumb == 0)) then
		return TOUSHI_MALEERR;
	end
	
	if (nMyFacNumb == nFactionNumb) then
		return TOUSHI_EQFACTERR;
	end
	
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (nStage == 2) then
		if (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then
			return TOUSHI_LGERR;
		end
		
		if (CalcItemCount(2,0,-1,-1,-1) > 0) then
			return TOUSHI_EQUIPERR;
		end
	end
	
	if (GetTask(TSK_TOUSHI_COUNT) == 0 and CalcFreeItemCellCount() < 2) then
		return TOUSHI_NOFREEBAG;
	end
	
	return TOUSHI_SUCCEED;
end


function toushiGetHierarchTitle(nFactionNumb)
	if (nFactionNumb == 7 or nFactionNumb == 3) then			-- �嶾�̣����̽� Ϊ����
		return TB_TOUSHI_HIERARCH[2];
	elseif (nFactionNumb == 1 or TB_TOUSHI_HIERARCH == 6) then	-- �����ؤ�� Ϊ����
		return TB_TOUSHI_HIERARCH[3];
	else														-- ���� Ϊ����
		return TB_TOUSHI_HIERARCH[1];
	end
end


function toushiGetSexName(nSex)
	if (nSex == 0) then
		return "��";
	else
		return "Ů";
	end
end


function OnCancel()
end

function daiyitoushi_main(nFactionNumb)
--	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
--		Say("�Բ��𣬸ù�����ʱ�ѹرգ��ٿ�ʱ�佫����֪ͨ", 0);
--		return 1;
--	end
	
	local nFlag	= GetTask(TSK_TOUSHI_FLAG);
	local tbDes	= {"<dec><npc>�������´��ң����ָ�������˭��ֻ��Ϊ���Լ������棬��ս�¶��չأ�������ԭ����ʧ���롣δ�̳���������������֣�����������֮�����Ӽ����𣬸�������ɾ�����ֹ��������Ź棬������Ӽ����������ɣ�һ��ӡ֤��ѧ��������������־�ѧ�����������֡�"};
	
	if (nFlag == 0) then
		tinsert(tbDes, format("����Ͷʦ��ת����/#toushiApplyEnter(%d)", nFactionNumb));
	elseif (nFlag == 1) then
		tinsert(tbDes, format("����Ͷʦ����������/#toushiTransEnter(%d)", nFactionNumb));
	elseif (nFlag == 2 and GetLastFactionNumber() == nFactionNumb) then
		tbDes	= {"<dec><npc>���������뱾�ɣ��Ժ�Ҫר�Ŀ����������������ѧ����"};
	else
		tbDes	= {"<dec><npc>������<sex> ��λ�����ص�����������."};
	end
	
	tinsert(tbDes, "�����Ի�/OnCancel");
	
	CreateTaskSay(tbDes);
end
--

-- ����Ͷʦ��תͶ����
function toushiApplyEnter(nFactionNumb)
	
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("���ѽ�150����������,������������������")
		return 
	end
	local nSex	= GetSex();
	local szDes = "";
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (GetLastFactionNumber() ~= nFactionNumb) then
		CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_FLAGERR], "�����Ի�/OnCancel"});
		return
	end
	
    local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- �ϴ�תͶʦ�ű��
	local nCurTime      = tonumber( GetCurServerTime() );
	--����ʱ������ת����- Modified By DinhHQ - 20110813
--	if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
--	    CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TIMEERR], "�����Ի�/OnCancel"});
--	    return
--	end
	
	if (nSex == 1) then
		szDes = "{����������������������Ӣ���ܼ�����������.}";
	end
	
	szDes	= format("<dec><npc>����������ѧ���������ʦ��Ҳ�������Ź�һ����Ӧ�������ɣ������Ҹ����뿪���ţ�Ҳ���Խ���%s ���ɵ���. %s<enter>, ׷����ѧ��·��Ȼ���ף���Ϊʦ������Ҳ��Ҫ��ս��һ�¡���������{�ﵽ120��}����Ҫ�һر���ʧ���Ѿõ�����{ ��������}, ʦ������������ɽ.", 
				toushiGetSexName(nSex),
				szDes);
	
	
	CreateTaskSay({szDes,
					format("%s ���ģ����ӽ����������./OnCancel", szHierarchTitle),
					format("%s, �뿴����ǲ�����������?/#toushiApplyMenPaiXinWu(%d)", szHierarchTitle, nFactionNumb),
					"�����Ի�/OnCancel"
				});
end

-- ��������ύ��������
function toushiApplyMenPaiXinWu()
	local bFlag = toushiCheckApplyState();
	if (bFlag == TOUSHI_SUCCEED) then
		GiveItemUI("�Ͻ���������", "�����������������Ŀ�λ.", "toushiApplyShowXinWu", "OnCancel", 1);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], "�����Ի�/OnCancel"});
	end
end

-- ��ʾ�����жϣ��������˳����ɴ���
-- ������˳����ɽ�����������תͶ���ű������
function toushiApplyShowXinWu(nCount)
	if (nCount ~= 1) then
		CreateTaskSay({"<dec><npc>���ɲ���С����ģ��Ѳ����������ۻ���?", 
						"�Ͻ���������/toushiApplyMenPaiXinWu",
						"������������һ��/OnCancel"
					});
		return 0;
	end
	
	local nItemIdx = GetGiveItemUnit(nCount);		--�ɸ����������Ʒ��Ż����Ʒ����
	local nG, nD, nP = GetItemProp(nItemIdx);		--�����Ʒ��ID����ֵ
	local szKey = join({nG, nD, nP});
	
	if (szKey ~= join(TB_TOUSHI_MENPAIXINWU)) then
		CreateTaskSay({"<dec><npc>���ɲ���С����ģ��Ѳ����������ۻ���?", 
						"�Ͻ���������/toushiApplyMenPaiXinWu",
						"������������һ��/OnCancel"
					});
		return 0;
	end
	
	--
	RemoveItemByIndex(nItemIdx);					-- ɾ����������
	SetTask(TSK_TOUSHI_FLAG, 1);					-- ���ô���Ͷʦ����ɹ����
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,FactionId:%d%s",
				"����Ͷʦ",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), GetLastFactionNumber(),
				"�ó��������ת����Ҫ��ɹ�"));
				
	CreateTaskSay({"<dec><npc>������ˣ�����׼����ɽ����ϣ��������������ѧ���������������.", "����һ������ʦ���̻�/OnCancel"});
end

-- ����Ͷʦ��������ǽ
function toushiTransEnter(nFactionNumb)
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("���ѽ���150��������, ����������������")
		return 
	end
	local bFlag				= toushiCheckTransFactState(nFactionNumb, 1);
	local nSex				= GetSex();
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		local szDes = "<dec><npc>��<sex> λ�������ҵ��������·�ˣ���Ҫ��������ʦ��������ľ�ѧ��{{����Ҫ֪������Ȼ�Ѿ����뱾�ţ��Ͳ�����ʹ��֮ǰ����ѧ�ˣ���Ȼ���ҽ������㱾�ŵ���ѧ��������뱾�ţ������ţ���������ʧ������}}�����������������뱾����?";
		
		if (nFactionNumb == 1 and nSex == 1) then
			szDes = "<dec><npc>��<sex> λ, �����ҵ��������·�ˣ���Ҫ��������ʦ��������ľ�ѧ����һ���ǣ�������ԭ������Ů���ӣ�����Ϊ��Ů���Ӳ�����᱾�Ŵ����Ĺ�����ֱ������ǰ��������������л��һ���ŷ��������ҵ��ƽ⹦����ֻ�ǣ���ҩ������ҩҲ���Ǻ��ף���Ҫ�������������ͨ���������������ҵ�������������ܼ��뱾�{{���⣬��ҲҪ֪�������Ѽ��뱾�ţ��Ͳ�����ʹ��֮ǰ����ѧ�ˣ���Ȼ���ҽ������㱾�ŵ���ѧ��������뱾�ţ������ţ���������ʧ������}}�����������������뱾����?";
		end
		
		CreateTaskSay({szDes, 
				format("%s, ��������ˣ�����뱾������./#toushiTransSureTodo(%d)", szHierarchTitle, nFactionNumb),
				format("%s, ����������/OnCancel", szHierarchTitle),
			});
		
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], "�����Ի�/OnCancel"});
	end
end

-- ��ʾתְ�ɹ���,��Ҫ����90������������
function toushiTransSureTodo(nFactionNumb)
	local tbDescrib		= {"<dec><npc>����Ҫѡ������֮·:"};

	for k, v in TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID[90] do
		if (type(v) == "table") then
			tbDescrib[getn(tbDescrib) + 1]	= format("%s/#toushiTransSure(%d, %d)", v[3], nFactionNumb, k);
		end
	end
	
	tbDescrib[getn(tbDescrib) + 1]	= "����Ҫ������/OnCancel";
	
	CreateTaskSay(tbDescrib);
end


-- ȷ�ϰ�����ǽ���жϽ�ɫ״̬�������ɫ����
function toushiTransSure(nFactionNumb, nMagicIdx)
	local bFlag	= toushiCheckTransFactState(nFactionNumb, 2);
	local nSex	= GetSex();
	local szLog	= "";
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		if (nFactionNumb == 1 and nSex == 1) then
			--local ndnumzimu		= CalcItemCount(23, unpack(TB_TOUSHI_YANGYINGXINWU), -1);	-- �����ĸ��
			local ndnumbeibao	= CalcItemCount(3, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);	-- ��鱳��
			
			if (ndnumbeibao >= 1) then
				ConsumeItem(3, 1, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);
			--elseif (ndnumzimu >= 1) then
			--	ConsumeItem(23, 1, unpack(TB_TOUSHI_YANGYINGXINWU), -1);
			
			else
				CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TWFEMALEERR], "�����Ի�/OnCancel"});
				return TOUSHI_TWFEMALEERR;
			end
			
			szLog = "����Ӣ������ɹ�";
		end
		
		local bTrans = toushiDoTransPlayer(GetLastFactionNumber(), nFactionNumb, nMagicIdx, szLog);			-- �����ɫ�������
		
		-- ������ȴʱ��
		local nCurTime = tonumber( GetCurServerTime() );
		SetTask(TSK_LAST_CHANGE_FACTION, nCurTime);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], "�����Ի�/OnCancel"});
	end
end


-- ת����ɫ�����Ӧ����
-- ���ý�ɫ���У����ɣ��ƺţ���Ӫ�������������
function toushiDoTransPlayer(nMyFacNumb, nFactionNumb, nMagicIdx, szLog)
	LeaveTeam();															-- ������Ӳ���
	
	local nLevel		= GetLevel();
	local tbOldSkill	= TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].tbSkillID;
	local tbNewSkill	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID;
	local tb90SkillExp		= {};
	local tb120SkillExp	= {};
	local tb150SkillExp	= {};
	
	zhuansheng_clear_skill(0, 0)											-- ����ת�� ϴ���ܵ㺯��
	
	for i = 1, getn(tbOldSkill[90]) do										-- ����ԭ����������
		if (type(tbOldSkill[90][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[90][i][1]);

--			if (nMagicLvl == 0) then
--				nMagicLvl = 1;
--			end

			if (tb90SkillExp.nShuliandu == nil) then
				tb90SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb90SkillExp.nShuliandu[getn(tb90SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[90][i]) >= 0) then
				tb90SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb90SkillExp.nShuliandu, toushiSortSkillsExp);									-- �������ȵȼ����������򣬸�����·�߼����������
	
	if (HaveMagic(tbOldSkill[120][1][1]) > 0) then							-- ����120������������
		local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[120][1][1]);
		
--		if (nMagicLvl == 0) then
--			nMagicLvl = 1;
--		end
		tb120SkillExp = {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
	end
	
	for i = 1, getn(tbOldSkill[150]) do
		if (type(tbOldSkill[150][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[150][i][1]);
			
			if (tb150SkillExp.nShuliandu == nil) then
				tb150SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb150SkillExp.nShuliandu[getn(tb150SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[150][i]) >= 0) then
				tb150SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb150SkillExp.nShuliandu, toushiSortSkillsExp);									-- �������ȵȼ����������򣬸�����·�߼����������
	for i=1,getn(tb150SkillExp.nShuliandu) do
		print(tb150SkillExp.nShuliandu[i].nMagicLvl, tb150SkillExp.nShuliandu[i].nMagicExpPre)
	end
	
	for nSkillLvl, tbLvlSkill in tbOldSkill do							-- ɾ�������ɼ���
		for i = 1, getn(tbLvlSkill) do
			if (type(tbLvlSkill[i]) == "table") then
				DelMagic(tbLvlSkill[i][1]);
			else
				DelMagic(tbLvlSkill[i]);
			end
		end
	end
	
	--for nSkillLvl, tbLvlSkill in tbNewSkill do							-- ѧϰ�����ɼ���
	for nSkillLvl = 10, 150, 10  do							-- ѧϰ�����ɼ���
		local tbLvlSkill = tbNewSkill[nSkillLvl];
		if (tbLvlSkill) then
			if (nSkillLvl == 150) then
				toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb150SkillExp, tbLvlSkill, nMagicIdx);	
			
			elseif (nSkillLvl == 120) then										-- �����120������,ֱ������Ϊ��120�����ܵȼ���������
				
				toushiAdd120Skill(tb120SkillExp, tbLvlSkill[1][1]);			
				
			elseif (nSkillLvl == 90) then									-- �����90������
				
				toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb90SkillExp, tbLvlSkill, nMagicIdx);			-- 
				
			else															-- ����Ǽӵ㼼��
				for i = 1, getn(tbLvlSkill) do 
					AddMagic(tbLvlSkill[i]);
				end
			end
		end
	end
	
	
	local nOldSeries	= GetSeries();
	local nNewSeries	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nSeries;
	
	toushiAddWuXingSkill(nOldSeries, nNewSeries);		-- ��������м��ܣ���ô����Ϊ������
	
	zhuansheng_clear_prop(0, 0, nNewSeries)			-- ����ת�� ϴǱ�ܵ㺯��,��������ϴ��,�����л���Ǳ�ܵ㲻һ��
	
	SetSeries(nNewSeries);							-- ת����ɫ��������
	
	toushiResetMaxLife(nNewSeries, nLevel);			-- ��ɫ��Ӧ���еȼ� �Ļ���Ѫ��
	toushiResetMaxMana(nNewSeries, nLevel);			-- ��ɫ��Ӧ���еȼ� �Ļ�������
	SetTask(TSK_TOUSHI_RESETBASE, 1);										-- 
	
	SetLastFactionNumber(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nFacNumb);					-- ��ɫ����ID
	
	SetTask(TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].nTaskId_Fact, 0);				-- ���ɫԭ�����������
	
	if (GetFaction() ~= "���뽭��") then
		SetFaction(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szFacName);			-- ��ɫ��������
		
		SetCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);					-- ��Ӧ������Ӫ
		SetCurCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);				-- ��Ӧ������Ӫ
		
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_HUISHI);	-- �����������,��ʦ
	else
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_CHUSHI);	-- �����������,��ʦ
	end
	
	SetRank(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nRankId);					-- ��ɫͷ��
	
	SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_137, 
					TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nValue_137);			-- �����������,��ʦ
	
	SetTask(144, 0);	--���ϴ��
	SetTask(TSK_TOUSHI_FLAG, 0);												-- �����Ͷʦ�ɹ����
	SetTask(TSK_TOUSHI_COUNT, GetTask(TSK_TOUSHI_COUNT) + 1);					-- ���ô���Ͷʦ�ɹ�����
	
	if (GetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3) ~= 1) then
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGDAN)), -2);			-- ���͵���ƷΪ���ð�
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGYAO)), -2);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3, 1))
		szLog = szLog..",����鵤����ҩ";
	end
	
	
	CreateTaskSay({"<dec><npc>�����������뱾�ɣ��պ���Ҫר�Ŀ���������������ѧ���������Ǳ��ɵ������鵤�����԰�����߹���������ȥʹ�ð�.",
					"�����Ի�/OnCancel"});
	
	Msg2Faction(format(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szMsg, GetName()));
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,OldFactionId:%d,NewFactionId:%d,MainMagic:%d,%s",
				"����Ͷʦ",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), nMyFacNumb, nFactionNumb,nMagicIdx,
				"����ת���ɳɹ�"..szLog));
	KickOutSelf();
end


function toushiSetTask(nTaskId, isHigh, nValue)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nTaskValue			= nTaskValue_H * 2^16 + nTaskValue_L;
	
	SetTask(nTaskId, nTaskValue);
	
	return nTaskValue;
end


function toushiAddTask(nTaskId, isHigh, nAdd)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	local nValue		= 0;
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nValue			= nValue + nAdd;
	
	toushiSetTask(nTaskId, isHigh, nValue)
	
	return nTaskValue;
end


function toushiGetTask(nTaskId, isHigh)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		return nTaskValue_H;
	else
		return nTaskValue_L;
	end
end


function toushiGetMagicProp(nMagicId)
	local nMagicLvl		= HaveMagic(nMagicId);
	
	if (nMagicLvl == -1) then
		return 0, 0, 0;
	end
	
	if (nMagicLvl <= 0) then
		nMagicLvl = 1;
	end
	
	if (nMagicLvl > 20) then
		nMagicLvl = 20;
	end
	
	local nMagicExp		= GetSkillExp(nMagicId);
--	local nMagicExpPre	= floor((nMagicExp * 10000) / TB_TOUSHI_SKILLEXP[nMagicId][nMagicLvl]);
	
	return nMagicLvl, nMagicExp;
end


-- ��ԭְҵ����������������
function toushiSortSkillsExp(tb1, tb2)
	if (tb1.nMagicLvl ~= tb2.nMagicLvl) then
		return tb1.nMagicLvl > tb2.nMagicLvl;
--	else
--		return tb1.nMagicExpPre > tb2.nMagicExpPre;
	end

end


-- ���150�����ܴ���
--  150����������ֻ����ɺ�δ���У�soδ���в��������ȫ��
function toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	local tbAddSkill	= {};
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	
	if (mod(floor(GetTask(TSK_LV150_SKILL) / 100), 100) >= TOUSHI_150SKILL_TASKSTATE) then
	-- ���150�������������Ϊ��ɵĴ���
		--�ı�150������ɵ��������������֧�ߵ��޸�
		SetTask(TSK_LV150_SKILL, TOUSHI_150SKILL_TASKSTATE*100+tbFactStepList[nFactionNumb])
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- �Ƚ�����·�߼��ܼӼ�¼
		else
			tbAddSkill[1] = {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		print(150,tbAddSkill[1][1], tbAddSkill[1][2], tbAddSkill[1][3])
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- ����������ȼ���
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- ��˳�����������
																								-- ��������ɼ��������Ȳ�������
					if (nCount > nAddCnt) then													-- ����뼼��Ϊһ����������Ϊ0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						print(tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre)
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
						print(tbNewSkill[k][1], 1, 0)
					end
				end
			else																				-- ����Ǽӵ㼼�ܣ����¼Ҫ��
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- �ڸ����ʱ��ֱ�Ӹ�0��
			end
		end
	else
		return
	end
	
	for k = 1, getn(tbAddSkill) do
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2]);
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1);
		else
			AddMagic(tbAddSkill[k]);
		end
	end
end

-- ���120�����ܴ������ԭ����120�����������������120������
function toushiAdd120Skill(tbOldSkill, nNewSkill)
	if (tbOldSkill.nMagicLvl and tbOldSkill.nMagicLvl > 0) then
		SetTask(LV120_SKILL_ID, nNewSkill);
		AddMagic(nNewSkill, tbOldSkill.nMagicLvl);
		AddSkillExp(nNewSkill, tbOldSkill.nMagicExpPre, 1, 1);
	end
end

-- ���90�����ܴ���
-- 	���90������������ɣ����������������90������
-- 	���90����������δ��ɣ��򰴾�����90�������������������ɼ���
function toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	local tbAddSkill	= {};
	
	
	if (GetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill) == TOUSHI_90SKILL_TASK) then
	-- ���90�������������Ϊ��ɵĴ���
		SetTask(TB_DAIYITOUSHI_FACTS[nNewNumb].nTaskId_90Skill, TOUSHI_90SKILL_TASK);	-- �����ɼ�����������Ϊ���
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- �Ƚ�����·�߼��ܼӼ�¼
		else
			tbAddSkill[1] = {tbNewSkill[90][nMagicIdx], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- ����������ȼ���
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- ��˳�����������
																								-- ��������ɼ��������Ȳ�������
					if (nCount > nAddCnt) then													-- ����뼼��Ϊһ����������Ϊ0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
					end
				end
			else																				-- ����Ǽӵ㼼�ܣ����¼Ҫ��
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- �ڸ����ʱ��ֱ�Ӹ�0��
			end
		end
	else
		local tbOtherMagic	= {tbShuliandu = {}, tbJinengdian = {}};
		local nCount		= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt		= 0;
		local nAddJinengCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt = nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[1].nMagicLvl, tbOldSkillExp.nShuliandu[1].nMagicExpPre};					-- �Ƚ�����·�߼��ܼӼ�¼
		else
			tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then
					if (nCount > nAddCnt) then
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						
					else
						
						tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[k][1], 1, 0};
					end
				end
				
			else
				
				if (tbOldSkillExp.nJinengdian) then
					tbAddSkill[getn(tbAddSkill) + 1]	= tbNewSkill[k];
					nAddJinengCnt						= nAddJinengCnt + 1;
					
				else
					
					tbOtherMagic.tbJinengdian[getn(tbOtherMagic.tbJinengdian) + 1]	= tbNewSkill[k];
				end
			end
		end
		
		if (getn(tbOtherMagic.tbJinengdian) > 0) then
			for j = 1, getn(tbOtherMagic.tbJinengdian) do
				
				if (nCount - nAddCnt <= 0) then
					break
				end

				nAddCnt								= nAddCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbJinengdian[j];
				
			end
		end
		
		if (getn(tbOtherMagic.tbShuliandu) > 0) then
			for j = 1, getn(tbOtherMagic.tbShuliandu) do
				if (not tbOldSkillExp.nJinengdian or tbOldSkillExp.nJinengdian - nAddJinengCnt <= 0) then
					break
				end
				nAddJinengCnt						= nAddJinengCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbShuliandu[j];
				
			end
		end
		
	end
	
	SetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill, 0);	-- ȡ��ԭְҵ90����������
	
	for k = 1, getn(tbAddSkill) do
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2]);
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1);
			
		else
			
			AddMagic(tbAddSkill[k]);
		end
	end
end

-- �����ɫ���и�������ô���м���Ҳ����
function toushiAddWuXingSkill(nOldSeries, nNewSeries)
	if (nOldSeries ~= nNewSeries) then
		local nMagicLvl1	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
		local nMagicLvl2	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
		if (nMagicLvl1 ~= -1) then
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId1);
		elseif (nMagicLvl2 >= 1) then
			local nMagicExp2	= GetSkillExp(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicLvl2);
			AddSkillExp(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicExp2, 1);
		end
	end
end
