
-- ====================== 文件信息 ======================

-- 剑侠情缘online 任务系统任务卷轴客户端脚本
-- Edited by peres
-- 2005/07/04 PM 19:59

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================
-- 任务系统
IncludeLib("TASKSYS");

-- 读入数据定义头文件
Include("\\script\\task\\system\\task_head.lua");

function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local strDesc = "";

	strDesc = strDesc.."<enter>任务描述：<color=yellow>"..TaskId(magiclevel1, 1, TaskID_Table.TaskText_Row).."<color><enter><enter>";

	strDesc = strDesc..CreateAwardText(TaskName(magiclevel1));

	strDesc = strDesc.."<enter><color=yellow>说明：单击右键即可获得此任务<color><enter>";
	
	return strDesc;

end;


-- 生成奖励文字字段
function CreateAwardText(taskName)

local nRow, nCol = TaskAwardMatrix(taskName);

local i=0;

local aryAward = {{}};

local strArray = "";
local strArrayRate = "";
local strText = ""; -- 奖励的说明

local nIsArray = 0; -- 判断是否有数组

local strAwardNormal = {} -- 固定发予的奖励
local strAward = "任务完成后所得奖励：<enter>"; -- 最后返回的奖励字段

local strType = "";

	strType = TaskAward(taskName, 1, 1);

	-- 对于任务奖励类型是奖励索引的处理
	if strType=="奖励索引" then
		-- 直接索引到任务名称
		taskName = TaskAward(taskName, 1, Award.AlliedAward_Row);
		nRow, nCol = TaskAwardMatrix(taskName);
	end;

	for i=1, nRow do
	
		strArray = TaskAward(taskName, i, Award.ArrayID_Row);
		strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
		strText     = TaskAward(taskName, i, Award.AwardText_Row);
		
		-- 如果奖励被定义了数组
		if strArray~="" then
		
			-- 如果数组不存在则初始化数组
			if aryAward[tonumber(strArray)]==nil then
				rawset(aryAward, tonumber(strArray), {}); 
			end;
			
			 rawset(aryAward[tonumber(strArray)],
			 		getn(aryAward[tonumber(strArray)])+1,
			 		"<color=green>"..strText.."<color>  "..strArrayRate.."% 的概率"
			 		);
			 		
			 nIsArray = 1;
			 
		else
			rawset(strAwardNormal,
					getn(strAwardNormal)+1,
					strText);
		end;
	
	end;
	
	-- 如果奖励被定义了数组，则调用数组发奖函数
	if nIsArray==1 then
		for i=1, getn(aryAward) do
			strAward = strAward.."<enter>第"..i.."个随机奖励包：<enter>";
			strAward = strAward..CreateTextForArray(aryAward[i]);
		end;
	end;
	
	strAward = strAward.."<enter>固定奖励：<enter>";
	
	if getn(strAwardNormal)~=0 then
	
		for i=1, getn(strAwardNormal) do
			strAward = strAward.."<color=green>"..strAwardNormal[i].."<enter>";
		end;
		
	else
		strAward = strAward.."<color=green>无固定奖励<color>";
	end;
	
	return strAward;
	
end;



function CreateTextForArray(aryAward)

local strAward = "";
local i=0;


	-- 把数组里面的东西发出去
	for i=1, getn(aryAward) do
		strAward = strAward..aryAward[i].."<enter>";
	end;
	
	return strAward;
	
end;