-- 大理　路人　车老太
-- by：Dan_Deng(2003-09-16)
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08妇女节活动，08.4.1后可删除
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08妇女节活动，08.4.1后可删除
	else	
		Talk(1,"","我今年已经80岁了，眼睛花，耳朵背，牙齿也掉落完了，吃喝不容易了.")
	end
end;
