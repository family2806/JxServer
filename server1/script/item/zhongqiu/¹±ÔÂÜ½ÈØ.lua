--Create by mengfan ,2004-9-14
--贡月芙蓉
--作用：中秋高级月饼之一，作用同洗髓经，80级以上玩家使用，增加5点潜能点。
--获得条件：集齐获得此物品所需要的所有单字。
--限制说明：该物品要求人物等级80级时使用有效，每人最多使用3次。
--任务变量701低4位表示使用该物品的次数



function main(sel)
	times = GetTask(701)
        str ={
		"<#>你试着咬了一口贡月芙蓉月饼，结果什么也没有发生。:(",
		"<#>你吃了一个贡月芙蓉月饼，觉得体格轻奇脱俗，经脉缓息顺畅。",
		"<#>你已经吃过3个贡月芙蓉月饼，实在吃不下了。"
	        }
	level = GetLevel()
	if(level < 80) then     --等级太低，不让使用
		Msg2Player(str[1])
		return 1
	end
	if(times > 2) then      --使用超过次数
		Msg2Player(str[3])
		return 1
	end
	AddProp(5)              --潜能点增加5点
	time=date("%m%d%H%M%S")
        name=GetName()
	WriteLog("玩家"..name.."在"..time.."吃掉了一个贡月芙蓉月饼")
	SetTask(701,times+1)
	Msg2Player(str[2])
	return 0
end	