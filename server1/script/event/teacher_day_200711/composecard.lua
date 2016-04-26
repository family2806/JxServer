Include("\\script\\event\\teacher_day_200711\\head.lua");
Include("\\script\\lib\\compose.lua");
function composeCard_TeacherDay200711 ()
	--{Material, Award, Result_su, Result_er, Result_fa}
	--Material = {nAmount, tbProp, [strName]}
	--Award = {type, detail, amount}
	if ( GetLevel() < 50 ) then
		Say("对不起，需要 <color=yellow>50级以上<color> 才能合成家传书!",0)
		return 0;
	end
	local tbMaterial = 
	{
		{1, {6,1,1599,nil,nil,nil}, "尊"},
		{1, {6,1,1600,nil,nil,nil}, "师"},
		{1, {6,1,1601,nil,nil,nil}, "重"},
		{1, {6,1,1602,nil,nil,nil}, "道"},
		{15, {6,0,20,nil,nil,nil}, "玫瑰花雨"},
	}
	local tbAward = {1,{6,1,1603,1,0,0},1}
	local tb_compose ={tbMaterial, tbAward, "合成字成功","原料不对","合成字失败"}
	material_compose(tb_compose, "合成字活动")
end