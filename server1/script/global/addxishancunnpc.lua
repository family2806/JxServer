-- 西山村npc加载脚本
-- 李欣 2005-01-26

xishancunnpc = {
{306,1,4,175,1641,3191,0,"不醒人士",0,"\\script\\江南区\\西山村\\npc\\npc_buxingrenshi.lua"},
{242,1,4,175,1716,3124,0,"西山小二",0,"\\script\\江南区\\西山村\\npc\\npc_xishanxiaoer.lua"},
{750,1,4,175,1624,3138,0,"月亮兔",0,"\\script\\江南区\\西山村\\npc\\npc_yueliangtu.lua"},
{749,1,4,175,1623,3139,0,"琦琦",0,"\\script\\江南区\\西山村\\npc\\npc_tuziqiqi.lua"},
{307,1,4,175,1620,3149,0,"钓尽天下孤独客",0,"\\script\\江南区\\西山村\\npc\\npc_diaosou.lua"},
{77,1,4,175,1701,3190,0,"边城浪子",0,"\\script\\江南区\\西山村\\npc\\npc_bianchenglangzi.lua"},
{662,1,4,175,1698,3205,0,"教练陈路生",0,"\\script\\江南区\\西山村\\npc\\npc_jiaolian.lua"},
{181,1,4,175,1697,3110,0,"尾指琴魔",0,"\\script\\江南区\\西山村\\npc\\npc_weizhiqinmo.lua"},
{135,1,4,175,1657,3208,0,"不是我是风",0,"\\script\\江南区\\西山村\\npc\\npc_bushiwoshifeng.lua"},
{133,1,4,175,1665,3214,0,"水晶苹果",0,"\\script\\江南区\\西山村\\npc\\npc_pingguo.lua"},
}

function add_xishancunnpc(Tab2)
	for i = 1 , getn(Tab2) do
		Mid = SubWorldID2Idx(Tab2[i][4]);
		if (Mid >= 0 ) then
			TabValue5 = Tab2[i][5] * 32
			TabValue6 = Tab2[i][6] * 32
			newtasknpcindex = AddNpcEx(Tab2[i][1],Tab2[i][2],Tab2[i][3],Mid,TabValue5,TabValue6,Tab2[i][7],Tab2[i][8],Tab2[i][9]);
			SetNpcScript(newtasknpcindex, Tab2[i][10]);
		end;
	end;
end;