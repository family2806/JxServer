Include("\\script\\event\\teacher_day_200711\\head.lua");
Include("\\script\\lib\\compose.lua");
function composeCard_TeacherDay200711 ()
	--{Material, Award, Result_su, Result_er, Result_fa}
	--Material = {nAmount, tbProp, [strName]}
	--Award = {type, detail, amount}
	if ( GetLevel() < 50 ) then
		Say("�Բ�����Ҫ <color=yellow>50������<color> ���ܺϳɼҴ���!",0)
		return 0;
	end
	local tbMaterial = 
	{
		{1, {6,1,1599,nil,nil,nil}, "��"},
		{1, {6,1,1600,nil,nil,nil}, "ʦ"},
		{1, {6,1,1601,nil,nil,nil}, "��"},
		{1, {6,1,1602,nil,nil,nil}, "��"},
		{15, {6,0,20,nil,nil,nil}, "õ�廨��"},
	}
	local tbAward = {1,{6,1,1603,1,0,0},1}
	local tb_compose ={tbMaterial, tbAward, "�ϳ��ֳɹ�","ԭ�ϲ���","�ϳ���ʧ��"}
	material_compose(tb_compose, "�ϳ��ֻ")
end