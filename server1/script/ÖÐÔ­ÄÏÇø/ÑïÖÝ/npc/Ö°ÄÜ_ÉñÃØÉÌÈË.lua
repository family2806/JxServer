-- 扬州　职能　神秘商人
-- By Li_Xin (2004-08-17)
-- By Ren Bin (2004-12-15) 增加千奇百怪动物秀的活动入口



Include("\\script\\global\\shenmi_chapman.lua") 
Include( "\\script\\global\\mask_ani.lua" )
Include( "\\script\\global\\weapon_ring.lua" )
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 


function main()
	str=
	{
		"<#> 我从西域来到中原收集水晶，金元宝和银票。我随时用宝物换取这些物品。客官有什么换的吗?",
		"<#> 交换武器图谱 /get1",
		"<#> 买奇珍异宝/get2",
--		"<#>参加千奇百怪动物秀活动/hello",
--		"<#>购买圣诞节日面具/chr_buy",
--		"<#>武器换戒指/weapon_ring",
		"<#> 我先看看!/no",
		"<#>我想换宝箱/BaiBaoXiang_Give_UI"
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	Say(str[1],4,str[5],str[2],str[3],str[4])
	
end;

function chr_buy()

	Say("圣诞节，我有两个宝物给你，是<color=red>圣诞老人<color> 和 <color=red>天使降生<color>. 如果单买其中一个是 <color=red>399 万两<color>, 两个一起买只需要 <color=red>688万两<color>. 还犹豫什么？ ",4,"买圣诞老人面具 (399 万) /mask","买天使降生(399 万) /mask","买2个(688 万) /mask_all","让我想想/no")

end

function mask_all()

	on_Pay = 6880000
	if ( GetCash() >= on_Pay ) then
		Pay( on_Pay )
		AddItem(0,11,70,0,0,0,0)
		AddItem(0,11,71,0,0,0,0)
		Msg2Player("你获得一个面具 ")
	else
		Say("忘记带钱啊？没事，我在这等你。记得早点回来",1,"好的!/no")
	end
end


function mask(msel)

	on_Pay = 3990000
	if ( GetCash() >= on_Pay ) then
		Pay( on_Pay )
		if ( msel == 0 ) then
			AddItem(0,11,70,0,0,0,0)
			Msg2Player("你获得1个圣诞老人面具")
		else
			AddItem(0,11,71,0,0,0,0)
			Msg2Player("你获得1个天使降生面具")
		end
	else
		Say("忘记带钱啊？没事，我在这等你。记得早点回来",1,"好的!/no")
	end

end

function no()

end