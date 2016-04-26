--剑网三周年活动
--豆沙寿桃
--使用后获得300w经验
--最多可获得1亿
--限 80级及以上 并 冲值玩家使用

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>食用一个豆沙寿桃，可获得<color=red>"..tostring(JXANNIVERSARY3_ONCEEXP).."<color>的经验，但是通过食用豆沙寿桃得到经验的上限是<color=red>"..tostring(JXANNIVERSARY3_MAXOWNEXP).."<color>，多食者无效。",
		"<#>使用豆沙寿桃/#_UseDoushaShoutao("..nItemIndex..")",
		"<#>我再考虑考虑/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseDoushaShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if (GetTask(TASKID_DOUSHASHOUTAO_EXP) >= JXANNIVERSARY3_MAXOWNEXP) then 
		Msg2Player("你已经使用了太多的豆沙寿桃，不能再通过使用豆沙寿桃提升经验。");
		return
	end 
	
	if (RemoveItemByIndex(nItemIndex) == 1 ) then
		local nAddExp = 0;
		if ( (GetTask(TASKID_DOUSHASHOUTAO_EXP) + JXANNIVERSARY3_ONCEEXP) > JXANNIVERSARY3_MAXOWNEXP) then
			nAddExp = JXANNIVERSARY3_MAXOWNEXP - GetTask(TASKID_DOUSHASHOUTAO_EXP);
		else
			nAddExp = JXANNIVERSARY3_ONCEEXP;
		end
		
		--增加经验
		SetTask(TASKID_DOUSHASHOUTAO_EXP, GetTask(TASKID_DOUSHASHOUTAO_EXP) + nAddExp);
		AddOwnExp(nAddExp);
		Msg2Player("你食用了一个豆沙寿桃，获得了"..JXANNIVERSARY3_ONCEEXP.."经验");
	else
		Msg2Player("没有豆沙寿桃可以使用！");
	end
end

function OnCancel()
	return 0;
end

