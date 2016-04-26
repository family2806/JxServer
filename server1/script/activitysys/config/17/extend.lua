Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\activitysys\\config\\17\\head.lua")

function pActivity:Jiluxiaohao_yesou()
	AddStatData("baoxiangxiaohao_kaiyesouxiangzi", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_chengzhan()
	AddStatData("baoxiangxiaohao_kaichengzhanlibao", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_zhizun()
	AddStatData("baoxiangxiaohao_kaizhizunmibao", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_shuizexiangzi()
	AddStatData("baoxiangxiaohao_kaishuizeixiangzi", 1)	--数据埋点第一期
end

--调整从水贼大头领boss落下的奖励- Modified By DinhHQ - 20120523
function pActivity:VnFFBigBossDrop(nNpcIndex)
	tbVnFFBigBossDrop = {
		[1]={{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=1},},
		[2]={{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=1},},
		[3]={{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=1},},
		[4]={{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=1},},
		[5]={{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=1},},
		[6]={{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=1},},
		[7]={{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=1},},
		[8]={{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},},
		[9]={{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},},
		[10]={{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.5},},
		[11]={{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},},
		[12]={{szName="金乌盔宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.5},},
		[13]={{szName="金乌上戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.3},},
		[14]={{szName="金乌鞋宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.5},},
		[15]={{szName="金乌腰带宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.5},},
		[16]={{szName="金乌护腕宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.5},},
		[17]={{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.15},},
		[18]={{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.15},},
		[19]={{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.15},},
		[20]={{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.15},},
		[21]={{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.15},},
		[22]={{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.15},},
		[23]={{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.15},},
		[24]={{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.08},},
		[25]={{szName="白虎下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.08},},
		[26]={{szName="白虎武器图谱",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.05},},
		[27]={{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},},
		[28]={{szName="龙血丸",tbProp={6,1,2117,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},},
		[29]={{szName="礼盒杀手锏",tbProp={6,1,2339,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		[30]={{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=8,nExpiredTime=20160},},
		[31]={{szName="天龙令",tbProp={6,1,2256,1,0,0},nCount=1,nRate=7.5},},
	}	
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVnFFBigBossDrop, "消灭水贼大头领的奖励", 1)
end

function pActivity:VnUsePirateBox(nItemIdx)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\17\\vnshuizeibaoxiang.lua", "VnPirateBox_main", nItemIdx)
	return nil
end