-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - NPC�Ի�����
-- �ļ�������npc_saodiseng.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-02-04 16:25:15

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
--�������� - ���������ֵ�����ʱ�� - Modified By DinhHQ - 20110926
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
-- ��Խ��ǿ��Ǩ�Ƶ� �������˴�
function beidou_translife_main()
	CreateTaskSay({"<dec><npc>����һ���ˣ����������Ҵﵽ<����������-�ķ�ƪ> �����������ˡ��ѵ��ϳ��书�����º����𣿼�Ȼ��ˣ���������ʲô��?",
		"���书���㲻Ҫ���Ұ� /zhuansheng_ondialog",
		"�������4���ܻ�ʣ���ܵ�/querySkillPoint_4",
		"ϴ����4����/wantClearSkillPoint_4",
		"�书���ķ�ʲô������һ������/OnCancel"
		});
end

function zhuansheng_ondialog()
	if (GetTask(TSK_ZHUANSHENG_FLAG) == 1) then
		Msg2Player("��ѧ <����������-����ƪ>");
	end
	
	local tbOpp = {"<dec><npc>û���ѵ��㲻֪�������������������꣬��ļ���Ϊ10�������Լ����书�����ϳ����ﵽ��Ӧ�������ָܻ�(90����120�����ָ�ԭ�м���)���⣬���������м��ܵ�����Ǳ��.<enter> �ܵ���˵��������Ҫ��ͷ��ʼ�����ǣ�Ҳ�����ż�������ﵽ120 130���س����������»������"};
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	if (n_transcount == 0 and n_level == 199 and (n_date >= ZHUANSHENG_ITEM_BEGIN and n_date <= ZHUANSHENG_ITEM_ENDLE)) then --��Ҫ����ʱ������
		tinsert(tbOpp, "�����˽ⱱ���ɵ�/zhuansheng_xiandan");
	end
	
	tinsert(tbOpp, "�������� <����������-�ķ�ƪ> ��Ҫʲô���� /zhuansheng_help_require");
	tinsert(tbOpp, "��ô����ѧ��<����������-�ķ�ƪ>?/zhuansheng_help_method");
	tinsert(tbOpp, "�����ҵĵȼ����Ա������ܵ��Ǳ�ܶ��?/zhuansheng_help_prop");
	tinsert(tbOpp, "�����ҿ���������ʲô�̶�?/zhuansheng_query");
	tinsert(tbOpp, "���ʼ���ת����ʱ��: /zhuansheng_time");
	tinsert(tbOpp, "�����Ի�/OnCancel");
	
	CreateTaskSay(tbOpp);
end

--ת��������
function zhuansheng_help_require()
	
	CreateTaskSay({"<dec><npc>�i�����ܼ�"
		.."<enter>  ".."1. Ҫ�������ȼ�:"
		.."<enter>    "..format("��������Ϊ %d, �ȼ�����С��%d", 1, TB_LEVEL_LIMIT[1])
		.."<enter>    "..format("��������Ϊ%d, �ȼ�����С��%d", 2, TB_LEVEL_LIMIT[2])
		.."<enter>    "..format("��������Ϊ%d, �ȼ�����С��%d", 3, TB_LEVEL_LIMIT[3])
		.."<enter>    "..format("��������Ϊ%d, �ȼ�����С��%d", 4, TB_LEVEL_LIMIT[4])
		.."<enter>    "..format("��������Ϊ%d, �ȼ�����С��%d", 5, TB_LEVEL_LIMIT[5])
		.."<enter>  ".."2. ��ѧ <����������-����ƪ>"
		.."<enter>  ".."3. ��������װ��."
		.."<enter>  ".."4. ��Ҫ������������ս��."
		.."<enter>  ".."5. ���У�����Ϊ��ɵ�����(ɱ�֣���ʹ��Ұ��)."
		.."<enter>  ".."6. ��һ�ε�������ת������Ҫ100���������Ĵ�ת����Ҫ200����"
		.."<enter>  "..format("7. ���Ĵ�ת����Ҫ %d ��%s.", TBITEMNEED_4[1].nCount, TBITEMNEED_4[1].szName)
		.."<enter>  "..format("8. ���Ĵ�ת����Ҫ%d ��%s.", TBITEMNEED_4[2].nCount, TBITEMNEED_4[2].szName)
		.."<enter>  ".."9. δ�ӻ���δ���150��������",
		--.."<enter>����".."3���������ʦͽ��ϵ��", ��Ϊת����80�����²���ʹ��ʦͽ��
		"�˽�������./zhuansheng_ondialog",
		"��֪����./OnCancel"});
end

--ת���ĺô�
function zhuansheng_help_effect()
	CreateTaskSay({"<dec><npc>1. ��ü��ܵ��Ǳ��"
	.."<enter>  ".."2. ��ø���ʱ��Ŀ��ԣ��õ��������������."
	.."<enter>  ".."3. �����书����������ߣ�����ø�ǿ�Ĺ������͸���Ĵ���ٶ�."
	.."<enter>  ".."4. ����ʹ��һЩ����װ��"
	.."<enter>  ".."5. ���һ�����ϴ��Ļ���",
		"�˽�������./zhuansheng_ondialog",
		"��֪����./OnCancel"});
end

--���ѧϰת��
function zhuansheng_help_method()
	CreateTaskSay({"<dec><npc>�����ѧ��<����������-����ƪ>, ���ҾͿ��Խ���<����������-�ķ�ƪ>."
		.. "ת��1-3�Σ���Ҫ100�������У�ת��4�Σ���Ҫ200����������."
		.. "<enter>����һ�£������ת��4������Ҫ������Ȼ��ȥ"
		.. "<color=yellow>����ɽ�ϣ�ҩ����4�㣬ɳĮɽ��3�����Ƕ�<color> ��� <color=yellow> ˪������ɽ�����磬��Ӱ<color>"
		.. "����һ���������������ת��4.", 
		"�ã���������ѧ./zhuansheng_want_learn",
		"ת��4����/wantGetTranslifeTask_4",
		"�����˽�ϸ��/zhuansheng_ondialog",
		"��֪���� OnCancel"});
end

--��Ҫѧϰת��
--�ڴ��ж��Ƿ����ת��������
function zhuansheng_want_learn()
	local n_transcount = ST_GetTransLifeCount()
	
	if (n_transcount >= 4) then
		CreateTaskSay({"<dec><npc>"..format("�� %d ת��δ��������ʱ�佫�Ժ����", 5), 
			"�����Ի�/OnCancel"});
		return 0;
	end

	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("���ѽ�150���ܣ�����������������")
		return 
	end

	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	if (n_transcount == 0) then
		CreateTaskSay({"<dec><npc>".."ת������Σ�����������.", 
			"�ã���������ѧ./#zhuansheng_sure_learn(-1)", "�����Ի�/OnCancel"});
	elseif (n_transcount < 0 or n_transcount >=5) then
		Say("�쳣״������ϵ��������", 0);
	else
		local tbOpp = {"<dec><npc>".."��ѡ�������ӵķ�����:"};
		
		for k, sz in TB_BASE_RESIST do
			tinsert(tbOpp, format("%s%s/#zhuansheng_sure_learn(%d)", "+", sz, k));
		end
		tinsert(tbOpp, "�����Ի�/OnCancel")
		CreateTaskSay(tbOpp);
		
	end
end

function zhuansheng_sure_learn(n_resist)
	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	local n_transcount = ST_GetTransLifeCount();
	
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			if (n_translevel ~= 0 and n_transresist == n_resist) then
				CreateTaskSay({"<dec><npc>"..format("���ǵ�%d ����ѡ��ת�� %s һ�������㲻��ѡ���Σ�������ѡ��.", i, TB_BASE_RESIST[n_resist]),
								"������ѡ/zhuansheng_want_learn",
								"�����Ի�/OnCancel"});
				return 0;
			end
		end
	end
	
	SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, n_resist);
	if (n_transcount == 2 and GetLevel() >= 190) then
		SetTask(TSK_ZHUANSHENG_AWARD, 1);
	end
	local nlevel = GetLevel();
	--ת��ʱ�Ĵ���
	LeaveTeam();	--��ɢ��ӹ�ϵ
	
	ST_DoTransLife();		--ִ��ת�������Զ�����\\script\\global\\translife.lua��main���� ����ֵΪ1Ϊ�ɹ����ɹ�����¼ת��ǰ�ĵȼ���
	
	CreateTaskSay({"<dec><npc>���Ѿ�ѧ <����������-�ķ�ƪ> ��.", "�a��лʦ��ָ��/OnCancel"});
end

function check_zhuansheng()
	-- Խ�ϰ�������ת�� ��� 5��
	if (check_zhuansheng_level() ~= 1) then							--����ƪ��ѧϰ		
		return 0;
	end
	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount ~= 0) then
		--�������� - ���������ֵ�����ʱ��- Modified By DinhHQ - 20110926
		if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
			local tb = {6, 10, 180, 180, 180}
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + tb[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], tb[ntranscount]), "������./OnCancel"});
				return 0;
			end
		else
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], TB_TRANSTIME_LIMIT[ntranscount]), "������./OnCancel"});
				return 0;
			end
		end	
	end
	
	--type=2 ����������
	--type=3 Ӧ���Ǳ���
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "������./OnCancel"});
		return 0;
	end
	--if (check_zhuansheng_league(LG_SHITULEAGUE) == 1) then	--ʦͽ��ϵ
	--	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[3], "�õģ���֪���ˡ�/OnCancel"});
	--	return 0;
	--end
	--������4ʱ����ʱȡ�������뿪�������� - Modified By DinhHQ - 20110813
	if ntranscount < 3 and (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then	--ս�ӹ�ϵ
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "������./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_KILLER_ID) ~= 0) then	--ɱ���������
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[8], "������./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_MESSENGER_FENG) ~= 0 or GetTask(TSK_MESSENGER_SHAN) ~= 0 or GetTask(TSK_MESSENGER_QIAN) ~= 0 ) then	--��ʹ�������
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[9], "������./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_TASKLINK_STATE) ~= 3 and GetTask(TSK_TASKLINK_STATE) ~= 0) then	--Ұ���������
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[10], "������./OnCancel"});
		return 0;
	end
	
	if GetTask(TSK_TASKLINK_CancelTaskLevel) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp1) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp2) ~= 0 then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[11], "������./OnCancel"});
		return 0;
	end
	
	if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then							--����ƪ��ѧϰ
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "������./OnCancel"});
		return 0;
	end
	
	--�������� - ���������ֵ�����ʱ�� - Modified By DinhHQ - 20110926
	if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
		if ntranscount == 0 then
		 	if GetCash() < 1000000 then
				CreateTaskSay({"ĿǰǮ������ <color=red>1000000<color>.", "������./OnCancel"});
				return 0;
			end
		elseif ntranscount == 1 then
			if GetCash() < 20000000 then
				CreateTaskSay({"ĿǰǮ������ <color=red>20000000<color>.", "������./OnCancel"});
				return 0;
			end
		else
			if (ntranscount < 3 and GetCash() < ZHUANSHENG_TUITION) then				--jxbҪ1��
				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[2], "������./OnCancel"});
				return 0;
			end
		end
	else
		if (ntranscount < 3 and GetCash() < ZHUANSHENG_TUITION) then				--jxbҪ1��
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[2], "������./OnCancel"});
			return 0;
		end
	end
	-- ��Ҫ��4��ת�����ж��Ƿ����999��������������������������ķ� �� ����jxb
	if ntranscount == 3 then
		for i=1,getn(TBITEMNEED_4) do
			local tbProb = TBITEMNEED_4[i].tbProb
			if CalcItemCount(3,tbProb[1], tbProb[2],tbProb[3], -1) < TBITEMNEED_4[i].nCount then
				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13 + i], "������./OnCancel"})
				return 0
			end
		end
		
		-- 4ת����jxb
		if GetCash() < ZHUANSHENG_TUITION_4 then	
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13], "������./OnCancel"});
		return 0;
		end
	end
	--������ɱ������
	return 1;
end

--ת�����ܱ�����Ǳ�ܵ� ���ܵ�˵��
function zhuansheng_help_prop()
	local nlevel = GetLevel();
	local ncurexp = GetExp();
	local ntranscount = ST_GetTransLifeCount();
	
	if (check_zhuansheng_level() ~= 1) then
		return 0;
	end
	
	local nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][1],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][2],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][3],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][4];
	
	local sz_res = "ѡ��һ�ֿ���";
	local sz_addskill = "";
	
	if (ntranscount == 0) then
		sz_res = "���п���";
	end
	
	if (nlevel == 199 and ncurexp >= ZHUANSHENG_XIANDAN_MINEXP and ntranscount == 0) then
		nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[200][ntranscount+1][1],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][2],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][3],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][4];
		sz_addskill = "[Ŀǰ�����ѳ���20�� ]";
	end
	
	CreateTaskSay({"<dec><npc>"..format("���ݼ��� %d ����%d ��, %s ���� <color=yellow>%d<color> Ǳ��, <color=yellow>%d <color> ����, ���� <color=yellow>%d%%<color> ����(%s), ���� <color=yellow>%d <color> ��߼�������.", 
				nlevel, (ntranscount+1), sz_addskill, nprop, nmgpoint, nresist, sz_res, naddskill), 
		"�˽�������./zhuansheng_ondialog",
		"������./OnCancel"});
end


function zhuansheng_query()
	--do return Say("δ���", 0)end
	local n_transcount = ST_GetTransLifeCount();
	local nmgpoint, nprop, nskill = 0,0,0;
	local tbresist = {0, 0, 0, 0, 0};
	local sz_msg = "";
	
	if (n_transcount ~= 0) then
		for i = 1, n_transcount do
			nlevel, nresistid = zhuansheng_get_gre(i);
			
			nmgpoint = TB_LEVEL_REMAIN_PROP[nlevel][i][1] + nmgpoint;
			nprop  = TB_LEVEL_REMAIN_PROP[nlevel][i][2] + nprop;
			nskill = TB_LEVEL_REMAIN_PROP[nlevel][i][4] + nskill;
			if (nresistid >= 0 and nresistid <= 4) then
				tbresist[nresistid+1] = tbresist[nresistid+1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("�������� %d �ȼ�: %d; ѡ����: %s", i, nlevel, TB_BASE_RESIST[nresistid]);
			elseif (nresistid == 255) then
				tbresist[1] = tbresist[1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[2] = tbresist[2] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[3] = tbresist[3] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[4] = tbresist[4] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[5] = tbresist[5] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("�������� %d �ȼ�: %d; ѡ����: %s", i, nlevel, "���п���");
			end
		end
	end
	
	CreateTaskSay({format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s%s", 
					"<dec><npc>",
					format("ת������: %d", n_transcount),
					format("��ü��ܵ�: %d", nmgpoint),
					format("���Ǳ�ܵ�: %d", nprop),
					format("��߼��ܵ�����: %d", nskill),
					format("�������: %d", tbresist[1]),
					format("��������: %d", tbresist[2]),
					format("��������: %d", tbresist[3]),
					format("�׷�����: %d", tbresist[4]),
					format("�շ�����: %d", tbresist[5]),
					sz_msg
					), 
			"�˽�������./zhuansheng_ondialog",
			"������./OnCancel"});
	
end


function zhuansheng_xiandan()
	
	CreateTaskSay({"<dec><npc>".."'�����ɵ���һ����ҩ����λ���ָ����������ڹ�����ѧ����������������Ҫ�õ���ʹ�ú�������ӹ��������챱���ɵ���Ҫ199����201000����������졣�����챱���ɵ�ʱ������20�ڵľ��齫ת��Ϊ�ɵ������ǣ���ס����Ҫת��������ʹ�ã�ÿ�����ʹ��һ����ҩ��ͬʱ��Ҫ��30����ʹ�á��ɵ��ĵ�λΪ100�����ԣ�������������ȥ�����������챱���鵤��?",
				"���챱���鵤 ��n/zhuansheng_makexiandan",
				"�˽⾭���/zhuansheng_help_xiandan",
				"��Ц���˽�һ��./zhuansheng_ondialog",
				"�����Ի�/OnCancel"
				});
end


function zhuansheng_makexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (GetTask(TSK_ZHUANSHENG_XIANDAN) > 0) then
		CreateTaskSay({"<dec><npc>".."ÿ��ֻ������һ�ű����ɵ������²���������", "�����Ի�/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		n_addexp = floor(n_addexp / 10e7) * 10e7;
		CreateTaskSay({"<dec><npc>".."����"..n_addexp.."���齫��תΪ�ɵ�����ȷ�������챱���ɵ���?",
				"�ԣ��������ɵ�!/zhuansheng_surexiandan",
				"������˽�һ��./zhuansheng_ondialog",
				"�����Ի�/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."���µĹ����������ɱ����ɵ����������ɵ������Щʱ��",
				"������˽�һ��./zhuansheng_ondialog",
				"�����Ի�/OnCancel"});
	end
end


function zhuansheng_surexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		CreateTaskSay({"<dec><npc>".."װ������10����λ��������װ��", "�����Ի�/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		
		local nitemidx = AddItem(6,1,1970,1,1,0);
		if (nitemidx > 0) then
--			local n_recexp = n_addexp;
--			if (n_recexp <= 10e8) then
--				ReduceOwnExp(n_recexp);
--			else
--				while (n_recexp > 0) do
--					if (n_recexp < 10e8) then
--						ReduceOwnExp(n_recexp);
--						n_recexp = 0;
--					else
--						n_recexp = n_recexp - 10e8;
--						ReduceOwnExp(10e8);
--					end
--				end
--			end
			ReduceOwnExp(n_addexp);
			
			SetSpecItemParam(nitemidx, 1, floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP));
			ITEM_SetExpiredTime(nitemidx, ZHUANSHENG_ITEM_EXTIME);	-- ��Ч��30��
			SyncItem(nitemidx);
			SetTask(TSK_ZHUANSHENG_XIANDAN, 1);
			WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tMakeSuccess,LEVEL:%d,FACTION:%d,ReduceExp:"..n_addexp..",ItemExp:%d",
						"�����ɵ�",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP)));
			Msg2Player(format("���1 %s", "�����ɵ�"));
		end
	end
	
end


function zhuansheng_help_xiandan()
	CreateTaskSay({"<dec><npc>".."����199����20���ھ�����������������������߿��ԣ����ǣ�����ľ��齫���˷ѵ������ԣ��Һ�һλ��ʿ����һ���ɵ���ͨ�������ɵ�������Ա������µľ��飬����ʱ�����õ�.",
				"������˽�һ��./zhuansheng_ondialog",
				"�����Ի�/OnCancel"});
end


function zhuansheng_time()
	local ntranscount = ST_GetTransLifeCount();
	local n_last_time = GetTask(TSK_ZHUANSHENG_LASTTIME);
	local n_cur_time = GetCurServerTime();
	local n_add_time = n_cur_time - n_last_time;
	
	if (ntranscount == 0) then
		CreateTaskSay({"<dec><npc>".."����δѧ��������������ֻ��Ҫ������������ת��.", "�����Ի�/OnCancel"})
	else
		if (n_add_time >= TB_TRANSTIME_LIMIT[ntranscount]*24*60*60) then
			CreateTaskSay({"<dec><npc>".."�ѹ�ת�����ʱ��������ֻ��Ҫ������������ת��.", "�����Ի�/OnCancel"})
		else
			
			CreateTaskSay({"<dec><npc>"..format("���� %d ����ܼ���ת��.",ceil((TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 - n_add_time) / (24*60*60))), "�����Ի�/OnCancel"})
		end
	end
end

