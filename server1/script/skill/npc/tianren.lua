
--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--天忍
	canyang_ruxue={ --残阳如血
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,5},{20,55}}},
		firedamage_v={
			[1]={{1,5},{20,50}},
			[3]={{1,5},{20,50}}
		},
		addskilldamage1={
			[1]={{1,361},{2,361}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage2={
			[1]={{1,142},{2,142}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,8},{20,8}}}
	},
	tianren_daofa={ --天忍刀法
		addfiremagic_v={{{1,15},{20,215}},{{1,-1},{2,-1}}}
	},
	tianren_maofa={ --天忍矛法
		addphysicsdamage_p={{{1,15},{20,215}},{{1,-1},{2,-1}},{{1,3},{2,3}}},
		attackratingenhance_p={{{1,35},{20,272}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,35}},{{1,-1},{2,-1}}}
	},
	huolian_fenhua={ --火莲焚华
		meleedamagereturn_p={{{1,-5},{20,-35}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,12},{20,12}}}
	},
	huanying_feihu={ --幻影飞狐
		attackratingenhance_p={{{1,-15},{20,-132}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	tuishan_tianhai={ --推山填海
		seriesdamage_p={{{1,5},{20,30}}},
		firedamage_v={
			[1]={{1,5},{20,45}},
			[3]={{1,5},{20,45}}
		},
		addskilldamage1={
			[1]={{1,362},{2,362}},
			[3]={{1,1},{20,115}}
		},
		skill_cost_v={{{1,32},{20,50}}}
	},
	feihong_wuji={ --飞鸿无迹
		adddefense_v={{{1,-150},{20,-1100}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	liehuo_qingtian={ --烈火情天
		seriesdamage_p={{{1,5},{20,30}}},
		physicsenhance_p={{{1,15},{20,75}}},
		firedamage_v={
			[1]={{1,8},{20,150}},
			[3]={{1,8},{20,150}}
		},
		addskilldamage1={
			[1]={{1,361},{2,361}},
			[3]={{1,1},{20,55}}
		},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	toutian_huanri={ --偷天换日
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,25},{20,231}}},
		deadlystrike_p={{{1,4},{20,55}}},
		firedamage_v={
			[1]={{1,10},{20,482}},
			[3]={{1,10},{20,482}}
		},
		addskilldamage1={
			[1]={{1,361},{2,361}},
			[3]={{1,1},{20,65}}
		},
		steallife_p={{{1,1},{20,8}}},
		stealmana_p={{{1,1},{20,6}}},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{2,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,12},{20,20}}}
	},
	limo_duopo={ --厉魔夺魄
		addphysicsdamage_p={{{1,-25},{20,-215}},{{1,18*40},{20,18*120}},{{1,6},{20,6}}},
		skill_cost_v={{{1,30},{20,30}}}
	},
	tanzhi_lieyan={ --弹指烈焰
		firedamage_v={
			[1]={{1,30},{20,225}},
			[3]={{1,30},{20,225}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,362},{2,362}},
			[3]={{1,1},{20,100}}
		},
		addskilldamage2={
			[1]={{1,148},{2,148}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,20},{20,30}}}
	},
	wuxing_zhen={ --五行阵
		adddefense_v={{{1,75},{20,550}},{{1,18},{20,18}}},
	},
	moyan_qisha={ --魔炎七杀
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		firedamage_v={
			[1]={{1,35},{20,637}},
			[3]={{1,35},{20,637}}
		},
		addskilldamage1={
			[1]={{1,363},{2,363}},
			[3]={{1,1},{20,87}}
		},
		fatallystrike_p={{{1,12},{20,50}}},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,20},{20,30}}}
	},
	tianmo_jieti={ --天魔解体
		adddefense_v={{{1,75},{30,850}},{{1,18*120},{30,18*360}}},
		attackratingenhance_p={{{1,65},{30,500}},{{1,18*120},{30,18*360}}},
		fasthitrecover_v={{{1,5},{20,40}},{{1,18*120},{20,18*360}}},
		addfiremagic_v={{{1,20},{30,315}},{{1,18*120},{30,18*360}}},
		addfiredamage_v={{{1,20},{30,315}},{{1,18*120},{30,18*360}}},
		fireenhance_p={{{1,31},{30,100}},{{1,18*120},{30,18*360}}},
--		lifemax_p={{{1,-11},{20,-30},{30,-20},{40,10},{41,10}},{{1,18*45},{30,18*180}}},
		attackspeed_v={{{1,26},{30,102},{33,109},{35,134},{38,138},{41,145},{42,163},{43,165}},{{1,18*120},{30,18*360}}},
		castspeed_v={{{1,26},{30,81},{33,86},{35,101},{36,103}},{{1,18*120},{30,18*360}}},
		skill_cost_v={{{1,100},{20,100}}}
	},
	beisu_qingfeng={ --悲酥清风
		fasthitrecover_v={{{1,-6},{20,-30},{23,-34},{28,-34},{29,-35}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	yunlong_ji={ --云龙击
		physicsenhance_p={{{1,45},{20,445}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		deadlystrike_p={{{1,4},{20,65}}},
		firedamage_v={
			[1]={{1,6},{15,100},{20,378}},
			[3]={{1,6},{15,100},{20,378}}
		},
		steallife_p={{{1,1},{20,16}}},
		stealmana_p={{{1,1},{20,16}}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{2,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,30},{20,30}}},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[3]={{1,378},{20,378}}
--		},
--		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(11600,1.15,1,1,1)},
							{2,SkillExpFunc(11600,1.15,2,1,1)},
							{3,SkillExpFunc(11600,1.16,3,1,1)},
							{4,SkillExpFunc(11600,1.17,4,1,1)},
							{5,SkillExpFunc(11600,1.18,5,1,1)},
							{6,SkillExpFunc(11600,1.19,6,1,1)},
							{7,SkillExpFunc(11600,1.20,7,1,1)},
							{8,SkillExpFunc(11600,1.21,8,1,1)},
							{9,SkillExpFunc(11600,1.22,9,1,1)},
							{10,SkillExpFunc(11600,1.23,10,1,1)},
							{11,SkillExpFunc(11600,1.24,11,1,1)},
							{12,SkillExpFunc(11600,1.23,12,1,1)},
							{13,SkillExpFunc(11600,1.22,13,1,1)},
							{14,SkillExpFunc(11600,1.21,14,1,1)},
							{15,SkillExpFunc(11600,1.20,15,1,1)},
							{16,SkillExpFunc(11600,1.19,16,1,1)},
							{17,SkillExpFunc(11600,1.18,17,1,1)},
							{18,SkillExpFunc(11600,1.17,18,1,1)},
							{19,SkillExpFunc(11600,1.16,19,1,1)},
							{20,SkillExpFunc(11600,1.15,20,1,1)},
							}},
	},
	fenghuo_liantian={ --烽火连天
		seriesdamage_p={{{1,20},{20,60}}},
		firedamage_v={
			[1]={{1,5},{20,40}},
			[3]={{1,5},{20,40}}
		},
	},
	tianwai_liuxing={ --天外流星
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		firedamage_v={
			[1]={{1,11},{15,200},{20,462}},
			[3]={{1,11},{15,200},{20,462}}
		},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		skill_cost_v={{{1,20},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,363},{20,363}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(4085,1.15,1,3,1)},
							{2,SkillExpFunc(4085,1.15,2,3,1)},
							{3,SkillExpFunc(4085,1.16,3,3,1)},
							{4,SkillExpFunc(4085,1.17,4,3,1)},
							{5,SkillExpFunc(4085,1.18,5,3,1)},
							{6,SkillExpFunc(4085,1.19,6,3,1)},
							{7,SkillExpFunc(4085,1.20,7,3,1)},
							{8,SkillExpFunc(4085,1.21,8,3,1)},
							{9,SkillExpFunc(4085,1.22,9,3,1)},
							{10,SkillExpFunc(4085,1.23,10,3,1)},
							{11,SkillExpFunc(4085,1.24,11,3,1)},
							{12,SkillExpFunc(4085,1.23,12,3,1)},
							{13,SkillExpFunc(4085,1.22,13,3,1)},
							{14,SkillExpFunc(4085,1.21,14,3,1)},
							{15,SkillExpFunc(4085,1.20,15,3,1)},
							{16,SkillExpFunc(4085,1.19,16,3,1)},
							{17,SkillExpFunc(4085,1.18,17,3,1)},
							{18,SkillExpFunc(4085,1.17,18,3,1)},
							{19,SkillExpFunc(4085,1.16,19,3,1)},
							{20,SkillExpFunc(4085,1.15,20,3,1)},
						}},
	},
	boss_tianwai={ --天外流星boss专用
		fatallystrike_p={{{1,12},{20,100}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		firedamage_v={
			[1]={{1,11},{15,200},{20,462}},
			[3]={{1,11},{15,200},{20,462}}
		},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		skill_cost_v={{{1,20},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,363},{20,363}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(4085,1.15,1,3,1)},
							{2,SkillExpFunc(4085,1.15,2,3,1)},
							{3,SkillExpFunc(4085,1.16,3,3,1)},
							{4,SkillExpFunc(4085,1.17,4,3,1)},
							{5,SkillExpFunc(4085,1.18,5,3,1)},
							{6,SkillExpFunc(4085,1.19,6,3,1)},
							{7,SkillExpFunc(4085,1.20,7,3,1)},
							{8,SkillExpFunc(4085,1.21,8,3,1)},
							{9,SkillExpFunc(4085,1.22,9,3,1)},
							{10,SkillExpFunc(4085,1.23,10,3,1)},
							{11,SkillExpFunc(4085,1.24,11,3,1)},
							{12,SkillExpFunc(4085,1.23,12,3,1)},
							{13,SkillExpFunc(4085,1.22,13,3,1)},
							{14,SkillExpFunc(4085,1.21,14,3,1)},
							{15,SkillExpFunc(4085,1.20,15,3,1)},
							{16,SkillExpFunc(4085,1.19,16,3,1)},
							{17,SkillExpFunc(4085,1.18,17,3,1)},
							{18,SkillExpFunc(4085,1.17,18,3,1)},
							{19,SkillExpFunc(4085,1.16,19,3,1)},
							{20,SkillExpFunc(4085,1.15,20,3,1)},
						}},
	},
	yehuo_fencheng={ --业火焚城
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		firedamage_v={
			[1]={{1,21},{20,320}},
			[3]={{1,21},{20,320}}
		},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{15,0},{15,1},{20,1}},
--			[3]={{1,379},{20,379}}
--		},
--		skill_showevent={{{1,0},{15,0},{15,1},{20,1}}},
	},
--	moyan_zaitian={ --魔炎在天
--		seriesdamage_p={{{1,20},{20,60}}},
--		firedamage_v={
--			[1]={{1,10},{20,80}},
--			[3]={{1,10},{20,80}}
--		},
--	},
	shehun_luanxin={ --摄魂乱心
		attackratingenhance_p={{{1,-12},{20,-128}},{{1,18*40},{20,18*120}}},
		adddefense_v={{{1,-80},{20,-800}},{{1,18*40},{20,18*120}}},
		addphysicsdamage_p={{{1,-15},{20,-215}},{{1,18*40},{20,18*120}},{{1,6},{20,6}}},
		fasthitrecover_v={{{1,-6},{20,-30}},{{1,18*40},{20,18*120}}},
		lifereplenish_v={{{1,-1},{20,-15}},{{1,18*40},{20,18*120}}},
		deadlystrikeenhance_p={{{1,-6},{20,-35}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,60},{20,120}}},
	},
	tianren120={ --天忍120级技能
		skill_cost_v={{{1,25},{20,80},{21,80}}},
		skill_mintimepercastonhorse_v={{{1,45*18},{15,25*18},{20,20*18},{21,20*18}}},
		skill_mintimepercast_v={{{1,45*18},{15,25*18},{20,20*18},{21,20*18}}},
		autodeathskill={{{1,723*256 + 41},{20,723*256 + 60},{21,723*256 + 60}},{{1,-1},{20,-1}},{{1,100},{2,100}}},
		--randmove={{{1,1},{20,1}},{{1,1*18},{20,5*18},{21,93}}},
		--missle_missrate={{{1,65},{15,20},{20,15},{21,14}}},
		skill_desc=
			function(level)
				return "冷却时间：<color=orange>"..floor(Link(level,SKILLS.tianren120.skill_mintimepercast_v[1]) / 18).."秒<color>\n"..
				"骑马施展冷却时间：<color=orange>"..floor(Link(level,SKILLS.tianren120.skill_mintimepercastonhorse_v[1]) / 18).."秒<color>\n"..
				"以<color=orange>"..floor(100 -Link(level,SKILLS.quntisuijizoudong.missle_missrate[1])).."%<color>的概率使自身一定范围内最多"..
				floor(Link(level,SKILLS.quntisuijizoudong.missle_hitcount[1])).."个敌人恐惧<color=orange>"..
				floor(Link(level,SKILLS.quntisuijizoudong.randmove[2]) / 18).."秒<color>\n"..
				"死亡后有<color=orange>"..floor(Link(level,SKILLS.tianren120.autodeathskill[3])).."%<color>的概率使自身一定范围内最多"..
				floor(Link(level,SKILLS.quntisuijizoudong.missle_hitcount[1])).."个敌人恐惧<color=orange>"..
				floor(Link(level,SKILLS.quntisuijizoudong.randmove[2]) / 18).."秒<color>\n"..
				"恐惧导致随机走动及攻击操作无效\n"
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
	quntisuijizoudong={ --群体随机走动
		randmove={{{1,1},{20,1}},{{1,1*18},{15,3*18},{20,4*18},{21,4*18},{40,4*18},{41,1*18},{55,3*18},{60,4*18},{61,4*18}}},
		missle_missrate={{{1,65},{15,20},{20,15},{21,15},{40,15},{41,0},{60,0}}},
		missle_hitcount={{{1,6},{20,6}}},
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

