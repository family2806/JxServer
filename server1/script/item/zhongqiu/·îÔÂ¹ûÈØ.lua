--Create by mengfan 2004-9-14
--奉月果蓉
--作用：中秋高级月饼之一，作用同武林秘籍，80级以上玩家使用，增加一点武功技能点。
--获得条件：集齐获得此物品所需要的所有单字。
--限制说明：该物品要求人物等级80级时使用有效，每人最多使用2次。
--任务变量700低4位表示使用该物品的次数

function main(sel) 
	times = GetTask(700)
	str={
		"<#>你试着咬了一口奉月果蓉月饼，结果什么也没有发生。:(",
		"<#>你试着咬了一口奉月果蓉月饼，结果没有发现武功有什么明显的变化。",
		"<#>你吃了一个奉月果蓉月饼，觉得体内有一股真气流动，顿时武功精进。",
		"<#>你已经吃过2个奉月果蓉月饼，实在吃不下了。"
		}
	if(times > 1) then                -- 使用次数已达到上限
		Msg2Player(str[4])
		return 1
	elseif (GetLevel() < 80) then     -- 等级小于80
		Msg2Player(str[2])
		return 1
	else                            	
		AddMagicPoint(1)          -- 奖励1点技能点
		time=date("%m%d%H%M%S")
	        name=GetName()
	    	WriteLog("玩家"..name.."在"..time.."吃掉了一个奉月果蓉月饼")
		SetTask(700,times+1)
		Msg2Player(str[3])
		return 0
	end
end