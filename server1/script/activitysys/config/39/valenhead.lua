ValenAct_nStartDate = 20120209
ValenAct_nEndDate = 20120301
ValenAct_TSK_REDLINE = 0
ValenAct_TREE_STATE = 1
ValenAct_TSK_STATE = 2
ValenAct_TSK_PUBTIME = 3
ValenAct_TSK_CREATETIME = 4
ValenAct_TSK_ID_AND_RANDOMTIME = 5
ValenAct_TSK_ACCTIME = 6
ValenAct_TSK_SCORE = 7
ValenAct_TSK_AWARD = 8
ValenAct_TSK_SINGLE_TIME = 9
--ValenAct_nLifePeriod = 30*60 
ValenAct_nMidTime = 60	-- ÿ���������δ��ȡʱ��
ValenAct_nLoopTime = 90	-- ÿ����������ȡδ���ʱ��
ValenAct_nStepTime = 300 -- �ɳ��׶�
ValenAct_nStepTaskTime = 270 -- ÿ���׶�����ʱ��
ValenAct_nStepPartTime = 30 -- ÿ���׶ο���ʱ��
ValenAct_nPickTime = 10*60  -- ��ժʱ��
ValenAct_nTskStepCount = 3
ValenAct_tbMap = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53}
ValenAct_tbNpcId = {1252, 1253, 1254, 1255,}
ValenAct_nUnGrow = 0
ValenAct_nGrowing = 1
ValenAct_tbConfig = {
	["õ������"] = {nTeamSize = 2, nItemIndex = 3109, nSexScore = 1, 
		tbName = {"õ����", "Сõ����", "õ����û�п���", "õ����������", },
		tbDialog = {
			"����˼����",
			"ִ��֮�֣����ӽ���.",
			"�����޼ƿ�����������üͷ,ȴ����ͷ.",
			"��Ը�����֪",
			"Ը�����������ճɾ���.",
		},
		szAddStatKey = "qingrenjie_zhongmeiguihuazhong",
	},
	["��u H�ng"] = {nTeamSize = nil, nItemIndex = 3110,	nSexScore = nil,
		tbName = {"�춹����", "С�춹��", "�춹��δ����", "�춹�����", },
		tbDialog = {
			"�춹���Ϲ�����������֦",
			"Ը�����ߢ����������˼",
			"����Թң����Ϧ����˼",
			"����˼������˼��������˼�����ڡ��������ʱ.",
			"����˼������˼��������˼˵��˭ ǳ���˲�֪.",
			"����˼�ⳤ���䣬����˼�����.",
		},
		szAddStatKey = "qingrenjie_zhonghongdou",
	},
}
ValenAct_nRedLineIndex = 3111
ValenAct_Op = {"T��i n��c", "��ˮ", "���", "����",}