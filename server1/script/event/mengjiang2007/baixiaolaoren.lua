--zero 20070712 令牌制造

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\pay.lua");

function main()
	if(tonumber(GetLocalDate("%Y%m%d"))>=20070728 and tonumber(GetLocalDate("%Y%m%d"))<=20070813) then
		CreateTaskSay({"<dec><npc>欢迎参加28-07-2007到24:00，13-08-2007举行的'召回猛将’活动. 活动期间，90级以上（含90级）的充值玩家可以参加制造金牌. 在首页看内容细节",
			"我想制造木牌/#lingpaizhizao_do(1)",
			"我想制造铜牌/#lingpaizhizao_do(2)",
			"我想制造银牌/#lingpaizhizao_do(3)",
			"我想制造金牌/#lingpaizhizao_do(4)",
			"我想制造玉牌/#lingpaizhizao_do(5)",
			"制造令牌的方法/lingbaizhizao_content",
			"取消/OnCancel"});	
	else
		Say("'召回猛将’活动从28-07-2007到24:00，13-08-2007进行. 90级以上（含90级）的充值玩家可以参加制造金牌.",0)
	end
	
end


lingpai_id={1477,1478,1479,1480,1481}
lingpai_success_rate={30,25,50,90,100};
lingpai_pay={5000,10000,20000,30000,1000000};
lingpai_name={"木牌","铜牌","银牌","金牌","玉牌"};
function lingpaizhizao_do(lingpai_level)
	if( IsCharged() == 0) then --充值
		Say("只有90级以上（含90级）的充值玩家才可以参加制造金牌.",0);
		return 
	end
	if( GetLevel() <90) then --等级
		Say("你还太小，不够力量参加这么危险的任务. 等到90级再来找我!",0);
		return 
	end
	
	if( CalcFreeItemCellCount() < 1) then -- 空间
		Say("背包已满，把它整理整齐.",0);
		return 
	end
	
	if( CalcEquiproomItemCount(6,1,lingpai_id[lingpai_level],-1) < 5) then --材料
		Say("所带原料不够!",0);
		return 
	end
		
	if( Pay(lingpai_pay[lingpai_level]) == 0) then  -- 去掉钱
			Say("真可惜，所带银两不足!",0);
		return 
	end
	
	for i=1,4 do ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1);	end --去掉4个材料
	if(random(1,100)<=lingpai_success_rate[lingpai_level]) then --成功的话
		ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1); --去掉一个材料
		AddItem(6,1,lingpai_id[lingpai_level]+1,1,0,0);
		Say(format("恭喜你得到1 %s.",lingpai_name[lingpai_level]),0);
		WriteLog(format("[召回猛将]\t%s\tAccount:%s\tName:%s\t 制造 %s 成功",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			lingpai_name[lingpai_level]));
	else
		Say("真可惜，制造失败，耗费了原料和银两!",0);
	end
end

function lingbaizhizao_content()
	CreateTaskSay({"<dec><npc><enter>制造木牌需要5份武林密件和5000两，如果制造失败将损耗4份武林密件和5000两.<enter><enter>制造铜牌要5个木牌和1万两，如果制造失败将损失4个木牌和1万两.<enter><enter>制造银牌要5个铜牌和2万两，如果制造失败将会损失4个铜牌和2万两.<enter><enter>制造金牌要5个银牌和3万两，如果失败的话会损失4个银牌和3万两.<enter><enter>制造玉牌要5个金牌和100万两. 制造玉牌的成功率是100%.",
		"返回/main",
		"知道了/OnCancel"
		});
end
function OnCancel()
end