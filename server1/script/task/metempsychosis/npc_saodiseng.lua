-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - NPC对话处理
-- 文件名　：npc_saodiseng.lua
-- 创建者　：子非魚
-- 创建时间：2009-02-04 16:25:15

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
--风云令牌 - 调整对新手的重生时间 - Modified By DinhHQ - 20110926
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
-- 被越南强制迁移到 北斗老人处
function beidou_translife_main()
	CreateTaskSay({"<dec><npc>又来一个人？看起来，我达到<北斗长生术-心法篇> 不再是秘密了。难道废除武功让天下害怕吗？既然如此，你找我有什么事?",
		"废武功？你不要吓我啊 /zhuansheng_ondialog",
		"检查重生4技能还剩技能点/querySkillPoint_4",
		"洗重生4技能/wantClearSkillPoint_4",
		"武功，心法什么。又来一个疯子/OnCancel"
		});
end

function zhuansheng_ondialog()
	if (GetTask(TSK_ZHUANSHENG_FLAG) == 1) then
		Msg2Player("已学 <北斗长生术-基础篇>");
	end
	
	local tbOpp = {"<dec><npc>没错，难道你不知道？修炼北斗长生术完，你的级别将为10级，所以技能武功将被废除，达到相应级别后才能恢复(90级，120级将恢复原有技能)此外，将保留所有技能点和你的潜能.<enter> 总的来说，大侠需要从头开始。但是，也不用着急，等你达到120 130将重出江湖，天下还是你的"};
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	if (n_transcount == 0 and n_level == 199 and (n_date >= ZHUANSHENG_ITEM_BEGIN and n_date <= ZHUANSHENG_ITEM_ENDLE)) then --需要加入时间限制
		tinsert(tbOpp, "我想了解北斗仙丹/zhuansheng_xiandan");
	end
	
	tinsert(tbOpp, "请问修炼 <北斗长生术-心法篇> 需要什么条件 /zhuansheng_help_require");
	tinsert(tbOpp, "怎么样能学到<北斗长生术-心法篇>?/zhuansheng_help_method");
	tinsert(tbOpp, "请问我的等级可以保留技能点和潜能多久?/zhuansheng_help_prop");
	tinsert(tbOpp, "请问我可以修炼到什么程度?/zhuansheng_query");
	tinsert(tbOpp, "请问继续转生的时间: /zhuansheng_time");
	tinsert(tbOpp, "结束对话/OnCancel");
	
	CreateTaskSay(tbOpp);
end

--转生的条件
function zhuansheng_help_require()
	
	CreateTaskSay({"<dec><npc>条件很简单"
		.."<enter>  ".."1. 要求重生等级:"
		.."<enter>    "..format("重生次数为 %d, 等级不能小于%d", 1, TB_LEVEL_LIMIT[1])
		.."<enter>    "..format("重生次数为%d, 等级不能小于%d", 2, TB_LEVEL_LIMIT[2])
		.."<enter>    "..format("重生次数为%d, 等级不能小于%d", 3, TB_LEVEL_LIMIT[3])
		.."<enter>    "..format("重生次数为%d, 等级不能小于%d", 4, TB_LEVEL_LIMIT[4])
		.."<enter>    "..format("重生次数为%d, 等级不能小于%d", 5, TB_LEVEL_LIMIT[5])
		.."<enter>  ".."2. 已学 <北斗长生术-基础篇>"
		.."<enter>  ".."3. 脱下所有装备."
		.."<enter>  ".."4. 需要脱离武林联赛战队."
		.."<enter>  ".."5. 不行，还有为完成的任务(杀手，信使，野叟)."
		.."<enter>  ".."6. 第一次到第三次转生，需要100万两，第四次转生需要200万两"
		.."<enter>  "..format("7. 第四次转生需要 %d 个%s.", TBITEMNEED_4[1].nCount, TBITEMNEED_4[1].szName)
		.."<enter>  "..format("8. 第四次转生需要%d 个%s.", TBITEMNEED_4[2].nCount, TBITEMNEED_4[2].szName)
		.."<enter>  ".."9. 未接或者未完成150技能任务",
		--.."<enter>　　".."3、必须清除师徒关系。", 改为转生后80级以下不能使用师徒令
		"了解其他事./zhuansheng_ondialog",
		"我知道了./OnCancel"});
end

--转生的好处
function zhuansheng_help_effect()
	CreateTaskSay({"<dec><npc>1. 获得技能点和潜能"
	.."<enter>  ".."2. 获得更长时间的抗性，得到更多的生存能力."
	.."<enter>  ".."3. 增加武功技能上限最高，将获得更强的攻击力和更快的打击速度."
	.."<enter>  ".."4. 可以使用一些最新装备"
	.."<enter>  ".."5. 获得一次免费洗点的机会",
		"了解其他事./zhuansheng_ondialog",
		"我知道了./OnCancel"});
end

--如何学习转生
function zhuansheng_help_method()
	CreateTaskSay({"<dec><npc>如果已学过<北斗长生术-基础篇>, 那我就可以教你<北斗长生术-心法篇>."
		.. "转生1-3次，需要100万两就行，转生4次，需要200万两，哈哈."
		.. "<enter>提醒一下，如果想转生4，首先要接任务，然后去"
		.. "<color=yellow>长白山南，药王洞4层，沙漠山洞3，裸狼洞<color> 打败 <color=yellow> 霜刀，穿山，疾风，棍影<color>"
		.. "才有一定比例获得霹雳弹转生4.", 
		"好，我想马上学./zhuansheng_want_learn",
		"转生4任务/wantGetTranslifeTask_4",
		"我想了解细节/zhuansheng_ondialog",
		"我知道了 OnCancel"});
end

--想要学习转生
--在此判断是否符合转生的条件
function zhuansheng_want_learn()
	local n_transcount = ST_GetTransLifeCount()
	
	if (n_transcount >= 4) then
		CreateTaskSay({"<dec><npc>"..format("第 %d 转生未开，具体时间将稍候更新", 5), 
			"结束对话/OnCancel"});
		return 0;
	end

	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("你已接150技能，请完成任务后来见我")
		return 
	end

	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	if (n_transcount == 0) then
		CreateTaskSay({"<dec><npc>".."转生第五次，防御将增加.", 
			"好，我想马上学./#zhuansheng_sure_learn(-1)", "结束对话/OnCancel"});
	elseif (n_transcount < 0 or n_transcount >=5) then
		Say("异常状况请联系管理部处理", 0);
	else
		local tbOpp = {"<dec><npc>".."请选择想增加的防御点:"};
		
		for k, sz in TB_BASE_RESIST do
			tinsert(tbOpp, format("%s%s/#zhuansheng_sure_learn(%d)", "+", sz, k));
		end
		tinsert(tbOpp, "结束对话/OnCancel")
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
				CreateTaskSay({"<dec><npc>"..format("这是第%d 次已选择转生 %s 一个防御点不能选择多次，请重新选择.", i, TB_BASE_RESIST[n_resist]),
								"我想重选/zhuansheng_want_learn",
								"结束对话/OnCancel"});
				return 0;
			end
		end
	end
	
	SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, n_resist);
	if (n_transcount == 2 and GetLevel() >= 190) then
		SetTask(TSK_ZHUANSHENG_AWARD, 1);
	end
	local nlevel = GetLevel();
	--转生时的处理
	LeaveTeam();	--解散组队关系
	
	ST_DoTransLife();		--执行转生，会自动调用\\script\\global\\translife.lua的main函数 返回值为1为成功，成功后会记录转生前的等级。
	
	CreateTaskSay({"<dec><npc>你已经学 <北斗长生术-心法篇> 了.", "多谢师父指教/OnCancel"});
end

function check_zhuansheng()
	-- 越南版允许多次转生 最多 5次
	if (check_zhuansheng_level() ~= 1) then							--基础篇的学习		
		return 0;
	end
	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount ~= 0) then
		--风云令牌 - 调整对新手的重生时间- Modified By DinhHQ - 20110926
		if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
			local tb = {6, 10, 180, 180, 180}
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + tb[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], tb[ntranscount]), "可以了./OnCancel"});
				return 0;
			end
		else
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], TB_TRANSTIME_LIMIT[ntranscount]), "可以了./OnCancel"});
				return 0;
			end
		end	
	end
	
	--type=2 好像是身上
	--type=3 应该是背包
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "可以了./OnCancel"});
		return 0;
	end
	--if (check_zhuansheng_league(LG_SHITULEAGUE) == 1) then	--师徒关系
	--	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[3], "好的，我知道了。/OnCancel"});
	--	return 0;
	--end
	--当重生4时，暂时取消联赛离开队伍条件 - Modified By DinhHQ - 20110813
	if ntranscount < 3 and (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then	--战队关系
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "可以了./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_KILLER_ID) ~= 0) then	--杀手任务完成
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[8], "可以了./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_MESSENGER_FENG) ~= 0 or GetTask(TSK_MESSENGER_SHAN) ~= 0 or GetTask(TSK_MESSENGER_QIAN) ~= 0 ) then	--信使任务完成
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[9], "可以了./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_TASKLINK_STATE) ~= 3 and GetTask(TSK_TASKLINK_STATE) ~= 0) then	--野叟任务完成
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[10], "可以了./OnCancel"});
		return 0;
	end
	
	if GetTask(TSK_TASKLINK_CancelTaskLevel) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp1) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp2) ~= 0 then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[11], "可以了./OnCancel"});
		return 0;
	end
	
	if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then							--基础篇的学习
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "可以了./OnCancel"});
		return 0;
	end
	
	--风云令牌 - 调整对新手的重生时间 - Modified By DinhHQ - 20110926
	if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
		if ntranscount == 0 then
		 	if GetCash() < 1000000 then
				CreateTaskSay({"目前钱不够 <color=red>1000000<color>.", "可以了./OnCancel"});
				return 0;
			end
		elseif ntranscount == 1 then
			if GetCash() < 20000000 then
				CreateTaskSay({"目前钱不够 <color=red>20000000<color>.", "可以了./OnCancel"});
				return 0;
			end
		else
			if (ntranscount < 3 and GetCash() < ZHUANSHENG_TUITION) then				--jxb要1亿
				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[2], "可以了./OnCancel"});
				return 0;
			end
		end
	else
		if (ntranscount < 3 and GetCash() < ZHUANSHENG_TUITION) then				--jxb要1亿
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[2], "可以了./OnCancel"});
			return 0;
		end
	end
	-- 需要第4次转生，判断是否具有999个霹雳弹，北斗长生术—大乘心法 和 二亿jxb
	if ntranscount == 3 then
		for i=1,getn(TBITEMNEED_4) do
			local tbProb = TBITEMNEED_4[i].tbProb
			if CalcItemCount(3,tbProb[1], tbProb[2],tbProb[3], -1) < TBITEMNEED_4[i].nCount then
				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13 + i], "可以了./OnCancel"})
				return 0
			end
		end
		
		-- 4转二亿jxb
		if GetCash() < ZHUANSHENG_TUITION_4 then	
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13], "可以了./OnCancel"});
		return 0;
		end
	end
	--其他？杀手任务？
	return 1;
end

--转生后能保留的潜能点 技能点说明
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
	
	local sz_res = "选择一种抗性";
	local sz_addskill = "";
	
	if (ntranscount == 0) then
		sz_res = "所有抗性";
	end
	
	if (nlevel == 199 and ncurexp >= ZHUANSHENG_XIANDAN_MINEXP and ntranscount == 0) then
		nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[200][ntranscount+1][1],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][2],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][3],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][4];
		sz_addskill = "[目前经验已超过20亿 ]";
	end
	
	CreateTaskSay({"<dec><npc>"..format("根据级别 %d 重生%d 次, %s 增加 <color=yellow>%d<color> 潜能, <color=yellow>%d <color> 技能, 增加 <color=yellow>%d%%<color> 抗性(%s), 增加 <color=yellow>%d <color> 最高技能上限.", 
				nlevel, (ntranscount+1), sz_addskill, nprop, nmgpoint, nresist, sz_res, naddskill), 
		"了解其他事./zhuansheng_ondialog",
		"可以了./OnCancel"});
end


function zhuansheng_query()
	--do return Say("未完成", 0)end
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
				sz_msg = sz_msg.."<enter>"..format("重生次数 %d 等级: %d; 选择抗性: %s", i, nlevel, TB_BASE_RESIST[nresistid]);
			elseif (nresistid == 255) then
				tbresist[1] = tbresist[1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[2] = tbresist[2] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[3] = tbresist[3] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[4] = tbresist[4] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[5] = tbresist[5] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("重生次数 %d 等级: %d; 选择抗性: %s", i, nlevel, "所有抗性");
			end
		end
	end
	
	CreateTaskSay({format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s%s", 
					"<dec><npc>",
					format("转生次数: %d", n_transcount),
					format("获得技能点: %d", nmgpoint),
					format("获得潜能点: %d", nprop),
					format("最高技能点增加: %d", nskill),
					format("火防增加: %d", tbresist[1]),
					format("冰防增加: %d", tbresist[2]),
					format("毒防增加: %d", tbresist[3]),
					format("雷防增加: %d", tbresist[4]),
					format("普防增加: %d", tbresist[5]),
					sz_msg
					), 
			"了解其他事./zhuansheng_ondialog",
			"可以了./OnCancel"});
	
end


function zhuansheng_xiandan()
	
	CreateTaskSay({"<dec><npc>".."'北斗仙丹是一种灵药，那位武林高手有深厚的内功，想学北斗长生术，都需要用到，使用后可以增加功力。制造北斗仙丹需要199级和201000万经验才能制造。在制造北斗仙丹时，超过20亿的经验将转化为仙丹。但是，记住，需要转生完后才能使用，每人最多使用一颗灵药。同时需要在30天内使用。仙丹的单位为100万，所以，经验余数将被去掉。你想制造北斗灵丹吗?",
				"制造北斗灵丹 Кn/zhuansheng_makexiandan",
				"了解经验点/zhuansheng_help_xiandan",
				"玩笑多了解一下./zhuansheng_ondialog",
				"结束对话/OnCancel"
				});
end


function zhuansheng_makexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (GetTask(TSK_ZHUANSHENG_XIANDAN) > 0) then
		CreateTaskSay({"<dec><npc>".."每人只能制造一颗北斗仙丹，阁下不能这样做", "结束对话/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		n_addexp = floor(n_addexp / 10e7) * 10e7;
		CreateTaskSay({"<dec><npc>".."你有"..n_addexp.."经验将被转为仙丹，你确定想制造北斗仙丹吗?",
				"对，我想炼仙丹!/zhuansheng_surexiandan",
				"我想多了解一下./zhuansheng_ondialog",
				"结束对话/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."阁下的功力不能炼成北斗仙丹，想炼成仙丹请多练些时日",
				"我想多了解一下./zhuansheng_ondialog",
				"结束对话/OnCancel"});
	end
end


function zhuansheng_surexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		CreateTaskSay({"<dec><npc>".."装备不足10个空位，请整理装备", "结束对话/OnCancel"});
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
			ITEM_SetExpiredTime(nitemidx, ZHUANSHENG_ITEM_EXTIME);	-- 有效期30天
			SyncItem(nitemidx);
			SetTask(TSK_ZHUANSHENG_XIANDAN, 1);
			WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tMakeSuccess,LEVEL:%d,FACTION:%d,ReduceExp:"..n_addexp..",ItemExp:%d",
						"北斗仙丹",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP)));
			Msg2Player(format("获得1 %s", "北斗仙丹"));
		end
	end
	
end


function zhuansheng_help_xiandan()
	CreateTaskSay({"<dec><npc>".."凡是199级和20多亿经验修炼北斗长生术，将提高抗性，但是，多余的经验将被浪费掉，所以，我和一位隐士发明一种仙丹，通过北斗仙丹，你可以保留余下的经验，重生时可以用到.",
				"我想多了解一下./zhuansheng_ondialog",
				"结束对话/OnCancel"});
end


function zhuansheng_time()
	local ntranscount = ST_GetTransLifeCount();
	local n_last_time = GetTask(TSK_ZHUANSHENG_LASTTIME);
	local n_cur_time = GetCurServerTime();
	local n_add_time = n_cur_time - n_last_time;
	
	if (ntranscount == 0) then
		CreateTaskSay({"<dec><npc>".."阁下未学到北斗长生术，只需要满足条件就能转生.", "结束对话/OnCancel"})
	else
		if (n_add_time >= TB_TRANSTIME_LIMIT[ntranscount]*24*60*60) then
			CreateTaskSay({"<dec><npc>".."已够转生间隔时间条件，只需要满足条件就能转生.", "结束对话/OnCancel"})
		else
			
			CreateTaskSay({"<dec><npc>"..format("还有 %d 天才能继续转生.",ceil((TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 - n_add_time) / (24*60*60))), "结束对话/OnCancel"})
		end
	end
end

