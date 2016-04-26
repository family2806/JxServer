Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

TB_JiangHuXingBaoDian = {
		[32] = {
			szTitleMsg = "<dec>��������˶�Ľ�����Թ�����Ƿ��Ѿ�����һ��ͬ�ʿ๲���ѵ��ֵܽ��á����Ƿ�����������ǽ�����������֮������ȡ�����ǳص�����Ȩ�������ǹ���ʢ���������Ǿͽ���һ�������Լ��İ��ѣ���д�Լ��Ŀ�����𡢶�Ů�鳤�����������ǡ���BOSS~",
			tbOpt = {
				[1] = {"�������", 33},
				[2] = {"����ͼ", 34},
				[3] = {"��֯�ṹ", 35},
				[4] = {"������", 36},
				[5] = {"������", 37},
				[6] = {"�������", 38},
				[7] = {"�����Ŀ��", 39},
				[8] = {"����ɢ", 40}
			},
		},
		[33] = { szTitleMsg = "<dec>����һ����������Ϳ���ȥ��ɽ(293.218)�ҽ�ɽ�����˽����Լ��İ���ˣ�<enter>1.�����������ᡢ���ɣ�����ɫ���֣�<enter>2.�ȼ���50��<enter>3.����ֵ450���ϣ���������ͨ���������ã��������ִ�����<enter>4.ͳ����30����<enter>5.�ν��ս��ս��Ʒ�����������ν�����ھ���ٴ���ȡ������֮ʯ��100��������֮ʯ��ȡ1����������Ҳ�����������ֱ�ӹ�������������򿪵õ���<enter>6.��Ǯ��100����",tbOpt = {{"������һ��", 32},},},
		[34] = { szTitleMsg = "<dec>������ڸ�����м��ƴ�ʹ�õ��ߡ���ͭ��������һ�����������Լ��Ķ�������ͼ�������Ϸ���߸�������ĳ��У�����ͼ����������ͬ��",tbOpt = {{"������һ��", 32},},},
		[35] = { szTitleMsg = "<dec>�����������಻����7�����ϣ���಻����56���ӳ��������Ӧ��ͬ��ְλ�����Ա༭65���ƺţ�ÿ���ƺų��Ȳ��ܳ���4�����֡�",tbOpt = {{"������һ��", 32},},},
		[36] = { szTitleMsg = "<dec>��������һ��������ϵͳ�����ڴ�Ű��Ĺ�ͬ�ʲ���",tbOpt = {{"������һ��", 32},},},
		[37] = { szTitleMsg = "<dec>�����ͨ�������ķ�ʽ������Ա�ַ����ְ����𣻿���ͨ���������Ž����ƶ������ϡ��ӳ��Ͱ�����������ֱ𷢷ŵĶ�ȡ�",tbOpt = {{"������һ��", 32},},},
		[38] = { szTitleMsg = "<dec>�㻹���Ժ���������ɰ�����ˡ�ÿ�������б������һ��������ᣬ���ٴ���һ����Ա��ᣬ�����Դ���7����Ա��ᡣ",tbOpt = {{"������һ��", 32},},},
		[39] = { szTitleMsg = "<dec>��ϵͳ������ν�Ұ�š����ء����������ϵͳ����ѡһ����ֻҪ����ܹ���ɸ�Ŀ�꣬����Ա���ܻ�÷������棡����������ȡBOSS���Ƶȡ�",tbOpt = {{"������һ��", 32},},},
		[40] = { szTitleMsg = "<dec>����İ����������16�˵�ʱ�����뿼����Ŷ�����3����û�дﵽ16�����ϣ����ͻ��ɢ���м�Ҫ�Ž���Լ����ֵ�Ŷ��",tbOpt = {{"������һ��", 32},},},
	};
	
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>��λ�����������ô��"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	tbDailog:AddOptEntry("�鿴��������Ϣ", TongHelp);
	tbDailog:AddOptEntry("�򿪰����ļ���", NeedOpenTongZhaoMu);
	
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
	
	tinsert(tb_dailog, "�����Ի�/OnCancel");
	
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
