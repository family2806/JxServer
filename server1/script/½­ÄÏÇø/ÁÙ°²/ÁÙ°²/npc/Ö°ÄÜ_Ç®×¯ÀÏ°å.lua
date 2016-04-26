-- 临安　职能　钱庄老板
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) 从统一功能移动处理银票到此独有
-- Update: Fanghao_Wu(2004-9-04) 增加元宝兑换铜钱功能

-- Update: paul zhang(2005-09-06) 为越南版作修改，只使用银元宝，没有金元宝，银元宝可充成包周(7天)或者25小时，
--			铜钱暂时不开放，同时增加一个头文件用于控制功能的开放与关闭
-- Update: paul zhang(2005-12-28) 为越南版作修改，由于越南方的原因，修改成只使用金元宝，没有银元宝，但是金元宝的作用修改为可充成包周(7天)或者25小时，

-- Edited by peres
-- 2005/12/29 开放一个元宝换 15 个铜钱的功能
-- end;

Include("\\script\\global\\systemconfig.lua") -- 系统配置
Include("\\script\\global\\head_qianzhuang.lua") -- 头定义
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 

IncludeForRegionVer("\\script\\global\\", "gamebank_proc.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		education_qianzhuanglaoban()
	else
		Talk(1,"gamebank_proc","本店的生意是越做越好，我决定明年再开几家分店。但这件事还是要和户部的王大人商量，没有他的保护，我的钱庄怎么能做的走啊")
	end
end
