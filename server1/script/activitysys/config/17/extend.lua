Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\activitysys\\config\\17\\head.lua")

function pActivity:Jiluxiaohao_yesou()
	AddStatData("baoxiangxiaohao_kaiyesouxiangzi", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_chengzhan()
	AddStatData("baoxiangxiaohao_kaichengzhanlibao", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_zhizun()
	AddStatData("baoxiangxiaohao_kaizhizunmibao", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_shuizexiangzi()
	AddStatData("baoxiangxiaohao_kaishuizeixiangzi", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

--§iµ÷Õû´ÓË®Ôô´óÍ·ÁìbossÂäÏÂµÄ½±Àø- Modified By DinhHQ - 20120523
function pActivity:VnFFBigBossDrop(nNpcIndex)
	tbVnFFBigBossDrop = {
		[1]={{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=1},},
		[2]={{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=1},},
		[3]={{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=1},},
		[4]={{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=1},},
		[5]={{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=1},},
		[6]={{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=1},},
		[7]={{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=1},},
		[8]={{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},},
		[9]={{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},},
		[10]={{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.5},},
		[11]={{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},},
		[12]={{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.5},},
		[13]={{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.3},},
		[14]={{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.5},},
		[15]={{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.5},},
		[16]={{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.5},},
		[17]={{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.15},},
		[18]={{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.15},},
		[19]={{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.15},},
		[20]={{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.15},},
		[21]={{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.15},},
		[22]={{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.15},},
		[23]={{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.15},},
		[24]={{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.08},},
		[25]={{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.08},},
		[26]={{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.05},},
		[27]={{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},},
		[28]={{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},},
		[29]={{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		[30]={{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=8,nExpiredTime=20160},},
		[31]={{szName="Thiªn Long LÖnh",tbProp={6,1,2256,1,0,0},nCount=1,nRate=7.5},},
	}	
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVnFFBigBossDrop, "PhÇn th­ëng tiªu diÖt Thñy TÆc §¹i §Çu LÜnh", 1)
end

function pActivity:VnUsePirateBox(nItemIdx)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\17\\vnshuizeibaoxiang.lua", "VnPirateBox_main", nItemIdx)
	return nil
end