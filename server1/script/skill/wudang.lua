--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end

SKILLS={
	--武当
	nulei_zhi={ --怒雷指
		lightingdamage_v={
			[1]={{1,1},{20,5}},
			[3]={{1,1},{20,75}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,365},{2,365}},
			[3]={{1,1},{20,110}}
		},
		addskilldamage2={
			[1]={{1,165},{2,165}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1078},{2,1078}},
			[3]={{1,1},{20,92}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,15},{20,20}}}
	},
	wudang_jianfa ={ --武当剑法
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,0},{2,0}}},
		attackratingenhance_p={{{1,15},{20,72}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,25,Conic}},{{1,-1},{2,-1}}}
	},
	wudang_quanfa={ --武当拳法
		manashield_p={{{1,-5},{15,-15},{19,-20},{20,-25},{21,-25}},{{1,-1},{20,-1}}},
		addlightingmagic_v={{{1,20},{15,250},{20,915},{25,1115},{26,1248}},{{1,-1},{2,-1}}}
	},
	canghai_mingyue={ --沧海明月
		physicsenhance_p={{{1,5},{20,75}}},
		seriesdamage_p={{{1,1},{20,10}}},
		lightingdamage_v={
			[1]={{1,6},{20,12}},
			[3]={{1,6},{20,115}}
		},
		addskilldamage1={
			[1]={{1,368},{2,368}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,267},{2,267}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1079},{2,1079}},
			[3]={{1,1},{20,52}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,10},{20,15}}}
	},
	zuowang_wuwo={ --坐望无我
		manashield_p={{{1,25},{5,75},{20,99},{21,100},{22,100}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,60},{20,160}}}
	},
	jianfei_jingtian={ --剑飞惊天
		seriesdamage_p={{{1,5},{20,30}}},
		physicsenhance_p={{{1,20},{20,115}}},
		lightingdamage_v={
			[1]={{1,10},{20,24}},
			[3]={{1,10},{20,225}}
		},
		addskilldamage1={
			[1]={{1,162},{2,162}},
			[3]={{1,3},{20,268}}
		},
		addskilldamage2={
			[1]={{1,1107},{2,1107}},
			[3]={{1,1},{20,220}}
		},
		skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,10},{20,25}}}
	},
	qingxing_zhen={ --七星阵
		attackratingenhance_p={{{1,24},{20,500}},{{1,18},{2,18}}},
		adddefense_v={{{1,97},{20,800}},{{1,18},{20,18}}},
	},
	tiyun_zong={ --梯云纵
		fastwalkrun_p={{{1,18},{20,60}},{{1,-1},{20,-1}}},
	},
	boji_erfu={ --剥及而复
		seriesdamage_p={{{1,5},{20,30}}},
		lightingdamage_v={
			[1]={{1,5},{20,8}},
			[3]={{1,5},{20,175}}
		},
		stun_p={{{1,20},{20,55}},{{1,1},{20,20}}},
		addskilldamage1={
			[1]={{1,365},{2,365}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1078},{2,1078}},
			[3]={{1,1},{20,100}}
		},
		skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,60},{20,70}}}
	},
	wuwo_wujian={ --无我无剑
		lightingdamage_v={
			[1]={{1,1},{20,5}},
			[3]={{1,5},{20,752}}
		},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		addskilldamage1={
			[1]={{1,365},{2,365}},
			[3]={{1,3},{20,130}}
		},
		addskilldamage2={
			[1]={{1,1078},{2,1078}},
			[3]={{1,1},{20,108}}
		},
		stun_p={{{1,5},{20,20}},{{1,1},{20,10},{21,10}}},
		skill_misslenum_v={{{1,1},{20,8},{21,8}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,70},{20,130}}}
	},
	taiji_shengong={ --太极神功
		attackspeed_v={{{1,21},{30,65},{33,69},{35,90},{38,94},{41,98}},{{1,-1},{30,-1}}},
		castspeed_v={{{1,21},{30,65},{33,69},{35,81},{41,90},{44,94}},{{1,-1},{30,-1}}},
		addlightingdamage_v={{{1,20},{20,275}},{{1,-1},{2,-1}}},
		manamax_p={{{1,35},{30,245}},{{1,-1},{2,-1}}},
		manareplenish_v={{{1,1},{30,12}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,5},{30,25}},{{1,-1},{2,-1}}},
		lightingenhance_p={{{1,16},{30,100},{33,108},{38,108},{41,116}},{{1,-1},{2,-1}}},
		manamax_yan_p={{{1,35},{35,200},{36,200}},{{1,-1},{2,-1}}},
	},
	sanhuan_taoyue={ --三环套月
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,20},{20,231}}},
		attackrating_p={{{1,65},{20,345}}},
		stealmana_p={{{1,1},{20,5}}},
		deadlystrike_p={{{1,16},{20,25}}},
		stun_p={{{1,1},{20,10}},{{1,1},{20,10},{21,10}}},
		lightingdamage_v={
			[1]={{1,6},{20,20}},
			[3]={{1,6},{20,386}}
		},
		addskilldamage1={
			[1]={{1,368},{2,368}},
			[3]={{1,1},{20,125}}
		},
		addskilldamage2={
			[1]={{1,1079},{2,1079}},
			[3]={{1,1},{20,105}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,15},{20,40}}}
	},
	tiandi_wuji={ --天地无极
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,5},{20,8}},
			[3]={{1,5},{15,150},{20,350}}
		},
		addskilldamage1={
			[1]={{1,1078},{2,1078}},
			[3]={{1,1},{20,60}}
		},
		skill_attackradius={{{1,448},{20,512},{20,512}}},
		missle_lifetime_v={{{1,8},{20,20},{21,20}}},
		stun_p={{{1,10},{20,20},{25,30},{26,30}},{{1,1},{20,6},{21,6}}},
		skill_cost_v={{{1,60},{20,150}}},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_flyevent={
--			[1]={{1,0},{5,0},{5,1},{20,1}},
--			[3]={{1,367},{20,367}}
--		},
--		skill_showevent={{{1,0},{5,0},{5,2},{20,2}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5880,1.15,1,5,1)},
							{2,SkillExpFunc(5880,1.15,2,5,1)},
							{3,SkillExpFunc(5880,1.16,3,5,1)},
							{4,SkillExpFunc(5880,1.17,4,5,1)},
							{5,SkillExpFunc(5880,1.18,5,5,1)},
							{6,SkillExpFunc(5880,1.19,6,5,1)},
							{7,SkillExpFunc(5880,1.20,7,5,1)},
							{8,SkillExpFunc(5880,1.21,8,5,1)},
							{9,SkillExpFunc(5880,1.22,9,5,1)},
							{10,SkillExpFunc(5880,1.23,10,5,1)},
							{11,SkillExpFunc(5880,1.24,11,5,1)},
							{12,SkillExpFunc(5880,1.23,12,5,1)},
							{13,SkillExpFunc(5880,1.22,13,5,1)},
							{14,SkillExpFunc(5880,1.21,14,5,1)},
							{15,SkillExpFunc(5880,1.20,15,5,1)},
							{16,SkillExpFunc(5880,1.19,16,5,1)},
							{17,SkillExpFunc(5880,1.18,17,5,1)},
							{18,SkillExpFunc(5880,1.17,18,5,1)},
							{19,SkillExpFunc(8000,1.16,19,5,1)},
							{20,SkillExpFunc(8000,1.15,20,5,1)},
							}},
	},
	qiwudang150={ --气武当150
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		lightingdamage_v={
			[1]={{1,6},{20,10},{23,11}},
			[3]={{1,6},{15,180},{20,420},{23,708},{26,852}}
		},
		skill_attackradius={{{1,448},{20,512},{20,512}}},
		missle_lifetime_v={{{1,20},{20,30},{21,30}}},
		stun_p={{{1,10},{20,30},{23,36},{26,36}},{{1,1},{20,6},{21,6}}},
		skill_cost_v={{{1,72},{20,180},{23,214},{26,231}}},
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
	jianqi_zongheng={ --剑气纵横
		seriesdamage_p={{{1,20},{20,60}}},
		lightingdamage_v={
			[1]={{1,12},{20,60}},
			[3]={{1,58},{20,610}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,366},{20,366}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
	},
	taiji_wuyi={ --太极无意
		seriesdamage_p={{{1,20},{20,60}}},
		stun_p={{{1,10},{20,20}},{{1,1},{20,10}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{15,0},{15,1},{20,1}},
			[3]={{1,377},{20,377}}
		},
		skill_showevent={{{1,0},{15,0},{15,8},{20,8}}},
	},
	nulei_lianhuanji={ --怒雷连环击
		seriesdamage_p={{{1,20},{20,60}}},
		lightingdamage_v={
			[1]={{1,12},{20,60}},
			[3]={{1,58},{20,610}}
		},
	},
	renjian_heyi={ --人剑合一
		physicsenhance_p={{{1,8},{15,80},{20,194}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,12},{20,35}},
			[3]={{1,12},{15,100},{20,268}}
		},
		attackrating_p={{{1,65},{20,345}}},
		stealmana_p={{{1,1},{20,5}}},
		deadlystrike_p={{{1,16},{20,25}}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,35},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{15,0},{15,1},{20,1}},
			[3]={{1,162},{20,162}}
		},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,371},{20,371}}
		},
		addskilldamage1={
			[1]={{1,1079},{2,1079}},
			[3]={{1,1},{20,35}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{15,1},{15,5},{20,5}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(7200,1.15,1,3,1)},
							{2,SkillExpFunc(7200,1.15,2,3,1)},
							{3,SkillExpFunc(7200,1.16,3,3,1)},
							{4,SkillExpFunc(7200,1.17,4,3,1)},
							{5,SkillExpFunc(7200,1.18,5,3,1)},
							{6,SkillExpFunc(7200,1.19,6,3,1)},
							{7,SkillExpFunc(7200,1.20,7,3,1)},
							{8,SkillExpFunc(7200,1.21,8,3,1)},
							{9,SkillExpFunc(7200,1.22,9,3,1)},
							{10,SkillExpFunc(7200,1.23,10,3,1)},
							{11,SkillExpFunc(7200,1.24,11,3,1)},
							{12,SkillExpFunc(7200,1.23,12,3,1)},
							{13,SkillExpFunc(7200,1.22,13,3,1)},
							{14,SkillExpFunc(7200,1.21,14,3,1)},
							{15,SkillExpFunc(7200,1.20,15,3,1)},
							{16,SkillExpFunc(7200,1.19,16,3,1)},
							{17,SkillExpFunc(7200,1.18,17,3,1)},
							{18,SkillExpFunc(7200,1.17,18,3,1)},
							{19,SkillExpFunc(7200,1.16,19,3,1)},
							{20,SkillExpFunc(7200,1.15,20,3,1)},
							}},
	},
	jianwudang150={ --剑武当150
		physicsenhance_p={{{1,12},{15,115},{20,280},{23,478},{26,577}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		lightingdamage_v={
			[1]={{1,15},{20,42},{23,50},{26,54}},
			[3]={{1,15},{15,120},{20,321},{23,562},{26,682}}
		},
		attackrating_p={{{1,78},{20,415},{23,521},{26,574}}},
		stealmana_p={{{1,1},{20,5},{23,6}}},
		deadlystrike_p={{{1,20},{20,30},{23,33},{26,34}}},
		missle_speed_v={{{1,0},{20,0}}},
		missle_lifetime_v={{{1,9},{20,9}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,40},{20,72},{23,82},{26,87}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{15,0},{15,1},{20,1}},
			[3]={{1,1105},{20,1105}}
		},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1107},{20,1107}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{15,1},{15,5},{20,5}}},
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
	xuanyi_wuxiang={ --玄一无象
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,1},{20,10}},
			[3]={{1,10},{20,100}}
		},
	},
	jianwudang150_2={ --剑武当150第2式
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		stun_p={{{1,1},{20,24},{23,31},{26,34}},{{1,1},{19,9},{20,10}}},
		lightingdamage_v={
			[1]={{1,1},{20,12},{23,15}},
			[3]={{1,12},{20,120},{23,154},{26,171}}
		},
	},
	taiji_jianyi={ --太极剑意
		stun_p={{{1,1},{20,20}},{{1,1},{19,9},{20,10}}},
--		seriesdamage_p={{{1,20},{20,60}}},
--		physicsenhance_p={{{1,15},{20,180}}},
	},	
	jianwudang150_3={ --剑武当150第3式
		stun_p={{{1,1},{20,24},{23,31},{26,34}},{{1,1},{19,9},{20,10}}},
		lightingdamage_v={
			[1]={{1,20},{20,60},{23,72},{26,78}},
			[3]={{1,60},{15,180},{20,400},{23,664},{26,796}}
		},
		physicsenhance_p={{{1,12},{15,115},{20,280},{23,478},{26,577}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		stealmana_p={{{1,1},{20,5},{23,6}}},
		deadlystrike_p={{{1,20},{20,30},{23,33},{26,34}}},
--		seriesdamage_p={{{1,20},{20,60}}},
--		physicsenhance_p={{{1,15},{20,180}}},
	},
	wudang120={ --武当120级技能
		skill_cost_v={{{1,15},{20,50},{21,50}}},
		--clearnegativestate={{{1,15},{15,75},{20,85},{21,85}}},
		missle_missrate={{{1,85},{15,25},{20,15},{21,15}}},
		ignorenegativestate_p={
			{{1,1},{15,1},{20,1},{21,1}},
			{{1,18},{20,18},{21,18}},
		},
		skill_mintimepercastonhorse_v={{{1,35*18},{15,18*18},{20,15*18},{21,15*18}}},
		skill_mintimepercast_v={{{1,35*18},{15,18*18},{20,15*18},{21,15*18}}},
		skill_desc=
			function(level)
				return "冷却时间：<color=orange>"..floor(Link(level,SKILLS.wudang120.skill_mintimepercast_v[1]) / 18).."秒<color>\n"..
				"骑马施展冷却时间：<color=orange>"..floor(Link(level,SKILLS.wudang120.skill_mintimepercastonhorse_v[1]) / 18).."秒<color>\n" ..
				"有<color=orange>"..floor(100 - Link(level,SKILLS.wudang120.missle_missrate[1])).."%<color>的概率<color>清除周围一定范围内友方玩家的异常状态\n"..
				"有<color=orange>"..floor(100 - Link(level,SKILLS.wudang120_child.missle_missrate[1])).."%<color>的概率<color>使自身对各种负面状态和技能免疫，持续<color=orange>"..
				floor(Link(level,SKILLS.wudang120_child.ignorenegativestate_p[2]) / 18).."秒<color>\n"
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
	wudang120_child={ --武当120级技能子技能
		missle_missrate={{{1,85},{15,20},{20,15},{21,15}}},
		ignorenegativestate_p={
			{{1,100},{15,100},{20,100},{21,100}},
			{{1,1*18},{20,3*18},{21,3*18}},
		},
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
