Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

TB_JiangHuXingBaoDian = {
		[32] = {
			szTitleMsg = "<dec>经历了如此多的江湖恩怨，你是否已经有了一帮同甘苦共患难的兄弟姐妹。你是否想带领着他们建立万世不灭之功，夺取七座城池的所有权，让他们共享盛世繁华。那就建立一个我们自己的帮会把，谱写自己的快意恩仇、儿女情长！抢船、抢城、抢BOSS~",
			tbOpt = {
				[1] = {"建立帮会", 33},
				[2] = {"帮会地图", 34},
				[3] = {"组织结构", 35},
				[4] = {"帮会基金", 36},
				[5] = {"帮会红利", 37},
				[6] = {"帮会联盟", 38},
				[7] = {"帮会周目标", 39},
				[8] = {"帮会解散", 40}
			},
		},
		[33] = { szTitleMsg = "<dec>有了一下条件后，你就可以去华山(293.218)找金山掌门人建立自己的帮会了！<enter>1.玩家无所属帮会、门派（即红色名字）<enter>2.等级≥50级<enter>3.声望值450以上，声望可以通过做任务获得，包括新手村任务<enter>4.统率力30以上<enter>5.宋金大战的战利品：岳王剑（宋金积分在军需官处换取岳王魂之石，100个岳王魂之石换取1把岳王剑；也可以在奇珍阁直接购买岳王剑礼包打开得到）<enter>6.金钱：100万两",tbOpt = {{"返回上一层", 32},},},
		[34] = { szTitleMsg = "<dec>你可以在各大城市祭酒处使用道具“青铜鼎”创建一张真正属于自己的独立帮会地图！针对游戏中七个风格各异的城市，帮会地图都会有所不同。",tbOpt = {{"返回上一层", 32},},},
		[35] = { szTitleMsg = "<dec>你可以任命最多不超过7个长老，最多不超过56个队长。允许对应不同的职位最多可以编辑65个称号，每个称号长度不能超过4个汉字。",tbOpt = {{"返回上一层", 32},},},
		[36] = { szTitleMsg = "<dec>帮会基金是一个公共的系统，用于存放帮会的共同资产。",tbOpt = {{"返回上一层", 32},},},
		[37] = { szTitleMsg = "<dec>你可以通过红利的方式给帮会成员分发部分帮会基金；可以通过红利发放界面制定给长老、队长和帮众三个级别分别发放的额度。",tbOpt = {{"返回上一层", 32},},},
		[38] = { szTitleMsg = "<dec>你还可以和其他帮会结成帮会联盟。每个联盟中必须存在一个盟主帮会，最少存在一个成员帮会，最多可以存在7个成员帮会。",tbOpt = {{"返回上一层", 32},},},
		[39] = { szTitleMsg = "<dec>由系统随机在宋金、野叟、闯关、龙脉任务等系统中挑选一个。只要帮会能够完成该目标，帮会成员都能获得丰厚的利益！帮主还能领取BOSS令牌等。",tbOpt = {{"返回上一层", 32},},},
		[40] = { szTitleMsg = "<dec>当你的帮会人数少于16人的时候会进入考验期哦，如果3天内没有达到16人以上，帮会就会解散！切记要团结好自己的兄弟哦。",tbOpt = {{"返回上一层", 32},},},
	};
	
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>这位少侠想加入帮会么？"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	tbDailog:AddOptEntry("查看帮会帮主信息", TongHelp);
	tbDailog:AddOptEntry("打开帮会招募面板", NeedOpenTongZhaoMu);
	
	tbDailog:Show()
end

function jianghuxing_showdiag(nidx, nbackidx)
	local tb_dailog = {};
	
	if (not TB_JiangHuXingBaoDian[nidx].szTitleMsg) then
		print("Error!!There Is No Titlemsg!!");
		return
	end
	
	tb_dailog[1] = TB_JiangHuXingBaoDian[nidx].szTitleMsg;
	
	if (TB_JiangHuXingBaoDian[nidx].tbOpt) then
		for nkey, szopp in TB_JiangHuXingBaoDian[nidx].tbOpt do
			tinsert(tb_dailog, format("%s/#jianghuxing_showdiag(%d)", szopp[1], szopp[2]));
		end
	end
	
	tinsert(tb_dailog, "结束对话/OnCancel");
	
	CreateTaskSay(tb_dailog);
end

function OnCancel()
end

function NeedOpenTongZhaoMu()
	OpenTongZhaoMu()
end

function TongHelp()
	jianghuxing_showdiag(32)
end
