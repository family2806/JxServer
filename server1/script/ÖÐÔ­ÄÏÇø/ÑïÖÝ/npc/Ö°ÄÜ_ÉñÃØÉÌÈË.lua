-- ���ݡ�ְ�ܡ���������
-- By Li_Xin (2004-08-17)
-- By Ren Bin (2004-12-15) ����ǧ��ٹֶ�����Ļ���



Include("\\script\\global\\shenmi_chapman.lua") 
Include( "\\script\\global\\mask_ani.lua" )
Include( "\\script\\global\\weapon_ring.lua" )
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 


function main()
	str=
	{
		"<#> �Ҵ�����������ԭ�ռ�ˮ������Ԫ������Ʊ������ʱ�ñ��ﻻȡ��Щ��Ʒ���͹���ʲô������?",
		"<#> ��������ͼ�� /get1",
		"<#> �������챦/get2",
--		"<#>�μ�ǧ��ٹֶ�����/hello",
--		"<#>����ʥ���������/chr_buy",
--		"<#>��������ָ/weapon_ring",
		"<#> ���ȿ���!/no",
		"<#>���뻻����/BaiBaoXiang_Give_UI"
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	Say(str[1],4,str[5],str[2],str[3],str[4])
	
end;

function chr_buy()

	Say("ʥ���ڣ���������������㣬��<color=red>ʥ������<color> �� <color=red>��ʹ����<color>. �����������һ���� <color=red>399 ����<color>, ����һ����ֻ��Ҫ <color=red>688����<color>. ����ԥʲô�� ",4,"��ʥ��������� (399 ��) /mask","����ʹ����(399 ��) /mask","��2��(688 ��) /mask_all","��������/no")

end

function mask_all()

	on_Pay = 6880000
	if ( GetCash() >= on_Pay ) then
		Pay( on_Pay )
		AddItem(0,11,70,0,0,0,0)
		AddItem(0,11,71,0,0,0,0)
		Msg2Player("����һ����� ")
	else
		Say("���Ǵ�Ǯ����û�£���������㡣�ǵ�������",1,"�õ�!/no")
	end
end


function mask(msel)

	on_Pay = 3990000
	if ( GetCash() >= on_Pay ) then
		Pay( on_Pay )
		if ( msel == 0 ) then
			AddItem(0,11,70,0,0,0,0)
			Msg2Player("����1��ʥ���������")
		else
			AddItem(0,11,71,0,0,0,0)
			Msg2Player("����1����ʹ�������")
		end
	else
		Say("���Ǵ�Ǯ����û�£���������㡣�ǵ�������",1,"�õ�!/no")
	end

end

function no()

end