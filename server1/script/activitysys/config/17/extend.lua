Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\activitysys\\config\\17\\head.lua")

function pActivity:Jiluxiaohao_yesou()
	AddStatData("baoxiangxiaohao_kaiyesouxiangzi", 1)	--��������һ��
end

function pActivity:Jiluxiaohao_chengzhan()
	AddStatData("baoxiangxiaohao_kaichengzhanlibao", 1)	--��������һ��
end

function pActivity:Jiluxiaohao_zhizun()
	AddStatData("baoxiangxiaohao_kaizhizunmibao", 1)	--��������һ��
end

function pActivity:Jiluxiaohao_shuizexiangzi()
	AddStatData("baoxiangxiaohao_kaishuizeixiangzi", 1)	--��������һ��
end

--�i������ˮ����ͷ��boss���µĽ���- Modified By DinhHQ - 20120523
function pActivity:VnFFBigBossDrop(nNpcIndex)
	tbVnFFBigBossDrop = {
		[1]={{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=1},},
		[2]={{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=1},},
		[3]={{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=1},},
		[4]={{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=1},},
		[5]={{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=1},},
		[6]={{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=1},},
		[7]={{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=1},},
		[8]={{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},},
		[9]={{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},},
		[10]={{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.5},},
		[11]={{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},},
		[12]={{szName="���ڿ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.5},},
		[13]={{szName="�����Ͻ䱦��",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.3},},
		[14]={{szName="����Ь����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.5},},
		[15]={{szName="������������",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.5},},
		[16]={{szName="���ڻ�����",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.5},},
		[17]={{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.15},},
		[18]={{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.15},},
		[19]={{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.15},},
		[20]={{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.15},},
		[21]={{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.15},},
		[22]={{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.15},},
		[23]={{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.15},},
		[24]={{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.08},},
		[25]={{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.08},},
		[26]={{szName="�׻�����ͼ��",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.05},},
		[27]={{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},},
		[28]={{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},},
		[29]={{szName="���ɱ���",tbProp={6,1,2339,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		[30]={{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=8,nExpiredTime=20160},},
		[31]={{szName="������",tbProp={6,1,2256,1,0,0},nCount=1,nRate=7.5},},
	}	
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVnFFBigBossDrop, "����ˮ����ͷ��Ľ���", 1)
end

function pActivity:VnUsePirateBox(nItemIdx)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\17\\vnshuizeibaoxiang.lua", "VnPirateBox_main", nItemIdx)
	return nil
end