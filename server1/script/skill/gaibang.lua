--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--丐帮
	gaibang_bangfa={ --丐帮棒法
		addphysicsdamage_p={{{1,10},{20,150}},{{1,-1},{2,-1}},{{1,2},{2,2}}},
		deadlystrikeenhance_p={{{1,2},{20,25,Conic}},{{1,-1},{2,-1}}}
	},
	gaibang_zhangfa={ --丐帮掌法
		addfiremagic_v={{{1,25},{20,275}},{{1,-1},{2,-1}}}
	},
	yanmen_tuobo={ --沿门托钵
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,10},{20,55}}},
		firedamage_v={
			[1]={{1,10},{20,100}},
			[3]={{1,10},{20,150}}
		},
		addskilldamage1={
			[1]={{1,359},{2,359}},
			[3]={{1,1},{20,40}}
		},
		addskilldamage2={
			[1]={{1,125},{2,125}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1074},{2,1074}},
			[3]={{1,1},{20,32}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,10},{20,10}}}
	},
	jianren_shenshou={ --见人伸手
		seriesdamage_p={{{1,1},{20,10}}},
		firedamage_v={
			[1]={{1,15},{20,75}},
			[3]={{1,15},{20,215}}
		},
		addskilldamage1={
			[1]={{1,357},{2,357}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage2={
			[1]={{1,128},{2,128}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1073},{2,1073}},
			[3]={{1,1},{20,40}}
		},
		addskilldamage4={
			[1]={{1,1101},{2,1101}},
			[3]={{1,1},{20,40}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	huabu_liushou={ --滑不留手
		fastwalkrun_p={{{1,9},{20,66}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,24},{20,50}}}
	},
	dagou_zhen={ --打狗阵
		addphysicsdamage_p={{{1,10},{20,175}},{{1,-1},{30,-1}},{{1,2},{2,2}}},
		--skill_cost_v={{{1,24},{20,50}}}
	},
	xianglong_zhang={ --降龙掌
		lifemax_p={{{1,-1},{20,-25},{25,-25},{26,-25}},{{1,-1},{2,-1}}},
		manamax_p={{{1,12},{20,50}},{{1,-1},{2,-1}}},
		addfiremagic_v={{{1,35},{15,250},{20,750}},{{1,-1},{2,-1}}},
	},
	bangda_egou={ --棒打恶狗
		physicsenhance_p={{{1,10},{20,179}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		firedamage_v={
			[1]={{1,70},{20,360}},
			[3]={{1,70},{20,420}}
		},
		addskilldamage1={
			[1]={{1,359},{2,359}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1074},{2,1074}},
			[3]={{1,1},{20,50}}
		},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,28},{20,48}}}
	},
	zuidie_kuangwu={ --醉碟狂舞
		allres_p={{{1,1},{30,30}},{{1,18*120},{30,18*180}}},
		addfiremagic_v={{{1,10},{30,215}},{{1,18*120},{30,18*180}}},
		addfiredamage_v={{{1,10},{30,175}},{{1,18*120},{30,18*180}}},
		deadlystrikeenhance_p={{{1,5},{20,30,Conic}},{{1,18*120},{30,18*180}}},
		lifemax_yan_p={{{1,21},{35,20},{36,20}},{{1,-1},{30,-1}}},
		skill_cost_v={{{1,50},{20,100}}}
	},
	kanglong_youhui={ --亢龙有悔//未完，待续
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		firedamage_v={
			[1]={{1,10},{20,536}},
			[3]={{1,10},{20,536}}
		},
		addskilldamage1={
			[1]={{1,357},{2,357}},
			[3]={{1,1},{20,55}}
		},
		addskilldamage2={
			[1]={{1,1073},{2,1073}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage3={
			[1]={{1,1101},{2,1101}},
			[3]={{1,1},{20,45}}
		},
		skill_misslesform_v={{{1,1},{10,1},{10,2},{20,2}}},
		skill_misslenum_v={{{1,1},{10,1},{20,15},{25,18},{26,18}}},
		skill_param1_v={{{1,0},{10,0},{10,2},{20,2},{21,2}}},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,10},{20,50}}}
	},
	huaxian_weiyi={ --化险为夷
		meleedamagereturn_p={{{1,4},{20,46}},{{1,-1},{20,-1}}},
		adddefense_v={{{1,48},{20,800}},{{1,-1},{20,-1}}},
	},
	xiaoyao_gong={ --逍遥功
		attackspeed_v={{{1,6},{20,65},{25,90},{31,108},{32,118},{33,121}},{{1,-1},{20,-1}}},
		castspeed_v={{{1,6},{20,65},{25,90},{31,108},{32,118},{33,121}},{{1,-1},{2,-1}}},
	},
	feilong_zaitian={ --飞龙在天
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		firedamage_v={
			[1]={{1,10},{15,300},{20,750}},
			[3]={{1,10},{15,300},{20,750}}
		},
		addskilldamage1={
			[1]={{1,1073},{2,1073}},
			[3]={{1,1},{20,25}}
		},
		addskilldamage2={
			[1]={{1,1101},{2,1101}},
			[3]={{1,1},{20,25}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_misslesform_v={{{1,1},{11,1},{11,0},{20,0}}},
		skill_misslenum_v={{{1,1},{11,1},{12,2},{15,2},{16,3},{20,4},{21,4}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,10},{20,65}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_flyevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[2]={{1,4},{2,4}},
--			[3]={{1,389},{20,389}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,389},{20,389}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(8600,1.15,1,1,1)},
							{2,SkillExpFunc(8600,1.15,2,1,1)},
							{3,SkillExpFunc(8600,1.16,3,1,1)},
							{4,SkillExpFunc(8600,1.17,4,1,1)},
							{5,SkillExpFunc(8600,1.18,5,1,1)},
							{6,SkillExpFunc(8600,1.19,6,2,1)},
							{7,SkillExpFunc(8600,1.20,7,2,1)},
							{8,SkillExpFunc(8600,1.21,8,2,1)},
							{9,SkillExpFunc(8600,1.22,9,2,1)},
							{10,SkillExpFunc(8600,1.23,10,2,1)},
							{11,SkillExpFunc(8600,1.24,11,2,1)},
							{12,SkillExpFunc(8600,1.23,12,2,1)},
							{13,SkillExpFunc(8600,1.22,13,2,1)},
							{14,SkillExpFunc(8600,1.21,14,2,1)},
							{15,SkillExpFunc(8600,1.20,15,3,1)},
							{16,SkillExpFunc(8600,1.19,16,3,1)},
							{17,SkillExpFunc(8600,1.18,17,3,1)},
							{18,SkillExpFunc(8600,1.17,18,3,1)},
							{19,SkillExpFunc(8600,1.16,19,3,1)},
							{20,SkillExpFunc(8600,1.15,20,4,1)},
						}},
	},
	zhanggaibang150={ --掌丐帮150
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		firedamage_v={
			[1]={{1,24},{15,720},{20,1800},{23,3096},{26,3744}},
			[3]={{1,24},{15,720},{20,1800},{23,3096},{26,3744}}
		},
		missle_speed_v={{{1,24},{20,40},{21,40}}},
		skill_misslenum_v={{{1,1},{11,1},{12,2},{15,2},{16,2},{20,3},{21,3}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,12},{20,78},{23,98}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_flyevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[2]={{1,4},{2,4}},
--			[3]={{1,389},{20,389}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1072},{20,1072}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												}},	
	},
--	qianlong_zaiyuan={ --潜龙在渊
--		seriesdamage_p={{{1,20},{20,60}}},
--		firedamage_v={
--			[1]={{1,17},{20,171}},
--			[3]={{1,17},{20,171}}
--		},
--	},
	longzhan_yuye={ --龙战于野
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		firedamage_v={
			[1]={{1,17},{20,371}},
			[3]={{1,17},{20,371}}
		},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_collideevent={
--			[1]={{1,0},{15,0},{15,1},{20,1}},
--			[3]={{1,358},{20,358}}
--		},
--		skill_showevent={{{1,0},{15,0},{15,4},{20,4}}},
	},
	zhanggaibang150_2={ --掌丐帮150第2式
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		firedamage_v={
			[1]={{1,20},{20,450},{23,585},{26,653}},
			[3]={{1,20},{20,450},{23,585},{26,653}}
		},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_collideevent={
--			[1]={{1,0},{15,0},{15,1},{20,1}},
--			[3]={{1,358},{20,358}}
--		},
--		skill_showevent={{{1,0},{15,0},{15,4},{20,4}}},
	},
	tianxia_wugou={ --天下无狗
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		skill_misslenum_v={{{1,1},{20,3},{21,3}}},
		physicsenhance_p={{{1,12},{15,100},{20,206}}},
		firedamage_v={
			[1]={{1,70},{15,150},{20,285}},
			[3]={{1,70},{15,200},{20,432}}
		},
		addskilldamage1={
			[1]={{1,1074},{2,1074}},
			[3]={{1,1},{20,25}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,20},{20,50}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(7000,1.15,1,1,1)},
							{2,SkillExpFunc(7000,1.15,2,1,1)},
							{3,SkillExpFunc(7000,1.16,3,1,1)},
							{4,SkillExpFunc(7000,1.17,4,1,1)},
							{5,SkillExpFunc(7000,1.18,5,1,1)},
							{6,SkillExpFunc(7000,1.19,6,1,1)},
							{7,SkillExpFunc(7000,1.20,7,1,1)},
							{8,SkillExpFunc(7000,1.21,8,1,1)},
							{9,SkillExpFunc(7000,1.22,9,1,1)},
							{10,SkillExpFunc(7000,1.23,10,1,1)},
							{11,SkillExpFunc(7000,1.24,11,1,1)},
							{12,SkillExpFunc(7000,1.23,12,1,1)},
							{13,SkillExpFunc(7000,1.22,13,1,1)},
							{14,SkillExpFunc(7000,1.21,14,2,1)},
							{15,SkillExpFunc(7000,1.20,15,2,1)},
							{16,SkillExpFunc(7000,1.19,16,2,1)},
							{17,SkillExpFunc(7000,1.18,17,3,1)},
							{18,SkillExpFunc(7000,1.17,18,3,1)},
							{19,SkillExpFunc(7000,1.16,19,3,1)},
							{20,SkillExpFunc(7000,1.15,20,3,1)},
						}},
	},
	gungaibang150={ --棍丐帮150
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		skill_misslenum_v={{{1,1},{20,5},{21,5}}},
		physicsenhance_p={{{1,10},{15,80},{20,165},{23,267},{26,318}}},
		firedamage_v={
			[1]={{1,60},{15,120},{20,230},{23,362},{26,428}},
			[3]={{1,60},{15,160},{20,345},{23,567},{26,678}}
		},
		missle_speed_v={{{1,24},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,20},{20,50},{23,59}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												}},	
	},
	gaibang120={ --丐帮120级技能
		autoattackskill={{{1,720*256 + 1},{20,720*256 + 20},{21,720*256 + 21}},{{1,-1},{20,-1}},{{1,12*18*256 + 1},{15,12*18*256 + 5},{20,12*18*256 + 6},{21,12*18*256 + 6}}},
		skill_desc=
			function(level)
				return "命中目标时有<color=orange>"..floor(Link(level,SKILLS.gaibang120.autoattackskill[3]) - 12*18*256).."%<color>的概率使其灼伤\n"..
				"灼伤将使普防最大值减少<color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.physicsresmax_p[1]))..
				"%<color>，火防最大值减少<color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.fireresmax_p[1]))..
				"%<color>，\n受远程攻击时伤害反弹减少<color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.rangedamagereturn_p[1]))..
				"%<color>，持续<color=orange>"..floor(Link(level,SKILLS.gaibang120zuzhou.physicsresmax_p[2]) / 18).."秒<color>\n"..
				"灼伤后<color=orange>"..floor((Link(level,SKILLS.gaibang120.autoattackskill[3]) / (18*256))).."秒<color>内不会再次触发"
			end,
		skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},	
	},
	gaibang120zuzhou={ --丐帮120级技能诅咒
		physicsresmax_p={{{1,-1},{15,-1},{20,-6},{21,-6}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		fireresmax_p={{{1,-1},{15,-2},{20,-12},{21,-12}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		--meleedamagereturn_p={{{1,-4},{15,-16},{20,-20},{21,-20}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		rangedamagereturn_p={{{1,-4},{15,-25},{20,-30},{21,-30}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点，求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

------------------------------------------------------
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

