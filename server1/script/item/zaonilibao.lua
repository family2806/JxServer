--剑网三周年活动
--枣泥寿桃
--使用后获得8小时打怪经验双倍，不可与仙草露叠加
--限 80级及以上 并 冲值玩家使用

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>食用枣泥寿桃，可获得<color=red>8<color>小时经验双倍，但是不可与仙草露叠加。",
		"<#>食用枣泥寿桃/#_UseZaoNiShoutao("..nItemIndex..")",
		"<#>我再考虑考虑/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseZaoNiShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if RemoveItemByIndex(nItemIndex) == 1 then
		AddSkillState(440, 1, 1, 64800 * 8);
		Msg2Player("你食用了一个枣泥寿桃，获得8小时打怪经验双倍效果。")
	end;
end;

function OnCancel()
end;